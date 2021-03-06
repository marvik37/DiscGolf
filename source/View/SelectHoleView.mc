using Toybox.WatchUi as Ui;

class SelectHoleView extends Ui.View{
    
    hidden var gui;
    hidden var mController;

    var lineUp;
    var lineDown;

    function initialize(controller) {
        View.initialize();
        mController = controller;
    }

    // Load your resources here
    function onLayout(dc) {
        gui = new Gui.SelectHoleGui(dc, mController);
        lineDown = gui.getLineDown();
        lineUp = gui.getLineUp();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        gui.update();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}