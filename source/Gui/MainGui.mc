using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;


module Gui{

    

    class MainGui extends CommonGui{

        const UP_ARROW = [[0,20], [30,20], [15,0]];
        const DOWN_ARROW = [[0,0], [30,0], [15,20]]; 

        const TAP_BOX_HEIGHT = 50;
        const TAP_BOX_WIDTH = 50; 

        var tapBoxUp;
        var tapBoxDown;

        hidden var parValuePos;
        hidden var time;
        hidden var timePos;
        hidden var parSection;
        hidden var totalSection;
        hidden var scoreSection;
        hidden var scoreValueSection;
        hidden var arrowPos;
        
        hidden var upSectionLine;
        hidden var midSectionLine;

        function initialize(dc, mController) {
            CommonGui.initialize(dc, mController);
            Sys.println(height);

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
            var pos = [parSection[0], parSection[1]];
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
                CommonGui.drawText(time.now(), pos, XTINY_FONT, CENTER_TEXT);
            }else if(version == Big){
            	CommonGui.drawText(time.now(), pos, TINY_FONT, CENTER_TEXT);
            }
            else {
                CommonGui.drawText(time.now(), pos, SMALL_FONT, CENTER_TEXT);
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
                    editParValue(TINY_FONT|| version == Big);
                }
                    
            }else{
                if(version == Forerunner235){
                    holePar(mController.parValue(), MEDIUM_FONT);
                }else if(version == Vivoactive ){
                    holePar(mController.parValue(), SMALL_FONT);
                }else if(version == Forerunner645 || version == Big){
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
            CommonGui.drawText(text, pos, LARGE_FONT, CENTER_TEXT);
            frontColor(BLACK);
        }

        

        hidden function scoreText() {
            var pos = scoreSection;
            CommonGui.drawText("Shots", pos, MEDIUM_FONT, CENTER_TEXT);
        }

        hidden function score(score) {
            var pos = scoreValueSection;
            CommonGui.drawText(score, pos, LARGE_FONT, CENTER_TEXT);
        }

        hidden function totalThrows(throws, score) {
            var pos = [totalSection[0], totalSection[1]];
            pos[1] += Gfx.getFontHeight(MEDIUM_FONT)+5;
            var text = score + "(" + throws + ")";
            var version = CommonGui.getVersion();
            switch(version){
            	case Big:
                case Forerunner645:
                    var length = text.length();
                    if(length > 5){
                        pos[0] = pos[0] - (5*(length-5));
                        CommonGui.drawText(text,pos,SMALL_FONT, CENTER_TEXT);
                    }else{
                        CommonGui.drawText(text, pos, SMALL_FONT, CENTER_TEXT);
                    }
                    break;
                default:
                    CommonGui.drawText(text, pos, LARGE_FONT, CENTER_TEXT);
                    break;
            }
        }

        hidden function totalText() {
            var pos = totalSection;
            CommonGui.drawText("Total", pos, MEDIUM_FONT, CENTER_TEXT);
        }

        hidden function parText() {
            var pos = parSection;
            if(version == Vivoactive  || version == Forerunner645 || version == Big){
                CommonGui.drawText("Par", pos, SMALL_FONT, CENTER_TEXT);
            }else if(version == Forerunner235){
                CommonGui.drawText("Par", pos, MEDIUM_FONT, CENTER_TEXT);
            }
            
        }

        hidden function holePar(par, font) {
            CommonGui.drawText(par, parValuePos, font, CENTER_TEXT);
        }

        hidden function drawText(){
            scoreText();
            totalText();
            parText();
        }

        hidden function drawArrows() {
            var up = [UP_ARROW[0], UP_ARROW[1], UP_ARROW[2]];
            var down = [DOWN_ARROW[0], DOWN_ARROW[1], DOWN_ARROW[2]];
            
            var pos = [arrowPos[0], arrowPos[1]];

            setArrowPos(up, down, pos);
           
            mDc.fillPolygon(up);
            mDc.fillPolygon(down);

            resetArrowPos(up, down, pos);
        }

        hidden function resetArrowPos(up, down, pos) {
            for(var i = 0; i < up.size(); i++){
                up[i][0] -= pos[0];
                up[i][1] -= pos[1] - 15;
            }

            for(var i = 0; i < down.size(); i++){
                down[i][0] -= pos[0];
                down[i][1] -= pos[1] + 15;
            }
        }

        hidden function setArrowPos(up, down, pos) {
            for(var i = 0; i < up.size(); i++){
                up[i][0] += pos[0];
                up[i][1] += pos[1] - 15;
            }

            for(var i = 0; i < down.size(); i++){
                down[i][0] += pos[0];
                down[i][1] += pos[1] + 15;
            }
        }
    }
}