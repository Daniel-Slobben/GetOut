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
		
		public function Room(location:Array, environment:String) 
		{
			this.location = location;
			this.environment = environment
		}
		
		public function getLocation():Array 
		{
			return location;
		}
		public function getEnvironment():String
		{
			return environment;
		}
		
	}

}