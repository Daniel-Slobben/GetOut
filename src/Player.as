package 
{
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
			var itemsString:String = "";
			
			for each (var item:Item in items)
			{
				itemsString += item.getName() + ", ";
			}
			return itemsString;
		}
		
	}

}