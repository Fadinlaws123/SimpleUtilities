if Config.Scripts.weaponFlashlight then 
  SetFlashLightKeepOnWhileMoving(true)
end

if Config.Scripts.disableKnockout then
  Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
  local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
    DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
          DisableControlAction(1, 142, true)
        end
    end
  end)
end

if Config.Scripts.disableCombatRoll then 
  Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedArmed(GetPlayerPed(-1), 4 | 2) and IsControlPressed(0, 25) then
            DisableControlAction(0, 22, true)
        end
    end
  end)
end

if Config.Scripts.realisticWeaponNames then
  Citizen.CreateThread(function()
    -- Pistols --
    AddTextEntry('WT_PIST', 'M9 Beretta')
    AddTextEntry('WT_PIST_CBT', 'Glock 17')
    AddTextEntry('WT_PIST_AP', 'Glock 18')
    AddTextEntry('WT_PIST_50', 'Desert Eagle')
    AddTextEntry('WT_STUN', 'X-26')
    AddTextEntry('WT_SNSPISTOL', 'Heckler & Koch P7M10')
    AddTextEntry('WT_HVYPISTOL', 'Enterprise 1911')
    AddTextEntry('WT_VPISTOL', 'FN Model 1922')
    AddTextEntry('WT_CERPST', 'Heckler & Koch P7')
    AddTextEntry('WT_MKPISTOL', 'Thompson/Center Contender G2')
    AddTextEntry('WT_REVOLVER', 'Taurus Raging Bull')
    AddTextEntry('WT_REV_DA', 'Colt M1892')
    AddTextEntry('WT_REV_NV', 'Colt 1851')
    AddTextEntry('WT_GDGTPST', 'P08 Luger')
    -- Sub Machine Guns --
    AddTextEntry('WT_SMG_MCR', 'UZI')
    AddTextEntry('WT_SMG', 'MP5')
    AddTextEntry('WT_SMG_ASL', 'FN P90')
    AddTextEntry('WT_MCHPIST', 'TEC-9')
    AddTextEntry('WT_MINISMG', 'Škorpion Vz. 82')
    AddTextEntry('WT_COMBATPDW', 'SIG MPX')
    AddTextEntry('WT_GUSNBRG', '45 ACP M1928A1 Thompson')
    -- Assault Rifles --
    AddTextEntry('WT_RIFLE_ASL', 'AK-47')
    AddTextEntry('WT_RIFLE_CBN', 'M4A1')
    AddTextEntry('WT_RIFLE_ADV', 'CTAR-21')
    AddTextEntry('WT_SPCARBINE', 'G36C')
    AddTextEntry('WT_BULLRIFLE', 'QBZ-95')
    AddTextEntry('WT_CMPRIFLE', 'AK Carbine')
    AddTextEntry('WT_MLTRYRFL', 'Steyr AUG A3')
    -- Machine Guns --
    AddTextEntry('WT_MG', 'PKM')
    AddTextEntry('WT_MG_CBT', 'M249')
    -- ShotGuns --
    AddTextEntry('WT_SG_PMP', 'Model 870')
    AddTextEntry('WT_SG_SOF', 'Mossberg 500')
    AddTextEntry('WT_SG_ASL', 'UTAS UTS-15')
    AddTextEntry('WT_SG_BLP', 'KSG')
    AddTextEntry('WT_HVYSHGN', 'Saiga 12')
    AddTextEntry('WT_CMBSHGN', 'Spas-12')
    -- Snipers --
    AddTextEntry('WT_SNIP_RIF', 'AWF')
    AddTextEntry('WT_SNIP_HVY', 'Barrett M82')
    AddTextEntry('WT_MKRIFLE', 'M39 EMR/Mk')
    -- Rocket Launchers --
    AddTextEntry('WT_GL', 'Milkor MGL')
    -- Misc --
    AddTextEntry('WT_MINIGUN', 'M134 Minigun')
    AddTextEntry('WT_GNADE_STK', 'C4')
  end)
end

if Config.Scripts.mapBlips then 
  Citizen.CreateThread(function()
    for _, info in pairs(Config.MapBlips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.9)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
  end)
end
