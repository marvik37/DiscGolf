
class Course{

    hidden var mHoles;

    function initialize(state){
        if(state == null){
            createNewCourse();
        }else{
            lastCourse(state);
        }
        
    }

    function lastCourse(state) {
        mHoles = new [state[0].size()];
        for(var i = 0; i < mHoles.size(); i++){
            var hole = new Hole(i);
            if(state[0][i] != 0){
                hole.setThrows(state[0][i]);
            }
            hole.setPar(state[1][i]);
            mHoles[i] = hole;

        }
    }

    function createNewCourse() {
        mHoles = new [18];
        for(var i = 0; i < mHoles.size(); i++){
            mHoles[i] = new Hole(i);
        }
    }

    function getHoles(){
        return mHoles;
    }
}