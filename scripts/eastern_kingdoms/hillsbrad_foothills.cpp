/* ScriptData
SDName: hillsbrad_foothills
SD%Complete: 100%
SDComment: Quest support: 660
SDCategory: hillsbrad_foothills
EndScriptData */

/* ContentData
npc_kinelory */

#include "precompiled.h"
#include "escort_ai.h"

/*#####
## npc_kinelory
#####*/

enum
{
    SAY_START                   = -1999935,
    SAY_SEARCH                  = -1999936,
    SAY_RETURN                  = -1999937,
    SAY_END                     = -1999938,

    SPELL_REJUVENATION          = 3627,

    QUEST_HINTS                 = 660
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
            case 14:
            {
                DoScriptText(SAY_END, m_creature, pPlayer);
                pPlayer->GroupEventHappens(QUEST_HINTS, m_creature);
                break;
            }
        }
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
    if (pQuest->GetQuestId() == QUEST_HINTS)
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

void AddSC_hillsbrad_foothills()
{
	Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_kinelory";
    newscript->GetAI = &GetAI_npc_kinelory;
	newscript->pQuestAccept = &QuestAccept_npc_kinelory;
    newscript->RegisterSelf();
}