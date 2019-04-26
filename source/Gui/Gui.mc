using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

module Gui {

    enum{
            Forerunner235, Vivoactive
        }

    /** FONTS **/
    const LARGE_FONT = Gfx.FONT_LARGE;
    const MEDIUM_FONT = Gfx.FONT_MEDIUM;
    const SMALL_FONT = Gfx.FONT_SMALL;



    /** TEXT JUSTIFYCATION **/
    const CENTER_TEXT = Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER;




    /** COLORS **/
    const BLACK = Gfx.COLOR_BLACK;
    const WHITE = Gfx.COLOR_WHITE;
    const GREEN = Gfx.COLOR_GREEN;
    const RED = Gfx.COLOR_RED;



    /** Rows **/
    function topRow(width, height) {
        var pos = [width/2, height/4];
        return pos;
    }

    function midRow(width, height) {
        var pos = [width/2, height/2];
        return pos;
    }

    function bottomRow(width, height) {
        var pos = [width/2, (height/4)*3];
        return pos;
    }


    

    /** Arrows **/
    function tapBoxUp() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [width/3 - 10, (height/5) *3 - 40];
    }

    function tapBoxDown() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [width/3 - 10, (height/5) *3 + 10];
    }

    const TAP_BOX_HEIGHT = 50;
    const TAP_BOX_WIDTH = 50;



    /** Color **/
    function backgroundColor(color, dc, width, height) {
        dc.setColor(color, Gfx.COLOR_TRANSPARENT);
        dc.fillRectangle(0, 0, width, height);
    }

    function frontColor(color, dc){
        dc.setColor(color, Gfx.COLOR_TRANSPARENT);
    }


    /** Select hole **/
    function lineUp() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [width, (height/3)];
    }

    function lineDown() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [width, (height/3)*2];
    }

    
}