class Game{
    hidden var mCourse;
    hidden var activeHole;

    function initialize(course){
        mCourse = course;
        activeHole = mCourse.getHoles()[0];
    }

    function playActiveHole(score){
        activeHole.setThrows(score);
    }

    function nextHole(){
        selectHole(activeHole.getIndex() + 1);
    }

    function selectHole(index){
        activeHole = mCourse.getHoles()[index];
    }

    function getActiveHole() {
        return activeHole;
    }

    function getCourse() {
        return mCourse;
    }

    function totalScore() {
        var holes = mCourse.getHoles();
        var score = 0;

        for(var i = 0; i < holes.size(); i++){
            if(holes[i].isRegistered()){
                score += holes[i].score();
            }
        }

        return score;
    }
    
    function totalThrows() {
        var holes = mCourse.getHoles();
        var throws = 0;
        for(var i = 0; i < holes.size(); i++){
            if(holes[i].isRegistered()){
                throws += holes[i].getThrows();
            }
        }
        return throws;
    }
}