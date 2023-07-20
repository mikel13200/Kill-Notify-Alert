local isPointsDisplaying = false;
local isPointsNumber = 0;
local isCurrentNumber = 0;
local isAlerts = {};

local function addDeath(killer, number, isPlaySound, soundTrack, volume)
    isCurrentNumber = isCurrentNumber + 1
    isAlerts[isCurrentNumber] = false;
    SendNUIMessage({
        action = "alert",
        reason = true,
        killed = killer,
        id = isCurrentNumber,
        points = 0,
        isPlaySound = isPlaySound,
        soundTrack = soundTrack,
        volume = volume,
    })
    isPointsDisplaying = true;
end

local function addKill(target, number, isPlaySound, soundTrack, volume)
    isCurrentNumber = isCurrentNumber + 1
    isAlerts[isCurrentNumber] = false;
    SendNUIMessage({
        action = "alert",
        reason = false,
        killed = target,
        id = isCurrentNumber,
        points = number, 
        isPlaySound = isPlaySound,
        soundTrack = soundTrack,
        volume = volume,
    })
    isPointsDisplaying = true;
end

Citizen.CreateThread(function()
    while true do
        Wait(1500)
        for k,v in pairs(isAlerts) do
            if isAlerts[k] then
                SendNUIMessage({action = "hideKillAlert", Index = k})
                isAlerts[k] = nil;
            else
                isAlerts[k] = true;
            end
        end
        if isPointsDisplaying and not isAlerts[isCurrentNumber] then
            SendNUIMessage({action = "hideDisplayedPoints"})
            isPointsDisplaying = false;
        end
    end
end)

exports("addKill", addKill);
exports("addDeath", addDeath);

RegisterNetEvent("Tizzy:AddAlert", function(action, name, number, isPlaySound, soundTrack, volume)
    if action == "Kill" then
        addKill(name, number, isPlaySound, soundTrack, volume)
    elseif action == "Death" then
        addDeath(name, number, isPlaySound, soundTrack, volume)
    end
end)

