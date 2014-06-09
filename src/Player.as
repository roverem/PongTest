package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author MR
	 */
	public class Player extends Entity
	{
		public var speed:uint;
		public var accel:Number;
		public var minAccel:Number;
		private var up:uint;
		private var down:uint;
		public var moveDown:Boolean;
		public var moveUp:Boolean;
		
		public function Player(x:uint, y:uint, up:uint, down:uint) 
		{
			super(x, y);
			width = 20;
			height = 100;
			setHitbox(width, height, halfWidth, halfHeight);
			
			type = "player";
			speed = 20;
			minAccel = 0.5;
			accel = minAccel;
			this.up = up;
			this.down = down;
			moveUp = false;
			moveDown = false;
		}
		
		public function checkInput():void
		{
			moveUp = Input.check(up);
				moveDown = Input.check(down);
		}
		
		override public function update():void 
		{
			super.update();
			
			checkInput();
			
			if (moveUp)
			{
				accel += 0.01;
				moveBy(0, -speed * FP.clamp(accel, minAccel, 1));
			}
			else if (moveDown)
			{
				accel += 0.01;
				moveBy(0, speed * FP.clamp(accel, minAccel,1));
			}
			else 
			{ 	
				accel = 0; 
			}
			
			y = FP.clamp(y, halfHeight, FP.screen.height - halfHeight);
		}
		
		override public function render():void 
		{
			super.render();
			Draw.rect(x - halfWidth, y - halfHeight, width, height, 0xffffff);
			
		}
		
	}

}