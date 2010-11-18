/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Boss_Amanitar
SD%Complete: 50%
SDComment: Mushrooms will possibly spawn under the map. 
SDCategory: Ahn'kahet
EndScriptData */

#include "precompiled.h"
#include "ahnkahet.h"

enum
{
    NPC_HEALTHY_MUSHROOM            = 30391,
    NPC_POISONOUS_MUSHROOM          = 30435,

    SPELL_BASH                      = 57094,
    SPELL_ENTANGLING_ROOTS          = 57095,
    SPELL_MINI                      = 57055,
    SPELL_VENOM_BOLT_VOLLEY         = 57088,

    SPELL_POTENT_FUNGUS             = 56648,
    SPELL_POISON_CLOUD              = 57061,
    SPELL_POISONOUS_MUSHROOM_VISUAL = 56741,
    SPELL_POISONOUS_MUSHROOM_VISUAL2= 61566,

    SPELL_MUSHROOM_MODEL            = 31690
};

/*######
## boss_amanitar
######*/

struct MANGOS_DLL_DECL boss_amanitarAI : public ScriptedAI
{
    boss_amanitarAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 spawnMushroomTimer;
    uint32 miniTimer;
    uint32 bashTimer;
    uint32 venomBoltVolleyTimer;

    void Reset()
    {
        spawnMushroomTimer = 1000;
        miniTimer = urand(20000, 22000);
        bashTimer = urand(10000, 11000);
        venomBoltVolleyTimer = urand(4000, 6000);
    }

    void spawnMushroom()
    {
        float posX, posY, posZ;
        int32 randX,randY;
        for(int i = 0; i < 8;i++)
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                randX = rand()%30;
                randY = rand()%30;
                posX = pTarget->GetPositionX() + (urand(0,1)? (randX+3) : (-randX-3));
                posY = pTarget->GetPositionY() + (urand(0,1)? (randY+3) : (-randY-3));
                posZ = pTarget->GetTerrain()->GetWaterOrGroundLevel(posX,posY,pTarget->GetPositionZ()+3);

                m_creature->SummonCreature(!urand(0, 4) ? NPC_HEALTHY_MUSHROOM : NPC_POISONOUS_MUSHROOM, posX, posY, posZ, m_creature->GetOrientation(), TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 60000);
            }     
    }

    void Aggro(Unit* pWho)
    {
        int i = 0;
        do
        {
            spawnMushroom();
            i++;
        }while (i < 3);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (spawnMushroomTimer < uiDiff)
        {
            spawnMushroom();
            spawnMushroomTimer = 30000;
        }else spawnMushroomTimer -= uiDiff;

        if (miniTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), SPELL_MINI);
            // not sure about this timer
            miniTimer = urand(20000, 25000);
        }else miniTimer -= uiDiff;

        if (bashTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_BASH);
            bashTimer = urand(9000, 13000);
        }else bashTimer -= uiDiff;

        if (venomBoltVolleyTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0), SPELL_VENOM_BOLT_VOLLEY);
            venomBoltVolleyTimer = urand(8000, 11000);
        }else venomBoltVolleyTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* pKiller)
    {
        std::list<Creature*> lMushrooms;
        GetCreatureListWithEntryInGrid(lMushrooms, m_creature, NPC_HEALTHY_MUSHROOM, 150.0f);
        for(std::list<Creature*>::iterator itr = lMushrooms.begin(); itr != lMushrooms.end(); ++itr)
            (*itr)->ForcedDespawn();
        lMushrooms.clear();
        GetCreatureListWithEntryInGrid(lMushrooms, m_creature, NPC_POISONOUS_MUSHROOM, 150.0f);
        for(std::list<Creature*>::iterator itr = lMushrooms.begin(); itr != lMushrooms.end(); ++itr)
            (*itr)->ForcedDespawn();
    }

};

CreatureAI* GetAI_boss_amanitar(Creature* pCreature)
{
    return new boss_amanitarAI(pCreature);
}

/*######
## npc_amanitar_healthy_mushroom
######*/

struct MANGOS_DLL_DECL npc_amanitar_healthy_mushroomAI : public ScriptedAI
{
    npc_amanitar_healthy_mushroomAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset() 
    {
        DoCast(m_creature,SPELL_MUSHROOM_MODEL,true);
    }

    void JustDied(Unit* pWho)
    {
        if (pWho->HasAura(SPELL_MINI, EFFECT_INDEX_0) || pWho->HasAura(SPELL_MINI, EFFECT_INDEX_1) || pWho->HasAura(SPELL_MINI, EFFECT_INDEX_2))
        {   
            pWho->RemoveAurasDueToSpell(SPELL_MINI);
            pWho->CastSpell(pWho, SPELL_POTENT_FUNGUS, true);
        }
    }
};

CreatureAI* GetAI_npc_amanitar_healthy_mushroom(Creature* pCreature)
{
    return new npc_amanitar_healthy_mushroomAI(pCreature);
}

/*######
## npc_amanitar_poisonous_mushroom
######*/

struct MANGOS_DLL_DECL npc_amanitar_poisonous_mushroomAI : public ScriptedAI
{
    npc_amanitar_poisonous_mushroomAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    uint32 poisenCloudTimer;

    void Reset()
    {
        poisenCloudTimer = urand(4,8)*100;
        DoCast(m_creature,SPELL_MUSHROOM_MODEL,true);
        DoCast(m_creature,SPELL_POISONOUS_MUSHROOM_VISUAL,true);
    }
 
    void UpdateAI(const uint32 uiDiff)
    {
        if (poisenCloudTimer < uiDiff)
        {
            DoCast(m_creature,SPELL_POISONOUS_MUSHROOM_VISUAL2,true);
            DoCastSpellIfCan(m_creature, SPELL_POISON_CLOUD);
            poisenCloudTimer = urand(7,10)*1000;
        }else poisenCloudTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_amanitar_poisonous_mushroom(Creature* pCreature)
{
    return new npc_amanitar_poisonous_mushroomAI(pCreature);
}

void AddSC_boss_amanitar()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_amanitar";
    newscript->GetAI = &GetAI_boss_amanitar;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_amanitar_healthy_mushroom";
    newscript->GetAI = &GetAI_npc_amanitar_healthy_mushroom;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_amanitar_poisonous_mushroom";
    newscript->GetAI = &GetAI_npc_amanitar_poisonous_mushroom;
    newscript->RegisterSelf();
}