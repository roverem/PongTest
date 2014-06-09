package  
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author MR
	 */
	public class WinScreen extends World 
	{
		private var text:Text;
		public function WinScreen(winner:String ) 
		{
			super();
			text = new Text(winner + " has won!\n\nPress any key to continue", FP.screen.width / 3, FP.screen.height / 3);
			addGraphic(text);
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.pressed(Key.ANY) || Input.mousePressed)
			{
				FP.world = new MainMenu();
			}
		}
		
	}

}