local function DoYoga()
    local ped = PlayerPedId()
    local anim = Config.YogaAnim

    RequestAnimDict(anim.dict)
    while not HasAnimDictLoaded(anim.dict) do
        Wait(0)
    end

    TaskPlayAnim(ped, anim.dict, anim.clip, 8.0, -8.0, -1, anim.flag, 0, false, false, false)

    local success = lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Meditating...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            combat = true
        },
    })

    ClearPedTasks(ped)
    if success then
        TriggerServerEvent('bl-meditate:server:SetStressLevel')
    else
        lib.notify({ title = 'Meditation cancelled', type = 'error' })
    end
end





local function Meditate()
    for i, coords in ipairs(Config.YogaMatsCityHall.mats) do
        exports.ox_target:addBoxZone({
            coords = coords,
            name = 'yogacityhall' .. i,
            size = vec3(1.2, 0.7, 1),
            rotation = 32.0,
            debug = true,

            options = {{
                distance = 1.5,
                icon = 'fa-solid fa-person-yoga',
                label = 'Do Yoga',
                onSelect = function()
                    DoYoga()

                end
            }}
        })
    end

    for i, coords in ipairs(Config.YogaMatsPark.mats) do
        exports.ox_target:addBoxZone({
            coords = coords,
            name = 'yogamirrorpark' .. i,
            size = vec3(1.2, 0.7, 1),
            rotation = 90.0,
            debug = true,

            options = {{
                distance = 1.5,
                icon = 'fa-solid fa-person-yoga',
                label = 'Do Yoga',
                onSelect = function()
                    DoYoga()
                end
            }}
        })
    end
end


Citizen.CreateThread(function ()
        Meditate()
        for _, value in ipairs(Config.Blips) do
        if value.enabled then
            for _, coords in ipairs(value.coords) do
                local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipSprite(blip, value.sprite)
                SetBlipColour(blip, value.color)
                SetBlipScale(blip, value.size)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(value.name)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    
    exports.ox_target:removeZone('yoga')

end)