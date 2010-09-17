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
SDName: Storm_Peaks
SD%Complete: 100
SDComment: Vendor Support (31247). Quest support: 12970, 12684
SDCategory: Storm Peaks
EndScriptData */

/* ContentData
npc_loklira_the_crone
npc_roxi_ramrocket
npc_frostborn_scout
EndContentData */

#include "precompiled.h"
#include "../../../game/ObjectMgr.h"

/*######
## npc_frostborn_scout
######*/

enum Scout
{
    QUEST_MISSING_SCOUT          = 12864,

    GOSSIP_TEXTID_SCOUT_1        = 13611,
    GOSSIP_TEXTID_SCOUT_2        = 13612,
    GOSSIP_TEXTID_SCOUT_3        = 13613,
    GOSSIP_TEXTID_SCOUT_4        = 13614

};

#define GOSSIP_ITEM_SCOUT_1     "Are you okay? I've come to take you back to Frosthold if you can stand."
#define GOSSIP_ITEM_SCOUT_2     "I'm sorry that I didn't get here sooner. What happened?"
#define GOSSIP_ITEM_SCOUT_3     "I'll go get some help. Hang in there."

bool GossipHello_npc_frostborn_scout(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetQuestStatus(QUEST_MISSING_SCOUT) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_SCOUT_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SCOUT_1, pCreature->GetGUID());
        return true;
    }

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_frostborn_scout(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_SCOUT_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SCOUT_2, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_SCOUT_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SCOUT_3, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SCOUT_4, pCreature->GetGUID());
            pPlayer->AreaExploredOrEventHappens(QUEST_MISSING_SCOUT);
            break;
    }
    return true;
}

/*######
## npc_loklira_the_crone
######*/

#define GOSSIP_ITEM_TELL_ME         "Tell me about this proposal."
#define GOSSIP_ITEM_WHAT_HAPPENED   "What happened then?"
#define GOSSIP_ITEM_YOU_WANT_ME     "You want me to take part in the Hyldsmeet to end the war?"
#define GOSSIP_ITEM_VERY_WELL       "Very well. I'll take part in this competition."

enum
{
    GOSSIP_TEXTID_LOKLIRA1    = 13777,
    GOSSIP_TEXTID_LOKLIRA2    = 13778,
    GOSSIP_TEXTID_LOKLIRA3    = 13779,
    GOSSIP_TEXTID_LOKLIRA4    = 13780,

    QUEST_THE_HYLDSMEET       = 12970,

    CREDIT_LOKLIRA            = 30467
};

bool GossipHello_npc_loklira_the_crone(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_THE_HYLDSMEET) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_TELL_ME, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LOKLIRA1, pCreature->GetGUID());
        return true;
    }

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_loklira_the_crone(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_WHAT_HAPPENED, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LOKLIRA2, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_YOU_WANT_ME, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LOKLIRA3, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_VERY_WELL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LOKLIRA4, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->TalkedToCreature(CREDIT_LOKLIRA, pCreature->GetGUID());
            pPlayer->CLOSE_GOSSIP_MENU();
            break;
    }
    return true;
}

/*######
## npc_thorim
######*/

#define GOSSIP_ITEM_THORIM1         "Can you tell me what became of Sif?"
#define GOSSIP_ITEM_THORIM2         "He did more than that, Thorim. He controls Ulduar now."
#define GOSSIP_ITEM_THORIM3         "It needn't end this way."

enum
{
    QUEST_SIBLING_RIVALRY           = 13064,

    SPELL_THORIM_STORY_KILL_CREDIT  = 56940,

    GOSSIP_TEXTID_THORIM1           = 13799,
    GOSSIP_TEXTID_THORIM2           = 13801,
    GOSSIP_TEXTID_THORIM3           = 13802,
    GOSSIP_TEXTID_THORIM4           = 13803
};

bool GossipHello_npc_thorim(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_SIBLING_RIVALRY) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_THORIM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_THORIM1, pCreature->GetGUID());
    }
    else
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_thorim(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_THORIM2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_THORIM2, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_THORIM3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_THORIM3, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_THORIM4, pCreature->GetGUID());
            pCreature->CastSpell(pPlayer, SPELL_THORIM_STORY_KILL_CREDIT, true);
            break;
    }

    return true;
}

/*######
## npc_roxi_ramrocket
######*/

