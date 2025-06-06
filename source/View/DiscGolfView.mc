using Toybox.WatchUi;
using Toybox.System as Sys;
using Gui;

class DiscGolfView extends WatchUi.View {

    var gui;
    
    hidden var mController;

    var upBox;
    var downBox;

    function initialize( controller) {
        View.initialize();
        mController = controller; 
    }

    // Load your resources here
    function onLayout(dc) {
        gui = new Gui.MainGui(dc, mController);
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
        gui.loadLayout();
        gui.updateText();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
