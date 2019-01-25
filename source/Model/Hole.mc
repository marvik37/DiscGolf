class Hole{

    hidden var mIndex;
    hidden var mPar = 3;
    hidden var mThrows;
    hidden var registered;

    function initialize(index){
        mIndex = index;
        registered = false;
    }

    function restart(){
        registered = false;
        mThrows = null;
    }

    function isRegistered() {
        return registered;
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

    function score(){
        return mThrows - mPar;
    }

    function setThrows(throws) {
        registered = true;
        mThrows = throws;
    }

    function getThrows() {
        return mThrows;
    }
}