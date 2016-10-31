package 
{
	import Commands.Command;
	/**
	 * ...
	 * @author ...
	 */
	public class Player extends Character 
	{
		
		public function Player(worldSize:Array, roomMap:Object) 
		{
			super(worldSize, roomMap);
			location = [Math.ceil(worldSize[0] / 2), Math.ceil(worldSize[1] / 2)];
			trace("character is at: " + location);
			currentLocation = roomMap[location[0] + "_" + location[1]];
			var healthPack:HealthPack = new HealthPack();
			healthPack.setOwner(this);
			addItem(healthPack);
		}
		
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
	}
}