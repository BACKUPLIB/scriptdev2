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
SDName: Boss_Taldaram
SD%Complete: 20%
SDComment:
SDCategory: Ahn'kahet
EndScriptData */

#include "precompiled.h"
#include "ahnkahet.h"

enum
{
    SAY_AGGRO                       = -1619008,
    SAY_VANISH_1                    = -1619009,
    SAY_VANISH_2                    = -1619010,
    SAY_FEED_1                      = -1619011,
    SAY_FEED_2                      = -1619012,
    SAY_SLAY_1                      = -1619013,
    SAY_SLAY_2                      = -1619014,
    SAY_SLAY_3                      = -1619015,
    SAY_DEATH                       = -1619016,

	SPELL_BEAM_VISUAL				= 60342,
	
	SPELL_FLAME_SPHERE				= 55931,
	SPELL_BLOODTHIRST				= 55968,
	SPELL_VANISH					= 55964,

	SPELL_EMBRACE_OF_THE_VAMPYR		= 55959,
	SPELL_EMBRACE_OF_THE_VAMPYR_H	= 59513,

	SPELL_FLAME_SPHERE_PERIODIC		= 55927,

	SPELL_FLAME_SPHERE_VISUAL		= 55628,

	NPC_FLAME_ORB_TRIGGER			= 31687
};

#define	FLAME_ORB_X_1	366.0f
#define FLAME_ORB_Y_1	-713.0f

#define FLAME_ORB_X_2	328.0f
#define FLAME_ORB_Y_2	-1015.0f

#define FLAME_ORB_X_3	674.0f
#define FLAME_ORB_Y_3	-1107.0f

#define ORB_Z			5.0f

/*######
## boss_taldaram
######*/

struct MANGOS_DLL_DECL boss_taldaramAI : public ScriptedAI
{
    boss_taldaramAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

	bool isInVanish;

	uint32 summonFlameOrbTimer;
	uint32 vanishTimer;
	uint32 bloodthirstTimer;
	uint32 embraceOfTheVampyrTimer;

    void Reset()
    {
		summonFlameOrbTimer = 12000;
		vanishTimer = 14000;
		bloodthirstTimer = 10000;

		isInVanish = false;
	
		if (m_pInstance)
			m_pInstance->SetData(TYPE_TALDARAM, NOT_STARTED);
    }

    void Aggro(Unit* pWho)
    {
        DoScriptText(SAY_AGGRO, m_creature);
		m_creature->RemoveAurasDueToSpell(SPELL_BEAM_VISUAL);
		
		if (m_pInstance)
			m_pInstance->SetData(TYPE_TALDARAM, IN_PROGRESS);
    }

