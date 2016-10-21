package 
{
	/**
	 * ...
	 * @author Daniël
	 */
	public class GetItemCommand implements Command 
	{
		
		public function GetItemCommand() 
		{
			
		}
		
		
		/* INTERFACE Command */
		
		public function execute(info:String, actor:Character):Boolean 
		{
			return actor.getItem();
		}
		
	}

}