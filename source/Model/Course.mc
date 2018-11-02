class Course{

    hidden var mHoles;

    function initialize(){
        mHoles = new [18];
        for(var i = 0; i < mHoles.size(); i++){
            mHoles[i] = new Hole(i);
        }
    }

    function getHoles(){
        return mHoles;
    }
}