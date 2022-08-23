fx_version 'adamant'
game 'gta5'

name "Subway"
description "Subway Script"
version "1.2.0"

ui_page 'ui/ui.html'

files {
    'ui/*.*', 
    'ui/**/*.*',
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}
