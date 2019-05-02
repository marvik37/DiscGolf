using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

module Gui {

    enum{
            Forerunner235, Vivoactive, Forerunner645
        }

    /** FONTS **/
    const LARGE_FONT = Gfx.FONT_LARGE;
    const MEDIUM_FONT = Gfx.FONT_MEDIUM;
    const SMALL_FONT = Gfx.FONT_SMALL;
    const TINY_FONT = Gfx.FONT_TINY;



    /** TEXT JUSTIFYCATION **/
    const CENTER_TEXT = Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER;




    /** COLORS **/
    const BLACK = Gfx.COLOR_BLACK;
    const WHITE = Gfx.COLOR_WHITE;
    const GREEN = Gfx.COLOR_GREEN;
    const RED = Gfx.COLOR_RED;


    /** MainView Positions **/
    function parSection() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [(width/4) * 3, (height/3)];
    }

    function totalSection() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [(width/4) * 3, (height/5)*3];
    }

    function scoreSection() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [width/4, height/3];
    }

    function scoreValueSection() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [width/5 , (height/5) * 3];
    }

    /** Arrows **/
    const UP_ARROW = [[0,20], [30,20], [15,0]];
    const DOWN_ARROW = [[0,0], [30,0], [15,20]];

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

    function arrowPos() {
        var settings = Sys.getDeviceSettings();
        var height = settings.screenHeight;
        var width = settings.screenWidth;
        return [(width/3) , (height / 5) * 3 ];
    }


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