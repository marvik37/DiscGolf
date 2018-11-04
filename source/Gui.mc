using Toybox.Graphics as Gfx;

module Gui{

    var height;
    var width;
    var mDc;
    var mFont = Gfx.FONT_MEDIUM;

    /** FONTS **/
    const LARGE_FONT = Gfx.FONT_LARGE;
    const MEDIUM_FONT = Gfx.FONT_MEDIUM;

    /** TEXT JUSTIFYCATION **/
    const CENTER_TEXT = Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER;

    /** COLORS **/
    const BLACK = Gfx.COLOR_BLACK;
    const WHITE = Gfx.COLOR_WHITE;

    /** ARROWS **/
    var UP_ARROW = [[0,10], [10,10], [5,0]];
    var DOWN_ARROW = [[0,0], [10,0], [5,10]];

    function initializer(dc) {
        mDc = dc;
        height = mDc.getHeight();
        width = mDc.getWidth();
    }

    function backgroundColor(color) {
        mDc.setColor(color, Gfx.COLOR_TRANSPARENT);
        mDc.fillRectangle(0, 0, width, height);
    }

    function frontColor(color){
        mDc.setColor(color, Gfx.COLOR_TRANSPARENT);
    }

   function topText(text) {
       var pos = [width/2, height/7];
       mDc.drawText(pos[0], pos[1], LARGE_FONT, text, CENTER_TEXT);
   }

   function drawLines() {
       mDc.drawLine(0, height/5, width, height/5);
       mDc.drawLine(width/2, height/5, width/2, height);
   }

    function scoreText() {
        var pos = [width/4, height/3];
        mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Score:", CENTER_TEXT);
    }

    function totalText() {
        var pos = [(width/4) * 3, height/3];
        mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Total", CENTER_TEXT);    
    }

    function drawArrows() {
        var pos = [(width/5)*2 , (height / 2) ];

        for(var i = 0; i < UP_ARROW.size(); i++){
            UP_ARROW[i][0] += pos[0];
            UP_ARROW[i][1] += pos[1] - 10;
        }

        for(var i = 0; i < DOWN_ARROW.size(); i++){
            DOWN_ARROW[i][0] += pos[0];
            DOWN_ARROW[i][1] += pos[1] + 10;
        }

        mDc.fillPolygon(UP_ARROW);
        mDc.fillPolygon(DOWN_ARROW);
    }


}