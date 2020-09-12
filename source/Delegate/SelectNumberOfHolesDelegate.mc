using Toybox.WatchUi as Ui;

class SelectNumberOfHolesDelegate extends Ui.BehaviorDelegate{

    hidden var mController;
    hidden var relatedView;

    function initialize(view, controller) {
        BehaviorDelegate.initialize();
        relatedView = view;
        mController = controller;
    }

   function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }

	 function onKey(keyEvent) {
        var key = keyEvent.getKey();

        switch(key){
            case Ui.KEY_UP:
                relatedView.addHole();
                break;
            case Ui.KEY_DOWN:
                relatedView.removeHole();
                break;
            case Ui.KEY_ENTER:
            	relatedView.setHole();
                Ui.popView(Ui.SLIDE_IMMEDIATE);
                return false;
                break;
        }
        relatedView.requestUpdate();
        return false;
    }
    
}