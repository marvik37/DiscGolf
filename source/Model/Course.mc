
class Course{

    hidden var mHoles;

    function initialize(state, par){
        if(state == null){
            createNewCourse(par);
        }else{
            lastCourse(state, par);
        }
        
    }

    function lastCourse(state, par) {
        mHoles = new [state.size()];
        for(var i = 0; i < mHoles.size(); i++){
            var hole = new Hole(i);
            if(state[i] != 0){
                hole.setThrows(state[i]);
                mHoles[i] = hole;
            }else{
                mHoles[i] = hole;
            }

            if(par != null){
                mHoles[i].setPar(par[i]);
            }
        }
    }

    function createNewCourse(par) {
        mHoles = new [18];
        for(var i = 0; i < mHoles.size(); i++){
            mHoles[i] = new Hole(i);
            if(par != null){
                mHoles[i].setPar(par[i]);
            }
        }
    }

    function getHoles(){
        return mHoles;
    }
}