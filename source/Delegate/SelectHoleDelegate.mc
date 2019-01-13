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
                mController.previousHole();
                break;
            case Ui.KEY_DOWN:
                mController.nextHole();
                break;
            case Ui.KEY_ENTER:
                Ui.popView(Ui.SLIDE_IMMEDIATE);
                return false;
                break;
        }
        relatedView.requestUpdate();
        return false;
    }

    function onBack() {
        mController.getGame().selectHole(currentHole - 1);
        return false;
    }
    
}