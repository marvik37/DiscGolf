using Toybox.WatchUi;

class NumberOfHolesPicker extends WatchUi.Picker{
	
	function initialize(){
		
		var title = new WatchUi.Text({:text=>Rez.Strings.numberOfHolesPickerTitle, :locX=>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_BOTTOM, :color=>Graphics.COLOR_WHITE});
		var factories = new [1];
		
		factories[0] = new NumberFactory(18,36,1,{});
		
		Picker.initialize({:title=>title, :pattern=>factories});
	}
	
	function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.clear();
        Picker.onUpdate(dc);
    }
}