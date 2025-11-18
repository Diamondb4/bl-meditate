
RegisterServerEvent('bl-meditate:server:GetStress', function()
    local src = source
    local stress = 'stress'
    local stressLevel = exports.qbx_core:GetMetadata(src, stress)
    print('hello', stressLevel)


end)

RegisterServerEvent('bl-meditate:server:SetStressLevel', function ()
    local src = source

    exports.qbx_core:SetMetadata(src, "stress", 0)

    local stressLevel = exports.qbx_core:GetMetadata(src, "stress")
    print(stressLevel)

end)
