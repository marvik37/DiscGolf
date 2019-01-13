class Course{

    hidden var mHoles;

    function initialize(numberOfHoles){
        mHoles = new [numberOfHoles];
        for(var i = 0; i < mHoles.size(); i++){
            mHoles[i] = new Hole(i);
        }
    }

    function getHoles(){
        return mHoles;
    }
}