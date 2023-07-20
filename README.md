# Kill Notify Alert
 
 
--You will have to incorporate this within your framework, its very simple to do so but if your struglling you can reach out and ill help you. tizzy#4417


@params
action(either Kill or Death)
name(killer or victims name) 
number(the amount of xp/points that should be displayed at the top)
isPlaySound(if you are wanting it to play a sound upon the notifier)
soundTrack(the file name, example("kill.ogg"))
volume(float, example(1.0))

If your logic for getting a players killer is client sided you can simply use the export, else use the event

Event:

TriggerClientEvent("Tizzy:AddAlert", source, action, name, number, isPlaySound, soundTrack, volume)

Exports:

exports.tizzy_alert:addDeath(name, xp, sound, audiofile, volume)


exports.tizzy_alert:addKill(name, xp, sound, audiofile, volume)
