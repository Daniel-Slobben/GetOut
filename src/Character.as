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
		private var currentLocation:Room;
		private var roomMap:Object;
		private var game:Game;
		private var health:int;
		private var map:Array;
		private var worldSize:Array;
		
		public function Character(worldSize:Array, roomMap:Object) 
		{
			trace("Creating character!");
			this.roomMap = roomMap;
			this.worldSize = worldSize;
			
			health = maxHealth;
			location = [Math.ceil(worldSize[0] / 2), Math.ceil(worldSize[1] / 2)];
			trace("character is at: " + location);
			currentLocation = roomMap[location[0] + "_" + location[1]];
			
			mapMaker(worldSize);
			//traceMap(worldSize);
		}
		
		public function go(direction:String):void
		{
			// hmm, desiredLocation only stored a reference of location. Quick hack to fix it
			
			var desiredLocation:Array = [location[0], location[1]];
			if (direction == "north")
			{
				desiredLocation[0]--;
				checkMovement(desiredLocation);				
			}
			else if (direction == "east")
			{
				desiredLocation[1]++;
				checkMovement(desiredLocation);				
			}
			else if (direction == "south")
			{
				desiredLocation[0]++;
				checkMovement(desiredLocation);
			}
			else if (direction == "west")
			{
				desiredLocation[1]--;
				checkMovement(desiredLocation);
			}
		}
		private function checkMovement(desiredLocation:Array):void
		{
			if (desiredLocation[0] > -1 && desiredLocation[0] < worldSize[0] && desiredLocation[1] > -1 && desiredLocation[1] < worldSize[1])
			{
				location = desiredLocation;
				traceLocation();
				desiredLocation = null;
			}
			else
			{
				trace("cant allow this movement");
			}
		}
		
		private function traceLocation():void
		{			
			currentLocation = roomMap[location[0] + "_" + location[1]];
			trace("Current location: " + location[0] + " " + location[1]);
			trace("You are now in a " + currentLocation.getEnvironment());
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