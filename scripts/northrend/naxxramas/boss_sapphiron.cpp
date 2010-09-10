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
SDName: Boss_Sapphiron
SD%Complete: 90
SDComment: Place Holder
SDCategory: Naxxramas
EndScriptData */

#include "precompiled.h"
#include "naxxramas.h"

enum
{
    EMOTE_BREATH                = -1533082,
    EMOTE_FLY                   = -1533083,
    EMOTE_GROUND                = -1533160,
    EMOTE_ENRAGE                = -1533161,

    SPELL_ICEBOLT               = 28522,
    SPELL_ICEBLOCK              = 62766,
    SPELL_FROST_BREATH          = 29318,
    SPELL_FROST_BREATH_H        = 28524,
    SPELL_FROST_BREATH_VISUAL   = 30101,

    SPELL_FROST_AURA            = 28531,
    H_SPELL_FROST_AURA          = 55799,

    SPELL_LIFE_DRAIN            = 28542,
    H_SPELL_LIFE_DRAIN          = 55665,

    SPELL_TAIL_SWEEP            = 55697,
    H_SPELL_TAIL_SWEEP          = 55696,

    SPELL_BLIZZARD              = 28547,
    H_SPELL_BLIZZARD            = 55699,

    SPELL_CLEAVE                = 19983,
    SPELL_BESERK                = 26662,

    SPELL_DIES                  = 29357,

    NPC_FROST_BREATH_TARGET     = 34548,  //hack
};

float frostBreathTargetCoord[3] = {3522.39f, -5236.78f, 137.6f};

