App.appearance = App.cable.subscriptions.create({
    channel:'AppearanceChannel'
}, {
    received: function(data) {
        var tutor = JSON.parse(data)
        if (tutor.online === true){
            $(tutorImgIdConstructor(tutor)).attr('class', 'online');
        };
        if (tutor.online === false){
            $(tutorImgIdConstructor(tutor)).attr('class', 'offline');
        };
    }
});

var tutorImgIdConstructor = function(tutor){
    return "#tutor-" + tutor.id.toString() + "-status";
};