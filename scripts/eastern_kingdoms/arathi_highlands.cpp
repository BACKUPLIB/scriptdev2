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
SDName: Arathi Highlands
SD%Complete: 100
SDComment: Quest support: 665, 660
SDCategory: Arathi Highlands
EndScriptData */

/* ContentData
npc_professor_phizzlethorpe
npc_kinelory
EndContentData */

#include "precompiled.h"
#include "escort_ai.h"

/*######
## npc_professor_phizzlethorpe
######*/

enum
{
    SAY_PROGRESS_1          = -1000264,
    SAY_PROGRESS_2          = -1000265,
    SAY_PROGRESS_3          = -1000266,
    EMOTE_PROGRESS_4        = -1000267,
    SAY_AGGRO               = -1000268,
    SAY_PROGRESS_5          = -1000269,
    SAY_PROGRESS_6          = -1000270,
    SAY_PROGRESS_7          = -1000271,
    EMOTE_PROGRESS_8        = -1000272,
    SAY_PROGRESS_9          = -1000273,

    QUEST_SUNKEN_TREASURE   = 665,
    ENTRY_VENGEFUL_SURGE    = 2776
};

struct MANGOS_DLL_DECL npc_professor_phizzlethorpeAI : public npc_escortAI
{
    npc_professor_phizzlethorpeAI(Creature* pCreature) : npc_escortAI(pCreature) { Reset(); }

    void Reset() { }

    void WaypointReached(uint32 uiPointId)
    {
        Player* pPlayer = GetPlayerForEscort();

        if (!pPlayer)
            return;

        switch(uiPointId)
        {
            case 4: DoScriptText(SAY_PROGRESS_2, m_creature, pPlayer); break;
            case 5: DoScriptText(SAY_PROGRESS_3, m_creature, pPlayer); break;
            case 8: DoScriptText(EMOTE_PROGRESS_4, m_creature); break;
            case 9:
                m_creature->SummonCreature(ENTRY_VENGEFUL_SURGE, -2056.41f, -2144.01f, 20.59f, 5.70f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 600000);
                m_creature->SummonCreature(ENTRY_VENGEFUL_SURGE, -2050.17f, -2140.02f, 19.54f, 5.17f, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 600000);
                break;
            case 10: DoScriptText(SAY_PROGRESS_5, m_creature, pPlayer); break;
            case 11:
                DoScriptText(SAY_PROGRESS_6, m_creature, pPlayer);
                SetRun();
                break;
            case 19: DoScriptText(SAY_PROGRESS_7, m_creature, pPlayer); break;
            case 20:
                DoScriptText(EMOTE_PROGRESS_8, m_creature);
                DoScriptText(SAY_PROGRESS_9, m_creature, pPlayer);
                pPlayer->GroupEventHappens(QUEST_SUNKEN_TREASURE, m_creature);
                break;
        }
    }

    void Aggro(Unit* pWho)
    {
        DoScriptText(SAY_AGGRO, m_creature);
    }

    void JustSummoned(Creature* pSummoned)
    {
        pSummoned->AI()->AttackStart(m_creature);
    }
};

bool QuestAccept_npc_professor_phizzlethorpe(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_SUNKEN_TREASURE)
    {
        pCreature->setFaction(FACTION_ESCORT_N_NEUTRAL_PASSIVE);
        DoScriptText(SAY_PROGRESS_1, pCreature, pPlayer);

        if (npc_professor_phizzlethorpeAI* pEscortAI = dynamic_cast<npc_professor_phizzlethorpeAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest, true);
    }
    return true;
}

CreatureAI* GetAI_npc_professor_phizzlethorpe(Creature* pCreature)
{
    return new npc_professor_phizzlethorpeAI(pCreature);
}

/*#####
## npc_kinelory
#####*/

enum
{
	SAY_START                   = -1999935,
    SAY_SEARCH                  = -1999936,
    SAY_RETURN                  = -1999937,
    SAY_END                     = -1999938,
	SAY_AGGRO_KINELORY          = -1999939,

    SPELL_REJUVENATION          = 3627,

    QUEST_HINTS_OF_A_NEW_PLAQUE = 660
};

struct MANGOS_DLL_DECL npc_kineloryAI : public npc_escortAI
{
    npc_kineloryAI(Creature* pCreature) : npc_escortAI(pCreature) { Reset(); }

    uint32 m_uiRejuvenationTimer;

    void Reset()
    {
        m_uiRejuvenationTimer = 10000;
    }

    void WaypointReached(uint32 uiPointId)
    {
        Player* pPlayer = GetPlayerForEscort();

        if (!pPlayer)
            return;

        switch(uiPointId)
        {
            case 5:
            {
                DoScriptText(SAY_SEARCH, m_creature);
                break;
            }
            case 6:
            {
                DoScriptText(SAY_RETURN, m_creature);
                break;
            }
            case 15:
            {
                DoScriptText(SAY_END, m_creature, pPlayer);
                pPlayer->GroupEventHappens(QUEST_HINTS_OF_A_NEW_PLAQUE, m_creature);
                break;
            }
        }
    }

	void Aggro(Unit* pWho)
    {
        DoScriptText(SAY_AGGRO_KINELORY, m_creature);
    }

    void UpdateEscortAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->GetHealthPercent() < 65.0f)
        {
            if (m_uiRejuvenationTimer < uiDiff)
            {
            DoCastSpellIfCan(m_creature, SPELL_REJUVENATION);
            m_uiRejuvenationTimer = 20000;
            }
            else
                m_uiRejuvenationTimer -= uiDiff;
        }
        else

        DoMeleeAttackIfReady();
    }
};

bool QuestAccept_npc_kinelory(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_HINTS_OF_A_NEW_PLAQUE)
    {
DoScriptText(SAY_START, pCreature, pPlayer);
        if (npc_kineloryAI* pEscortAI = dynamic_cast<npc_kineloryAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
    return true;
}

CreatureAI* GetAI_npc_kinelory(Creature* pCreature)
{
    return new npc_kineloryAI(pCreature);
}

void AddSC_arathi_highlands()
{
    Script * newscript;

    newscript = new Script;
    newscript->Name = "npc_professor_phizzlethorpe";
    newscript->GetAI = &GetAI_npc_professor_phizzlethorpe;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_professor_phizzlethorpe;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "npc_kinelory";
    newscript->GetAI = &GetAI_npc_kinelory;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_kinelory;
    newscript->RegisterSelf();
}
