fx_version 'cerulean'
games { 'gta5' }
ui_page "web/index.html"
author "tizzy#4417"

client_scripts {
	"cl_alert.lua"
}

files {
    "web/*",
}

export 'addKill'
export 'addDeath'