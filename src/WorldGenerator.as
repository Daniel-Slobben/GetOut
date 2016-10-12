package 
{
	/**
	 * Class for generating all the rooms
	 * @author Daniël
	 */
	public class WorldGenerator 
	{
		private var roomMap:Object;
		//TODO: Create a Room class. See the class diagram!
		
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
	}
}