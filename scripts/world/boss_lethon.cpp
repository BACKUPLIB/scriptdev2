/* Copyright (C) 2006 - 2011 ScriptDev2 <http://www.scriptdev2.com/>
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
SDName: Lethon
SD%Complete:
SDComment:
SDCategory: Bosses
EndScriptData */

#include "precompiled.h"

enum
{
    // Spells
    SPELL_DRAWSPIRIT                    = 24811,
    SPELL_NOXIOUSBREATH                 = 24818,
    SPELL_SLEEPINGFOG                   = 24813,
    SPELL_SHADOWBOLTWHIRL               = 24834,
    SPELL_SUMMONPLAYER                  = 24776,
    SPELL_TAILSWEEP                     = 15847,
    SPELL_MARKOFNATURE                  = 25040, // not working
};

struct MANGOS_DLL_DECL boss_lethonAI : public ScriptedAI
{
    boss_lethonAI(Creature *pCreature) : ScriptedAI(pCreature) {Reset();}

    uint32 m_uiDrawSpirit_Timer;
    uint32 m_uiNoxiousBreath_Timer;
    uint32 m_uiSleepingFog_Timer;
    uint32 m_uiShadowBoltWhirl_Timer;
    uint32 m_uiTailSweep_Timer;

    void Reset()
    {
        m_uiDrawSpirit_Timer = 30000;
        m_uiNoxiousBreath_Timer = 45000;
        m_uiSleepingFog_Timer = 40000;
        m_uiShadowBoltWhirl_Timer = 20000;
        m_uiTailSweep_Timer = 10000;
    }

    void Aggro(Unit *who)
    {
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiDrawSpirit_Timer < diff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                DoCast(pTarget,SPELL_DRAWSPIRIT);

            m_uiDrawSpirit_Timer = 22000;
        }
        else
            m_uiDrawSpirit_Timer -= diff;

        if (m_uiTailSweep_Timer < diff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                DoCast(pTarget,SPELL_TAILSWEEP);

            m_uiTailSweep_Timer = 15000;
        }
        else
            m_uiTailSweep_Timer -= diff;

        if (m_uiNoxiousBreath_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_NOXIOUSBREATH);
            m_uiNoxiousBreath_Timer = 10000;
        }
        else
            m_uiNoxiousBreath_Timer -= diff;

        if (m_uiSleepingFog_Timer < diff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                DoCast(pTarget, SPELL_SLEEPINGFOG);

            m_uiSleepingFog_Timer = 18000;
        }
        else
            m_uiSleepingFog_Timer -= diff;

        if (m_uiShadowBoltWhirl_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_SHADOWBOLTWHIRL);
                m_uiShadowBoltWhirl_Timer = 12000;
        }
        else
            m_uiShadowBoltWhirl_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_lethon(Creature* pCreature)
{
    return new boss_lethonAI(pCreature);
}

void AddSC_boss_lethon()
{
    Script *pNewScript;
    pNewScript = new Script;
    pNewScript->Name="boss_lethon";
    pNewScript->GetAI = &GetAI_boss_lethon;
    pNewScript->RegisterSelf();
}


