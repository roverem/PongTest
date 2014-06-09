package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author MR
	 */
	public class Score extends Entity 
	{
		private var leftScore:Text;
		private var rightScore:Text;
		public var playerAScore:uint;
		public var playerBScore:uint;
		private var offsetX:uint = 100;
		private var offsetY:uint = 30;
		public var winner:String;
		public var maxScore:uint = 10;
		
		public function Score() 
		{
			super(0, 0);
			
			leftScore = new Text("0", FP.screen.width / 2 - offsetX, offsetY);
			rightScore = new Text("0", FP.screen.width / 2 + offsetX, offsetY);
			leftScore.size = 80;
			rightScore.size = 80;
			playerAScore = 0;
			playerBScore = 0;
			addGraphic(leftScore);
			addGraphic(rightScore);
			winner = "None";
		}
		
		override public function update():void 
		{
			super.update();
			leftScore.text = playerAScore.toString();
			rightScore.text = playerBScore.toString();
			
			trace(playerAScore);
			
			if (playerAScore >= maxScore)
			{
				winner = "Player A";
			}
			else if (playerBScore >= maxScore)
			{
				winner = "Player B";
			}
			
		}
		
	}

}