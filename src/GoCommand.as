package 
{
	/**
	 * ...
	 * @author ...
	 */
	public class GoCommand extends Command 
	{
		
		public function GoCommand() 
		{
			super();			
		}
		
		override public function execute(direction:String, actor:Character):void
		{
			actor.go(direction);
		}
		
		
		
	}

}