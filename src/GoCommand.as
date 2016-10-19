package 
{
	/**
	 * ...
	 * @author ...
	 */
	public class GoCommand implements Command 
	{
		
		public function GoCommand() 
		{
			super();			
		}
		
		public function execute(direction:String, actor:Character):Boolean
		{
			return actor.go(direction);
		}
		
		
		
	}

}