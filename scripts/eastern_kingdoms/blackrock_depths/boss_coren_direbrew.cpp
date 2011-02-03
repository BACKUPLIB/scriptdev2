/* Copyright (C) 2006 - 2011 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: boss_coren_direbrew
SD%Complete: 0
SDComment: Placeholder
SDCategory: Blackrock Depths
EndScriptData */

#include "precompiled.h"
#include "escort_ai.h"

/*######
## boss_coren_direbrew
######*/

enum
{
        QUEST_INSULT_COREN  = 12062,

        SAY_PAY             = -1799998,
        SAY_AGGRO           = -1799997,

        SAY_IDLE1           = -1799996,
        SAY_IDLE2           = -1799995,
        SAY_IDLE3           = -1799994,
        SAY_IDLE4           = -1799993,

        SAY_ANTAGONIST1_1   = -1799992,
        SAY_ANTAGONIST1_2   = -1799991,
        SAY_ANTAGONIST1_3   = -1799990,
        SAY_ANTAGONIST2_1   = -1799989,
        SAY_ANTAGONIST2_2   = -1799988,
        SAY_ANTAGONIST2_3   = -1799987,
        SAY_ANTAGONIST4     = -1799986,

        MOB_ANTAGONIST      = 23795,
        MOB_ILSA            = 26764,
        MOB_URSULA          = 26822,
        MOB_MINION          = 26776,

        SPELL_DISARM        = 47310
};

float Coord[6][4] =
{
    {902.65f,-131.26f,-49.74f,5.94f},// Antagonist1
    {902.85f,-134.45f,-49.74f,0.49f},// Antagonist2
    {904.72f,-137.24f,-49.75f,1.34f},// Antagonist3
    {905.53f,-128.06f,-49.74f,5.04f},// Coren noncombat event movement point1
    {909.47f,-137.38f,-49.74f,1.01f},// Coren noncombat event movement point2
    {898.79f,-140.91f,-49.75f,0.48f} // Ursula and Ilsa spawn point
};

