package 
{
	import States.State;
	import States.lostState;
	import States.winState;
	import States.worldState;
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
		protected var health:int;
		protected var worldSize:Array;
		protected var currentState:States.State;
		
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
			this.roomMap = roomMap;
			this.worldSize = worldSize;
			currentState = new States.worldState();
			
			health = maxHealth;		
		}
		
		/**
		 * adds health to the character
		 * @param
		 */
		public function addHealth(healthToAdd:int):void
		{
			if (health + healthToAdd > maxHealth)
			{
				health = maxHealth;
			}
			else 
			{
				health += healthToAdd;
			}			
			checkHealth();
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
		
		public function getItem():Boolean
		{
			var item:Item = currentLocation.getItem();
			if (item != null)
			{
				item.setOwner(this);
				addItem(item);
				Console.writeOutput("You have picked up: " + item.getName());
				currentLocation.removeItem();
				return true;
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
				if (this is Player)  
				{
					currentLocation.setOccupied(null);
					(this as Player).traceLocation();					
				}	
				location = desiredLocation;
				currentLocation = roomMap[location[0] + "_" + location[1]];
				currentLocation.trigger(this);			
				if (this is Player)  
				{
					currentLocation.setOccupied(this as Player);
				}	
			}
			else
			{
				if (this is Player) 
				{
					Console.writeOutput("Congratz, you won the game!")
					currentState = new States.winState();
				}		
			}
		}
		
		public function getCurrentState():States.State 
		{
			return currentState;
		}
		
		/**
		 * This method should be overridden
		 */
		public function checkHealth():void
		{
			
		}
		
	}

}