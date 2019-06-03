using Toybox.Application;
using Toybox.WatchUi;

class DiscGolfApp extends Application.AppBase {

    hidden var game;
    hidden var controller;

    var time;

    function initialize() {
        AppBase.initialize();
        time = new Time();
    }

    // onStart() is called on application start up
    function onStart(state) {
        var lastGame = getLastGame();
        var course = null;
        try{
            course = new Course(lastGame);
        }catch( ex ){
            lastGame = null;
            course = new Course(lastGame);
        }
        game = new Game(course);
        controller = new Controller(game);
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        var view = new DiscGolfView( controller);
        return [ view, new DiscGolfDelegate(view, controller) ];
    }

    function getLastGame(){
        return getProperty("CurrentGame");
    }

}
