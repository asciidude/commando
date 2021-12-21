fx_version 'cerulean'
game 'gta5'

author 'asciidude'
description 'A script with a bundle of commands to use'
version '1.0.0'

server_script {
    'config.lua',
    'server/server.lua'
}

client_scripts {
    'config.lua',
    'client/functions.lua',
    'client/entityiter.lua',
    'client/client.lua'
}