#define GOSSIP_TEXT_RAMROCKET1  "How do you fly in this cold climate?"
#define GOSSIP_TEXT_RAMROCKET2  "I hear you sell motorcycle parts."

enum
{
    SPELL_MECHANO_HOG           = 60866,
    SPELL_MEKGINEER_CHOPPER     = 60867
};

bool GossipHello_npc_roxi_ramrocket(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isTrainer())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, GOSSIP_TEXT_RAMROCKET1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRAIN);

    if (pCreature->isVendor())
    {
        if (pPlayer->HasSpell(SPELL_MECHANO_HOG) || pPlayer->HasSpell(SPELL_MEKGINEER_CHOPPER))
        {
            if (pPlayer->HasSkill(SKILL_ENGINEERING) && pPlayer->GetBaseSkillValue(SKILL_ENGINEERING) >= 450)
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_RAMROCKET2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
        }
    }

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_roxi_ramrocket(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_TRAIN:
            pPlayer->SEND_TRAINERLIST(pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_TRADE:
            pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
            break;
    }

    return true;
}

/*######
## npc_goblin_prisoner
######*/

enum
{
    QUEST_THEY_TOOK_OUR_MEN = 12843,
    NPC_GOBLIN_PRISONER     = 29466,
    NPC_SAY_EXIT            = -1999958,
    NPC_SAY_UNGRATEFUL_USER = -1999959,
    NPC_SAY_REMOVE_KILL     = -1999960,

    SPELL_ENRAGE            = 45111,
    SPELL_CHARGE_PLAYER     = 63336
};

struct MANGOS_DLL_DECL npc_goblin_prisonerAI : public ScriptedAI
{
    npc_goblin_prisonerAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint8 m_phase;
    uint32 m_timer;
    uint64 pPlayerGUID;

    void Reset()
    {
        m_phase = 0x00;
        m_timer     = 0;
    }

    void StartExit(uint64 PlayerGUID)
    {
        pPlayerGUID = PlayerGUID;
        m_phase = 0x01;
        m_timer = 2000;
    }

