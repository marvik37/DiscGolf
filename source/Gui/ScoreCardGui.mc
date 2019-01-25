using Toybox.Graphics as Gfx;

module Gui{

    class ScoreCardGui{

        hidden var mController;
        hidden var height;
        hidden var width;
        hidden var mDc;

        hidden const columnWidth = 10;

        hidden var top;
        hidden var middle; 
        hidden var bottom;

        hidden var left = 20;
        

        function initialize(dc, controller) {
            mDc = dc;
            mController = controller;
            height = mDc.getHeight();
            width = mDc.getWidth();

            top = height / 4;
            middle = height / 2;
            bottom = (height/4) * 3;
        
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

            mDc.drawLine(left, top, width, top);
            mDc.drawLine(left, middle, width, middle);
            mDc.drawLine(left, bottom, width, bottom);

            var x = left;
            for(var i = 0; i < 10; i++){
                mDc.drawLine(x, top, x, bottom);
                x += columnWidth;
            }
        }
    }

}