struct MANGOS_DLL_DECL boss_sapphironAI : public ScriptedAI
{
    boss_sapphironAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        m_uiIceboltCountMax = m_bIsRegularMode ? 2 : 3;
        Reset();
    }

    instance_naxxramas* m_pInstance;
    bool m_bIsRegularMode;

    uint32 m_uiIceboltCount;
    uint32 m_uiIceboltCountMax;
    uint32 m_uiIceboltTimer;
    uint32 m_uiFrostBreathTimer;
    uint32 m_uiLifeDrainTimer;
    uint32 m_uiBlizzardTimer;
    uint32 m_uiTailSweepTimer;
    uint32 m_uiCleaveTimer;
    uint32 m_uiFlyTimer;
    uint32 m_uiBeserkTimer;
    uint32 m_uiPhase;
    uint32 m_uiLandTimer;
    uint32 m_uiBirthTimer;
    uint8 m_uiBirthState;
    bool m_bLandoff;
    std::vector<Unit*> targets;
    std::vector<Player*> immunePlayers;
    Creature* pFrostBreathTarget;

    void Reset()
    {
        m_uiFrostBreathTimer = 7000;
        m_uiLifeDrainTimer = 24000;
        m_uiBlizzardTimer = 20000;
        m_uiTailSweepTimer = 10000;
        m_uiCleaveTimer = 10000;
        m_uiFlyTimer = 45000;
        m_uiIceboltTimer = 4000;
        m_uiLandTimer = 2000;
        m_uiBirthTimer = 19000;
        m_uiBirthState = 0;
        m_uiBeserkTimer = 15*MINUTE*IN_MILLISECONDS;
        m_uiPhase = 1;
        m_uiIceboltCount = 0;
        m_bLandoff = false;
        pFrostBreathTarget;
        targets.clear();
        immunePlayers.clear();
        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->setFaction(35);
        if(m_pInstance)
            if(GameObject* pGo = m_pInstance->instance->GetGameObject(m_pInstance->GetData64(GO_SAPPHIRON_BIRTH)))
                pGo->Respawn();
    }

    void MoveInLineOfSight(Unit *who)
    {
        if(m_uiBirthState == 0 && m_pInstance)
        {
            if(GameObject* pGo = m_pInstance->instance->GetGameObject(m_pInstance->GetData64(GO_SAPPHIRON_BIRTH)))
                pGo->Respawn();
            m_uiBirthState = 1;
        }
    }

    void Aggro(Unit* pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, IN_PROGRESS);

        m_creature->SetInCombatWithZone();
        DoCastSpellIfCan(pWho, m_bIsRegularMode ? SPELL_FROST_AURA : H_SPELL_FROST_AURA);

        pFrostBreathTarget = m_creature->SummonCreature(NPC_FROST_BREATH_TARGET,
                                            frostBreathTargetCoord[0],
                                            frostBreathTargetCoord[1],
                                            frostBreathTargetCoord[2],0.f,TEMPSUMMON_MANUAL_DESPAWN,0);
        if(pFrostBreathTarget)
        {
            pFrostBreathTarget->SetSpeedRate(MOVE_WALK,0.0f,true);
            pFrostBreathTarget->SetSpeedRate(MOVE_RUN,0.0f,true);
        }
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, DONE);
        if(pFrostBreathTarget)
            pFrostBreathTarget->ForcedDespawn();
        m_creature->CastSpell(m_creature, SPELL_DIES, true);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SAPPHIRON, FAIL);
        if(pFrostBreathTarget)
            pFrostBreathTarget->ForcedDespawn();
    }

    void SpellHitTarget(Unit *target, const SpellEntry *spell)
    {
        if (spell->Id == SPELL_ICEBOLT)
        {
            if (target->HasAura(SPELL_ICEBOLT))
            {
                target->CastSpell(target, SPELL_ICEBLOCK, true);
                target->ApplySpellImmune(0, IMMUNITY_SCHOOL, SPELL_SCHOOL_MASK_FROST, true);
            }
        } else if (spell->Id == SPELL_FROST_BREATH || spell->Id == SPELL_FROST_BREATH_H)
        {
            if (target->HasAura(SPELL_ICEBOLT))
            {
                target->RemoveAurasDueToSpell(SPELL_ICEBLOCK);
                target->RemoveAurasDueToSpell(SPELL_ICEBOLT);
                target->ApplySpellImmune(0, IMMUNITY_SCHOOL, SPELL_SCHOOL_MASK_FROST, false);
                return;
            }
        } else if (spell->Id == SPELL_FROST_BREATH_VISUAL)
        {
            target->GetMotionMaster()->MoveIdle();
            target->getThreatManager().clearReferences();
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if(m_uiBirthState == 1)
            if(m_uiBirthTimer < uiDiff)
            {
                m_creature->SetVisibility(VISIBILITY_ON);
                m_creature->setFaction(21);
                m_uiBirthState = 2;
            }
            else
                m_uiBirthTimer -= uiDiff;

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_uiBeserkTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BESERK) == CAST_OK)
            {
                m_uiBeserkTimer = 300000;
                DoScriptText(EMOTE_ENRAGE, m_creature);
            }
        }
        else
            m_uiBeserkTimer -= uiDiff;

        if (m_uiPhase == 1)
        {
            if (m_uiLifeDrainTimer < uiDiff)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    if (DoCastSpellIfCan(pTarget, m_bIsRegularMode ? SPELL_LIFE_DRAIN : H_SPELL_LIFE_DRAIN) == CAST_OK)
                        m_uiLifeDrainTimer = 24000;
                }
            }
            else
                m_uiLifeDrainTimer -= uiDiff;

            if (m_uiBlizzardTimer < uiDiff)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    if (DoCastSpellIfCan(pTarget, m_bIsRegularMode ? SPELL_BLIZZARD : H_SPELL_BLIZZARD) == CAST_OK)
                        m_uiBlizzardTimer = urand(17,20)*IN_MILLISECONDS;
                }
            }
            else
                m_uiBlizzardTimer -= uiDiff;

            if (m_uiCleaveTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                    m_uiCleaveTimer = urand(7000, 10000);
            }
            else
                m_uiCleaveTimer -= uiDiff;

            if (m_uiTailSweepTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, m_bIsRegularMode ? SPELL_TAIL_SWEEP : H_SPELL_TAIL_SWEEP) == CAST_OK)
                    m_uiTailSweepTimer = urand(10000, 15000);
            }
            else
                m_uiTailSweepTimer -= uiDiff;

            if (m_creature->GetHealthPercent() > 10.0f)
            {
                if (m_uiFlyTimer < uiDiff)
                {
                    m_uiPhase = 2;
                    m_creature->InterruptNonMeleeSpells(false);
                    m_creature->HandleEmote(EMOTE_ONESHOT_LIFTOFF);
                    m_creature->GetMotionMaster()->Clear(false);
                    m_creature->GetMotionMaster()->MoveIdle();
                    DoCastSpellIfCan(m_creature,11010);
                    m_creature->SetHover(true);
                    DoCastSpellIfCan(m_creature,18430);
                    m_uiIceboltTimer = 4000;
                    m_uiIceboltCount = 0;
                    m_bLandoff = false;
                    DoScriptText(EMOTE_FLY, m_creature);
                }
                else
                    m_uiFlyTimer -= uiDiff;
            }

            DoMeleeAttackIfReady();
        }
        else // Phase 2
        {
            if (m_uiIceboltCount < m_uiIceboltCountMax)
            {
                if (m_uiIceboltTimer < uiDiff)
                {
                    if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                    {
                        if(DoCastSpellIfCan(pTarget,SPELL_ICEBOLT) == CAST_OK)
                        {  
                            targets.push_back(pTarget);
                            ++m_uiIceboltCount;

                            if (m_uiIceboltCount == m_uiIceboltCountMax)
                            {
                                DoScriptText(EMOTE_BREATH, m_creature);
                                m_uiFrostBreathTimer = 8700;
                                if(pFrostBreathTarget)
                                {
                                    pFrostBreathTarget->NearTeleportTo(m_creature->GetPositionX(),m_creature->GetPositionY(),pFrostBreathTarget->GetPositionZ(),0);
                                    m_creature->CastSpell(pFrostBreathTarget,SPELL_FROST_BREATH_VISUAL,true);
                                }
                            }

                            m_uiIceboltTimer = 4000;
                        }
                    }
                }
                else
                    m_uiIceboltTimer -= uiDiff;
            }
            else
            {
                if (m_bLandoff)
                {
                    if (m_uiLandTimer < uiDiff)
                    {
                        m_uiPhase = 1;
                        m_creature->HandleEmote(EMOTE_ONESHOT_LAND);
                        m_creature->SetHover(false);
                        m_creature->GetMotionMaster()->Clear(false);
                        m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
                        m_uiFlyTimer = 45000;
                        DoScriptText(EMOTE_GROUND, m_creature);
                    }
                    else
                        m_uiLandTimer -= uiDiff;
                }
                else
                {
                    if (m_uiFrostBreathTimer < uiDiff)
                    {
                        if(!pFrostBreathTarget)
                            return;

                        Map *map = m_creature->GetMap();
                        if (!map->IsDungeon())
                            return;

                        Map::PlayerList const &PlayerList = map->GetPlayers();

                        //check for each player
                        for(Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                            //check for both iceblocks
                            for(std::vector<Unit*>::iterator itr = targets.begin(); itr!= targets.end(); ++itr)
                                //check if player near iceblock
                            {
                                if(i->getSource()->GetDistance2d((*itr)) <= 10.0f)
                                {
                                    //check if iceblock is closer to breathtarget then player
                                    if(pFrostBreathTarget->GetDistanceOrder((*itr),i->getSource(),false))
                                    {
                                        // messages for ingame debug on testserver only
                                        (*itr)->MonsterYell("Näher dran",LANG_UNIVERSAL,0);
                                        i->getSource()->MonsterYell("Weiter weg",LANG_UNIVERSAL,0);
                                        i->getSource()->ApplySpellImmune(0, IMMUNITY_SCHOOL, SPELL_SCHOOL_MASK_FROST, true);
                                        immunePlayers.push_back(i->getSource());
                                        break;
                                    }  
                                }
                            }

                        if (DoCastSpellIfCan(m_creature, SPELL_FROST_BREATH) == CAST_OK)
                        {
                            //remove frost immunity
                            for(std::vector<Player*>::iterator itr = immunePlayers.begin(); itr!= immunePlayers.end(); ++itr)
                            {
                                (*itr)->ApplySpellImmune(0, IMMUNITY_SCHOOL, SPELL_SCHOOL_MASK_FROST, false);
                            }
                            m_uiLandTimer = 4000;
                            m_bLandoff = true;
                            immunePlayers.clear();
                            targets.clear();
                        }
                    }
                    else
                        m_uiFrostBreathTimer -= uiDiff;
                }
            }
                
        }
    }
};

CreatureAI* GetAI_boss_sapphiron(Creature* pCreature)
{
    return new boss_sapphironAI(pCreature);
}

void AddSC_boss_sapphiron()
{
    Script* NewScript;
    NewScript = new Script;
    NewScript->Name = "boss_sapphiron";
    NewScript->GetAI = &GetAI_boss_sapphiron;
    NewScript->RegisterSelf();
}
