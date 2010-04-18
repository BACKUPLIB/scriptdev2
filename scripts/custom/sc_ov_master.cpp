/* Copyright (C) 2006,2007 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
/*
OV-Master by Nezz for Orangevirus(http://orangevir.us)
*/

#include "precompiled.h"
#include "sc_creature.h"
#include "sc_gossip.h"
#include "../../../../game/Player.h"
#include "../../../../game/GossipDef.h"
#include "../../../../shared/Log.h"

#define HOW_TO_BECOME_VIP    "Wie kann ich VIP werden?"
#define QUESTLIST            "Ich möchte mein VIP Quest beginnen."
#define VENDORLIST           "Zeigt mir eure Waren."
#define NEWS                 "Erzaehl mir die News."
#define STARTED_VIP_QUEST    "Danke das du gespendet hast."
#define TRAINLIST            "Ich möchte mich weiterbilden"

struct MANGOS_DLL_DECL ov_masterAI : public ScriptedAI
{
   ov_masterAI(Creature *c) : ScriptedAI(c) {Reset();}

    bool InCombat;

    void Reset()
    {
        InCombat = false;

       // m_creature->RemoveAllAuras();
       // m_creature->DeleteThreatList();
       // m_creature->CombatStop();
       // DoGoHome();
    }

    void AttackStart(Unit *who) //We don't attack, because OV Master is your friend ^^
    {
        return; 
    }

    void Aggro(Unit *who) //We don't attack, also maybe put here some texts to say when VIP is in 10 yards: Why don't you take your VIP weapon?
    {
        return;
    }

};


CreatureAI* GetAI_ov_master(Creature *_Creature)
{
    return new ov_masterAI (_Creature);
}

bool GossipHello_ov_master(Player *player, Creature *_Creature)
{
    uint64 pguid = player->GetGUID();
    uint64 cguid = _Creature->GetGUID();

    /*if (_Creature->isQuestGiver()) {
        player->PrepareQuestMenu( cguid );
        player->SendPreparedQuest( cguid );*/

    if(player->isVIP( pguid ) == true)
	    {//sLog.outError("Player VIP Status: %d", player->isVIP(pguid));
        player->ADD_GOSSIP_ITEM( 2, QUESTLIST, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
		player->ADD_GOSSIP_ITEM( 1, VENDORLIST, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);
		player->ADD_GOSSIP_ITEM( 3, TRAINLIST, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRAIN);}
    else
        {//sLog.outError("Player VIP Status: %d", player->isVIP(pguid));
		player->ADD_GOSSIP_ITEM( 2, HOW_TO_BECOME_VIP, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);}

    player->ADD_GOSSIP_ITEM( 0, NEWS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
    player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, cguid);

    return true;
}

bool GossipSelect_ov_master(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    uint64 pguid = player->GetGUID();
    uint64 cguid = _Creature->GetGUID();

    if (action == GOSSIP_ACTION_INFO_DEF + 1) // Gib VIPQuest
    {
        /*QEmote qe;
        qe._Delay = 0;
        qe._Emote = 0;
        std::string title = "";
        player->PlayerTalkClass->SendQuestGiverQuestList( qe, title, cguid ); */
        if (_Creature->isQuestGiver()) {
            player->PrepareQuestMenu( cguid );
            player->SendPreparedQuest( cguid ); }
    }
    else
        player->SEND_GOSSIP_MENU(110002,cguid); // VIPQuest fertig
    
	if (action == GOSSIP_ACTION_INFO_DEF + 2) // Wie werde ich VIP?
        player->SEND_GOSSIP_MENU(110000,cguid);

    if(action == GOSSIP_ACTION_TRADE)
    {
        player->SEND_VENDORLIST( _Creature->GetGUID() );
    }

    if(action == GOSSIP_ACTION_TRAIN)
    {
        player->SEND_TRAINERLIST( _Creature->GetGUID() );
    }

    if (action == GOSSIP_ACTION_INFO_DEF + 4) // News
        player->SEND_GOSSIP_MENU(110001,cguid);

    return true;
}

uint32 NPCDialogStatus_ov_master(Player *player, Creature *_Creature )
{
    return player->QUEST_DIALOG_STATUS(player, _Creature, DIALOG_STATUS_LOW_LEVEL_AVAILABLE);
}

bool QuestAccept_ov_master(Player *player, Creature *creature, Quest const *quest )
{
    if(quest->GetQuestId() == 99000)
    {
        //((ov_masterAI*)creature->AI())->DoSay(STARTED_VIP_QUEST, LANG_UNIVERSAL, player);
        return true;
    }
    return false;
}


void AddSC_ov_master()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="ov_master";
    newscript->pGossipHello          = &GossipHello_ov_master;
    newscript->pGossipSelect         = &GossipSelect_ov_master;
    newscript->pNPCDialogStatus      = &NPCDialogStatus_ov_master;
    newscript->pQuestAccept          = &QuestAccept_ov_master;
    newscript->GetAI = GetAI_ov_master;
    newscript->RegisterSelf();
}
