Config = {}

Config.YogaAnim = { dict = 'rcmcollect_paperleadinout@', clip = 'meditiate_idle', flag = 1 }

Config.YogaMatsPark = {
    mats = {
    vec3(1080.21, -684.05, 56.65),
    vec3(1081.75, -684.34, 56.64),
    vec3(1083.1, -684.16, 56.66)
    }
}

Config.YogaMatsCityHall = {
    mats = {
    vec3(-525.9, -237.42, 35.00),
    vec3(-524.69, -239.78, 35.00),
    vec3(-523.43, -242.02, 35.00),
    vec3(-521.92, -244.22, 35.00),
    vec3(-520.63, -246.48, 35.00)
    }
}
Config.Blips = {
    {
        --cityhall
        enabled = true,
        sprite = 197,
        color = 83,
        size = 1.0,
        name = 'Meditate',
        coords = 
        {
            Config.YogaMatsCityHall.mats[3], -- city hall
            Config.YogaMatsPark.mats[2] --mirror park
        }
    },

}