using Toybox.Application;
using Toybox.WatchUi;

class DiscGolfApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
        var course = new Course();
        var game = new Game(course);
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new DiscGolfView(), new DiscGolfDelegate() ];
    }

}
