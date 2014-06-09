package  
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author MR
	 */
	public class PlayerAI extends Player 
	{
		private var ball:Ball;
		private var timer:Number;
		public function PlayerAI(x:uint, y:uint, ball:Ball) 
		{
			super(x, y, 0, 0);
			this.ball = ball;
			
		}
		override public function checkInput():void 
		{
			
			
			if (y > ball.y)
			{
				moveUp = true;
				moveDown = false;
			}
			else
			{
				moveUp = false;
				moveDown = true;
			}
			timer += FP.elapsed;
		}
		
	}

}