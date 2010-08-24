/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/
 
/* ScriptData
SDName: Boss_Thaddius
SD%Complete: 0
SDComment: Placeholder. Includes Feugen & Stalagg.
SDCategory: Naxxramas
EndScriptData */

#include "precompiled.h"
#include "naxxramas.h"

enum
{
    // Stalagg
    SAY_STAL_AGGRO                = -1533023,
    SAY_STAL_SLAY                 = -1533024,
    SAY_STAL_DEATH                = -1533025,

    SPELL_POWERSURGE              = 28134,
    H_SPELL_POWERSURGE            = 54529,

    //Feugen
    SAY_FEUG_AGGRO                = -1533026,
    SAY_FEUG_SLAY                 = -1533027,
    SAY_FEUG_DEATH                = -1533028,

    SPELL_STATICFIELD             = 28135,
    H_SPELL_STATICFIELD           = 54528,

    SPELL_MANABURN                = 28135,

    //both
    SPELL_WARSTOMP                = 28125,

    //Thaddius
    SAY_GREET                     = -1533029,
    SAY_AGGRO1                    = -1533030,
    SAY_AGGRO2                    = -1533031,
    SAY_AGGRO3                    = -1533032,
    SAY_SLAY                      = -1533033,
    SAY_ELECT                     = -1533034, // don't know where to use this
    SAY_DEATH                     = -1533035,
    SAY_SCREAM1                   = -1533036,
    SAY_SCREAM2                   = -1533037,
    SAY_SCREAM3                   = -1533038,
    SAY_SCREAM4                   = -1533039,

    SPELL_BALL_LIGHTNING          = 28299,
    SPELL_POLARITY_SHIFT          = 28089,

    SPELL_CHARGE_POSITIVE_DMGBUFF = 29659,
    SPELL_CHARGE_POSITIVE_NEARDMG = 28059,

    SPELL_CHARGE_NEGATIVE_DMGBUFF = 29660,
    SPELL_CHARGE_NEGATIVE_NEARDMG = 28084,

    SPELL_CHAIN_LIGHTNING         = 28167,
    H_SPELL_CHAIN_LIGHTNING       = 54531,

    SPELL_BESERK                  = 26662,

    //generic
    C_TESLA_COIL                  = 16218                   //the coils (emotes "Tesla Coil overloads!")
};

struct MANGOS_DLL_DECL mob_stalaggAI : public ScriptedAI
{
    mob_stalaggAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsHeroicMode = pCreature->GetMap()->IsRaidOrHeroicDungeon();
        Reset();
    }
 
    ScriptedInstance* m_pInstance;
    bool m_bIsHeroicMode;
    bool m_bIsDeath;
    bool m_bIsHold;
 
    float HomeX, HomeY, HomeZ;
 
    uint32 WarStomp_Timer;
    uint32 PowerSurge_Timer;
    uint32 DeathCheck_Timer;
    uint32 Hold_Timer;
 
    void Reset()
    {
        m_bIsDeath = false;
        m_bIsHold = false;
 
        HomeX = 3450.45f;
        HomeY = -2931.42f;
        HomeZ = 312.091f;
 
        WarStomp_Timer = 8000+rand()%2000;
        PowerSurge_Timer = 10000+rand()%5000;
        DeathCheck_Timer = 1000;
        Hold_Timer = 3000;
    }
 
    void Aggro(Unit* pWho)
    {
        DoScriptText(SAY_STAL_AGGRO, m_creature);
    }
 
    void SetHold()
    {
        m_creature->StopMoving();
        m_creature->GetMotionMaster()->Clear(false);
        m_creature->GetMotionMaster()->MoveIdle();
        Hold_Timer = 3000;
        m_bIsHold = true;
    }
 
    void AttackStart(Unit* pWho)
    {
        if (m_bIsHold)
            return;
 
        if (m_creature->Attack(pWho, true))
        {
            m_creature->AddThreat(pWho, 0.0f);
            m_creature->SetInCombatWith(pWho);
            pWho->SetInCombatWith(m_creature);
            DoStartMovement(pWho);
        }
    }
 
    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
 
        if (m_bIsHold)
        {
            if (Hold_Timer < uiDiff)
            {
                m_creature->AI()->AttackStart(m_creature->getVictim());
                DoStartMovement(m_creature->getVictim());
                m_bIsHold = false;
            }else Hold_Timer -= uiDiff;
        }
 
        if (DeathCheck_Timer < uiDiff)
        {
            if (m_pInstance)
                if (Creature* pFeugen = ((Creature*)m_creature->GetMap()->GetUnit( m_pInstance->GetData64(TYPE_FEUGEN))))
                {
                    if (!pFeugen->isAlive() && !m_bIsDeath)
                    {
                        m_bIsDeath = true;
                        DeathCheck_Timer = 5000;
                    }
                    else if (!pFeugen->isAlive() && m_bIsDeath)
                    {
                        pFeugen->Respawn();
                        m_bIsDeath = false;
                        DeathCheck_Timer = 1000;
                    }
                    else
                        DeathCheck_Timer = 1000;
                }
        }else DeathCheck_Timer -= uiDiff;
 
        if (WarStomp_Timer < uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_WARSTOMP);
            WarStomp_Timer = 8000+rand()%2000;
        }else WarStomp_Timer -= uiDiff;
 
        if (PowerSurge_Timer < uiDiff)
        {
            DoCast(m_creature, m_bIsHeroicMode ? H_SPELL_POWERSURGE : SPELL_POWERSURGE);
            PowerSurge_Timer = 10000+rand()%5000;
        }else PowerSurge_Timer -= uiDiff;
 
