package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Draw;
	
	/**
	 * ...
	 * @author MR
	 */
	public class MainMenu extends World 
	{
		private var startReset:Number;
		
		private var aiButton:UiButton;
		private var humanButton:UiButton;
		private var title:Text;
		
		public function MainMenu() 
		{
			super();
			
			startReset = 0;
			
			aiButton = new UiButton(true, "AI", true);
			add(aiButton);
			
			humanButton = new UiButton(false, "HUMAN", false);
			add(humanButton);
			
			title = new Text("PONG", 0, 50);
			title.size = 40;
			title.x = FP.screen.width / 2 - title.width / 2 + 4;
			addGraphic(title);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (startReset > 0.6)
			{
				startReset = 0;
				humanButton.visible = !humanButton.visible;
				aiButton.visible = !aiButton.visible;
				title.visible = !title.visible;
			}
			
			startReset += FP.elapsed;
		}
		
		override public function render():void 
		{
			super.render();
			Draw.line(FP.screen.width / 2, 0, FP.screen.width / 2, FP.screen.height);
		}
		
	}

}