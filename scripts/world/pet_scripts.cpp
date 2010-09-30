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
SDName: Pet_Scripts
SD%Complete: ??
SDComment: Here is the place for scripted AI for guardian and mini pets.
SDCategory: Pets
EndScriptData */

#include "precompiled.h"
#include "PetAI.h"
#include "Pet.h"
#include "SpellMgr.h"


struct MANGOS_DLL_DECL pet_simple_guardianAI : public PetAI
{
    /* This AI is more a kind of additional initialisation,
       that adds spells to the autocast list, defined in
       CreatureInfo::Spells.
       The AI functions are processed by PetAI.
    */
    pet_simple_guardianAI(Pet* pPet): PetAI(pPet)
    {
        // add spells if any
         if (CreatureInfo const* pPetInfo = pPet->GetCreatureInfo())
            for (uint8 i = 0; i<CREATURE_MAX_SPELLS; i++)
            {
                if (!pPetInfo->spells[i])
                  continue;

                if (SpellEntry const *spellInfo = GetSpellStore()->LookupEntry(pPetInfo->spells[i]))
                {
                    // skip spells without any cooldown
                    if (!spellInfo->StartRecoveryTime && !GetSpellRecoveryTime(spellInfo))
                        continue;
                    // in case applying stat auras, we need to set it modifiable temporary
                    pPet->SetCanModifyStats(true);
                    pPet->addSpell(pPetInfo->spells[i], spellInfo->Attributes & SPELL_ATTR_PASSIVE ? ACT_PASSIVE : ACT_ENABLED);
                    pPet->SetCanModifyStats(false);
                }
            }
    }
};


/*######
## pet_dk_ghoul
######*/

enum
{
    SPELL_DK_SCALING_01 = 54566,
    SPELL_DK_SCALING_02 = 51996,
    SPELL_LEAP          = 47482
};

struct MANGOS_DLL_DECL pet_dk_ghoulAI : public pet_simple_guardianAI
{
    pet_dk_ghoulAI(Pet* pPet) : pet_simple_guardianAI(pPet)
    {
        pPet->SetCanModifyStats(true);
        pPet->addSpell(SPELL_DK_SCALING_01);
        pPet->addSpell(SPELL_DK_SCALING_02);
        pPet->SetCanModifyStats(false);
    }

    // some hacky-hacky for "Leap" :-/
    void AttackStart(Unit *u)
    {
        Unit* oldTarget = m_creature->getVictim();
        PetAI::AttackStart(u);

        // PetAI::AttackStart was successfull
        if (m_creature->getVictim() != oldTarget && m_creature->getVictim() == u
            && !m_creature->IsNonMeleeSpellCasted(false))
        {
            float dist = m_creature->GetDistance(m_creature->getVictim());
            if (dist > 5.0f && dist < 30.0f)
                // self cast (works only like this, because target mode is buggy)
                m_creature->CastSpell(m_creature, SPELL_LEAP, false);
        }
    }
};

CreatureAI* GetAI_pet_simple_guardian(Creature* pCreature)
{
    if (pCreature->isPet())
        return new pet_simple_guardianAI((Pet*)pCreature);
    else
        return NULL;
}

CreatureAI* GetAI_pet_dk_ghoul(Creature* pCreature)
{
    if (pCreature->isPet())
        return new pet_dk_ghoulAI((Pet*)pCreature);
    else
        return NULL;
}

void AddSC_pets()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "pet_simple_guardian";
    newscript->GetAI = &GetAI_pet_simple_guardian;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "pet_dk_ghoul";
    newscript->GetAI = &GetAI_pet_dk_ghoul;
    newscript->RegisterSelf();
}
