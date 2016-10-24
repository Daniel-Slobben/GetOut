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
		
		private var worldGenerator:WorldGenerator;
		
		private var enemies:Array;
		
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
			
			initializeEnemies();
			
			Console.writeOutput("Reach to end of the map to win.");
			Console.writeOutput("Welcome to GetOut!");
			Console.writeOutput("");
			
		}
		
		public function moveEnemies():void
		{
			for each (var enemy:Enemy in enemies)
			{
				enemy.action();
			}
		}
		
		private function initializeEnemies():void 
		{
			
			var enemy1:Enemy = new Enemy(worldSize, roomMap);
			var enemy2:Enemy = new Enemy(worldSize, roomMap);
			var enemy3:Enemy = new Enemy(worldSize, roomMap);
			
			enemies = [enemy1, enemy2, enemy3];			
		}
		
		private function initializeConsole():void 
		{
			console = new Console(player, this);
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
			worldGenerator = new WorldGenerator(worldSize);
			roomMap = worldGenerator.getRoomMap();
			worldGenerator.createBaseMap();
			for (var i:int = 0; i < 10; i++ )
			{
				worldGenerator.simulateStep();
			}			
			worldGenerator.generate();
			worldGenerator.traceMap();
			worldGenerator.traceFeatureMap();
		}
		
	}

}