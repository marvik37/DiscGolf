class Hole{

    hidden var mIndex;
    hidden var mScore;
    hidden var mPar = 3;

    function initialize(index){
        mIndex = index;
    }

    function getIndex(){
        return mIndex;
    }

    function getPar(){
        return mPar;
    }

    function setPar(par){
        mPar = par;
    }

    function getScore(){
        return mScore;
    }

    function setScore(score){
        return mScore;
    }
}