using Toybox.WatchUi as Ui;

class MainMenuDelegate extends Ui.Menu2InputDelegate{

    hidden var mController;

    function initialize(controller) {
        Menu2InputDelegate.initialize();
        mController = controller;
    }

    function onSelect(item) {
        var id = item.getId();
        if(id.equals("selectHole")){
            System.println("Select hole");
            var view = new SelectHoleView(mController);
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            Ui.pushView(view, new SelectHoleDelegate(view, mController), Ui.SLIDE_UP);
        }else if(id.equals("newGame")){
            mController.newGame();
        }else if(id.equals("scorecard")){
            var view = new ScoreCardView(mController);
            Ui.popView(Ui.SLIDE_IMMEDIATE);
            Ui.pushView(view, new ScoreCardDelegate(view, mController), Ui.SLIDE_UP);
        }else if(id.equals("numberOfHoles")){
        	var picker = new SelectNumberOfHolesView(mController);
        	Ui.pushView(picker, new SelectNumberOfHolesDelegate(picker, mController), Ui.SLIDE_UP);
        }else if(id.equals("changePar")){
            mController.editPar = true;
        }
    }

}