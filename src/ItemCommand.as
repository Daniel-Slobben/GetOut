package 
{
	/**
	 * ...
	 * @author Daniël
	 */
	public class ItemCommand implements Command 
	{
		
		public function ItemCommand() 
		{
			
		}
		
		
		/* INTERFACE Command */
		
		public function execute(info:String, actor:Character):Boolean 
		{
			return actor.useItem(info);
		}
		
	}

}