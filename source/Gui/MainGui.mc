using Toybox.Graphics as Gfx;

module Gui{

    class MainGui {

        hidden var mController;
        hidden var height;
        hidden var width;
        hidden var mDc;

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
            totalThrows(mController.totalThrows(), mController.totalScore());
            topText("Hole " + mController.currentHole().toString());
            holePar(mController.parValue());
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

        hidden function totalThrows(throws, score) {
            var pos = [(width/4) * 3, (height/5)*3 + Gfx.getFontHeight(MEDIUM_FONT) + 5];
            var text = score + "(" + throws + ")";
            mDc.drawText(pos[0], pos[1], LARGE_FONT, text, CENTER_TEXT);
        }

        hidden function totalText() {
            var pos = [(width/4) * 3, (height/5)*3];
            mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Total", CENTER_TEXT);    
        }

        hidden function parText() {
            var pos = [(width/4) * 3, height/3];
            mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Par", CENTER_TEXT);
        }

        hidden function holePar(par) {
            var pos = [(width/4) * 3, (height/3) + Gfx.getFontHeight(MEDIUM_FONT)];
            mDc.drawText(pos[0], pos[1], MEDIUM_FONT, par, CENTER_TEXT);
        }

        hidden function drawText(){
            scoreText();
            totalText();
            parText();
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
}