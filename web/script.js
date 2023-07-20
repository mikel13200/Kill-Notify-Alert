var isPointsDisplaying = false;
var currentPoints = 0; 
$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var i = event.data
        switch(i.action) {
            case 'alert':
                addPoints(i.points)
                addAlert(i.reason, i.killed, i.id, i.isPlaySound, i.soundTrack, i.volume)
            break;
            case 'hideKillAlert':
                $("#" + i.Index).fadeOut(250).delay(250)
                $("#" + i.Index).remove();
            break;
            case 'hideDisplayedPoints':
                $(".points").fadeOut(250)
                currentPoints = 0
                isPointsDisplaying = false; 
            break;
        }
    });
});

function addPoints(isPoints) {
    $(".points").fadeIn(0)
    if (isPointsDisplaying) {
        currentPoints = currentPoints + isPoints;
        $("#pointsText").text("+" + currentPoints)
    } else {
        isPointsDisplaying = true;
        currentPoints = isPoints;
        $("#pointsText").text("+" + isPoints)
    }
}

function addAlert(isKilled, person, id, isPlaySound, soundTrack, Volume) {
    if (isPlaySound) {
        const audio = new Audio(soundTrack)
        audio.volume = Volume;
        audio.play()        
    }
    if (isKilled) {
        $('.main-cont').append(`<div id=${id} class="Alert"><span>Killed by</span><span id="red">${person}</span></div>`)
    } else {
        $('.main-cont').append(`<div id=${id} class="Alert"><span>Killed</span><span id="green">${person}</span></div>`)
    }
}
