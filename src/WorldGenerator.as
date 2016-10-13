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
		
		/**
		 * Constructor for the world generator
		 */
		public function WorldGenerator() 
		{
			roomMap = new Object();
			
		}
		
		/**
		 * 
		 * @param	worldSize
		 */
		
		public function generate(worldSize:Array):void 
		{
			var i:int;
			var j:int;
			trace("I am in the world generation now!");
			for (i = 0; i < worldSize[0]; i++) 
			{
				trace("Loading: " + i);
				for (j = 0; j < worldSize[1]; j++) 
				{									
					var locationArray:Array = [i, j];
					roomMap[i + "_" + j] = new Room(locationArray);	
				}
			}
		}
		public function getRoomMap():Object 
		{
			return roomMap;
		}
		
		public function createBaseMap(worldSize:Array):void 
		{						
			var i:int;
			var j:int;
			var chanceOfLife:Number = 0.8;
			map = [];
			for (i = 0; i < worldSize[0]; i++) 
			{
				map [i] = [];
				for (j = 0; j < worldSize[1]; j++) 
				{							
					var randomNumber:Number = Math.random();
					// About an 80 percent chance a point in the map will be false
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
			
		}
		/**
		 * Thanks to gamedevelopment.tutsplus.com
		 * for this elegant solution.
		 * The reason this for loop starts at -1
		 * is so that you can do things like
		 * {x + j, y} to easily get the coordinates
		 * of neighboor cells.
		 * @param	x coordinates of the cell we want to check
		 * @param	y coordinates of the cell we want to check
		 * @return The amount of alive cells next to it
		 */
		private function countAliveNeighbours(x:int, y:int):int
		{
			var count:int = 0;
			for (var i:int = -1; i < 2; i++)
			{
				for (var j:int = -1; j < 2; j++)
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
		
		public function traceMap(worldSize:Array):void
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
			trace("Number of alive neighbours for location 0, 0: " + countAliveNeighbours(0, 0));
		}
	}
}