/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

/* ScriptData
SDName: Boss_Novos
SD%Complete: 80%
SDComment: Timers
SDCategory: Drak'Tharon Keep
EndScriptData */

#include "precompiled.h"
#include "draktharon_keep.h"

/*######
## boss_novos
######*/

enum
{
    SAY_AGGRO                   = -1600005,
    SAY_DEATH                   = -1600006,
    SAY_KILL                    = -1600007,
    SAY_ADDS                    = -1600008,
    SAY_BUBBLE_1                = -1600009,
    SAY_BUBBLE_2                = -1600010,

    EMOTE_ASSISTANCE            = -1600011,

    POS                         = 3,
    
    SPELL_ARCANE_FIELD          = 47346,
    SPELL_FROSTBOLT             = 49037,
    H_SPELL_FROSTBOLT           = 59855,
    SPELL_ARCANE_BLAST          = 49198,
    H_SPELL_ARCANE_BLAST        = 59909,
    SPELL_BLIZZARD              = 49034,
    H_SPELL_BLIZZARD            = 59854,
    SPELL_WRATH_OF_MISERY       = 50089,
    H_SPELL_WRATH_OF_MISERY     = 59856,
    SPELL_FLASH_OF_DARKNESS     = 49668,
    H_SPELL_FLASH_OF_DARKNESS   = 59004,

    NPC_CRYSTAL_HANDLER         = 26627,
};

const float PosSummonHandler[POS][3] =
{
    {-337.78f, -720.39f, 28.58f},
    {-379.31f, -818.36f, 59.70f},
    {-412.45f, -726.96f, 28.58f},
};

struct MANGOS_DLL_DECL boss_novosAI : public ScriptedAI
{
    boss_novosAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    bool m_bPhase1;
    bool m_bPhase2_Check;
    uint32 m_uiHandler_Spawn;
    uint32 m_uiHandler_Count;
    uint32 m_uiFrostbolt_Timer;
    uint32 m_uiArcaneBlast_Timer;
    uint32 m_uiSpecialCast_Timer;
    uint32 m_uiSummonMinion_Timer;
    
