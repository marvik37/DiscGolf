using Toybox.Graphics as Gfx;

module Gui{

    class ScoreCardGui{

        hidden var mController;
        hidden var height;
        hidden var width;
        hidden var mDc;

        hidden const columnWidth = 18;

        hidden var top;
        hidden var middle; 
        hidden var bottom;

        hidden var left;
        hidden var right;
        

        function initialize(dc, controller) {
            mDc = dc;
            mController = controller;
            height = mDc.getHeight();
            width = mDc.getWidth();

            top = height / 4;
            middle = height / 2;
            bottom = (height/4) * 3;

            left = (mDc.getWitdt() - (columnWidth*9)) / 2;
            right = left + columnWidth * 9;
        }


        function update() {
            setColor();
            drawTable();
            drawScore();
        }

        hidden function setColor() {
            backgroundColor(WHITE, mDc, width, height);
            frontColor(BLACK, mDc);
        }

        hidden function drawTable() {

            mDc.drawLine(left, top, right, top);
            mDc.drawLine(left, middle, right, middle);
            mDc.drawLine(left, bottom, right, bottom);

            var x = left;
            for(var i = 0; i < 10; i++){
                mDc.drawLine(x, top, x, bottom);
                x += columnWidth;
            }
        }

        hidden function throws(hole) {
            return hole.getThrows() == null ? "-" : hole.getThrows();
        }

        hidden function drawScore() {

            var holes = mController.getGame().getCourse().getHoles();
            var x = left + (columnWidth/2);
            for(var i = 0; i < 9; i++){
                mDc.drawText(x, top - ((top - middle) / 2), MEDIUM_FONT, throws(holes[i]), CENTER_TEXT);
                x += columnWidth;
            }

            x = left + (columnWidth/2);
            for(var i = 9; i < holes.size(); i++){
                mDc.drawText(x, middle - ((middle - bottom) / 2), MEDIUM_FONT, throws(holes[i]),CENTER_TEXT);
                x += columnWidth;
            }
        }
    }

}