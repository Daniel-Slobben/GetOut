package 
{
	/**
	 * ...
	 * @author Daniël
	 */
	public class Character 
	{
		private var location:Array;
		
		private const maxHealth:int = 100;
		private var health:int;
		private var map:Array;
		
		public function Character(worldSize:Array) 
		{
			trace("Creating character!");
			
			health = maxHealth;
			location = [Math.ceil(worldSize[0] / 2), Math.ceil(worldSize[1] / 2)];
			trace("character is at: " + location);
			mapMaker(worldSize);
			traceMap(worldSize);
		}
		
		private function mapMaker(worldSize:Array):void 
		{			
			var i:int;
			var j:int;
			map = [];
			for (i = 0; i < worldSize[0]; i++) 
			{
				map [i] = [];
				for (j = 0; j < worldSize[1]; j++) 
				{									
					map [i][j] = false;
				}
			}
			
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
					output += map[i][j] + ", ";
				}
				trace(output);
				output = "";
			}
		}
		
	}

}