package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Daniël
	 */
	public class Main extends Sprite 
	{
		public static var stage:Stage;
		
		public function Main() 
		{
			
			Main.stage = stage;
			var game:Game = new Game();
			game.initialize();
		}
		
	}
	
}