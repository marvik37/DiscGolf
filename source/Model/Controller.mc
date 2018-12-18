
class Controller{

    hidden var mGame;

    function initialize(game) {
        mGame = game;
    }

    function currentHole() {
        return mGame.getActiveHole().getIndex() + 1;
    }

    function currentHoleThrows() {
        var throws = mGame.getActiveHole().getThrows();

        return throws == null ? "-" : throws.toString();
    }

    function totalThrows() {
        return mGame.totalThrows().toString();
    }

    function plussOne() {
        var hole = mGame.getActiveHole();
        var throws = hole.getThrows();

        if(throws == null){
            hole.setThrows(hole.getPar());
            return true;
        }
        hole.setThrows(throws + 1);
        return true;
    }

    function minusOne() {
        var hole = mGame.getActiveHole();
        var throws = hole.getThrows();
        
        if(throws == null){
            hole.setThrows(hole.getPar() - 1);
            return true;
        }

        if(throws == 1){
            return true;
        }

        hole.setThrows(throws - 1);
        return true;
        
    }
}