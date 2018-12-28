using Toybox.Graphics as Gfx;

class Gui {

    hidden var mController;
    hidden var height;
    hidden var width;
    hidden var mDc;
    hidden var mFont = Gfx.FONT_MEDIUM;

    /** FONTS **/
    const LARGE_FONT = Gfx.FONT_LARGE;
    const MEDIUM_FONT = Gfx.FONT_MEDIUM;

    /** TEXT JUSTIFYCATION **/
    const CENTER_TEXT = Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER;

    /** COLORS **/
    const BLACK = Gfx.COLOR_BLACK;
    const WHITE = Gfx.COLOR_WHITE;
    

    function initialize(dc, controller) {
        mDc = dc;
        mController = controller;
        height = mDc.getHeight();
        width = mDc.getWidth();
       
    }

    function loadLayout() {
        setColor();
        setLayout();
    }

    function setColor() {
        backgroundColor(WHITE);
        frontColor(BLACK);
    }

    function setLayout() {
        drawLines();
        drawArrows();   
        drawText();
    }

    function updateText(){
        score(mController.currentHoleThrows());
        totalThrows(mController.totalThrows());
        topText("Hullnr " + mController.currentHole().toString());
    }

    hidden function backgroundColor(color) {
        mDc.setColor(color, Gfx.COLOR_TRANSPARENT);
        mDc.fillRectangle(0, 0, width, height);
    }

    hidden function frontColor(color){
        mDc.setColor(color, WHITE);
    }

    hidden function topText(text) {
       var pos = [width/2, height/7];
       mDc.drawText(pos[0], pos[1], LARGE_FONT, text, CENTER_TEXT);
   }

   hidden function drawLines() {
       mDc.drawLine(0, height/4, width, height/4);
       mDc.drawLine(width/2, height/4, width/2, height);
   }

    hidden function scoreText() {
        var pos = [width/4, height/3];
        mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Score:", CENTER_TEXT);
    }

    hidden function score(score) {
        var pos = [width/5 , (height/5) * 3];
        mDc.drawText(pos[0], pos[1], LARGE_FONT, score, CENTER_TEXT);
    }

    hidden function totalThrows(throws) {
        var pos = [(width/4) * 3, (height/3)*2];
        mDc.drawText(pos[0], pos[1], MEDIUM_FONT, throws, CENTER_TEXT);
        
    }

    hidden function totalText() {
        var pos = [(width/4) * 3, height/3];
        mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Total", CENTER_TEXT);    
    }

    hidden function drawText(){
        scoreText();
        totalText();
    }

    hidden function drawArrows() {
    	
    	var UP_ARROW = [[0,20], [30,20], [15,0]];
    	var DOWN_ARROW = [[0,0], [30,0], [15,20]];
    	
        var pos = [(width/3) , (height / 5) * 3 ];

        for(var i = 0; i < UP_ARROW.size(); i++){
            UP_ARROW[i][0] += pos[0];
            UP_ARROW[i][1] += pos[1] - 15;
        }

        for(var i = 0; i < DOWN_ARROW.size(); i++){
            DOWN_ARROW[i][0] += pos[0];
            DOWN_ARROW[i][1] += pos[1] + 15;
        }

        mDc.fillPolygon(UP_ARROW);
        mDc.fillPolygon(DOWN_ARROW);
    }
    
}

