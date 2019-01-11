using Toybox.Graphics as Gfx;

module Gui {

    /** FONTS **/
    const LARGE_FONT = Gfx.FONT_LARGE;
    const MEDIUM_FONT = Gfx.FONT_MEDIUM;




    /** TEXT JUSTIFYCATION **/
    const CENTER_TEXT = Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER;




    /** COLORS **/
    const BLACK = Gfx.COLOR_BLACK;
    const WHITE = Gfx.COLOR_WHITE;




    /** Rows **/
    function topRow(width, height) {
        var pos = [width/2, height/3];
        return pos;
    }

    function midRow(width, height) {
        var pos = [width/2, height/2];
        return pos;
    }

    function bottomRow(width, height) {
        var pos = [width/2, (height/3)*2];
        return pos;
    }




    /** Color **/
    function backgroundColor(color, dc) {
        dc.setColor(color, Gfx.COLOR_TRANSPARENT);
        dc.fillRectangle(0, 0, width, height);
    }

    function frontColor(color, dc){
        dc.setColor(color, WHITE);
    }
}