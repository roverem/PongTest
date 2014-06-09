package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	
	/**
	 * ...
	 * @author MR
	 */
	public class Main extends Engine
	{
		public function Main():void
		{
			super(800, 600, 60, false);
			
			FP.world = new MainMenu();
			//FP.world = new Gameplay();
			//FP.console.enable();
		}
	}
	
}