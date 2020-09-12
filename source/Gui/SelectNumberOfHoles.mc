
module Gui{
	class SelectNumberOfHoles extends CommonGui{
		
		var tapBoxUp;
        var tapBoxDown;
		
		hidden var numberPos;
        hidden var arrowPos;
		hidden var numberOfHoles;
		
		function initialize(dc, controller){
			CommonGui.initialize(dc, controller);
			numberPos = [ width/2, height/2 ];
			
			numberOfHoles = controller.getGame().getCourse().getNumberOfHoles();
		}
		
		function setNumberOfHoles(n){
			numberOfHoles = n;
		}
		
		function getNumberOfHoles(){
			return numberOfHoles;
		}
		
		function update(){
			setColor();
			updateNumber();
		}
		
		hidden function updateNumber(){
			drawArrows();
			drawNumber();
		}
		
		hidden function drawNumber(){
			drawText(numberOfHoles,numberPos, LARGE_FONT, CENTER_TEXT);
		}
		
		hidden function drawArrows() {
            var up = [UP_ARROW[0], UP_ARROW[1], UP_ARROW[2]];
            var down = [DOWN_ARROW[0], DOWN_ARROW[1], DOWN_ARROW[2]];
            
            var pos = [numberPos[0] - 15, numberPos[1] - 10];

            setArrowPos(up, down, pos);
           
            mDc.fillPolygon(up);
            mDc.fillPolygon(down);

            resetArrowPos(up, down, pos);
        }
		
		hidden function setArrowPos(up, down, pos) {
            for(var i = 0; i < up.size(); i++){
                up[i][0] += pos[0];
                up[i][1] += pos[1] - 50;
            }

            for(var i = 0; i < down.size(); i++){
                down[i][0] += pos[0];
                down[i][1] += pos[1] + 50;
            }
        }
        
        hidden function resetArrowPos(up, down, pos) {
            for(var i = 0; i < up.size(); i++){
                up[i][0] -= pos[0];
                up[i][1] -= pos[1] - 50;
            }

            for(var i = 0; i < down.size(); i++){
                down[i][0] -= pos[0];
                down[i][1] -= pos[1] + 50;
            }
        }
		
	}
}