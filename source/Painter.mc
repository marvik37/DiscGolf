using Toybox.Graphics as Gfx;

module Painter{

        function test(dc){
            dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
            dc.fillRectangle(0,0,dc.getWidth(),dc.getHeight());
            dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
            dc.drawText(dc.getWidth() / 2, dc.getHeight() / 2, Gfx.FONT_MEDIUM, "Test", Gfx.TEXT_JUSTIFY_CENTER);
        }

}