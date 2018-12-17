
class Controller{

    hidden var mGame;

    function initialize(game) {
        mGame = game;
    }

    function currentHole() {
        var retur = mGame.getActiveHole().getIndex() + 1;
        return retur;
    }

    function currentHoleThrows() {
        var throws = mGame.getActiveHole().getThrows();

        return throws == null ? "-" : throws.toString();
    }

    function totalThrows() {
        return mGame.totalThrows().toString();
    }
}