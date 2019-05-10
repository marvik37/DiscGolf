using Toybox.WatchUi as Ui;
using Toybox.System as Sys;


class DiscGolfDelegate extends Ui.BehaviorDelegate {

    hidden var relatedView;
    hidden var mController;
    hidden var mKeys;


    function initialize(view, controller) {
        BehaviorDelegate.initialize();
        relatedView = view;
        mController = controller;
        mKeys = new [Ui has :EXTENDED_KEYS ? 23 : 16];
    }

    function onKey(keyEvent) {
        var key = keyEvent.getKey();
        System.println(key);
        
        if(mController.editPar){
            return editPar(key);
        }
        else if (mController.changeHole){
            return setHole(key);
        }
        else{
            return setThrows(key);
        }
    }

    function onTap(keyEvent) {
        
        if(mController.editPar){
            editParTap(keyEvent);
        }
        else if(mController.changeHole){
            setHoleTap(keyEvent);
        }
        else
        {
            setThrowsTap(keyEvent);
        }
        
        
        return false;
    }

    hidden function setThrowsTap(keyEvent) {
        if(tapUp(keyEvent)){
                mController.plussOne();
                relatedView.requestUpdate();
            }
        if(tapDown(keyEvent)){
            mController.minusOne();
            relatedView.requestUpdate();
        }
    }

    hidden function setHoleTap(keyEvent) {
        if(tapUp(keyEvent)){
            mController.nextHole();
        }
        if(tapDown(keyEvent)){
            mController.previousHole();
        }
        relatedView.requestUpdate();
    }

    hidden function editParTap(keyEvent) {
        if(tapUp(keyEvent)){
                mController.parPluss();
                relatedView.requestUpdate();
            }
        if(tapDown(keyEvent)){
            mController.parMinus();
            relatedView.requestUpdate();
        }
    }

    hidden function tapDown(keyEvent) {
        var coordinates = keyEvent.getCoordinates();
        var tapDown = Gui.tapBoxDown();

        return coordinates[0] > tapDown[0] && coordinates[0] < tapDown[0] + Gui.TAP_BOX_WIDTH
        && coordinates[1] > tapDown[1] && coordinates[1] < tapDown[1] + Gui.TAP_BOX_HEIGHT;

    }

    hidden function tapUp(keyEvent) {
        var coordinates = keyEvent.getCoordinates();
        var tapUp = Gui.tapBoxUp();

        return coordinates[0] > tapUp[0] && coordinates[0] < tapUp[0] + Gui.TAP_BOX_WIDTH
        && coordinates[1] > tapUp[1] && coordinates[1] < tapUp[1] + Gui.TAP_BOX_HEIGHT;
    }

    hidden function setHole(key){
        switch(key){
            case Ui.KEY_UP:
                mController.nextHole();
                break;
            case Ui.KEY_DOWN:
                mController.previousHole();
                break;
            case Ui.KEY_ENTER:
                mController.changeHole = false;
                break;
            case Ui.KEY_ESC:
                mController.changeHole = false;
                break;
        }
        relatedView.requestUpdate();
        return true;
    }

    hidden function setThrows(key) {
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

    hidden function editPar(key) {
        switch(key){
            case Ui.KEY_UP:
                mController.parPluss();
                break;
            case Ui.KEY_DOWN:
                mController.parMinus();
                break;
            case Ui.KEY_ENTER:
                mController.editPar = false;
                break;
            case Ui.KEY_ESC:
                mController.editPar = false;
                break;
        }
        relatedView.requestUpdate();
        return true;
    }

    function onMenu() {
        mController.editPar = false;
        pushMenu();
        return true;
    }

    function onHold(evt) {
        onMenu();
        return false;
    }

    function pushMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new MainMenuDelegate(mController), Ui.SLIDE_UP);        
    }

    function onBack() {
        mController.save();
        return false;
    }

        function onKeyPressed(evt) {
        var key = evt.getKey();
        var now = Sys.getTimer();
        mKeys[key] = now;
    }

    function onKeyReleased(evt) {
        var key = evt.getKey();

        if (mKeys[key] != null) {
            var now = Sys.getTimer();
            var delta = now - mKeys[key];

            Sys.println(Lang.format("Key $1$ held for $2$ms", [ key, delta ]));
            
            if(delta > 1000 && key == Ui.KEY_ENTER){
                mController.changeHole = true;
            }

            mKeys[key] = null;
            relatedView.requestUpdate();
        }
    }

}
