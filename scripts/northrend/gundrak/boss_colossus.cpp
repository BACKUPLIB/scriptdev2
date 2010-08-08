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
SDName: Boss_Colossus
SD%Complete: 20%
SDComment:
SDCategory: Gundrak
EndScriptData */

#include "precompiled.h"
#include "gundrak.h"
#include <math.h> 

enum
{
    EMOTE_SURGE                 = -1604008,
    EMOTE_SEEP                  = -1604009,
    EMOTE_GLOW                  = -1604010
};

#define SPELL_MOJO_WAVE				55626
#define SPELL_MOJO_WAVE_H			58993
#define SPELL_MOJO_PUDDLE			55627
#define SPELL_MOJO_PUDDLE_H			58994

#define SPELL_MIGHTY_BLOW			54719
#define SPELL_EMERGE				54850

#define MOJO_ENTRY					29830
#define ELEMENTAL_ENTRY				29573

float distance = 10;

/*######
## boss_colossus
######*/

struct MANGOS_DLL_DECL boss_colossusAI : public ScriptedAI
{
    boss_colossusAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

	bool m_bHasCreatedList;
	bool m_bIsElementarPhase;

	std::list<uint64> m_lLivingMojoGUIDList;

	Creature* pElemental;

	uint32 elementalLifepoints;
	uint32 mightyBlowTimer;
	uint32 emergeTimer;
	uint32 spawnElementalTimer;

    void Reset()
    {
		m_bHasCreatedList = true;
		m_bIsElementarPhase = false;

		if (m_pInstance)
            m_pInstance->SetData(TYPE_COLOSSUS, NOT_STARTED);

		if (!m_lLivingMojoGUIDList.empty() && m_pInstance)
        {
            for(std::list<uint64>::iterator itr = m_lLivingMojoGUIDList.begin(); itr != m_lLivingMojoGUIDList.end(); ++itr)
            {
                if (Creature* pMojo = m_pInstance->instance->GetCreature(*itr))
                {
                    if (!pMojo->isAlive())
                        pMojo->Respawn();
                    else
                        pMojo->AI()->EnterEvadeMode();
                }
            }
        }

		m_lLivingMojoGUIDList.clear();
		emergeTimer = 12000;

		pElemental = NULL;
    }

	void Aggro(Unit* pWho)
	{
		if (m_pInstance)
            m_pInstance->SetData(TYPE_COLOSSUS, IN_PROGRESS);

		//		m_creature->RemoveFlag(CREATURE_FIELD_TYPE_FLAGS ,CREATURE_TYPEFLAGS_UNK22);
	}

	void JustDied(Unit* pWho)
	{
		if (m_pInstance)
            m_pInstance->SetData(TYPE_COLOSSUS, DONE);
	}

