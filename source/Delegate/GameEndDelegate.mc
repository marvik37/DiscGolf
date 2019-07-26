using Toybox.WatchUi as Ui;
using Toybox.System as Sys;


class MainMenuDelegate extends Ui.MenuInputDelegate{

    hidden var mController;

    function initialize(controller) {
        MenuInputDelegate.initialize();
        mController = controller;
    }

    function onMenuItem(item) {
        if(item == :scorecard){
            var view = new ScoreCardView(mController);
            Ui.pushView(view, new ScoreCardDelegate(view, mController), Ui.SLIDE_IMMEDIATE);
        }else if(item == :newGame){
            mController.newGame();
        }else if(item == :save){
            mController.saveScoreCard();
        }else if(item == :exit){
            mController.newGame();
            Sys.exit();
        }
    }
}