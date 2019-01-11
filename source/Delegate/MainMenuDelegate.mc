using Toybox.WatchUi as Ui;

class MainMenuDelegate extends Ui.MenuInputDelegate{

    hidden var mController;

    function initialize(controller) {
        MenuInputDelegate.initialize();
        mController = controller;
    }

    function onMenuItem(item) {
        if(item == :selectHole){
            System.println("Select hole");
            Ui.pushView(new SelectHoleView(mController), new SelectHoleDelegate(), Ui.SLIDE_UP);
        }
    }
}