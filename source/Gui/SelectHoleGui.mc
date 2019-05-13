using Toybox.Graphics as Gfx;

module Gui{

    class SelectHoleGui extends CommonGui{

        hidden var lineUp;
        hidden var lineDown;

        hidden var topRow;
        hidden var midRow;
        hidden var bottomRow;


        function initialize(dc, controller) {
            CommonGui.initialize(dc, controller);
       
            lineDown =  [width, (height/3)*2];
            lineUp = [width, (height/3)];
            topRow = [width/2, height/4];
            midRow = [width/2, height/2];
            bottomRow = [width/2, (height/4)*3];
        }

        function getLineUp() {
            return lineUp;
        }

        function getLineDown(){
            return lineDown;
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

        hidden function midRowText() {
            var pos = midRow;
            var hole = mController.currentHole();
            var holeString = "Hole " + hole.toString();
            drawText(holeString, pos, MEDIUM_FONT, CENTER_TEXT);
        }

        hidden function topRowText() {
            var pos = topRow;
            var hole = mController.currentHole();
            
            if(hole > 1){
                var holeString = "Hole " + (hole-1).toString();
                drawText(holeString, pos, MEDIUM_FONT, CENTER_TEXT);
            }
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
}

