using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;




module Gui{

    class MainGui extends CommonGui{

        const UP_ARROW = [[0,20], [30,20], [15,0]];
        const DOWN_ARROW = [[0,0], [30,0], [15,20]];   

        const TAP_BOX_HEIGHT = 50;
        const TAP_BOX_WIDTH = 50; 

        hidden var parValuePos;
        hidden var time;
        hidden var timePos;
        hidden var parSection;
        hidden var totalSection;
        hidden var scoreSection;
        hidden var scoreValueSection;
        hidden var arrowPos;
        hidden var tapBoxUp;
        hidden var tapBoxDown;
        hidden var upSectionLine;


        function initialize(dc, controller) {
            CommonGui(dc, controller);
            Sys.println(mDc.getHeight());

            time = App.getApp().time;
            timePos = [width/2, height/20];
            
            parSection = [(width/4) * 3, (height/3)];
            parValuePos = setParPos(version);

            totalSection = [(width/4) * 3, (height/5)*3];

            scoreSection = [width/4, height/3];
            scoreValueSection = [width/5 , (height/5) * 3];

            arrowPos = [(width/3) , (height / 5) * 3 ];
            tapBoxDown = [width/3 - 10, (height/5) *3 + 10];
            tapBoxUp = [width/3 - 10, (height/5) *3 - 40];

            upSectionLine = height/4;
            midSectionLine = width/2;
        }

       

        hidden function setParPos(version) {
            var pos = parSection;
            switch (version){
                case Forerunner235:
                    pos[1] += Gfx.getFontHeight(MEDIUM_FONT);
                    break;
                case Vivoactive:
                    pos[1] += Gfx.getFontHeight(SMALL_FONT);
                    break;
                default:
                    pos[1] += Gfx.getFontHeight(TINY_FONT);
                    break;
            }
            return pos;
        }

        
        
        function loadLayout() {
            setColor();
            setLayout();
        }

        

        function setLayout() {
            drawLines();
            drawArrows();   
            drawText();
        }

        hidden function drawLines() {
            mDc.drawLine(0, upSectionLine, width, upSectionLine);
            mDc.drawLine(midSectionLine, upSectionLine, midSectionLine, height);
        }

        function updateText(){
            drawTime();
            score(mController.currentHoleThrows());
            totalThrows(mController.totalThrows(), mController.totalScore());
            topText("Hole " + mController.currentHole().toString());
            parValue();
        }

        hidden function drawTime() {
            var pos = timePos;
            time.start();
            if(version == Forerunner645){
                mDc.drawText(pos[0], pos[1], XTINY_FONT, time.now(), CENTER_TEXT);
            }else {
                mDc.drawText(pos[0], pos[1], SMALL_FONT, time.now(), CENTER_TEXT);
            }
        }

        hidden function parValue() {
            //Edit par box
            if(mController.editPar){
                if(version == Forerunner235){
                    editParValue(MEDIUM_FONT);
                }else if(version == Vivoactive){
                    editParValue(SMALL_FONT);
                }else if(version == Forerunner645){
                    editParValue(TINY_FONT);
                }
                    
            }else{
                if(version == Forerunner235){
                    holePar(mController.parValue(), MEDIUM_FONT);
                }else if(version == Vivoactive ){
                    holePar(mController.parValue(), SMALL_FONT);
                }else if(version == Forerunner645){
                    holePar(mController.parValue(), TINY_FONT);
                }
                
            }
        }

        hidden function editParValue(font) {
            var size = Gfx.getFontHeight(font);
            mDc.fillRectangle(parValuePos[0] - (size/2), parValuePos[1] - (size/2), size, size);
            frontColor(WHITE);
            holePar(mController.parValue(), font);
            frontColor(BLACK);
        }

        hidden function topText(text) {
            var pos = [width/2, height/6];
            if(mController.changeHole){
                mDc.fillRectangle(pos[0] - 50, pos[1] - Gfx.getFontHeight(LARGE_FONT)/2, 100, Gfx.getFontHeight(LARGE_FONT));
                frontColor(WHITE);
            }else{
                frontColor(BLACK);
            }
            drawText(text, pos, LARGE_FONT, CENTER_TEXT);
            frontColor(BLACK);
        }

        

        hidden function scoreText() {
            var pos = scoreSection();
            mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Shots:", CENTER_TEXT);
        }

        hidden function score(score) {
            var pos = scoreValueSection();
            mDc.drawText(pos[0], pos[1], LARGE_FONT, score, CENTER_TEXT);
        }

        hidden function totalThrows(throws, score) {
            var pos = totalSection;
            pos[1] += Gfx.getFontHeight(MEDIUM_FONT)+5;
            var text = score + "(" + throws + ")";
            var version = getVersion();
            switch(version){
                case Forerunner645:
                    var length = text.length();
                    if(length > 5){
                        pos[0] = pos[0] - (5*(length-5));
                        drawText(text,pos,SMALL_FONT, CENTER_TEXT);
                    }else{
                        drawText(text, pos, SMALL_FONT, CENTER_TEXT);
                    }
                    break;
                default:
                    drawText(text, pos, LARGE_FONT, CENTER_TEXT);
                    break;
            }
        }

        hidden function totalText() {
            var pos = totalSection;
            mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Total", CENTER_TEXT);    
        }

        hidden function parText() {
            var pos = parSection;
            if(version == Vivoactive  || version == Forerunner645){
                mDc.drawText(pos[0], pos[1], SMALL_FONT, "Par", CENTER_TEXT);
            }else if(version == Forerunner235){
                mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Par", CENTER_TEXT);
            }
            
        }

        hidden function holePar(par, font) {
            mDc.drawText(parValuePos[0], parValuePos[1], font, par, CENTER_TEXT);
        }

        hidden function drawText(){
            scoreText();
            totalText();
            parText();
        }

        hidden function drawArrows() {
            var up = UP_ARROW;
            var down = DOWN_ARROW;
            
            var pos = arrowPos;

            for(var i = 0; i < up.size(); i++){
                up[i][0] += pos[0];
                up[i][1] += pos[1] - 15;
            }

            for(var i = 0; i < down.size(); i++){
                down[i][0] += pos[0];
                down[i][1] += pos[1] + 15;
            }


            mDc.fillPolygon(up);
            mDc.fillPolygon(down);
        }
    }
}