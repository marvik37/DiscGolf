
using Toybox.System;

class Time{

    hidden var hour;
    hidden var minutes;
    hidden var time;


    function initialize() {
        time = System.getClockTime(); // ClockTime object
        hour = time.hour.format("%02d");
        minutes = time.min.format("%02d");
    }
}