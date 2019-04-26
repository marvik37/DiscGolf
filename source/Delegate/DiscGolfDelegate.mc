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
        
        if(mController.editPar){
            return editPar(key);
        }
        else{
            return setThrows(key);
        }
    }

    function onTap(keyEvent) {
        

        if(tapUp(keyEvent)){
            mController.plussOne();
            relatedView.requestUpdate();
        }
        if(tapDown(keyEvent)){
            mController.minusOne();
            relatedView.requestUpdate();
        }
        return false;
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
        Ui.pushView(new Rez.Menus.MainMenu(), new MainMenuDelegate(mController), Ui.SLIDE_UP);
        return true;
    }

    function onBack() {
        mController.save();
        return false;
    }

}