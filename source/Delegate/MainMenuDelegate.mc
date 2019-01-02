using Toybox.WatchUi as Ui;

class MainMenuDelegate extends Ui.MenuInputDelegate{

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if(item == :selectHole){
            System.println("Select hole");
        }
    }
}