
using Toybox.System;
using Toybox.WatchUi as Ui;
using Toybox.Timer;


class Time{

    hidden var hour;
    hidden var minutes;
    hidden var time;

    hidden var timer;


    function initialize() {
        getTime();
        timer = new Timer.Timer();
    }

    function start() {
    	getTime();
        timer.start(method(:update), 60000 - (time.sec * 1000), false);
    }
	
	hidden function getTime(){
		time = System.getClockTime();
		hour = time.hour.format("%02d");
        minutes = time.min.format("%02d");
	}
	
    function now() {
        return hour + ":" + minutes;
    }

    function update() {
        Ui.requestUpdate();
    }

}