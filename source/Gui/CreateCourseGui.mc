


class CreateCourseGui extends Gui.CommonGui{

    hidden var lineUp;
    hidden var lineDown;

    hidden var topRow;
    hidden var midRow;
    hidden var bottomRow;

    hidden var right;
    hidden var left;

    

    function initialize(dc, controller) {
        CommonGui.initialize(dc, controller);
       
        lineDown =  [width, (height/3)*2];
        lineUp = [width, (height/3)];
        right = width/3 * 2;
        left = width/3;
        topRow = [left, height/4];
        midRow = [left, height/2];
        bottomRow = [left, (height/4)*3];

    }

    
    function update() {
        setColor();
        drawLines();
        updateText();
    }

    hidden function updateText(){
        topRowText();
        midRowText();
        bottomRowText();
    }

    hidden function drawLines(){
        drawLineUp();
        drawLineDown();
    }

    function drawLineUp() {
        mDc.drawLine(0, lineUp[1], lineUp[0], lineUp[1]);
    }

    function drawLineDown() {
        mDc.drawLine(0, lineDown[1], lineDown[0], lineDown[1]);
    }

    hidden function title() {
        var pos = topRow;

    }

    hidden function midRowText() {
        var pos = midRow;
        var hole = mController.currentHole();
        var par = mController.getActiveHole().getPar();
        var holeString = "Hole " + hole.toString();
        drawText(holeString, pos, MEDIUM_FONT, CENTER_TEXT);
        pos[0] = right;
        drawText(par, pos, MEDIUM_FONT, CENTER_TEXT);
        pos[0] = left;
    }

    

    hidden function bottomRowText() {
        var pos = bottomRow;
        var hole = mController.currentHole();
        var numberOfHoles = mController.getGame().getCourse().getHoles().size();

        if(hole < numberOfHoles){
            var holeString = "Hole " + (hole+1).toString();
            drawText(holeString, pos, MEDIUM_FONT, CENTER_TEXT);
        }
    }

}