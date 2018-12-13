
class Controller{

    hidden var mGame;

    function initialize(game) {
        mGame = game;
    }

    function currentHole() {
        var retur = mGame.getActiveHole().getIndex() + 1;
        return retur;
    }

    function currentHoleScore() {
        var score = mGame.getActiveHole().getScore();

        return score == null ? "-" : score.toString();
    }
}