    void KilledUnit(Unit* pVictim)
    {
        switch(urand(0, 2))
        {
            case 0: DoScriptText(SAY_SLAY_1, m_creature); break;
            case 1: DoScriptText(SAY_SLAY_2, m_creature); break;
            case 2: DoScriptText(SAY_SLAY_3, m_creature); break;
        }
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_TALDARAM, DONE);
    }

	void MoveInLineOfSight(Unit* pWho)
    {
        if (m_pInstance)
        {
			if (pWho->IsWithinDist(m_creature, 10.0f, true))
            {
                if (m_creature->isAlive())
				{
					if (m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
					{
						m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
						m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
					}
				}
            }
        }
    }

	void summonFlameOrb()
	{
		if (m_bIsRegularMode)
		{
			if (Creature* pFlameOrb = m_creature->SummonCreature(NPC_FLAME_ORB_TRIGGER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + ORB_Z, m_creature->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 15000))
			{
				pFlameOrb->GetMotionMaster()->Clear();
				pFlameOrb->CastSpell(pFlameOrb, SPELL_FLAME_SPHERE_VISUAL, true);

				switch (urand(0, 2))
				{
					case 0:
						pFlameOrb->GetMotionMaster()->MovePoint(0, FLAME_ORB_X_1, FLAME_ORB_Y_1, pFlameOrb->GetPositionZ());
						break;
					case 1:
						pFlameOrb->GetMotionMaster()->MovePoint(0, FLAME_ORB_X_2, FLAME_ORB_Y_2, pFlameOrb->GetPositionZ());
						break;
					case 2:
						pFlameOrb->GetMotionMaster()->MovePoint(0, FLAME_ORB_X_3, FLAME_ORB_Y_3, pFlameOrb->GetPositionZ());
						break;
					default:
						pFlameOrb->GetMotionMaster()->MovePoint(0, FLAME_ORB_X_1, FLAME_ORB_Y_1, pFlameOrb->GetPositionZ());
						break;
				}
				
				pFlameOrb->SetInCombatWithZone();				
			}
		}
		else
		{
			if (Creature* pFlameOrb1 = m_creature->SummonCreature(NPC_FLAME_ORB_TRIGGER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + ORB_Z, m_creature->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 15000))
			{
				pFlameOrb1->GetMotionMaster()->Clear();
				pFlameOrb1->CastSpell(pFlameOrb1, SPELL_FLAME_SPHERE_VISUAL, true);
				pFlameOrb1->GetMotionMaster()->MovePoint(0, FLAME_ORB_X_1, FLAME_ORB_Y_1, pFlameOrb1->GetPositionZ());	
			}

			if (Creature* pFlameOrb2 = m_creature->SummonCreature(NPC_FLAME_ORB_TRIGGER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + ORB_Z, m_creature->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 15000))
			{
				pFlameOrb2->GetMotionMaster()->Clear();
				pFlameOrb2->CastSpell(pFlameOrb2, SPELL_FLAME_SPHERE_VISUAL, true);
				pFlameOrb2->GetMotionMaster()->MovePoint(0, FLAME_ORB_X_2, FLAME_ORB_Y_2, pFlameOrb2->GetPositionZ());
			}

			if (Creature* pFlameOrb3 = m_creature->SummonCreature(NPC_FLAME_ORB_TRIGGER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ() + ORB_Z, m_creature->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN, 15000))
			{
				pFlameOrb3->GetMotionMaster()->Clear();
				pFlameOrb3->CastSpell(pFlameOrb3, SPELL_FLAME_SPHERE_VISUAL, true);
				pFlameOrb3->GetMotionMaster()->MovePoint(0, FLAME_ORB_X_3, FLAME_ORB_Y_3, pFlameOrb3->GetPositionZ());
			}
		}
	}

    void UpdateAI(const uint32 uiDiff)
    {
		if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
			return;

		if (summonFlameOrbTimer < uiDiff)
		{
			summonFlameOrb();
			summonFlameOrbTimer = 12000;
		}else summonFlameOrbTimer -= uiDiff;

		if (vanishTimer < uiDiff)
		{
			m_creature->SetVisibility(VISIBILITY_OFF);
			isInVanish = true;
			embraceOfTheVampyrTimer = 2200;
			vanishTimer = 200000;
		}else vanishTimer -= uiDiff;
		
		if (isInVanish)
		{
			if (embraceOfTheVampyrTimer < uiDiff)
			{
				if (Unit* pPlayer = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
				{
					m_creature->NearTeleportTo(pPlayer->GetPositionX() + 3.0f, pPlayer->GetPositionY() + 3.0f, pPlayer->GetPositionZ(), pPlayer->GetOrientation());
					m_creature->SetVisibility(VISIBILITY_ON);
					DoCastSpellIfCan(pPlayer, m_bIsRegularMode ? SPELL_EMBRACE_OF_THE_VAMPYR : SPELL_EMBRACE_OF_THE_VAMPYR_H);
					summonFlameOrbTimer += 20000;
				}
				
				isInVanish = false;
				vanishTimer = 25000;
			}else embraceOfTheVampyrTimer -= uiDiff;
		}

		if (bloodthirstTimer < uiDiff)
		{
			DoCastSpellIfCan(m_creature->getVictim(), SPELL_BLOODTHIRST); 
			bloodthirstTimer = m_bIsRegularMode ? 15000 : 8000;
		}else bloodthirstTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_taldaram(Creature* pCreature)
{
    return new boss_taldaramAI(pCreature);
}

/*######
## boss_taldaram_flame_orb
######*/

struct MANGOS_DLL_DECL mob_taldaram_flame_orbAI : public ScriptedAI
{
    mob_taldaram_flame_orbAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

	uint32 castTimer;

    void Reset()
    {
		castTimer = 1000;
    }

	void Aggro(Unit* pWho)
	{
		m_creature->DeleteThreatList();
		m_creature->SetSplineFlags(SPLINEFLAG_FLYING);
	}

    void UpdateAI(const uint32 uiDiff)
    {
		if (castTimer < uiDiff)
		{
			m_creature->CastSpell(m_creature, SPELL_FLAME_SPHERE_PERIODIC, true);
			castTimer = 250;
		}else castTimer -= uiDiff;
    }
};

CreatureAI* GetAI_mob_taldaram_flame_orb(Creature* pCreature)
{
    return new mob_taldaram_flame_orbAI(pCreature);
}

/*######
## go_nerubian_device
######*/

bool GOHello_go_nerubian_device(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData();

    if (!pInstance)
        return false;

    pInstance->SetData(TYPE_TALDARAM, SPECIAL);
    pGo->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_UNK1);
    return false;
}

void AddSC_boss_taldaram()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_taldaram";
    newscript->GetAI = &GetAI_boss_taldaram;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "mob_taldaram_flame_orb";
    newscript->GetAI = &GetAI_mob_taldaram_flame_orb;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_nerubian_device";
    newscript->pGOHello = &GOHello_go_nerubian_device;
    newscript->RegisterSelf();
}
