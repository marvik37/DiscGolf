using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

module Gui {

     /** FONTS **/
    const LARGE_FONT = Gfx.FONT_LARGE;
    const MEDIUM_FONT = Gfx.FONT_MEDIUM;
    const SMALL_FONT = Gfx.FONT_SMALL;
    const TINY_FONT = Gfx.FONT_TINY;
    const XTINY_FONT = Gfx.FONT_XTINY;



    /** TEXT JUSTIFYCATION **/
    const CENTER_TEXT = Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER;




    /** COLORS **/
    const BLACK = Gfx.COLOR_BLACK;
    const WHITE = Gfx.COLOR_WHITE;
    const GREEN = Gfx.COLOR_GREEN;
    const RED = Gfx.COLOR_RED;
    const GREY = Gfx.COLOR_LT_GRAY;


    enum{
            Forerunner235, Vivoactive, Forerunner645
        }

    class CommomGui{

        hidden var height;
        hidden var width;
        hidden var settings;
        hidden var version;
        hidden var mDc;

        function initialize(dc, controller) {
            settings = Sys.getDeviceSettings();
            height = settings.screenHeight;
            width = settings.screenWidth;
            version = getVersion();
        }

        function getVersion() {
            var height = Sys.getDeviceSettings().screenHeight;
            if(height == 180){
                return Forerunner235;
            }else if(height == 148){
                return Vivoactive;
            }else if(height == 240){
                return Forerunner645;
            }
            return null;
        }

        /** Color **/

        function setColor() {
            backgroundColor(WHITE);
            frontColor(BLACK);
        }

        function backgroundColor(color) {
            mDc.setColor(color, Gfx.COLOR_TRANSPARENT);
            mDc.fillRectangle(0, 0, width, height);
        }

        function frontColor(color){
            mDc.setColor(color, Gfx.COLOR_TRANSPARENT);
        }

        function drawText(text, pos, font, justification) {
            mDc.drawText(pos[0], pos[1], font, text, justification);
        }

    }


    

  


    /** Rows **/
    function topRow() {
        var pos = [width/2, height/4];
        return pos;
    }

    function midRow() {
        var pos = [width/2, height/2];
        return pos;
    }

    function bottomRow() {
        var pos = [width/2, (height/4)*3];
        return pos;
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