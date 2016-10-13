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
		
		/**
		 * Constructor for the character superclass.
		 * some of these functions still need to be handed over
		 * to the subclasses
		 * @param	worldSize
		 * @param	roomMap
		 */
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
		
		/**
		 * Method that gets called by the goCommand
		 * @param	direction The direction the character will be moving
		 */
		public function go(direction:String):void
		{
			// desiredLocation only stored a reference of location. Quick hack to fix it
			// Is there a better way to force this? 
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
		
		/**
		 * Method that checks if the movement is allowed
		 * Does the actual movement.
		 * @param	desiredLocation
		 */
		private function checkMovement(desiredLocation:Array):void
		{
			if (desiredLocation[0] > -1 && desiredLocation[0] < worldSize[0] && desiredLocation[1] > -1 && desiredLocation[1] < worldSize[1])
			{
				location = desiredLocation;
				traceLocation();
			}
			else
			{
				trace("cant allow this movement");
			}
		}
		
		/**
		 * traces the location and the current room to the output
		 */
		private function traceLocation():void
		{			
			currentLocation = roomMap[location[0] + "_" + location[1]];
			trace("Current location: " + location[0] + " " + location[1]);
			trace("You are now in a " + currentLocation.getEnvironment());
		}
		
		/**
		 * makes an empty map. This method is also used in worldGenerator.
		 * Should probably just make this a static method somewhere. 
		 * @param	worldSize
		 */
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
		/**
		 * Traces the entire map of this character to the output
		 * @param	worldSize
		 */
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