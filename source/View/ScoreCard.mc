using Toybox.WatchUi as Ui;
using Gui;

class ScoreCardView extends Ui.View{

    hidden var gui;
    hidden var mController;
    hidden var front = true;
	hidden var page = 1;
	hidden var numberOfPages;

    function initialize(controller) {
        View.initialize();
        mController = controller;
        
        numberOfPages = getNumberOfPages();
    }

    function onLayout(dc) {
        gui = new Gui.ScoreCardGui(dc, mController); 
    }
	
	hidden function getNumberOfPages(){
		var numberOfHoles = mController.getGame().getCourse().getNumberOfHoles();
		var pages = numberOfHoles / 9;
		if(numberOfHoles % 9 > 0){
			pages++;
		}
		return pages;
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
        gui.update(page);
        return true;
    }
	
	function nextPage(){
		if(page == numberOfPages){
			page = 1;
		}else{
			page++;
		}
	}
	
	function previousPage(){
		if(page == 1){
			page = numberOfPages;
		}else{
			page--;
		}
	}
	
    function shiftScoreCard() {
        if(front){
            front = false;
        }else{
            front = true;
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}