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
SDName: instance_draktharon_keep
SD%Complete: 80-90%
SDComment:
SDCategory: Drak'Tharon
EndScriptData */

#include "precompiled.h"
#include "draktharon_keep.h"

struct MANGOS_DLL_DECL instance_draktharon_keep : public ScriptedInstance
{
    instance_draktharon_keep(Map* pMap) : ScriptedInstance(pMap) {Initialize();};

    uint64 m_uiCrystal1;
    uint64 m_uiCrystal2;
    uint64 m_uiCrystal3;
    uint64 m_uiCrystal4;

    uint32 m_uiCrystalsActivated;

    void Initialize()
    {
        m_uiCrystal1 = 0;
        m_uiCrystal2 = 0;
        m_uiCrystal3 = 0;
        m_uiCrystal4 = 0;
        m_uiCrystalsActivated = 0;
    }

    void OnObjectCreate(GameObject* pGo)
    {
        switch(pGo->GetEntry())
        {
            case CRYSTAL_1: m_uiCrystal1 = pGo->GetGUID(); break;
            case CRYSTAL_2: m_uiCrystal2 = pGo->GetGUID(); break;
            case CRYSTAL_3: m_uiCrystal3 = pGo->GetGUID(); break;
            case CRYSTAL_4: m_uiCrystal4 = pGo->GetGUID(); break;
        }
    }

    uint32 GetData(uint32 uiType)
    {
        switch(uiType)
        {
            case TYPE_CRYSTALS_ACTIVATED: return m_uiCrystalsActivated;
        }
        return 0;
    }

    uint64 GetData64(uint32 uiType)
    {
        switch(uiType)
        {
            case TYPE_CRYSTAL_1: return m_uiCrystal1;
            case TYPE_CRYSTAL_2: return m_uiCrystal2;
            case TYPE_CRYSTAL_3: return m_uiCrystal3;
            case TYPE_CRYSTAL_4: return m_uiCrystal4;
        }
        return 0;
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        switch(uiType)
        {
        case TYPE_CRYSTALS_ACTIVATED: m_uiCrystalsActivated = uiData; break;
        }
    }
};


InstanceData* GetInstanceData_instance_draktharon_keep(Map* pMap)
{
    return new instance_draktharon_keep(pMap);
}

void AddSC_instance_draktharon_keep()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "instance_draktharon_keep";
    newscript->GetInstanceData = &GetInstanceData_instance_draktharon_keep;
    newscript->RegisterSelf();
}