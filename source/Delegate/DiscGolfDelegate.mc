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