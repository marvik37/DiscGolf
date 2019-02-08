using Toybox.Graphics as Gfx;

module Gui{

    class ScoreCardGui{

        hidden var mController;
        hidden var height;
        hidden var width;
        hidden var mDc;

        hidden const columnWidth = 18;

        hidden var title;
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

            title = height / 8;

            top = height / 4;
            middle = height / 2;
            bottom = (height/4) * 3;

            left = (mDc.getWidth() - (columnWidth*9)) / 2;
            right = left + columnWidth * 9;
        }


        function update(front) {
            setColor();
            drawTable();
            if(front){
                drawScoreFront9();
            }else{
                drawScoreBack9();
            }
            
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

        hidden function drawTopLine(text, x){
            mDc.drawText(x, top - ((top - middle) / 2), SMALL_FONT, text, CENTER_TEXT);
        }

        hidden function drawBottomLine(text, x) {
            mDc.drawText(x, middle - ((middle - bottom) / 2), MEDIUM_FONT, text,CENTER_TEXT);

        }

        hidden function titleText(text) {
            mDc.drawText(mDc.getWidth()/2, title, LARGE_FONT, text, CENTER_TEXT);
        }

        hidden function drawScoreFront9() {
            
            titleText("Hole 1-9");

            var holes = mController.getGame().getCourse().getHoles();
            var x = left + (columnWidth/2);

            for(var i = 1; i <= 9; i++){
                drawTopLine(i, x);
                x += columnWidth;
            }

            x = left + (columnWidth/2);
            for(var i = 0; i < 9; i++){
                drawBottomLine(throws(holes[i]), x);
                x += columnWidth;
            }
        }

        hidden function drawScoreBack9(){
            
            titleText("Hole 10-18");

            var holes = mController.getGame().getCourse().getHoles();
            var x = left + (columnWidth/2);

            for(var i = 10; i <= 18; i++){
                drawTopLine(i, x);
                x += columnWidth;
            }

            x = left + (columnWidth/2);
            for(var i = 9; i < holes.size(); i++){
                drawBottomLine(throws(holes[i]), x);
                x += columnWidth;
            }

        }
    }

}