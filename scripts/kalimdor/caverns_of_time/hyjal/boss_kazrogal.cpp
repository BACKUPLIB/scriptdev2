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
SDName: Boss_Kazrogal
SD%Complete: 50
SDComment: Needs further testing
SDCategory: Caverns of Time, Mount Hyjal
EndScriptData */

#include "precompiled.h"
#include "hyjal.h"
#include "SpellAuras.h"

#define SAY_AGGRO                   "Hallo"
#define SAY_SLAY1                   "Blöd gelaufen"
#define SAY_SLAY2                   "Gschissen grissn"
#define SAY_SLAY3                   "Oje" 
#define SAY_DEATH                   "Tschüss"

#define SPELL_MANA_MARK				31447
#define SPELL_EXPLOSION_MARK		31463
#define SPELL_CLEAVE				31436
#define SPELL_CRIPPLE				31477
#define SPELL_WAR_STOMP				31480

struct MANGOS_DLL_DECL boss_kazrogalAI : public ScriptedAI
{
    boss_kazrogalAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

	uint32 MarkTimer;
	uint32 MarkReadyTimer;
	uint8 MarkCount;
	uint32 CrippleTimer;
	uint32 WarStompTimer;
	uint32 CleaveTimer;

    void Reset()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_KAZROGAL, NOT_STARTED);

		MarkTimer = 60000;
		MarkCount = 0;
		CrippleTimer = 6000;
		WarStompTimer = 15000;
		CleaveTimer = 5000;
    }

    void Aggro(Unit* pWho)
    {
        m_creature->MonsterYell(SAY_AGGRO, 0, 0);

        m_creature->SetInCombatWithZone();

        if (m_pInstance)
            m_pInstance->SetData(TYPE_KAZROGAL, IN_PROGRESS);
    }

    void KilledUnit(Unit *victim)
    {
        switch(urand(0, 2))
        {
            case 0: m_creature->MonsterYell(SAY_SLAY1, 0, 0); break;
            case 1: m_creature->MonsterYell(SAY_SLAY2, 0, 0); break;
            case 2: m_creature->MonsterYell(SAY_SLAY3, 0, 0); break;
        }
    }

    void JustDied(Unit *victim)
    {
        m_creature->MonsterYell(SAY_DEATH, 0, 0);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_KAZROGAL, DONE);
    }

    void IfOOM()
    {
        ThreatList const& tList = m_creature->getThreatManager().getThreatList();
        if (tList.empty())
            return;

        std::list<Unit*> targets;

        for (ThreatList::const_iterator itr = tList.begin();itr != tList.end(); ++itr)
        {
            Unit* pUnit = Unit::GetUnit((*m_creature), (*itr)->getUnitGuid());
			if (pUnit->GetPower(POWER_MANA) == 0 && pUnit->HasAura(31447) && pUnit->isAlive() && pUnit->GetMaxPower(POWER_MANA) > 10)
			{
				pUnit->CastSpell(pUnit, SPELL_EXPLOSION_MARK, true);
			}
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

		 // IfOOM();

		if (MarkTimer < diff)
		{
			switch (MarkCount)
			{
				case 0:
					DoCastSpellIfCan(m_creature, SPELL_MANA_MARK, 0, 0);
					MarkTimer = 50000;
					break;
				case 1:
					DoCastSpellIfCan(m_creature, SPELL_MANA_MARK, 0, 0);
					MarkTimer = 40000;
					break;
				case 2:
					DoCastSpellIfCan(m_creature, SPELL_MANA_MARK, 0, 0);
					MarkTimer = 40000;
					break;
				case 3:
					DoCastSpellIfCan(m_creature, SPELL_MANA_MARK, 0, 0);
					MarkTimer = 30000;
					break;
				case 4:
					DoCastSpellIfCan(m_creature, SPELL_MANA_MARK, 0, 0);
					MarkTimer = 20000;
					break;
				case 5:
					DoCastSpellIfCan(m_creature, SPELL_MANA_MARK, 0, 0);
					MarkTimer = 10000;
					break;
				default:
					DoCastSpellIfCan(m_creature, SPELL_MANA_MARK, 0, 0);
					MarkTimer = 7000;
					break;
			}

			MarkCount++;
		}
		else MarkTimer -= diff;

		if (CrippleTimer < diff)
		{
			DoCastSpellIfCan(m_creature->getVictim(), SPELL_CRIPPLE, 0, 0);
			CrippleTimer = urand(5000, 6000);
		}else CrippleTimer -= diff;
		
		if (WarStompTimer < diff)
		{
			DoCastSpellIfCan(m_creature->getVictim(), SPELL_WAR_STOMP, 0, 0);
			WarStompTimer = urand(15000, 20000);
		}else WarStompTimer -= diff;
		
		if (CleaveTimer < diff)
		{
			DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE, 0, 0);
			CleaveTimer = urand(6000, 12000);
		}else CleaveTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_kazrogal(Creature* pCreature)
{
    return new boss_kazrogalAI(pCreature);
}

void AddSC_boss_kazrogal()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_kazrogal";
    newscript->GetAI = &GetAI_boss_kazrogal;
    newscript->RegisterSelf();
}
