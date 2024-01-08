if(Config.Scripts.weaponFlashlight == true) then 
  SetFlashLightKeepOnWhileMoving(true)
end

if (Config.Scripts.disableKnockout == true) then
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

if (Config.Scripts.disableCombatRoll == true) then 
  Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedArmed(GetPlayerPed(-1), 4 | 2) and IsControlPressed(0, 25) then
            DisableControlAction(0, 22, true)
        end
    end
  end)
end