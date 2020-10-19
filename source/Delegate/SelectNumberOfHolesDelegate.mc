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
    
    function onTap(keyEvent){
    	
    	if(tapUp(keyEvent)){
    		relatedView.addHole();
    	}
    	if(tapDown(keyEvent)){
    		relatedView.removeHole();
    	}
    	relatedView.requestUpdate();
    	
    	return false;
    }
    
	hidden function tapDown(keyEvent) {
	    var coordinates = keyEvent.getCoordinates();
	    var gui = relatedView.gui;
	    var tapDown = gui.tapBoxDown;
	
	    return coordinates[0] > tapDown[0] && coordinates[0] < tapDown[0] + gui.TAP_BOX_WIDTH
	    && coordinates[1] > tapDown[1] && coordinates[1] < tapDown[1] + gui.TAP_BOX_HEIGHT;

    }

    hidden function tapUp(keyEvent) {
        var coordinates = keyEvent.getCoordinates();
        var gui = relatedView.gui;
        var tapUp = gui.tapBoxUp;

        return coordinates[0] > tapUp[0] && coordinates[0] < tapUp[0] + gui.TAP_BOX_WIDTH
        && coordinates[1] > tapUp[1] && coordinates[1] < tapUp[1] + gui.TAP_BOX_HEIGHT;
    }
    
}