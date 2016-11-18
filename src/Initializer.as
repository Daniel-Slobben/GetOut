package 
{
	
	/**
	 * Initialize this textgame already
	 * @author Daniël
	 */
	public class Initializer 
	{
		
		private var console:Console;
		
		private var player:Player;
		private var worldSize:Array;
		private var roomMap:Object;
		
		private var worldGenerator:WorldGenerator;
		
		private static var enemies:Array;
		
		/**
		 * Empty constructor
		 */
		public function Initializer() 
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
			
			initializeEnemies();
			
			Console.writeOutput("Tip: type 'Go North' to go north.");
			Console.writeOutput("Tip: Walk back the way you came to avoid the poison damage!");
			Console.writeOutput("The specific commands that are available can change depending on the status of your game.");
			Console.writeOutput("Please type 'help' in the box above to see what commands are available!");
			Console.writeOutput("Reach to end of the map to win.");
			Console.writeOutput("Welcome to GetOut!");
			
		}
		
		/**
		 * Triggers an enemy to do their moves
		 */		
		public static function moveEnemies():void
		{
			for each (var enemy:Enemy in enemies)
			{
				enemy.action();
			}
		}
		
		/**
		 * Initializes the enemies
		 */
		private function initializeEnemies():void 
		{
			
			var enemy1:Enemy = new Enemy(worldSize, roomMap);
			var enemy2:Enemy = new Enemy(worldSize, roomMap);
			var enemy3:Enemy = new Enemy(worldSize, roomMap);
			
			enemies = [enemy1, enemy2, enemy3];			
		}
		
		/**
		 * Initializes the console
		 */
		private function initializeConsole():void 
		{
			console = new Console(player, this);
			Main.stage.addChild(console);
		}
		
		/**
		 * Initializes the player
		 */
		private function initializeCharacter():void 
		{
			player = new Player(worldSize, roomMap);
		}
		
		/**
		 * Initializes the gameworld with a worldsize of 20 20
		 * This is not dynamic because i am lazy
		 */
		private function initializeWorld():void 
		{						
			worldSize = [20, 20];
			worldGenerator = new WorldGenerator(worldSize);
			roomMap = worldGenerator.getRoomMap();
			
			// the methods for cellular automation
			worldGenerator.createBaseMap();
			worldGenerator.simulate(10);
			
			// the methods for actual room generation
			worldGenerator.generate();
			
			// tracing the maps
			worldGenerator.traceMap();
			worldGenerator.traceFeatureMap();
		}		
	}
}