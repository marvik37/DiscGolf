using Toybox.WatchUi as Ui;

class SelectNumberOfHolesView extends Ui.View{
    
    hidden var gui;
    hidden var mController;
    
    hidden const MAX = 36;
    hidden const MIN = 1;

    function initialize(controller) {
        View.initialize();
        mController = controller;
    }

    // Load your resources here
    function onLayout(dc) {
        gui = new Gui.SelectNumberOfHoles(dc, mController);
       
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
    
    function setHole(){
    	var holes = gui.getNumberOfHoles();
    	mController.createNewCourse(holes);
    }
    
    function addHole(){    	
    	var holes = gui.getNumberOfHoles();
    	if(holes < MAX){
    		holes++;
    	}
    	gui.setNumberOfHoles(holes);
    	
    }
    
    function removeHole(){
    	var holes = gui.getNumberOfHoles();
    	if(holes > MIN){
    		holes--;
    	}
    	gui.setNumberOfHoles(holes);
    	
    }
}