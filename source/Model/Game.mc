class Game{
    hidden var mCourse;
    hidden var activeHole;

    function initialize(course){
        mCourse = course;
        activeHole = mCourse.getHoles()[0];
    }

    function playActiveHole(score){
        activeHole.setScore(score);
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
}