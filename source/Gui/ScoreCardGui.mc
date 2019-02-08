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

            left = 20;
            right = left + columnWidth * 9;
        }


        function update() {
            setColor();
            drawTable();
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

        hidden function drawScore() {
            var x = left;
            for(var i = 0; i < 9; i++){
                mDc.drawText(x, top - (top - bottom) / 2, mController.currentHoleThrows(), CENTER_TEXT);
                x += 3;
            }
        }
    }

}