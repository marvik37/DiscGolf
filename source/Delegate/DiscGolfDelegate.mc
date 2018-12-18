using Toybox.WatchUi;

class DiscGolfDelegate extends WatchUi.BehaviorDelegate {

    hidden var relatedView;
    hidden var mController;

    function initialize(view, controller) {
        BehaviorDelegate.initialize();
        relatedView = view;
        mController = controller;
    }

    function onKeyReleased(keyEvent) {
        var key = keyEvent.getKey();
        switch(key){
            case KEY_UP:
                mController.plussOne();
                break;
            case KEY_DOWN:
                mController.minusOne();
                break;
        }
        relatedView.requestUpdate();
    }

    function onMenu() {
        return true;
    }

}