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
SDName: Sholazar_Basin
SD%Complete: 100
SDComment: Quest support: 12573, 12544, 12688
SDCategory: Sholazar Basin
EndScriptData */

/* ContentData
npc_vekjik
mob_voiceofnozronn
npc_engineer_helice
EndContentData */

#include "precompiled.h"
#include "escort_ai.h"

/*######
## npc_vekjik
######*/

#define GOSSIP_VEKJIK_ITEM1 "Shaman Vekjik, I have spoken with the big-tongues and they desire peace. I have brought this offering on their behalf."
#define GOSSIP_VEKJIK_ITEM2 "No no... I had no intentions of betraying your people. I was only defending myself. it was all a misunderstanding."

enum
{
    GOSSIP_TEXTID_VEKJIK1       = 13137,
    GOSSIP_TEXTID_VEKJIK2       = 13138,

    SAY_TEXTID_VEKJIK1          = -1000208,

    SPELL_FREANZYHEARTS_FURY    = 51469,

    QUEST_MAKING_PEACE          = 12573
};

bool GossipHello_npc_vekjik(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_MAKING_PEACE) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_VEKJIK_ITEM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_VEKJIK1, pCreature->GetGUID());
        return true;
    }

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_vekjik(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch(uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_VEKJIK_ITEM2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_VEKJIK2, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->CLOSE_GOSSIP_MENU();
            DoScriptText(SAY_TEXTID_VEKJIK1, pCreature, pPlayer);
            pPlayer->AreaExploredOrEventHappens(QUEST_MAKING_PEACE);
            pCreature->CastSpell(pPlayer, SPELL_FREANZYHEARTS_FURY, false);
            break;
    }

    return true;
}

/*######
## mob_voiceofnozronn
######*/
enum nozronnsay
{
SAY_NOZRONN1 = -1594190,
SAY_NOZRONN2 = -1594191,
SAY_NOZRONN3 = -1594192,
SAY_NOZRONN4 = -1594193,
SAY_NOZRONN5 = -1594194,
QUEST_BONES_OF_NOZRONN = 12544
};


struct MANGOS_DLL_DECL mob_voiceofnozronnAI : public ScriptedAI
{
    mob_voiceofnozronnAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    uint32 saytimer;
    uint32 step;
    Player* pPlayer;
    void Reset()
    {
     saytimer = 1000;
     step = 0;
    }

	void UpdateAI(const uint32 diff)
	{
        if(saytimer < diff)
	    {
            switch(step)
            {
                case 0:
                    pPlayer = GetPlayerAtMinimumRange(20.0f);
					if(pPlayer)
					{
                    DoScriptText(SAY_NOZRONN1, m_creature);
                    saytimer += 5000;
                    step++;
					break;
					} else break;
                    break;
                case 1:
                    DoScriptText(SAY_NOZRONN2, m_creature);
                    saytimer += 5000;
                    step++;
                    break;
                case 2:
                    DoScriptText(SAY_NOZRONN3, m_creature);
                    saytimer += 5000;
                    step++;
                    break;
                case 3:
                    DoScriptText(SAY_NOZRONN4, m_creature);
                    saytimer += 5000;
                    step++;
                    break;
                case 4:
                    if (pPlayer->GetQuestStatus(QUEST_BONES_OF_NOZRONN) == QUEST_STATUS_INCOMPLETE)
					{
                    pPlayer->KilledMonsterCredit(28256, m_creature->GetGUID());
                    //pPlayer->CompleteQuest(QUEST_BONES_OF_NOZRONN);
                    DoScriptText(SAY_NOZRONN5, m_creature);
                    step++;
                    break;
					} else break;
            }

	    } else saytimer -= diff;

	}

};

CreatureAI* GetAI_mob_voiceofnozronnAI(Creature* pCreature)
{
    return new mob_voiceofnozronnAI(pCreature);
}

/*#####
## npc_engineer_helice
#####*/

/*
TODO:
implement following actions along escorting:
Engineer Helice says: Let's get the hell out of here.
Engineer Helice says: Listen up, Venture Company goons! Rule #1: Never keep the prisoner near the explosives.
Engineer Helice says: Or THIS is what you get.
<Packs of dynamite explodes>
Engineer Helice says: It's getting a little hot over here. Shall we move on?
Engineer Helice says: Oh, look, it's another cartload of explosives! Let's help them dispose of it.
<Packs of dynamite explodes>
Engineer Helice says: You really shouldn't play with this stuff. Someone could get hurt.
Engineer Helice says: We made it! Thank you for getting me out of that hell hole. Tell Hemet to expect me!
*/

enum
{
    QUEST_ENGINEERING_A_DISASTER  = 12688
};

struct MANGOS_DLL_DECL npc_engineer_heliceAI : public npc_escortAI
{
    npc_engineer_heliceAI(Creature* pCreature) : npc_escortAI(pCreature) { Reset(); }

    void WaypointReached(uint32 i)
    {
        Player* pPlayer = GetPlayerForEscort();

        if (!pPlayer)
            return;

        switch(i)
        {
            case 10:
                pPlayer->GroupEventHappens(QUEST_ENGINEERING_A_DISASTER, m_creature);
                break;
            default:
                break;
        }
    }

    void Reset() 
    { 
        m_creature->setFaction(35);
    }
};

bool QuestAccept_npc_engineer_helice(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_ENGINEERING_A_DISASTER)
    {

        if (npc_engineer_heliceAI* pEscortAI = dynamic_cast<npc_engineer_heliceAI*>(pCreature->AI()))
        {
            //FIXME: probably not the right faction
            //set npc enemy to monsters
            pCreature->setFaction(pPlayer->getFaction());
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
        }
    }
    return true;
}

CreatureAI* GetAI_npc_engineer_helice(Creature* pCreature)
{
    return new npc_engineer_heliceAI(pCreature);
}

void AddSC_sholazar_basin()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_vekjik";
    newscript->pGossipHello = &GossipHello_npc_vekjik;
    newscript->pGossipSelect = &GossipSelect_npc_vekjik;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_voiceofnozronn";
    newscript->GetAI = &GetAI_mob_voiceofnozronnAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_engineer_helice";
    newscript->GetAI = &GetAI_npc_engineer_helice;
    newscript->pQuestAccept = &QuestAccept_npc_engineer_helice;
    newscript->RegisterSelf();
}
