
class Controller{

    hidden var mGame;

    function initialize(game) {
        mGame = game;
    }

    function getGame(){
        return mGame;
    }

    function parValue() {
        return mGame.getActiveHole().getPar().toString();
    }

    function nextHole() {
        var numberOfHoles = mGame.getCourse().getHoles().size();
        if(currentHole() < numberOfHoles){
            mGame.nextHole();
        }
        else if(currentHole() == numberOfHoles){
            mGame.selectHole(0);
        }
        
    }

    function previousHole() {
        var numberOfHoles = mGame.getCourse().getHoles().size();
        if(currentHole() > 1){
            mGame.previousHole();
        }
        else if(currentHole() == 1){
            mGame.selectHole(numberOfHoles - 1);
        }

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

    function totalScore() {
        var score = mGame.totalScore();
        if(score == 0){
            return "E";
        }
        if(score > 0){
            return "+" + score.toString();
        }

        return score.toString();
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