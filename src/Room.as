package 
{
	/**
	 * ...
	 * @author Daniël
	 */
	public class Room 
	{
		private var location:Array;
		private var environment:String;
		private var features:int;
		private var occupied:Player;
		
		private var item:Item;
		
		private var poisonLevel:int = 0;
		
		public function Room(location:Array, environment:String, features:int) 
		{
			this.location = location;
			this.environment = environment;
			this.features = features;
			
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
			if (features < 10)
			{
				var chance:Number = features;
				// ex: if features = 4, chance = 0.7
				// ex: if features = 8, chance = 0.3
				chance = 1 - ((chance / 10) - 0.1);
				
				if (Math.random() < chance)
				{
					// This room is selected to spawn a health pack.
					item = new HealthPack();
				}				
			}			
		}
		
		public function checkItem():Boolean
		{
			if (item != null)
			{
				return true;
			}
			return false;
		}
		
		public function removeItem():void
		{
			if (item != null)
			{
				item = null;
			}
		}
		
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
			if (features > 19)
			{
				poisonLevel = Math.floor(Math.random() * 70);
			}
			else if (features > 14)
			{
				poisonLevel = Math.floor(Math.random() * 30);
			}
			else if (features > 7)
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
		public function getFeatures():int
		{
			return features;
		}
		
	}

}