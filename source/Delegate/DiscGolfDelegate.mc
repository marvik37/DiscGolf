using Toybox.WatchUi;

class DiscGolfDelegate extends WatchUi.BehaviorDelegate {

    hidden var relatedView;


    function initialize(view) {
        BehaviorDelegate.initialize();
        relatedView = view;
    }

    function onMenu() {
        return true;
    }

}