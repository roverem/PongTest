package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author MR
	 */
	public class UiButton extends Entity
	{
		private var ai:Boolean;
		private var text:Text;
		public function UiButton(leftScreen:Boolean, txt:String, ai:Boolean) 
		{
			if (leftScreen)	{x = 0;	}
			else{x = FP.screen.width / 2;}
			
			super(x, 0);
			setHitbox(FP.screen.width / 2, FP.screen.height);
			
			text = new Text(txt, FP.screen.width / 4, FP.screen.height / 2);
			addGraphic(text);
			this.ai = ai;
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.mousePressed && collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				FP.world = new Gameplay(ai);
			}
		}
		
	}

}