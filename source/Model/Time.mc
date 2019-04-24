
using Toybox.System;
using Toybox.WatchUi as Ui;


class Time{

    hidden var hour;
    hidden var minutes;
    hidden var time;

    hidden var timer;


    function initialize() {
        time = System.getClockTime(); // ClockTime object
        hour = time.hour.format("%02d");
        minutes = time.min.format("%02d");

        timer = new Timer.Timer();
        timer.start(method(:update), 60000 - (time.sec * 1000), false);

    }

    function now() {
        return hour + ":" + minutes;
    }

    function update() {
        Ui.requestUpdate();
    }

}