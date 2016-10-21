package 
{
	/**
	 * ...
	 * @author ...
	 */
	public class HealthPack extends Item 
	{
		private var player:Player;
		private var healthToAdd:int = 20;
		private var name:String = "health pack";
		
		public function HealthPack(player:Player)		
		{
			this.player = player;
		}
		
		override public function trigger():void 
		{
			player.addHealth(healthToAdd);
		}
		
		override public function getName():String
		{
			return name;
		}
		
	}

}