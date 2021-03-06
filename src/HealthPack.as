package 
{
	/**
	 * The health pack class
	 * A health pack has an owner and can add health to that owner.
	 * @author Slobben
	 */
	public class HealthPack extends Item 
	{
		private var owner:Character;
		private var healthToAdd:int = 20;
		private var name:String = "health pack";
		
		public function HealthPack()		
		{
		}
		
		override public function trigger():void 
		{
			owner.addHealth(healthToAdd);
		}
		
		override public function getName():String
		{
			return name;
		}
		override public function setOwner(owner:Character):void
		{
			this.owner = owner;
		}
		
	}

}