using Toybox.WatchUi as Ui;

class SelectHoleDelegate extends Ui.BehaviorDelegate{

    hidden var mController;
    hidden var currentHole;
    hidden var relatedView;

    function initialize(view, controller) {
        BehaviorDelegate.initialize();
        relatedView = view;
        mController = controller;
        currentHole = controller.currentHole();
    }

    function onKey(keyEvent) {
        var key = keyEvent.getKey();

        switch(key){
            case Ui.KEY_UP:
                mController.nextHole();
                break;
            case Ui.KEY_DOWN:
                mController.previousHole();
                break;
        }
        relatedView.requestUpdate();
        return false;
    }

    
}