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
		
		private function setItems():void 
		{
			
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