    void Reset()
    {
        m_bPhase2_Check = true;
        m_uiHandler_Spawn = 5000;
        m_uiHandler_Count = 0;
        m_bPhase1 = false;
        if(m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE))
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        if(m_pInstance)
        {
            m_pInstance->SetData(TYPE_CRYSTALS_ACTIVATED, 0);
            for(int i=0;i<4;i++)
            {
                GameObject* pGo = m_pInstance->instance->GetGameObject(m_pInstance->GetData64(i));
                if(pGo && pGo->GetGoState() == GO_STATE_ACTIVE)
                    pGo->UseDoorOrButton(0,false);
            }
        }
    }

    void Aggro(Unit* pWho)
    {
        DoScriptText(SAY_AGGRO, m_creature);
        m_creature->CallForHelp(50.0f);
        DoCast(m_creature, SPELL_ARCANE_FIELD);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        m_creature->SetInCombatWithZone();
        m_bPhase1 = true;
    }

    void KilledUnit(Unit* pVictim)
    {
        DoScriptText(SAY_KILL, m_creature);
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, m_creature);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if(m_pInstance)
            if(m_bPhase2_Check && m_pInstance->GetData(TYPE_CRYSTALS_ACTIVATED) == 4)
            {
                m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                m_creature->InterruptSpell(CURRENT_CHANNELED_SPELL);
                m_uiSummonMinion_Timer = urand (15000,20000);
                m_uiSpecialCast_Timer = urand(15000, 20000);
                m_uiArcaneBlast_Timer = urand(25000, 30000);
                m_uiFrostbolt_Timer = 500;
                m_bPhase1 = false;
                m_bPhase2_Check = false;
            }

        if (!m_bPhase1)
        {
            //Regual cast - frostbolt
            if (m_uiFrostbolt_Timer < uiDiff && m_uiArcaneBlast_Timer > uiDiff && m_uiSpecialCast_Timer > uiDiff)
            {
                DoCast(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), m_bIsRegularMode ? SPELL_FROSTBOLT : H_SPELL_FROSTBOLT);
                m_uiFrostbolt_Timer = 1000;
            }else m_uiFrostbolt_Timer -= uiDiff;

               //Arcane Blast
            if (m_uiArcaneBlast_Timer < uiDiff)
            {
                m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
                m_creature->CastSpell(m_creature, m_bIsRegularMode ? SPELL_ARCANE_BLAST : H_SPELL_ARCANE_BLAST, true);
                m_uiArcaneBlast_Timer = urand(25000, 30000);
            }else m_uiArcaneBlast_Timer -= uiDiff;

            //Wrath Of Misery or Blizzard
            if (m_uiSpecialCast_Timer < uiDiff)
            {
                m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
                switch(urand(0, 1))
                {
                    case 0:
                        DoCast(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), m_bIsRegularMode ? SPELL_WRATH_OF_MISERY : H_SPELL_WRATH_OF_MISERY);
                    case 1:
                        DoCast(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), m_bIsRegularMode ? SPELL_BLIZZARD : H_SPELL_BLIZZARD);
                }
                m_uiSpecialCast_Timer = urand(10000, 15000);
            }else m_uiArcaneBlast_Timer -= uiDiff;
            
            //Summon Minions (Heroic)
            if (m_uiSummonMinion_Timer < uiDiff)
            {
                if(m_bIsRegularMode)
                    return;

                uint8 SummonLoc = rand()%POS;
                if (Creature* pAdd1 = m_creature->SummonCreature(NPC_FETID_TROLL_CORPSE, PosSummonHandler[SummonLoc][0],PosSummonHandler[SummonLoc][1],PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd1->AI()->AttackStart(m_creature->getVictim());
                if (Creature* pAdd2 = m_creature->SummonCreature(NPC_FETID_TROLL_CORPSE, PosSummonHandler[SummonLoc][0],PosSummonHandler[SummonLoc][1],PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd2->AI()->AttackStart(m_creature->getVictim());
                if (Creature* pAdd3 = m_creature->SummonCreature(NPC_FETID_TROLL_CORPSE, PosSummonHandler[SummonLoc][0],PosSummonHandler[SummonLoc][1],PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd3->AI()->AttackStart(m_creature->getVictim());
                if (Creature* pAdd4 = m_creature->SummonCreature(NPC_FETID_TROLL_CORPSE, PosSummonHandler[SummonLoc][0],PosSummonHandler[SummonLoc][1],PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd4->AI()->AttackStart(m_creature->getVictim());
                if (Creature* pAdd5 = m_creature->SummonCreature(NPC_FETID_TROLL_CORPSE, PosSummonHandler[SummonLoc][0],PosSummonHandler[SummonLoc][1],PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd5->AI()->AttackStart(m_creature->getVictim());
                m_uiSummonMinion_Timer = urand (15000,20000);
            }else m_uiSummonMinion_Timer -= uiDiff;

        }
        
        //Phase 1 Waves spawn
        if (m_uiHandler_Spawn < uiDiff && m_bPhase1 == true)
        {
                uint8 SummonLoc = rand()%POS;
                if(m_uiHandler_Count < 4 && rand()%3)
                {
                    DoScriptText(SAY_ADDS,m_creature);
                    if(Creature* pCrystalHandler = m_creature->SummonCreature(NPC_CRYSTAL_HANDLER, PosSummonHandler[SummonLoc][0]+rand()%2,PosSummonHandler[SummonLoc][1]+rand()%2,PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                        pCrystalHandler->AI()->AttackStart(m_creature->getVictim());
                    m_uiHandler_Count++;
                }
                m_creature->HandleEmoteCommand(EMOTE_ASSISTANCE);
                if (Creature* pAdd1 = m_creature->SummonCreature(NPC_HULKING_CORPSE, PosSummonHandler[SummonLoc][0]+rand()%2,PosSummonHandler[SummonLoc][1]+rand()%2,PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd1->AI()->AttackStart(m_creature->getVictim());
                SummonLoc = rand()%POS;
                if (Creature* pAdd2 = m_creature->SummonCreature(NPC_RISEN_SHADOWCASTER, PosSummonHandler[SummonLoc][0]+rand()%2,PosSummonHandler[SummonLoc][1]+rand()%2,PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd2->AI()->AttackStart(m_creature->getVictim());
                SummonLoc = rand()%POS;
                if (Creature* pAdd3 = m_creature->SummonCreature(NPC_FETID_TROLL_CORPSE, PosSummonHandler[SummonLoc][0]+rand()%2,PosSummonHandler[SummonLoc][1]+rand()%2,PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd3->AI()->AttackStart(m_creature->getVictim());
                SummonLoc = rand()%POS;
                if (Creature* pAdd4 = m_creature->SummonCreature(NPC_FETID_TROLL_CORPSE, PosSummonHandler[SummonLoc][0]+rand()%2,PosSummonHandler[SummonLoc][1]+rand()%2,PosSummonHandler[SummonLoc][2],0, TEMPSUMMON_TIMED_DESPAWN, 120000))
                    pAdd4->AI()->AttackStart(m_creature->getVictim());
                m_uiHandler_Spawn = 17500;

        }else m_uiHandler_Spawn -= uiDiff;
    }
};



CreatureAI* GetAI_boss_novos(Creature* pCreature)
{
    return new boss_novosAI(pCreature);
}

struct MANGOS_DLL_DECL crystal_handlerAI : public ScriptedAI
{
    crystal_handlerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 m_uiFlashOfDarknessTimer;
    bool m_bIsRegularMode;

    void Reset()
    {
        m_uiFlashOfDarknessTimer = 8000;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if(m_uiFlashOfDarknessTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), m_bIsRegularMode ? SPELL_FLASH_OF_DARKNESS : H_SPELL_FLASH_OF_DARKNESS);

            m_uiFlashOfDarknessTimer = urand(5,10)*1000;
        } else m_uiFlashOfDarknessTimer -= uiDiff;
    }

    void JustDied(Unit* pKiller)
    {
        if(m_pInstance)
        {
            uint32 crystals = m_pInstance->GetData(TYPE_CRYSTALS_ACTIVATED);
            GameObject* pGo = m_pInstance->instance->GetGameObject(m_pInstance->GetData64(crystals));
            if(pGo)
            {
                pGo->UseDoorOrButton(0,false);
            }
            m_pInstance->SetData(TYPE_CRYSTALS_ACTIVATED,++crystals);
        }
    }
};

CreatureAI* GetAI_crystal_handler(Creature* pCreature)
{
    return new crystal_handlerAI(pCreature);
}

void AddSC_boss_novos()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_novos";
    newscript->GetAI = &GetAI_boss_novos;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "crystal_handler";
    newscript->GetAI = &GetAI_crystal_handler;
    newscript->RegisterSelf();
}