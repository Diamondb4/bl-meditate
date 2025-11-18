fx_version 'cerulean'
game 'gta5'

description 'bl-meditate'
version '2.0.0'

shared_script {
    '@ox_lib/init.lua',
    'config.lua',
    '@qbx_core/modules/lib.lua'
    
}

server_scripts {
    'server.lua'
}

client_scripts {

    'client.lua'
  }

lua54 'yes'_fxv2_oal 'yes'


