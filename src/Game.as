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
		private var roomMap:Object;
		
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
		}
		
		private function initializeConsole():void 
		{
			console = new Console(character);
			Main.stage.addChild(console);
		}
		
		private function initializeCharacter():void 
		{
			character = new Character(worldSize, roomMap);
		}
		
		private function initializeWorld():void 
		{			
			var worldGenerator:WorldGenerator = new WorldGenerator();
			worldSize = [7, 7];
			worldGenerator.generate(worldSize);
			roomMap = worldGenerator.getRoomMap();
		}
		
	}

}