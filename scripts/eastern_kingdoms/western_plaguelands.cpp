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
SDName: Western_Plaguelands
SD%Complete: 90
SDComment: Quest support: 5216,5219,5222,5225,5229,5231,5233,5235,9446. To obtain Vitreous Focuser (could use more spesifics about gossip items)
SDCategory: Western Plaguelands
EndScriptData */

/* ContentData
npcs_dithers_and_arbington
npc_myranda_hag
npc_the_scourge_cauldron
npc_anchorite_truuen
EndContentData */

#include "precompiled.h"
#include "escort_ai.h"

/*######
## npcs_dithers_and_arbington
######*/

bool GossipHello_npcs_dithers_and_arbington(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    if (pCreature->isVendor())
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_TEXT_BROWSE_GOODS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

    if (pPlayer->GetQuestRewardStatus(5237) || pPlayer->GetQuestRewardStatus(5238))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What does the Felstone Field Cauldron need?",      GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What does the Dalson's Tears Cauldron need?",      GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What does the Writhing Haunt Cauldron need?",      GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "What does the Gahrron's Withering Cauldron need?", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);
        pPlayer->SEND_GOSSIP_MENU(3985, pCreature->GetGUID());
    }else
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npcs_dithers_and_arbington(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_TRADE:
            pPlayer->SEND_VENDORLIST(pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Thanks, i need a Vitreous Focuser", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
            pPlayer->SEND_GOSSIP_MENU(3980, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Thanks, i need a Vitreous Focuser", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
            pPlayer->SEND_GOSSIP_MENU(3981, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Thanks, i need a Vitreous Focuser", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
            pPlayer->SEND_GOSSIP_MENU(3982, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Thanks, i need a Vitreous Focuser", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
            pPlayer->SEND_GOSSIP_MENU(3983, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+5:
            pPlayer->CLOSE_GOSSIP_MENU();
            pCreature->CastSpell(pPlayer, 17529, false);
            break;
    }
    return true;
}

/*######
## npc_myranda_the_hag
######*/

enum
{
    QUEST_SUBTERFUGE        = 5862,
    QUEST_IN_DREAMS         = 5944,
    SPELL_SCARLET_ILLUSION  = 17961
};

#define GOSSIP_ITEM_ILLUSION    "I am ready for the illusion, Myranda."

bool GossipHello_npc_myranda_the_hag(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_SUBTERFUGE) == QUEST_STATUS_COMPLETE &&
        !pPlayer->GetQuestRewardStatus(QUEST_IN_DREAMS) && !pPlayer->HasAura(SPELL_SCARLET_ILLUSION))
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ILLUSION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->SEND_GOSSIP_MENU(4773, pCreature->GetGUID());
        return true;
    }
    else
        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_myranda_the_hag(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        pCreature->CastSpell(pPlayer, SPELL_SCARLET_ILLUSION, false);
    }
    return true;
}

/*######
## npc_the_scourge_cauldron
######*/

struct MANGOS_DLL_DECL npc_the_scourge_cauldronAI : public ScriptedAI
{
    npc_the_scourge_cauldronAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    void Reset() {}

    void DoDie()
    {
        //summoner dies here
        m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        //override any database `spawntimesecs` to prevent duplicated summons
        uint32 rTime = m_creature->GetRespawnDelay();
        if (rTime<600)
            m_creature->SetRespawnDelay(600);
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!who || who->GetTypeId() != TYPEID_PLAYER)
            return;

        if (who->GetTypeId() == TYPEID_PLAYER)
        {
            switch(m_creature->GetAreaId())
            {
                case 199:                                   //felstone
                    if (((Player*)who)->GetQuestStatus(5216) == QUEST_STATUS_INCOMPLETE ||
                        ((Player*)who)->GetQuestStatus(5229) == QUEST_STATUS_INCOMPLETE)
                    {
                        m_creature->SummonCreature(11075, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
                        DoDie();
                    }
                    break;
                case 200:                                   //dalson
                    if (((Player*)who)->GetQuestStatus(5219) == QUEST_STATUS_INCOMPLETE ||
                        ((Player*)who)->GetQuestStatus(5231) == QUEST_STATUS_INCOMPLETE)
                    {
                        m_creature->SummonCreature(11077, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 600000);
                        DoDie();
                    }
                    break;
                case 201:                                   //gahrron
                    if (((Player*)who)->GetQuestStatus(5225) == QUEST_STATUS_INCOMPLETE ||
                        ((Player*)who)->GetQuestStatus(5235) == QUEST_STATUS_INCOMPLETE)
                    {
                        m_creature->SummonCreature(11078, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,600000);
                        DoDie();
                    }
                    break;
                case 202:                                   //writhing
                    if (((Player*)who)->GetQuestStatus(5222) == QUEST_STATUS_INCOMPLETE ||
                        ((Player*)who)->GetQuestStatus(5233) == QUEST_STATUS_INCOMPLETE)
                    {
                        m_creature->SummonCreature(11076, 0.0f, 0.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,600000);
                        DoDie();
                    }
                    break;
            }
        }
    }
};
CreatureAI* GetAI_npc_the_scourge_cauldron(Creature* pCreature)
{
    return new npc_the_scourge_cauldronAI(pCreature);
}

/*######
##  npc_anchorite_truuen
######*/

enum eTruuen
{
    NPC_GHOST_UTHER             = 17233,
    NPC_THEL_DANIS              = 1854,
    NPC_GHOUL                   = 1791,      //ambush 

    QUEST_TOMB_LIGHTBRINGER     = 9446,

    SAY_START                   = -1999980,
    SAY_WP_8                    = -1999981,  //Beware! We are attacked!    
    SAY_WP_9                    = -1999982,  //It must be the purity of the Mark of the Lightbringer that is drawing forth the Scourge to attack us. We must proceed with caution lest we be overwhelmed!
    SAY_WP_15                   = -1999983,  //This land truly needs to be cleansed by the Light! Let us continue on to the tomb. It isn't far now...
    SAY_WP_21                   = -1999984,  //Be welcome, friends!
    SAY_WP_23                   = -1999985,  //Thank you for coming here in remembrance of me. Your efforts in recovering that symbol, while unnecessary, are certainly touching to an old man's heart. 
    SAY_WP_24                   = -1999986,  //Please, rise my friend. Keep the Blessing as a symbol of the strength of the Light and how heroes long gone might once again rise in each of us to inspire. 
    SAY_WP_25                   = -1999987,  //Thank you my friend for making this possible. This is a day that I shall never forget! I think I will stay a while. Please return to High Priestess MacDonnell at the camp. I know that she'll be keenly interested to know of what has transpired here.
};

struct npc_anchorite_truuenAI : public npc_escortAI
{    
    npc_anchorite_truuenAI(Creature* pCreature) : npc_escortAI(pCreature) { }

    uint32 m_uiChatTimer;

    Creature* Ughost;
    Creature* Theldanis;
    Creature* GhostUther;

    void Reset()
    {        
        m_uiChatTimer = 7000;
    }

    void JustSummoned(Creature* pSummoned)
    {
        if (pSummoned->GetEntry() == NPC_GHOUL)
            pSummoned->AI()->AttackStart(m_creature);
    }
    
    void WaypointReached(uint32 i)
    {
        Player* pPlayer = GetPlayerForEscort();
        switch (i)
        {
            case 8:
                DoScriptText(SAY_WP_8, m_creature);
                Ughost = DoSpawnCreature(NPC_GHOUL, 7.0f, 7.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                Ughost = DoSpawnCreature(NPC_GHOUL, 5.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                break;
            case 9:
                DoScriptText(SAY_WP_9, m_creature);
                break;
            case 14:                
                Ughost = DoSpawnCreature(NPC_GHOUL, 7.0f, 7.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                Ughost = DoSpawnCreature(NPC_GHOUL, 5.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                Ughost = DoSpawnCreature(NPC_GHOUL, 10.0f, 10.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                Ughost = DoSpawnCreature(NPC_GHOUL, 8.0f, 8.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000);
                break;
            case 15:
                DoScriptText(SAY_WP_15, m_creature);
            case 21:                 
                Theldanis = GetClosestCreatureWithEntry(pPlayer, NPC_THEL_DANIS, 1500.0f);
                DoScriptText(SAY_WP_21, Theldanis);
                break;
            case 22:
                break;                
            case 23:
                Ughost = DoSpawnCreature(NPC_GHOST_UTHER, 0.0f, 0.0f , 0.0f , 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);                
                GhostUther = GetClosestCreatureWithEntry(pPlayer, NPC_GHOST_UTHER, 1500.0f);
                DoScriptText(SAY_WP_23, GhostUther);
                m_uiChatTimer = 8000;
                break;
            case 24:
                DoScriptText(SAY_WP_24, m_creature, pPlayer);
                m_uiChatTimer = 6000;
                break;
            case 25:
                DoScriptText(SAY_WP_25, m_creature, pPlayer);
                m_uiChatTimer = 4000;
                break;
            case 26:
                if (pPlayer)
                    pPlayer->GroupEventHappens(QUEST_TOMB_LIGHTBRINGER, m_creature);                
                break;            
        }
    }

    void EnterCombat(Unit* pWho){}    

     void JustDied(Unit* pKiller)
    {
       Player* pPlayer = GetPlayerForEscort();
        if (pPlayer)
            pPlayer->FailQuest(QUEST_TOMB_LIGHTBRINGER);  
    }

    void UpdateAI(const uint32 uiDiff)
    {
        npc_escortAI::UpdateAI(uiDiff);
        DoMeleeAttackIfReady();
        if (HasEscortState(STATE_ESCORT_ESCORTING))
            m_uiChatTimer = 6000;
    }
};

CreatureAI* GetAI_npc_anchorite_truuen(Creature* pCreature)
{
    return new npc_anchorite_truuenAI(pCreature);
}

bool QuestAccept_npc_anchorite_truuen(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_TOMB_LIGHTBRINGER)
    {
        DoScriptText(SAY_START, pCreature, pPlayer);

        if (npc_anchorite_truuenAI* pEscortAI = dynamic_cast<npc_anchorite_truuenAI*>(pCreature->AI()))
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
    }
return true;
}

/*######
##
######*/

void AddSC_western_plaguelands()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npcs_dithers_and_arbington";
    newscript->pGossipHello = &GossipHello_npcs_dithers_and_arbington;
    newscript->pGossipSelect = &GossipSelect_npcs_dithers_and_arbington;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_myranda_the_hag";
    newscript->pGossipHello = &GossipHello_npc_myranda_the_hag;
    newscript->pGossipSelect = &GossipSelect_npc_myranda_the_hag;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_the_scourge_cauldron";
    newscript->GetAI = &GetAI_npc_the_scourge_cauldron;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "npc_anchorite_truuen";
	newscript->pQuestAcceptNPC = &QuestAccept_npc_anchorite_truuen;
    newscript->GetAI = &GetAI_npc_anchorite_truuen;
    newscript->RegisterSelf();
}
