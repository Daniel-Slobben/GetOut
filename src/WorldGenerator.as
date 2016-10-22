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
		private var chanceOfLife:Number = 0.4;
		
		/**
		 * Constructor for the world generator
		 */
		public function WorldGenerator(worldSize:Array) 
		{
			roomMap = new Object();
			this.worldSize = worldSize;
			
		}
		
		/**
		 * 
		 * @param	worldSize
		 */
		
		public function generate():void 
		{
			trace("I am in the world generation now!");
			for (var i:int = 0; i < worldSize[0]; i++) 
			{
				trace("Loading: " + i);
				for (var j:int = 0; j < worldSize[1]; j++) 
				{
					var features:int = countAliveNeighbours(i, j, -2);
					var locationArray:Array = [i, j];
					if (map[i][j])
					{
						roomMap[i + "_" + j] = new Room(locationArray, "Desert", features);	
					}
					else 
					{
						roomMap[i + "_" + j] = new Room(locationArray, "Forest", features);	
					}
					
				}
			}
		}
		
		public function getRoomMap():Object 
		{
			return roomMap;
		}
		
		public function createBaseMap():void 
		{						
			var i:int;
			var j:int;
			
			map = [];
			for (i = 0; i < worldSize[0]; i++) 
			{
				map [i] = [];
				for (j = 0; j < worldSize[1]; j++) 
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
		
		public function simulateStep():void
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
		/**
		 * Thanks to gamedevelopment.tutsplus.com
		 * for this elegant solution.
		 * The reason this for loop starts at -1 for the direct neighbours
		 * is so that you can do things like
		 * {x + j, y} to easily get the coordinates
		 * of neighboor cells
		 * @param	x coordinates of the cell we want to check
		 * @param	y coordinates of the cell we want to check
		 * @return The amount of alive cells next to it
		 */
		private function countAliveNeighbours(x:int, y:int, loopStart:int):int
		{
			var count:int = 0;
			for (var i:int = loopStart; i < Math.abs(loopStart)+1; i++)
			{
				for (var j:int = loopStart; j < Math.abs(loopStart)+1; j++)
				{
					var neighbour_x:int = x + i;
					var neighbour_y:int = y + j;
					
					// this is the cell we want to check
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
		
		public function traceFeatureMap():void
		{
			var output:String = "";
			for (var i:int = 0; i < worldSize[0]; i++) 
			{
				for (var j:int = 0; j < worldSize[1]; j++) 
				{
					if (roomMap[i + "_" + j].getFeatures() > 9)
					{
						output += " " + roomMap[i + "_" + j].getFeatures();
					}
					else 
					{
						output += " " + roomMap[i + "_" + j].getFeatures()+" ";
					}
				}
				trace(output);
				output = "";
			}
			trace("Number of alive neighbours for location 0, 0: " + countAliveNeighbours(0, 0, -1));
		}
		
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