package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author MR
	 */
	public class Gameplay extends World 
	{
		public static var padOffsetX:uint = 40;
		private var ball:Ball;
		public var ai:Boolean;
		public var score:Score;
		
		public function Gameplay(ai:Boolean) 
		{
			super();
			score = new Score();
			add(score);
			ball = new Ball(score, padOffsetX * 2, FP.screen.height / 2);
			add(ball);
			
			add(new Player(padOffsetX, FP.screen.height / 2, Key.A, Key.Z));
			
			if (ai)
			{
				add(new PlayerAI(FP.screen.width - padOffsetX, FP.screen.height / 2, ball));				
			}
			else
			{
				add(new Player(FP.screen.width - padOffsetX, FP.screen.height / 2, Key.UP, Key.DOWN));
			}
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (score.winner != "None")
			{
				FP.world = new WinScreen(score.winner);
			}
			
		}
		
	}

}