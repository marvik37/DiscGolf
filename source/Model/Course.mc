
class Course{

    hidden var mHoles;
    hidden var numberOfHoles;

    function initialize(state, par){
        if(state == null){
            setUpCourse(par);
        }else{
            lastCourse(state, par);
        }
        
    }
	
	function getNumberOfHoles(){
		return numberOfHoles;
	}
	
    function lastCourse(state, par) {
        mHoles = new [state.size()];
       	numberOfHoles = mHoles.size();
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

    hidden function setUpCourse(par) {
    	if(par == null){
    		mHoles = new [18];
    		numberOfHoles = mHoles.size();
	        for(var i = 0; i < mHoles.size(); i++){
	            mHoles[i] = new Hole(i);
	        }
    	}else{
    		numberOfHoles = par.size();
    		mHoles = new [numberOfHoles];
    		
    		for(var i = 0; i < numberOfHoles; i++){
    			mHoles[i] = new Hole(i);
    			mHoles[i].setPar(par[i]);
    		}
    	}
    
        
    }
    
    function createCourse(holes){
    	var keepScore = mHoles;
    	numberOfHoles = holes;
    	mHoles = new [numberOfHoles];
        for(var i = 0; i < mHoles.size(); i++){
            mHoles[i] = new Hole(i);
            if(keepScore != null && keepScore.size() > i && keepScore[i].isRegistered()){
            	mHoles[i].setThrows(keepScore[i].getThrows());
            	mHoles[i].setPar(keepScore[i].getPar());
            }
        }
    }

    function getHoles(){
        return mHoles;
    }
}