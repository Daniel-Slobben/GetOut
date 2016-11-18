package 
{
	/**
	 * Class for generating all the rooms
	 * @author Daniël
	 */
	public class WorldGenerator 
	{
		private var roomMap:Object;
		private var map:Array;
		private var deathLimit:int = 3;
		private var birthLimit:int = 4;
		private var worldSize:Array;
		private var chanceOfLife:Number = 0.37;
		
		/**
		 * Constructor for the world generator
		 */
		public function WorldGenerator(worldSize:Array) 
		{
			roomMap = new Object();
			this.worldSize = worldSize;			
		}
		
		/**
		 * The function for generating the world
		 */
		public function generate():void 
		{
			trace("I am in the world generation now!");
			for (var i:int = 0; i < worldSize[0]; i++) 
			{
				trace("Loading: " + i);
				for (var j:int = 0; j < worldSize[1]; j++) 
				{
					var dangerLevel:int = countAliveNeighbours(i, j, -2);
					var locationArray:Array = [i, j];
					if (map[i][j])
					{
						roomMap[i + "_" + j] = new Room(locationArray, "Desert", dangerLevel);	
					}
					else 
					{
						roomMap[i + "_" + j] = new Room(locationArray, "Forest", dangerLevel);	
					}					
				}
			}
		}
		
		/**
		 * Creates the base map used for cellular automation
		 */
		public function createBaseMap():void 
		{			
			map = [];
			for (var i:int = 0; i < worldSize[0]; i++) 
			{
				map [i] = [];
				for (var j:int = 0; j < worldSize[1]; j++) 
				{							
					var randomNumber:Number = Math.random();
					if (randomNumber > chanceOfLife)
					{
						map [i][j] = false;
					}
					else
					{
						map [i][j] = true;
					}					
				}
			}			
		}
		
		/**
		 * Simulates the steps for cellular automation
		 * @param	amountOfSteps How many steps you want to take
		 */
		public function simulate(amountOfSteps:int):void
		{
			for (var count:int = 0; count < amountOfSteps; count++ )
			{
				var newMap:Array = createEmptyMap();
				for (var i:int = 0; i < worldSize[0]; i++) 
				{
					for (var j:int = 0; j < worldSize[1]; j++) 
					{	
						var aliveNeighbours:int = countAliveNeighbours(i, j, -1);
						
						// rules for alive cells
						if (map[i][j])
						{
							if (aliveNeighbours < deathLimit)
							{
								newMap[i][j] = false;
							}
							else
							{
								newMap[i][j] = true;
							}
						}
						// rules for dead cells
						else
						{
							if (aliveNeighbours > birthLimit)
							{
								newMap[i][j] = true;
							}
							else
							{
								newMap[i][j] = false;
							}
						}
					}
				}
				map = newMap;
			}
		}
		
		/**
		 * Function for counting the amount of alive neighbours a coordinate has.
		 * @param	x coordinates of the cell we want to check
		 * @param	y coordinates of the cell we want to check
		 * @param	size The higher this number is the more neighbours we have to check
		 * @return  The amount of alive cells in the area we check
		 */
		private function countAliveNeighbours(x:int, y:int, size:int):int
		{
			var count:int = 0;
			for (var i:int = size; i < Math.abs(size)+1; i++)
			{
				for (var j:int = size; j < Math.abs(size)+1; j++)
				{
					// this is the cell we want to check
					var neighbour_x:int = x + i;
					var neighbour_y:int = y + j;					
					
					if (i == 0 && j == 0)
					{
						// nothing
					}
					// edges of the map
					else if (neighbour_x < 0 || neighbour_y < 0 || neighbour_x >= map.length || neighbour_y >= map[0].length)
					{
						count++;
					}
					else if (map[neighbour_x][neighbour_y])
					{
						count++;
					}
				}
			}
			return count;
		}
		
		/**
		 * Traces the map with the dangerlevels
		 */
		public function traceFeatureMap():void
		{
			var output:String = "";
			for (var i:int = 0; i < worldSize[0]; i++) 
			{
				for (var j:int = 0; j < worldSize[1]; j++) 
				{
					if (roomMap[i + "_" + j].getDangerLevels() > 9)
					{
						output += " " + roomMap[i + "_" + j].getDangerLevels();
					}
					else 
					{
						output += " " + roomMap[i + "_" + j].getDangerLevels()+" ";
					}
				}
				trace(output);
				output = "";
			}
		}
		
		/**
		 * Traces the false/true map
		 */
		public function traceMap():void
		{
			var i:int;
			var j:int;
			var output:String = "";
			for (i = 0; i < worldSize[0]; i++) 
			{
				for (j = 0; j < worldSize[1]; j++) 
				{
					if (map[i][j])
					{
						output += "X ";
					}
					else
					{
						output += "O ";
					}					
				}
				trace(output);
				output = "";
			}
			trace("Number of alive neighbours for location 0, 0: " + countAliveNeighbours(0, 0, -1));
		}		
		
		public function getRoomMap():Object 
		{
			return roomMap;
		}
		
		/**
		 * ActionScript doesnt let me do boolean[][]
		 * So i created a function to do it for me;
		 * @param	worldSize
		 */
		private function createEmptyMap():Array 
		{			
			var newMap:Array;
			var i:int;
			var j:int;
			newMap = [];
			for (i = 0; i < worldSize[0]; i++) 
			{
				newMap [i] = [];
				for (j = 0; j < worldSize[1]; j++) 
				{									
					newMap [i][j] = false;
				}
			}
			return newMap;			
		}
	}
}