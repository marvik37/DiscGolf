using Toybox.WatchUi as Ui;

class DiscGolfDelegate extends Ui.BehaviorDelegate {

    hidden var relatedView;
    hidden var mController;

    function initialize(view, controller) {
        BehaviorDelegate.initialize();
        relatedView = view;
        mController = controller;
    }

    function onKey(keyEvent) {
        var key = keyEvent.getKey();
        System.println(key);
        switch(key){
            case Ui.KEY_UP:
                mController.plussOne();
                break;
            case KEY_DOWN:
                mController.minusOne();
                break;
            case KEY_ENTER:
                mController.nextHole();
                break;
        }
        relatedView.requestUpdate();
        return false;
    }

    function onMenu() {
        return true;
    }

}