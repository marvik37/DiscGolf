using Toybox.WatchUi as Ui;

class ScoreCardDelegate extends Ui.BehaviorDelegate{

    hidden var relatedView;
    hidden var mController;

    function initialize(view, controller) {
        BehaviorDelegate.initialize();
        relatedView = view;
        mController = controller;
    }

    function onKey(keyEvent) {
        var key = keyEvent.getKey();

        switch(key){
            case Ui.KEY_UP:
                relatedView.shiftScoreCard();
                break;
            case Ui.KEY_DOWN:
                relatedView.shiftScoreCard();
                break;
        }
        relatedView.requestUpdate();
        return false;
    }
}