/*
if (m_creature->GetDistance2d(HomeX, HomeY) > 10)
DoCast(m_creature, SPELL_WARSTOMP);
*/
        DoMeleeAttackIfReady();
    }
 
    void KilledUnit(Unit *victim)
    {
        if(victim == m_creature)
            return;
        DoScriptText(SAY_STAL_SLAY, m_creature);
    }
    void JustDied(Unit* killer)
    {
        DoScriptText(SAY_STAL_DEATH, m_creature);
    }
};
 
struct MANGOS_DLL_DECL mob_feugenAI : public ScriptedAI
{
    mob_feugenAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsHeroicMode = pCreature->GetMap()->IsRaidOrHeroicDungeon();
        Reset();
    }
 
    ScriptedInstance* m_pInstance;
    bool m_bIsHeroicMode;
    bool m_bIsDeath;
    bool m_bIsHold;
 
    float HomeX, HomeY, HomeZ;
 
    uint32 WarStomp_Timer;
    uint32 StaticField_Timer;
    uint32 DeathCheck_Timer;
    uint32 Hold_Timer;
 
    void Reset()
    {
        m_bIsDeath = false;
        m_bIsHold = false;
 
        HomeX = 3508.14f;
        HomeY = -2988.65f;
        HomeZ = 312.092f;
 
        WarStomp_Timer = 8000+rand()%2000;
        StaticField_Timer = 10000+rand()%5000;
        DeathCheck_Timer = 1000;
        Hold_Timer = 3000;
    }
 
    void Aggro(Unit* pWho)
    {
        DoScriptText(SAY_FEUG_AGGRO, m_creature);
    }
 
    void SetHold()
    {
        m_creature->StopMoving();
        m_creature->GetMotionMaster()->Clear(false);
        m_creature->GetMotionMaster()->MoveIdle();
        Hold_Timer = 3000;
        m_bIsHold = true;
    }
 
    void AttackStart(Unit* pWho)
    {
        if (m_bIsHold)
            return;
 
        if (m_creature->Attack(pWho, true))
        {
            m_creature->AddThreat(pWho, 0.0f);
            m_creature->SetInCombatWith(pWho);
            pWho->SetInCombatWith(m_creature);
            DoStartMovement(pWho);
        }
    }
 
    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
 
        if (m_bIsHold)
        {
            if (Hold_Timer < uiDiff)
            {
                m_creature->AI()->AttackStart(m_creature->getVictim());
                DoStartMovement(m_creature->getVictim());
                m_bIsHold = false;
            }else Hold_Timer -= uiDiff;
        }
 
        if (DeathCheck_Timer < uiDiff)
        {
            if (m_pInstance)
                if (Creature* pStalagg = ((Creature*)m_creature->GetMap()->GetUnit( m_pInstance->GetData64(TYPE_STALAGG))))
                {
                    if (!pStalagg->isAlive() && !m_bIsDeath)
                    {
                        m_bIsDeath = true;
                        DeathCheck_Timer = 5000;
                    }
                    else if (!pStalagg->isAlive() && m_bIsDeath)
                    {
                        pStalagg->Respawn();
                        m_bIsDeath = false;
                        DeathCheck_Timer = 1000;
                    }
                    else
                        DeathCheck_Timer = 1000;
                }
        }else DeathCheck_Timer -= uiDiff;
 
        if (WarStomp_Timer < uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_WARSTOMP);
            WarStomp_Timer = 8000+rand()%2000;
        }else WarStomp_Timer -= uiDiff;
 
        if (StaticField_Timer < uiDiff)
        {
            DoCast(m_creature->getVictim(), m_bIsHeroicMode ? H_SPELL_STATICFIELD : SPELL_STATICFIELD);
            StaticField_Timer = 10000+rand()%5000;
        }else StaticField_Timer -= uiDiff;
 
