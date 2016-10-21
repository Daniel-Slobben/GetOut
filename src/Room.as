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
		}
		
		/**
		 * Yes this is weirdly done
		 * couldnt find another way to use Items without a reference to the player
		 * @param	player
		 */
		public function setItems(player:Player):void 
		{
			item = new HealthPack(player);
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
		
		private function setPoisonLevel():void
		{
			if (features > 19)
			{
				poisonLevel = Math.floor(Math.random() * 40);
			}
			else if (features > 14)
			{
				poisonLevel = Math.floor(Math.random() * 20);
			}
		}
		
		public function trigger(player:Player):void
		{
			
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