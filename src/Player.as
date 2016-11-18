package 
{
	import Commands.Command;
	import States.*;
	/**
	 * The player class
	 * 
	 * @author ...
	 */
	public class Player extends Character 
	{
		/**
		 * The constructor. 
		 * gives the player a location 
		 * gives the player a health pack
		 * @param	worldSize
		 * @param	roomMap
		 */
		public function Player(worldSize:Array, roomMap:Object) 
		{
			super(worldSize, roomMap);
			location = [Math.ceil(worldSize[0] / 2), Math.ceil(worldSize[1] / 2)];
			trace("character is at: " + location);
			currentLocation = roomMap[location[0] + "_" + location[1]];
			currentLocation.setOccupied(this);
			var healthPack:HealthPack = new HealthPack();
			healthPack.setOwner(this);
			addItem(healthPack);
		}
		
		/**
		 * Makes a string of the inventory
		 * @return the inventory
		 */
		public function getInventory():String
		{
			var itemString:String = "";
			var loopCounter:int = 0;
			
			for each (var item:Item in items)
			{
				loopCounter++;
				itemString += item.getName();
				if (loopCounter != items.length)
				{
					itemString += ", ";
				}
				else 
				{
					itemString += ".";
				}
			}
			return itemString;
		}
		
		/**
		 * return a string with all currently available commands
		 * @return
		 */
		public function getHelp():String
		{
			var commandArray:Array = currentState.getCommands();
			var commandString:String = "";
			var loopCounter:int = 0;
			for each (var command:Command in commandArray)
			{
				loopCounter++;
				commandString += command.getName();
				if (loopCounter != commandArray.length)
				{
					commandString += ", ";
				}
				else 
				{
					commandString += ".";
				}
			}
			return commandString
		}	
		
		/**
		 * traces the location and the current room to the output
		 */
		public function traceLocation():void
		{						
			trace("Current location: " + location[0] + " " + location[1]);
			if (currentLocation.checkItem())
			{
				Console.writeOutput("This room contains the item: " + currentLocation.getItem().getName());
			}
			Console.writeOutput("You are now in a " + currentLocation.getEnvironment());			
			
		}
		
		override public function checkHealth():void 
		{
			Console.writeOutput("You now have " + health + " Health.");
			if (health < 1)
			{				
				currentState = new States.lostState();
				Console.writeOutput("Please check your statistics by writing 'stats'. ");
				Console.writeOutput("You have lost the game.");
			}
		}
	}
}