    void MovementInform(uint32 uiMoveType, uint32 uiPointId)
    {
        if (uiMoveType != POINT_MOTION_TYPE)
            return;

        if (uiPointId == 1)
        {
            m_phase = 0x02;
            m_timer = 5000;

            DoScriptText(NPC_SAY_EXIT, m_creature, m_creature->GetMap()->GetPlayer(pPlayerGUID));
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (m_phase)
        {
            if (m_timer < diff)
            {
                // go some steps forward
                if (m_phase & 0x01)
                {

                    float orientation = m_creature->GetOrientation();

                    Map const *map = m_creature->GetMap();
                    float x = m_creature->GetPositionX() + cos(orientation)*3;
                    float y = m_creature->GetPositionY() + sin(orientation)*3;
                    float z = map->GetHeight(x, y, MAX_HEIGHT);
                    m_creature->GetMotionMaster()->MovePoint(1, x, y, z);

                    m_phase = 0x00;
                }
                // go somewhere and despawn
                else if (m_phase & 0x04)
                {
                    float orientation = m_creature->GetOrientation() + (urand(0,1) ? M_PI_F /4 : -M_PI_F /4);

                    Map const *map = m_creature->GetMap();
                    float x = m_creature->GetPositionX() + cos(orientation)*10;
                    float y = m_creature->GetPositionY() + sin(orientation)*10;
                    float z = map->GetHeight(x, y, MAX_HEIGHT);
                    m_creature->GetMotionMaster()->MovePoint(2, x, y, z);
                    m_phase = 0x20;
                    m_timer = 1000;
                }
                // custom phase: check if player pay's attention
                else if (m_phase & 0x02)
                {
                    if (Player* pPlayer = m_creature->GetMap()->GetPlayer(pPlayerGUID))
                    {
                        // become angry
                        if (!m_creature->IsWithinDist(pPlayer, 10.0f, false) && !pPlayer->HasInArc(M_PI_F/2, m_creature))
                        {
                            m_creature->GetMotionMaster()->Clear();
                            DoCast(m_creature, SPELL_ENRAGE, true);
                            DoScriptText(NPC_SAY_UNGRATEFUL_USER, m_creature, pPlayer);

                            m_phase = 0x08;
                            m_timer = 1000;
                            return;
                        }
                    }
                    m_phase = 0x04;
                }
                // custom phase: charge to player
                else if (m_phase & 0x08)
                {
                    // charge to player and follow
                    if (Player* pPlayer = m_creature->GetMap()->GetPlayer(pPlayerGUID))
                    {
                        //m_creature->GetMotionMaster()->MoveFollow(pPlayer, 0.5f, pPlayer->GetAngle(m_creature));
                        DoCast(pPlayer, SPELL_CHARGE_PLAYER, false);
                    }
                    m_phase = 0x10;
                    m_timer = 1000;
                    return;
                }
                // custom phase: (remove kill credit and) knock back :-P
                else if (m_phase & 0x10)
                {
                    DoScriptText(NPC_SAY_REMOVE_KILL, m_creature, m_creature->GetMap()->GetPlayer(pPlayerGUID));

                    /* hmm,ok, does does not really work...
                    if (Player* pPlayer = m_creature->GetMap()->GetPlayer(pPlayerGUID))
                        if (Quest const* qInfo = GetQuestTemplateStore(QUEST_THEY_TOOK_OUR_MEN))
                        {
                            if (pPlayer->GetQuestStatus(QUEST_THEY_TOOK_OUR_MEN) == QUEST_STATUS_COMPLETE) 
                                pPlayer->IncompleteQuest(QUEST_THEY_TOOK_OUR_MEN);
                            QuestStatusMap qMap = pPlayer->getQuestStatusMap();
                            QuestStatusData& q_status = qMap[QUEST_THEY_TOOK_OUR_MEN];
                            uint32 curkillcount = q_status.m_creatureOrGOcount[0];
                            q_status.m_creatureOrGOcount[0] = q_status.m_creatureOrGOcount[0] -1 < 0 ? 0 : q_status.m_creatureOrGOcount[0] -1;
                            if (q_status.uState != QUEST_NEW)
                                q_status.uState = QUEST_CHANGED;

                            pPlayer->SendQuestUpdateAddCreatureOrGo( qInfo, m_creature->GetObjectGuid(), 0, curkillcount, -1);
                        }
                    */
                    // kock player back and despawn
                    m_creature->GetMotionMaster()->Clear();
                    if (Player* pPlayer = m_creature->GetMap()->GetPlayer(pPlayerGUID))
                        pPlayer->KnockBackFrom(m_creature, 15.0f, 30.0f);
                    m_phase = 0x20;
                    m_timer = 4000;
                    return;
                }
                else if (m_phase & 0x20)
                {
                    m_creature->ForcedDespawn();
                    m_phase = 0x00;
                    pPlayerGUID = 0;
                    return;
                }
            }
            else
                m_timer -= diff;
        }
    }
};

CreatureAI* GetAI_npc_goblin_prisonerAI(Creature* pCreature)
{
    return new npc_goblin_prisonerAI(pCreature);
}

bool GOHello_rusty_cage(Player* pPlayer, GameObject* pGo)
{
    // hacky implementation for eyecandy :-)
    if (Creature* pPrisoner = GetClosestCreatureWithEntry(pGo,29466, 2))
    {
        if (npc_goblin_prisonerAI* pPrisonerAI = dynamic_cast<npc_goblin_prisonerAI*>(pPrisoner->AI()))
            pPrisonerAI->StartExit(pPlayer->GetGUID());
    }

    // kill creadit is done via event script
    return false;
}

void AddSC_storm_peaks()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_frostborn_scout";
    newscript->pGossipHello = &GossipHello_npc_frostborn_scout;
    newscript->pGossipSelect = &GossipSelect_npc_frostborn_scout;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_loklira_the_crone";
    newscript->pGossipHello = &GossipHello_npc_loklira_the_crone;
    newscript->pGossipSelect = &GossipSelect_npc_loklira_the_crone;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_thorim";
    newscript->pGossipHello = &GossipHello_npc_thorim;
    newscript->pGossipSelect = &GossipSelect_npc_thorim;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_roxi_ramrocket";
    newscript->pGossipHello = &GossipHello_npc_roxi_ramrocket;
    newscript->pGossipSelect = &GossipSelect_npc_roxi_ramrocket;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_goblin_prisoner";
    newscript->GetAI = &GetAI_npc_goblin_prisonerAI;
    newscript->RegisterSelf(false);

    newscript = new Script;
    newscript->Name = "go_rusty_cage";
    newscript->pGOHello = &GOHello_rusty_cage;
    newscript->RegisterSelf(false);
}
