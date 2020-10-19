using Toybox.Graphics as Gfx;

module Gui{

    class ScoreCardGui extends CommonGui{


        hidden var columnWidth = 18;
        hidden var columnHeight;

        var col = true;


        hidden var title;
        hidden var top;
        hidden var middle; 
        hidden var bottom;

        hidden var left;
        hidden var right;

        

        function initialize(dc, controller) {
            CommonGui.initialize(dc, controller);
         
            title = height / 8;


            if(version == Forerunner645){
                columnWidth = 23;
            }else if(version == Big){
            	columnWidth = 35;
            }
            
            top = height / 4;
            middle = height / 2;
            bottom = (height/4) * 3;
            left = (width - (columnWidth*9)) / 2;
            right = left + columnWidth * 9;

            columnHeight = middle - top;
            
        }


        function update(page) {
            setColor();
            drawTable();
            drawScore(page);
            
        }
		
		hidden function drawScore(page){
			var startHole = 9*page - 8;
			var lastHole = 9*page;
			var holes = mController.getGame().getCourse().getHoles();
			if(holes.size() < lastHole){
            	lastHole = holes.size();
            }
			var title = "Hole " + startHole + "-" + lastHole;
			titleText(title);
			
            var x = left + (columnWidth/2);
            
            
            
            for(var i = startHole; i <= lastHole; i++){
                drawTopLine(i, x);
                x += columnWidth;
            }

            x = left + (columnWidth/2);
            for(var i = startHole-1; i < lastHole; i++){
                color(holes[i], x);
                drawBottomLine(throws(holes[i]), x);
                x += columnWidth;
            }
		}
    
        hidden function drawTable() {

            mDc.drawLine(left, top, right, top);
            mDc.drawLine(left, middle, right, middle);
            mDc.drawLine(left, bottom, right, bottom);

            var x = left;

           

            for(var i = 0; i < 10; i++){
                mDc.drawLine(x, top, x, bottom);
                x += columnWidth;
            }
        }

        hidden function throws(hole) {
            return hole.getThrows() == null ? "-" : hole.getThrows();
        }

        hidden function drawTopLine(text, x){
            var xx = x - (columnWidth/2);
            switch(version){
            	case Big:
                case Forerunner645:
                    if(col){
                        frontColor(GREY);
                        mDc.fillRectangle(xx+1, top+1, columnWidth-1, columnHeight-1);
                        frontColor(BLACK);
                        col = false; 
                    }else{
                        col = true;
                    }
                    mDc.drawText(x, top - ((top - middle) / 2), XTINY_FONT, text, CENTER_TEXT);
                    break;
                default:
                    mDc.drawText(x, top - ((top - middle) / 2), SMALL_FONT, text, CENTER_TEXT);
                    break;
            }
        }

        hidden function drawBottomLine(text, x) {
            mDc.drawText(x, middle - ((middle - bottom) / 2), MEDIUM_FONT, text,CENTER_TEXT);

        }

        hidden function titleText(text) {
            var pos = [width/2, title];
            drawText(text, pos, LARGE_FONT, CENTER_TEXT);
        }

        hidden function drawScoreFront9() {
            
            titleText("Hole 1-9");

            var holes = mController.getGame().getCourse().getHoles();
            var x = left + (columnWidth/2);

            for(var i = 1; i <= 9; i++){
                drawTopLine(i, x);
                x += columnWidth;
            }

            x = left + (columnWidth/2);
            for(var i = 0; i < 9; i++){
                color(holes[i], x);
                drawBottomLine(throws(holes[i]), x);
                x += columnWidth;
            }
        }

        hidden function drawScoreBack9(){
            
            titleText("Hole 10-18");

            var holes = mController.getGame().getCourse().getHoles();
            var x = left + (columnWidth/2);

            for(var i = 10; i <= 18; i++){
                drawTopLine(i, x);
                x += columnWidth;
            }

            x = left + (columnWidth/2);
            for(var i = 9; i < holes.size(); i++){
                color(holes[i], x);
                drawBottomLine(throws(holes[i]), x);
                x += columnWidth;
            }

        }

        hidden function color(hole, x) {
            if (hole.getThrows() == null){
                return;
            }
            x = x - (columnWidth/2);
            if(hole.getThrows() < hole.getPar()){
                frontColor(GREEN);
                mDc.fillRectangle(x+1, middle+1, columnWidth-1, columnHeight-1);
            }else if(hole.getThrows() > hole.getPar()){
                frontColor(RED);
                mDc.fillRectangle(x+1,middle+1, columnWidth-1, columnHeight-1);
            }
            frontColor(BLACK);
        }
    }

}