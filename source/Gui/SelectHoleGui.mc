using Toybox.Graphics as Gfx;

module Gui{

    class SelectHoleGui{

        hidden var mController;
        hidden var height;
        hidden var width;
        hidden var mDc;

        function initialize(dc, controller) {
            mDc = dc;
            mController = controller;
            height = mDc.getHeight();
            width = mDc.getWidth();
        }

        function update() {
            setColor(BLACK, WHITE);
            drawLines();
            updateText();
        }

        hidden function setColor(front, back) {
            backgroundColor(back, mDc, width, height);
            frontColor(front, mDc);
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
            mDc.drawLine(0, lineUp()[1], lineUp()[0], lineUp()[1]);
        }

        function drawLineDown() {
            mDc.drawLine(0, lineDown()[1], lineDown()[0], lineDown()[1]);
        }

        hidden function midRowText() {
            var pos = midRow(width, height);
            var hole = mController.currentHole();
            var holeString = "Hole " + hole.toString();
            mDc.drawText(pos[0], pos[1], MEDIUM_FONT, holeString, CENTER_TEXT);
        }

        hidden function topRowText() {
            var pos = topRow(width, height);
            var hole = mController.currentHole();
            
            if(hole > 1){
                var holeString = "Hole " + (hole-1).toString();
                mDc.drawText(pos[0], pos[1], MEDIUM_FONT, holeString, CENTER_TEXT);
            }
        }

        hidden function bottomRowText() {
            var pos = bottomRow(width, height);
            var hole = mController.currentHole();
            var numberOfHoles = mController.getGame().getCourse().getHoles().size();

            if(hole < numberOfHoles){
                var holeString = "Hole " + (hole+1).toString();
                mDc.drawText(pos[0], pos[1], MEDIUM_FONT, holeString, CENTER_TEXT);
            }
        }
    }
}

