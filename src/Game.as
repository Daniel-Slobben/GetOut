package 
{
	
	/**
	 * textgame
	 * @author Daniël
	 */
	public class Game 
	{
		
		private var console:Console;
		
		private var player:Player;
		private var worldSize:Array;
		private var roomMap:Object;
		
		/**
		 * Empty constructor
		 */
		public function Game() 
		{
			
		}
		
		/**
		 * Function for initializing the game.
		 */
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
			console = new Console(player);
			Main.stage.addChild(console);
		}
		
		private function initializeCharacter():void 
		{
			player = new Player(worldSize, roomMap);
		}
		
		/**
		 * Method for initializing the game world
		 * Some responsibilities of this method could/should
		 * be handed over to worldGenerator.as
		 */
		private function initializeWorld():void 
		{						
			worldSize = [20, 20];
			var worldGenerator:WorldGenerator = new WorldGenerator(worldSize);
			roomMap = worldGenerator.getRoomMap();
			worldGenerator.createBaseMap();
			for (var i:int = 0; i < 10; i++ )
			{
				worldGenerator.simulateStep();
			}			
			worldGenerator.generate();
			worldGenerator.traceMap();
		}
		
	}

}