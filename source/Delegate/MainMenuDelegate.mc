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
            var view = new SelectHoleView(mController);
            Ui.switchToView(view, new SelectHoleDelegate(view, mController), Ui.SLIDE_UP);
        }else if(item == :newGame){
            mController.newGame();
        }else if(item == :scorecard){
            var view = new ScoreCardView(mController);
            Ui.switchToView(view, new ScoreCardDelegate(view, mController), Ui.SLIDE_UP);
        }

        if(item == :changePar){
            mController.editPar = true;
        }
    }

    

}