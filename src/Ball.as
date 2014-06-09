package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author MR
	 */
	public class Ball extends Entity 
	{
		private var speed:uint;
		private var nextPosition:Point;
		private var score:Score;
		
		public function Ball(score:Score, x:Number = 0, y:Number = 0) 
		{
			super(x, y);
			width = 14;
			height = 14;
			setHitbox(width, height, halfWidth, halfHeight);
			
			nextPosition = getNextPosition();
			speed = 7;
			this.score = score;
		}
		
		override public function render():void 
		{
			super.render();
			
			Draw.rect(x - halfWidth, y - halfHeight, width, height, 0xffffff);
		}
		
		override public function update():void 
		{
			super.update();
			
			moveTowards(nextPosition.x, nextPosition.y, speed);
			var c:Player = collide("player", x, y) as Player;
			if (c)
			{
				nextPosition = getNextPosition();
			}
			
			if (y < halfHeight)
			{
				nextPosition.y = Math.abs(y) + halfHeight;
			}
			
			if (y > FP.screen.height - halfHeight)
			{
				nextPosition.y = FP.screen.height - (nextPosition.y - FP.screen.height);
			}
			
			if (x > FP.screen.width || x < 0)
			{
				//SCORE POINTS
				//RESET BALL POSITION
				if (x > FP.screen.width)
				{
					score.playerAScore++;
					x = FP.screen.width - Gameplay.padOffsetX;
					y = FP.screen.height / 2;
					nextPosition = getNextPosition();
					
				}
				else if (x < 0)
				{
					score.playerBScore++;
					x = Gameplay.padOffsetX;
					y = FP.screen.height / 2;
					nextPosition = getNextPosition();
				}
			}
		}
		
		private function getNextPosition():Point
		{
			var nextX:int;
			if (x > FP.screen.width / 2)
			{
				nextX = -20;
			}
			else 
			{
				nextX = FP.screen.width + 20;
			}
			
			var r:uint = Math.random() * 100;
			var relativeY:uint = y * 100 / FP.screen.height;
			
			var randY:uint;
			if (r > relativeY)
			{
				randY = y + Math.random() * FP.screen.height - y;
			}
			else
			{
				randY = y - Math.random() * y;
			}
			return new Point(nextX, randY);
		}
		
	}

}