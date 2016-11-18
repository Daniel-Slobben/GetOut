package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * The main class. 
	 * Not much to it.
	 * @author Daniël
	 */
	public class Main extends Sprite 
	{
		public static var stage:Stage;
		
		public function Main() 
		{			
			Main.stage = stage;
			var initializer:Initializer = new Initializer();
			initializer.initialize();
		}
		
	}
	
}