    void UpdateAI(const uint32 uiDiff)
    {
		if (m_bIsElementarPhase)
			return;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
		{
			if (m_bHasCreatedList)
			{
				std::list<Creature* > lMojoList;
				GetCreatureListWithEntryInGrid(lMojoList, m_creature, MOJO_ENTRY, 20.0f);
				m_bHasCreatedList = false;
			}

			return;
		}

		if (mightyBlowTimer < uiDiff)
		{
			m_creature->CastSpell(m_creature->getVictim(), SPELL_MIGHTY_BLOW, false);
			mightyBlowTimer = urand(14000, 18000);
		}else mightyBlowTimer -= uiDiff;

		if (emergeTimer < uiDiff)
		{
			m_creature->CastSpell(m_creature, SPELL_EMERGE, true);
			mightyBlowTimer += 3000;
			emergeTimer = 9999999;
			spawnElementalTimer = 2700;
		}emergeTimer -= uiDiff;

		if (spawnElementalTimer < uiDiff)
		{
			m_bIsElementarPhase = true;
			m_creature->GetMotionMaster()->Clear();
			m_creature->GetMotionMaster()->MoveIdle();
			m_creature->DeleteThreatList();
			float x;
			float y;
			float winkel = m_creature->GetOrientation() / 0.01744444444444444f;
			if (winkel < 90)
			{
				float sinWinkel = sin(winkel);
				float h = sinWinkel * distance;
				float p = sqrt(distance * distance - h * h);
				x = p;
				y = h;
			}
			else if (winkel < 180)
			{
				float sinWinkel = sin(winkel);
				float h = sinWinkel * distance;
				float p = sqrt(distance * distance - h * h);
				x = p*(-1);
				y = h;
			}
			else if (winkel < 270)
			{
				float sinWinkel = sin(winkel);
				float h = sinWinkel * distance;
				float p = sqrt(distance * distance - h * h);
				x = p*(-1);
				y = h*(-1);
			}
			else
			{
				float sinWinkel = sin(winkel);
				float h = sinWinkel * distance;
				float p = sqrt(distance * distance - h * h);
				x = p;
				y = h*(-1);
			}

			if (pElemental = m_creature->SummonCreature(ELEMENTAL_ENTRY, m_creature->GetPositionX() + x, m_creature->GetPositionY() + y, m_creature->GetPositionZ(), 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 1000000))
			{
				pElemental->Attack(m_creature->getVictim(), true);
			}
			spawnElementalTimer = 9999999;
		}else spawnElementalTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_colossus(Creature* pCreature)
{
    return new boss_colossusAI(pCreature);
}

struct MANGOS_DLL_DECL mob_colossus_living_mojoAI : public ScriptedAI
{
    mob_colossus_living_mojoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

	bool m_bHasMoved;
	bool m_bIsDead;
	
	uint32 m_uiDeathTimer;
	uint32 m_uiWaveTimer;

    void Reset()
    {
		m_bHasMoved = false;
		m_bIsDead = false;

		m_uiWaveTimer = urand(10000, 13000);
    }

	void JustDied(Unit* who)
	{
		m_creature->CastSpell(m_creature, m_bIsRegularMode ? SPELL_MOJO_PUDDLE : SPELL_MOJO_PUDDLE_H, true);
	}

    void UpdateAI(const uint32 uiDiff)
    {
		if (m_bIsDead && m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
		{
			if (m_uiDeathTimer < uiDiff)
			{
				m_creature->setDeathState(JUST_DIED);
				m_creature->SetVisibility(VISIBILITY_OFF);
				m_bIsDead = false;
			}else m_uiDeathTimer -= uiDiff;
		}

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
		{
			if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
				if (Unit* pColossus = Unit::GetUnit(*m_creature, m_pInstance->GetData64(TYPE_COLOSSUS)))
					if (m_creature->IsWithinDistInMap(pColossus, 20.0f, true))
						m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

			if (Unit* pColossus = Unit::GetUnit(*m_creature, m_pInstance->GetData64(TYPE_COLOSSUS)))
				if (pColossus->isInCombat() && m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
				{
					m_creature->GetMotionMaster()->MovePoint(0, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ());
					m_uiDeathTimer = 4000;
					m_bIsDead = true;
				}

			 return;
		}

		if (m_uiWaveTimer < uiDiff)
		{
			m_creature->CastSpell(m_creature, m_bIsRegularMode ? SPELL_MOJO_WAVE : SPELL_MOJO_WAVE_H, true);
			m_uiWaveTimer = urand(15000, 18000);
		}else m_uiWaveTimer -= uiDiff;
           

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_colossus_living_mojo(Creature* pCreature)
{
    return new mob_colossus_living_mojoAI(pCreature);
}

struct MANGOS_DLL_DECL mob_colossus_elementalAI : public ScriptedAI
{
    mob_colossus_elementalAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

	void Reset()
    {

    }
};

CreatureAI* GetAI_mob_colossus_elemental(Creature* pCreature)
{
    return new mob_colossus_elementalAI(pCreature);
}

void AddSC_boss_colossus()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_colossus";
    newscript->GetAI = &GetAI_boss_colossus;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "mob_colossus_living_mojo";
    newscript->GetAI = &GetAI_mob_colossus_living_mojo;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "mob_colossus_elemental";
    newscript->GetAI = &GetAI_mob_colossus_elemental;
    newscript->RegisterSelf();
}
