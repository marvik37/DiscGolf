using Toybox.WatchUi as Ui;

class SelectHoleDelegate extends Ui.BehaviorDelegate{

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent) {
        return false;
    }

    
}