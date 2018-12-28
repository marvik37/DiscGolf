using Toybox.WatchUi;

class DiscGolfView extends WatchUi.View {

    hidden var gui;
    hidden var mGame;
    hidden var mController;

    function initialize(game, controller) {
        View.initialize();
        mGame = game;
        mController = controller; 
    }

    // Load your resources here
    function onLayout(dc) {
        gui = new Gui(dc, mController);
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
        return true;
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
