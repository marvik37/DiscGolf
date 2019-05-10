using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Application as App;




module Gui{

    class MainGui {

        hidden var mController;
        hidden var height;
        hidden var width;
        hidden var mDc;
        hidden var version;

        hidden var parValuePos;

        hidden var time;


        function initialize(dc, controller) {
            mDc = dc;
            Sys.println(mDc.getHeight());
            mController = controller;
            height = mDc.getHeight();
            width = mDc.getWidth();
            version = getVersion();
            setParPos(version);
            time = App.getApp().time;
        }

       

        hidden function setParPos(version) {
            var pos = parSection();
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
            parValuePos = pos;
        }

        
        
        function loadLayout() {
            setColor();
            setLayout();
        }

        hidden function setColor() {
            backgroundColor(WHITE, mDc, width, height);
            frontColor(BLACK, mDc);
        }

        function setLayout() {
            drawLines();
            drawArrows();   
            drawText();
        }

        function updateText(){
            drawTime();
            score(mController.currentHoleThrows());
            totalThrows(mController.totalThrows(), mController.totalScore());
            topText("Hole " + mController.currentHole().toString());
            parValue();
        }

        hidden function drawTime() {
            var pos = [width/2, height/20];
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
            frontColor(WHITE, mDc);
            holePar(mController.parValue(), font);
            frontColor(BLACK, mDc);
        }

        hidden function topText(text) {
            var pos = [width/2, height/6];
            if(mController.changeHole){
                mDc.fillRectangle(pos[0] - 50, pos[1] - Gfx.getFontHeight(LARGE_FONT)/2, 100, Gfx.getFontHeight(LARGE_FONT));
                frontColor(WHITE, mDc);
            }else{
                frontColor(BLACK, mDc);
            }
            mDc.drawText(pos[0], pos[1], LARGE_FONT, text, CENTER_TEXT);
            frontColor(BLACK,mDc);
        }

        hidden function drawLines() {
            mDc.drawLine(0, height/4, width, height/4);
            mDc.drawLine(width/2, height/4, width/2, height);
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
            var pos = totalSection();
            pos[1] += Gfx.getFontHeight(MEDIUM_FONT)+5;
            var text = score + "(" + throws + ")";
            var version = getVersion();
            switch(version){
                case Forerunner645:
                    var length = text.length();
                    if(length > 5){
                        mDc.drawText(pos[0] - (5*(length-5)), pos[1], SMALL_FONT, text, CENTER_TEXT);
                    }else{
                        mDc.drawText(pos[0], pos[1], SMALL_FONT, text, CENTER_TEXT);
                    }
                    break;
                default:
                    mDc.drawText(pos[0], pos[1], LARGE_FONT, text, CENTER_TEXT);
                    break;
            }
        }

        hidden function totalText() {
            var pos = totalSection();
            mDc.drawText(pos[0], pos[1], MEDIUM_FONT, "Total", CENTER_TEXT);    
        }

        hidden function parText() {
            var pos = parSection();
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
            var UP_ARROW = [[0,20], [30,20], [15,0]];
            var DOWN_ARROW = [[0,0], [30,0], [15,20]];
            
            var pos = arrowPos();

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