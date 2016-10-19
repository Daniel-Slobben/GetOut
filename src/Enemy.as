package 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends Character 
	{
		
		public function Enemy(worldSize:Array, roomMap:Object) 
		{
			super(worldSize, roomMap);
			
		}
		
		public function action():void
		{
			trace("Should be doing ai thingies");
		}
		
	}

}