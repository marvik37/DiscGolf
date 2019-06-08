
using Toybox.Application as App;

class Controller{

    hidden var mGame;
    
    var editPar = false;
    var changeHole = false;

    function initialize(game) {
        mGame = game;
    }

    function getGame(){
        return mGame;
    }

    function parPluss() {
        var hole = mGame.getActiveHole();
        var par = hole.getPar();
        hole.setPar(par + 1);
    }

    function parMinus() {
        var hole = mGame.getActiveHole();
        var par = hole.getPar();

        if(par > 1){
            hole.setPar(par - 1);
        }
    
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

    function save() {
        var app = App.getApp();

        var holes = mGame.getCourse().getHoles();
        var state = new [holes.size()];
        var par = new [holes.size()];
        for(var i = 0; i < holes.size(); i++){
            if(holes[i].isRegistered()){
                state[i] = holes[i].getThrows();
            }else{
                state[i] = 0;
            }
            par[i] = holes[i].getPar();
        }

        app.setProperty("CurrentGame", state);
        app.setProperty("Par", par);
    }

    function newGame() {
        var holes = mGame.getCourse().getHoles();
        for(var i = 0; i < holes.size(); i++){
            holes[i].restart();
        }
        mGame.selectHole(0);
    }
}