struct MANGOS_DLL_DECL boss_coren_direbrewAI : public npc_escortAI
{
    boss_coren_direbrewAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
       m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
       Reset();
    }

    ScriptedInstance* m_pInstance;

    bool m_bEventStarted;
    bool m_bLastPoint;
    bool m_bAntagonistAttacked;
    bool m_bIlsaSpawned;
    bool m_bUrsulaSpawned;

    // Adds GUIDs
    uint64 m_uiAntagonist1GUID;
    uint64 m_uiAntagonist2GUID;
    uint64 m_uiAntagonist3GUID;

    uint32 m_uiAggroYell_Timer;
    uint32 m_uiWalk_Timer;
    uint32 m_uiSpeach_Timer;
    uint32 m_uiMinion_Timer;
    uint32 m_uiDisarm_Timer;

    uint8 m_uiSpeach;
    uint8 m_uiWalk;
   
    void Reset()
    {
        DespawnAdds();
        // Player cannot turn quest before quest event begins
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        // Coren cannot be attacked before quest rewareded
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        SetEscortPaused(false);
        
        m_bEventStarted = false;
        m_bLastPoint = false;
        m_bAntagonistAttacked = false;
        m_bIlsaSpawned = false;
        m_bUrsulaSpawned = false;
        
        m_uiAggroYell_Timer = 10000;
        m_uiWalk_Timer = 0;
        m_uiSpeach_Timer = 0;
        m_uiSpeach = 0;
        m_uiWalk = 0;
        m_uiMinion_Timer = 10000;
        m_uiDisarm_Timer = 1000;
    }
   
   void NPCSay(uint64 guid, int32 text)
   {
        Creature* pPointer = (Creature*) m_creature->GetMap()->GetUnit(guid);
        if (pPointer && pPointer->isAlive())
            DoScriptText(text,pPointer,NULL);
   }

   void Despawn(uint64 guid)
   {
       if (Creature* pCreature = (Creature*) m_creature->GetMap()->GetUnit(guid))
            pCreature->ForcedDespawn();
   }

   void Assault(uint64 guid, uint32 faction, Unit* pTarget)
   {
       Creature* pCreature = (Creature*) m_creature->GetMap()->GetUnit(guid);
       if (pTarget && pCreature)
       {
           pCreature->setFaction(faction);
           pCreature->AI()->AttackStart(pTarget);
       }
   }

 
    void DespawnAdds()
    {
        Despawn(m_uiAntagonist1GUID);
        Despawn(m_uiAntagonist2GUID);
        Despawn(m_uiAntagonist3GUID);
    }

    void JustDied(Unit* pKiller)
    {
        DespawnAdds();
    }

    void WaypointReached (uint32 i)
    {
        switch(i)
        {
        case 1:
            Creature* pTemp;
            if (pTemp = m_creature->SummonCreature(MOB_ANTAGONIST, Coord[0][0], Coord[0][1], Coord[0][2], Coord[0][3], TEMPSUMMON_DEAD_DESPAWN, 0))
            {
                m_uiAntagonist1GUID = pTemp->GetGUID();
                pTemp = NULL;
            }
            if (pTemp = m_creature->SummonCreature(MOB_ANTAGONIST, Coord[1][0], Coord[1][1], Coord[1][2], Coord[1][3], TEMPSUMMON_DEAD_DESPAWN, 0))
            {
                m_uiAntagonist2GUID = pTemp->GetGUID();
                pTemp = NULL;
            }
            if (pTemp = m_creature->SummonCreature(MOB_ANTAGONIST, Coord[2][0], Coord[2][1], Coord[2][2], Coord[2][3], TEMPSUMMON_DEAD_DESPAWN, 0))
            {
                m_uiAntagonist3GUID = pTemp->GetGUID();
            }
            break;
        case 12:
            // When escort is paused we need to restore questgiver flags
            m_creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            m_creature->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            m_bLastPoint = true;
            SetEscortPaused(true);
            break;
        }
    }

    void MoveInLineOfSight (Unit* pWho)
    {
        if (!pWho)
            return;

        if (m_bEventStarted)
            return;

        if (pWho->GetTypeId() != TYPEID_PLAYER)
            return;

        Player* pPlayer = (Player*)pWho;
        if (!pPlayer)
            return;

        if (!m_bEventStarted && m_creature->GetDistance(pPlayer) < 10)
        {
            if (pPlayer->GetQuestStatus(QUEST_INSULT_COREN) == QUEST_STATUS_COMPLETE)
            {
                Start(false,pPlayer->GetGUID());
                m_bEventStarted = true;
            }
        }
    }

    void UpdateEscortAI(const uint32 uiDiff)
    {
        if (!m_creature->isInCombat() || !m_creature->SelectHostileTarget() || !m_creature->getVictim())
        {
            // After achieving last point of escort small noncombat event begins
            if (m_bLastPoint)
            {
                void GetAntagonists();
                // Coren Walking in front of Antagonists
                if (m_uiWalk_Timer < uiDiff)
                {
                    m_creature->AddSplineFlag(SPLINEFLAG_WALKMODE);
                    switch(m_uiWalk)
                    {
                        case 0:
                            m_creature->SendMonsterMove(Coord[3][0],Coord[3][1],Coord[3][2],SPLINETYPE_NORMAL,SPLINEFLAG_WALKMODE,6000);
                            m_uiWalk = 1;
                            break;
                        case 1:
                            m_creature->SendMonsterMove(Coord[4][0],Coord[4][1],Coord[4][2],SPLINETYPE_NORMAL,SPLINEFLAG_WALKMODE,6000);
                            m_uiWalk = 0;
                            break;
                    }
                    m_uiWalk_Timer = 6000;
                }
                else m_uiWalk_Timer -= uiDiff;

                // Coren Yell and Antagonists response
                if (m_uiSpeach_Timer < uiDiff)
                {
                    switch(m_uiSpeach)
                    {
                    case 0:
                        DoScriptText(SAY_IDLE1,m_creature);
                        m_uiSpeach = 1;
                        break;
                    case 1:
                        NPCSay(m_uiAntagonist1GUID,SAY_ANTAGONIST2_1);
                        NPCSay(m_uiAntagonist2GUID,SAY_ANTAGONIST2_2);
                        NPCSay(m_uiAntagonist3GUID,SAY_ANTAGONIST2_3);
                        m_uiSpeach = 2;
                        break;
                    case 2:
                        DoScriptText(SAY_IDLE2,m_creature);
                        m_uiSpeach = 3;
                        break;
                    case 3:
                        NPCSay(m_uiAntagonist1GUID,SAY_ANTAGONIST1_2);
                        NPCSay(m_uiAntagonist2GUID,SAY_ANTAGONIST1_3);
                        NPCSay(m_uiAntagonist3GUID,SAY_ANTAGONIST1_1);
                        m_uiSpeach = 4;
                        break;
                    case 4:
                        DoScriptText(SAY_IDLE3,m_creature);
                        m_uiSpeach = 5;
                        break;
                    case 5:
                        NPCSay(m_uiAntagonist1GUID,SAY_ANTAGONIST1_1);
                        NPCSay(m_uiAntagonist2GUID,SAY_ANTAGONIST1_2);
                        NPCSay(m_uiAntagonist3GUID,SAY_ANTAGONIST1_3);
                        m_uiSpeach = 6;
                        break;
                    case 6:
                        DoScriptText(SAY_IDLE4,m_creature);
                        m_uiSpeach = 7;
                        break;
                    case 7:
                        NPCSay(m_uiAntagonist1GUID,SAY_ANTAGONIST4);
                        NPCSay(m_uiAntagonist2GUID,SAY_ANTAGONIST4);
                        NPCSay(m_uiAntagonist3GUID,SAY_ANTAGONIST4);
                        m_uiSpeach = 0;
                        break;
                    }
                    m_uiSpeach_Timer = 5000;
                }else m_uiSpeach_Timer -=uiDiff;
            }
        }
        else 
        {
            //Force Antagonist to assist Coren in combat
            if (m_creature->getVictim() && !m_bAntagonistAttacked)
            {
                Assault(m_uiAntagonist1GUID,m_creature->getFaction(),m_creature->getVictim());
                Assault(m_uiAntagonist2GUID,m_creature->getFaction(),m_creature->getVictim());
                Assault(m_uiAntagonist3GUID,m_creature->getFaction(),m_creature->getVictim());
                m_bAntagonistAttacked = true;
            }

            if (!m_bIlsaSpawned && ((m_creature->GetHealth()*100) / m_creature->GetMaxHealth() <= 66))
            {
                Creature* Ilsa = m_creature->SummonCreature(MOB_ILSA,Coord[5][0],Coord[5][1],Coord[5][2],Coord[5][3],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,20000);
                if (Ilsa && m_creature->getVictim()) // i know if(victim) was checked at the top but once got crash with multithreaded mangos
                    {
                        Ilsa->AI()->AttackStart(m_creature->getVictim());
                        m_bIlsaSpawned = true;
                    }
            }

            if (!m_bUrsulaSpawned && ((m_creature->GetHealth()*100) / m_creature->GetMaxHealth() <= 33))
            {
                Creature* Ursula = m_creature->SummonCreature(MOB_URSULA,Coord[5][0],Coord[5][1],Coord[5][2],Coord[5][3],TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,20000);
                if (Ursula && m_creature->getVictim())// i know if(victim) was checked at the top but once got crash with multithreaded mangos
                    {
                        Ursula->AI()->AttackStart(m_creature->getVictim());
                        m_bUrsulaSpawned = true;
                    }
            }

        if (m_uiMinion_Timer < uiDiff)
        {
            if (m_pInstance)
                if(Creature* pMinion = m_creature->SummonCreature(MOB_MINION,m_creature->GetPositionX()+rand()%20,m_creature->GetPositionY()+rand()%20,m_creature->GetPositionZ(),0,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,20000))
                {
                    pMinion->AI()->AttackStart(m_creature->getVictim());
                    m_uiMinion_Timer = 23000;
                }
                    
        }else m_uiMinion_Timer -= uiDiff;

        if (m_uiAggroYell_Timer < uiDiff)
        {
            DoScriptText(SAY_AGGRO,m_creature);
            m_uiAggroYell_Timer = 45000 + (rand()%45000);
        }
        else m_uiAggroYell_Timer -= uiDiff;

        if(m_uiDisarm_Timer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_DISARM);
            m_uiDisarm_Timer = 15000;
        }
        else m_uiDisarm_Timer -= uiDiff;

        DoMeleeAttackIfReady();
        }
    }
};

CreatureAI* GetAI_boss_coren_direbrew(Creature* pCreature)
{
    return new boss_coren_direbrewAI(pCreature);
}

bool ChooseReward_boss_coren_direbrew(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{

    if (pPlayer && pQuest->GetQuestId() == QUEST_INSULT_COREN)
        if (boss_coren_direbrewAI* pEscortAI = dynamic_cast<boss_coren_direbrewAI*>(pCreature->AI()))
        {
            DoScriptText(SAY_PAY,pCreature,pPlayer);
            pCreature->setFaction(16);
            pEscortAI->AttackStart(pPlayer);
            pCreature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }
    return true;
}

void AddSC_boss_coren_direbrew()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_coren_direbrew";
    pNewScript->GetAI = &GetAI_boss_coren_direbrew;
    pNewScript->pQuestRewardedNPC = &ChooseReward_boss_coren_direbrew;
    pNewScript->RegisterSelf();
}