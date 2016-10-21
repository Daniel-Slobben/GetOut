package 
{
	/**
	 * ...
	 * @author Daniël
	 */
	public class Character 
	{
		protected var location:Array;
		
		protected const maxHealth:int = 100;
		protected var currentLocation:Room;
		protected var roomMap:Object;
		protected var game:Game;
		protected var health:int;
		protected var map:Array;
		protected var worldSize:Array;
		
		protected var items:Array = new Array();
		
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
			
			
			
			mapMaker(worldSize);
			//traceMap(worldSize);
		}
		
		/**
		 * adds health to the player
		 * @param
		 */
		public function addHealth(healthToAdd:int):void
		{
			health += healthToAdd;
			Console.writeOutput("you now have " + health + " Health.");
		}
		
		/**
		 * uses the item if it exists
		 * @param	itemToUse
		 */
		public function useItem(itemToUse:String):Boolean
		{
			for each (var item:Item in items)
			{
				if ( item.getName() == itemToUse )
				{
					item.trigger();
					deleteItem(item);
					return true;
				}
			}
			return false;
		}
		
		/**
		 * add Item to the list
		 * @param	item to add;
		 */
		public function addItem(itemToAdd:Item):void
		{
			items.push(itemToAdd);
		}
		
		/**
		 * remove item from items
		 * @param	item to delete
		 */
		public function deleteItem(itemToDelete:Item):void
		{
			items.removeAt(items.indexOf(itemToDelete));
		}
		
		/**
		 * Method that gets called by the goCommand
		 * @param	direction The direction the character will be moving
		 */
		public function go(direction:String):Boolean
		{
			// desiredLocation only stored a reference of location.
			// Is there a better way to force this? 
			var desiredLocation:Array = [location[0], location[1]];
			if (direction == "north")
			{
				desiredLocation[0]--;
				move(desiredLocation);				
			}
			else if (direction == "east")
			{
				desiredLocation[1]++;
				move(desiredLocation);				
			}
			else if (direction == "south")
			{
				desiredLocation[0]++;
				move(desiredLocation);
			}
			else if (direction == "west")
			{
				desiredLocation[1]--;
				move(desiredLocation);
			}
			else 
			{
				return false;
			}
			return true;
			
		}
		
		/**
		 * Method that checks if the movement is allowed
		 * Does the actual movement.
		 * @param	desiredLocation
		 */
		private function move(desiredLocation:Array):void
		{
			if (desiredLocation[0] > -1 && desiredLocation[0] < worldSize[0] && desiredLocation[1] > -1 && desiredLocation[1] < worldSize[1])
			{
				location = desiredLocation;
				if (this is Player) 
				{
					traceLocation();
				}				
			}
			else
			{
				if (this is Player) 
				{
					Console.writeOutput("Congratz, you won the game!")
				}		
			}
		}
		
		/**
		 * traces the location and the current room to the output
		 */
		private function traceLocation():void
		{			
			currentLocation = roomMap[location[0] + "_" + location[1]];
			trace("Current location: " + location[0] + " " + location[1]);
			Console.writeOutput("You are now in a " + currentLocation.getEnvironment());
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