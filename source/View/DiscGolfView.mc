using Toybox.WatchUi;

class DiscGolfView extends WatchUi.View {

    hidden var painter;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        Gui.initializer(dc);
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
        Gui.backgroundColor(Gui.WHITE);
        Gui.frontColor(Gui.BLACK);
        Gui.topText("Hullnr");
        Gui.drawLines();
        Gui.scoreText();
        Gui.totalText();
        Gui.drawArrows();
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
