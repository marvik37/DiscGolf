using Toybox.Graphics as Gfx;

module Gui{

    var height;
    var width;
    var mDc;
    var mFont = Gfx.FONT_MEDIUM;
    var justification;

    function initializer(dc) {
        mDc = dc;
        height = mDc.getHeight();
        width = mDc.getWidth();
    }

    function setFont(font){
        mFont = font;
    }

    function backgroundColor(color) {
        mDc.setColor(color, Gfx.COLOR_TRANSPARENT);
        mDc.fillRectangle(0, 0, width, height);
    }

    function frontColor(color){
        mDc.setColor(color, Gfx.COLOR_TRANSPARENT);
    }

   



}