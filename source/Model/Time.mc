
using Toybox.Time;
using Toybox.Time.Gregorian;

class Time{

    hidden var hour;
    hidden var minutes;
    hidden var time;

    hidden var format = Time.FORMAT_MEDIUM;

    function initialize() {
        var moment = new Time.Moment(Time.now().value());
        time = Gregorian.info(moment, format);
        minutes = time.min;
        hour = time.hour;
    }


    function now() {
        return hour + ":" + minutes;
    }
}