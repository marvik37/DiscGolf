using Toybox.WatchUi as Ui;

class ScoreCardDelegate extends Ui.BehaviorDelegate{

    hidden var relatedView;
    hidden var mController;

    function initialize(view, controller) {
        BehaviorDelegate.initialize();
        relatedView = view;
        mController = controller;
    }
}