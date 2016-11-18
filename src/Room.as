package 
{
	/**
	 * the room class
	 * is a location in the game
	 * @author Daniël
	 */
	public class Room 
	{
		private var location:Array;
		private var environment:String;
		private var dangerLevel:int;
		private var occupied:Player;
		
		private var item:Item;
		
		private var poisonLevel:int = 0;
		
		public function Room(location:Array, environment:String, dangerLevel:int) 
		{
			this.location = location;
			this.environment = environment;
			this.dangerLevel = dangerLevel;
			
			createFeatures();
		}
		
		private function createFeatures():void 
		{
			setPoisonLevel();
			setItems();
		}
		
		/**
		 * makes certain items
		 * @param	player
		 */
		public function setItems():void 
		{			
			if (dangerLevel < 10)
			{
				var chance:Number = dangerLevel;
				chance = 1 - ((chance / 10) - 0.1);
				
				if (Math.random() < chance)
				{
					// This room is selected to spawn a health pack.
					item = new HealthPack();
				}				
			}			
		}
		
		/**
		 * checks if this room has an item
		 * @return returns true or false
		 */
		public function checkItem():Boolean
		{
			if (item != null)
			{
				return true;
			}
			return false;
		}
		
		/**
		 * removes the item in this room 
		 */
		public function removeItem():void
		{
			if (item != null)
			{
				item = null;
			}
		}
		
		/**
		 * return the item
		 * @return the item
		 */
		public function getItem():Item
		{
			return item;
		}
		
		/**
		 * function should get called when a player moves to this room
		 * @param	player
		 */
		public function trigger(character:Character):void
		{
			// Trigger the poison first
			character.addHealth(0 - poisonLevel);
		}
		
		/**
		 * Sets the poison level of this location
		 */
		private function setPoisonLevel():void
		{
			if (dangerLevel > 19)
			{
				poisonLevel = Math.floor(Math.random() * 70);
			}
			else if (dangerLevel > 14)
			{
				poisonLevel = Math.floor(Math.random() * 30);
			}
			else if (dangerLevel > 7)
			{
				poisonLevel = Math.floor(Math.random() * 10);
			}
		}
		
		public function isOccupied():Player
		{
			return occupied;
		}	
		public function setOccupied(player:Player):void
		{
			occupied = player;
		}
		public function getLocation():Array 
		{
			return location;
		}
		public function getEnvironment():String
		{
			return environment;
		}
		public function getDangerLevels():int
		{
			return dangerLevel;
		}
		public function nullifyPoison():void
		{
			poisonLevel  = 0;
		}
		
	}

}