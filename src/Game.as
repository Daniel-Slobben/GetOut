package 
{
	
	/**
	 * textgame
	 * @author Daniël
	 */
	public class Game 
	{
		
		private var console:Console;
		
		private var character:Character;
		private var worldSize:Array;
		
		public function Game() 
		{
			
		}
		
		public function initialize(  ):void 
		{
			trace("Starting init...");
			
			initializeWorld();			
			trace("World generation is done!");
			
			initializeCharacter();
			trace("Character creation is done!");
			
			initializeConsole();
			trace("Done!");
			
			
			
			startGame();
		}
		
		private function initializeConsole():void 
		{
			console = new Console();
			Main.stage.addChild(console);
		}
		
		private function startGame():void 
		{
			
		}
		
		private function initializeCharacter():void 
		{
			character = new Character(worldSize);
		}
		
		private function initializeWorld():void 
		{			
			var worldGenerator:WorldGenerator = new WorldGenerator();
			worldSize = [7, 7];
			worldGenerator.generate(worldSize);
		}
		
	}

}