/*
if (m_creature->GetDistance2d(HomeX, HomeY) > 10)
DoCast(m_creature, SPELL_WARSTOMP);
*/
        DoMeleeAttackIfReady();
    }
 
    void KilledUnit(Unit *victim)
    {
        if(victim == m_creature)
            return;
        DoScriptText(SAY_FEUG_SLAY, m_creature);
    }
    void JustDied(Unit* killer)
    {
        DoScriptText(SAY_FEUG_DEATH, m_creature);
    }
};
 
struct MANGOS_DLL_DECL boss_thaddiusAI : public ScriptedAI
{
    boss_thaddiusAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_bIsHeroicMode = pCreature->GetMap()->IsRaidOrHeroicDungeon();
        Reset();
    }
 
    ScriptedInstance* m_pInstance;
    bool m_bIsHeroicMode;
    bool m_bIsActiveCheck;
    bool m_bIsActived;
    bool m_bIsPolarityShift;
    bool m_bInMeleeRange;
 
    uint32 Active_Timer;
    uint32 ChainLightning_Timer;
    uint32 PolarityShift_Timer;
    uint32 BallLightning_Timer;
    uint32 Enrage_Timer;
    uint32 Scream_Timer;
    uint32 RangeCheck_Timer;
 
    uint32 SwitchTarget_Timer;
 
    void Reset()
    {
        m_bIsActiveCheck = false;
        m_bIsActived = false;
        m_bIsPolarityShift = false;
        m_bInMeleeRange = false;
 
        Active_Timer = 1000;
        ChainLightning_Timer = 15000;
        PolarityShift_Timer = 30000;
        BallLightning_Timer = 1000;
        Enrage_Timer = 300000;
        Scream_Timer = 60000+rand()%30000;
        RangeCheck_Timer = 2000;
 
        SwitchTarget_Timer = 20000;
 
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
 
        if (m_pInstance)
        {
            if (Creature* pStalagg = ((Creature*)m_creature->GetMap()->GetUnit( m_pInstance->GetData64(TYPE_STALAGG))))
                if (!pStalagg->isAlive())
                    pStalagg->Respawn();
 
            if (Creature* pFeugen = ((Creature*)m_creature->GetMap()->GetUnit( m_pInstance->GetData64(TYPE_FEUGEN))))
                if (!pFeugen->isAlive())
                    pFeugen->Respawn();
 
            m_pInstance->SetData(TYPE_THADDIUS, NOT_STARTED);
        }
    }
 
    void Aggro(Unit* who)
    {
        switch(rand()%3)
        {
            case 0: DoScriptText(SAY_AGGRO1, m_creature); break;
            case 1: DoScriptText(SAY_AGGRO2, m_creature); break;
            case 2: DoScriptText(SAY_AGGRO3, m_creature); break;
        }
 
        if (!who || m_creature->getVictim())
            return;
 
        if (who->isTargetableForAttack() && who->isInAccessablePlaceFor(m_creature) && m_creature->IsHostileTo(who))
            AttackStart(who);
 
        if(m_pInstance)
            m_pInstance->SetData(TYPE_THADDIUS, IN_PROGRESS);
    }
 
    void AttackStart(Unit* who)
    {
        if (!m_bIsActived)
            return;
 
        if (!who || who == m_creature)
            return;
 
        if (m_creature->Attack(who, true))
        {
            m_creature->SetInCombatWithZone();
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            DoStartMovement(who);
        }
    }
 
    void UpdateAI(const uint32 uiDiff)
    {
        if (m_bIsActiveCheck)
        {
            if (!m_bIsActived && Active_Timer < uiDiff)
            {
                m_bIsActived = true;
                Active_Timer = 1000;
            }else Active_Timer -= uiDiff;
        }
        else
        {
            if (Active_Timer < uiDiff)
            {
                if(m_pInstance)
                {
                    bool m_bIsAlive = false;
                    Creature* pStalagg;
                    Creature* pFeugen;
                    if (pStalagg = ((Creature*)m_creature->GetMap()->GetUnit( m_pInstance->GetData64(TYPE_STALAGG))))
                        if (pStalagg->isAlive())
                            m_bIsAlive = true;
                    if (pFeugen = ((Creature*)m_creature->GetMap()->GetUnit( m_pInstance->GetData64(TYPE_FEUGEN))))
                        if (pFeugen->isAlive())
                            m_bIsAlive = true;
 
                    if (!m_bIsAlive)
                    {
                        m_bIsActiveCheck = true;
                        Active_Timer = 15000;
                    }
                    else
                    {
                        if (pStalagg->isInCombat() && pFeugen->isInCombat())
                        {
                            if (SwitchTarget_Timer < uiDiff)
                            {
                                Unit* pStalaggTarget;
                                Unit* pFeugenTarget;
                                float StalaggTargetThreat;
                                float FeugenTargetThreat;
 
                                // Get Stalagg's target threat
                                if (pStalagg && pStalagg->isAlive())
                                {
                                    if (pStalaggTarget = pStalagg->getVictim())
                                        StalaggTargetThreat = m_creature->getThreatManager().getThreat(pStalaggTarget);
                                }
                                // Get Feugen's target threat
                                if (pFeugen && pFeugen->isAlive())
                                {
                                    if (pFeugenTarget = pFeugen->getVictim())
                                        FeugenTargetThreat = m_creature->getThreatManager().getThreat(pFeugenTarget);
                                }
 
                                // Switch Feugen's target from Stalagg
                                if (pStalagg && pStalagg->isAlive())
                                {
                                    if (pFeugen && pFeugen->isAlive())
                                    {
                                        HostileReference* ref = pFeugen->getThreatManager().getCurrentVictim();
                                        if (ref)
                                        {
                                            ((mob_stalaggAI*)pStalagg->AI())->SetHold();
                                            pStalagg->CastSpell(pFeugenTarget, 54517, true);
                                            ((Player*)pFeugenTarget)->TeleportTo(pFeugenTarget->GetMapId(), pStalagg->GetPositionX(), pStalagg->GetPositionY(), pStalagg->GetPositionZ(), 0, TELE_TO_NOT_LEAVE_COMBAT);
                                            ref->removeReference();
                                            pStalagg->AddThreat(pFeugenTarget, FeugenTargetThreat);
                                            //pStalagg->AI()->AttackStart(pFeugenTarget);
                                        }
                                    }
                                }
                                // Switch Stalagg's target from Feugen
                                if (pFeugen && pFeugen->isAlive())
                                {
                                    if (pStalagg && pStalagg->isAlive())
                                    {
                                        HostileReference* ref = pStalagg->getThreatManager().getCurrentVictim();
                                        if (ref)
                                        {
                                            ((mob_feugenAI*)pFeugen->AI())->SetHold();
                                            pFeugen->CastSpell(pStalaggTarget, 54517, true);
                                            ((Player*)pStalaggTarget)->TeleportTo(pStalaggTarget->GetMapId(), pFeugen->GetPositionX(), pFeugen->GetPositionY(), pFeugen->GetPositionZ(), 0, TELE_TO_NOT_LEAVE_COMBAT);
                                            ref->removeReference();
                                            pFeugen->AddThreat(pStalaggTarget, StalaggTargetThreat);
                                            //pFeugen->AI()->AttackStart(pStalaggTarget);
                                        }
                                    }
                                }
 
                                SwitchTarget_Timer = 20000;
                            }else SwitchTarget_Timer -= uiDiff;
                        }
                        else if (pStalagg->isInCombat() || pFeugen->isInCombat())
                        {
                            if (m_pInstance)
                                m_pInstance->SetData(TYPE_THADDIUS, IN_PROGRESS);
                        }
                        else if (!pStalagg->isInCombat() && !pFeugen->isInCombat())
                        {
                            if (m_pInstance)
                                m_pInstance->SetData(TYPE_THADDIUS, NOT_STARTED);
                        }
 
                        Active_Timer = 1000;
                    }
                }
            }else Active_Timer -= uiDiff;
        }
 
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;
 
        if (ChainLightning_Timer < uiDiff)
        {
            DoCast(m_creature, m_bIsHeroicMode ? H_SPELL_CHAIN_LIGHTNING : SPELL_CHAIN_LIGHTNING);
            ChainLightning_Timer = 12000+rand()%5000;
        }else ChainLightning_Timer -= uiDiff;
 
        if(m_bIsPolarityShift)
        {
            // workaround for POLARITY_SHIFT
            if (PolarityShift_Timer < uiDiff)
            {
/*
Map *map = m_creature->GetMap();
if (map->IsDungeon())
{
Map::PlayerList const &PlayerList = map->GetPlayers();
if (PlayerList.isEmpty())
return;
for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
if (i->getSource()->isAlive() && i->getSource()->isTargetableForAttack())
{
switch(rand()%2)
{
case 0:
if (i->getSource()->HasAura(SPELL_CHARGE_NEGATIVE_NEARDMG))
i->getSource()->RemoveAurasDueToSpell(SPELL_CHARGE_NEGATIVE_NEARDMG);
i->getSource()->CastSpell(i->getSource(), SPELL_CHARGE_POSITIVE_NEARDMG, true);
break;
case 1:
if (i->getSource()->HasAura(SPELL_CHARGE_POSITIVE_NEARDMG))
i->getSource()->RemoveAurasDueToSpell(SPELL_CHARGE_POSITIVE_NEARDMG);
i->getSource()->CastSpell(i->getSource(), SPELL_CHARGE_NEGATIVE_NEARDMG, true);
break;
}
}
}
*/
                m_bIsPolarityShift = false;
                PolarityShift_Timer = 27000;
            }else PolarityShift_Timer -= uiDiff;
        }
        else
        {
            if(PolarityShift_Timer < uiDiff)
            {
       DoCast(m_creature, SPELL_POLARITY_SHIFT); // need core support
                m_bIsPolarityShift = true;
                PolarityShift_Timer = 3000;
            }else PolarityShift_Timer -= uiDiff;
        }
 
        if (Enrage_Timer < uiDiff)
        {
            DoCast(m_creature, SPELL_BESERK);
            Enrage_Timer = 300000;
        }else Enrage_Timer -= uiDiff;
 
        if (Scream_Timer < uiDiff)
        {
            switch(rand()%4)
            {
                case 0: DoScriptText(SAY_SCREAM1, m_creature);break;
                case 1: DoScriptText(SAY_SCREAM2, m_creature);break;
                case 2: DoScriptText(SAY_SCREAM3, m_creature);break;
                case 3: DoScriptText(SAY_SCREAM4, m_creature);break;
            }
            Scream_Timer = 60000+rand()%30000;
        }else Scream_Timer -= uiDiff;
 
        if (RangeCheck_Timer < uiDiff)
        {
            m_bInMeleeRange = false;
            std::list<HostileReference*> t_list = m_creature->getThreatManager().getThreatList();
            for(std::list<HostileReference*>::iterator itr = t_list.begin(); itr!= t_list.end(); ++itr)
            {
                Unit* pTarget = m_creature->GetMap()->GetUnit( (*itr)->getUnitGuid());
 
                //if in melee range
                if (pTarget && pTarget->IsWithinDistInMap(m_creature, ATTACK_DISTANCE))
                {
                    m_bInMeleeRange = true;
                    break;
                }
            }
 
            if (!m_bInMeleeRange)
                DoCast(m_creature->getVictim(), SPELL_BALL_LIGHTNING);
 
            RangeCheck_Timer = 2000;
        }else RangeCheck_Timer -= uiDiff;
 
        //if nobody is in melee range
        if (m_bInMeleeRange)
            DoMeleeAttackIfReady();
    }
 
    void JustDied(Unit* killer)
    {
        DoScriptText(SAY_DEATH, m_creature);
 
        if (m_pInstance)
            m_pInstance->SetData(TYPE_THADDIUS, DONE);
    }
 
    void KilledUnit(Unit *victim)
    {
        DoScriptText(SAY_SLAY, m_creature);
    }
};
 
CreatureAI* GetAI_boss_thaddius(Creature* pCreature)
{
    return new boss_thaddiusAI(pCreature);
}
 
CreatureAI* GetAI_mob_stalagg(Creature* pCreature)
{
    return new mob_stalaggAI(pCreature);
}
 
CreatureAI* GetAI_mob_feugen(Creature* pCreature)
{
    return new mob_feugenAI(pCreature);
}
 
void AddSC_boss_thaddius()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_thaddius";
    newscript->GetAI = &GetAI_boss_thaddius;
    newscript->RegisterSelf();
 
    newscript = new Script;
    newscript->Name = "mob_stalagg";
    newscript->GetAI = &GetAI_mob_stalagg;
    newscript->RegisterSelf();
 
    newscript = new Script;
    newscript->Name = "mob_feugen";
    newscript->GetAI = &GetAI_mob_feugen;
    newscript->RegisterSelf();
}