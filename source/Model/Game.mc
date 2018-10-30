class Game{
    hidden var mCourse;
    hidden var activeHole;

    function initialize(course){
        mCourse = course;
    }

    function playActiveHole(score){
        activeHole.setScore(score);
    }

    function nextHole(){
        activeHole = mCourse.getHoles()[activeHole.getIndex + 1];
    }

    function selectHole(index){
        activeHole = mCourse.getHoles()[index];
    }
}