package Commands 
{
	import Commands.Command;
	/**
	 * ...
	 * @author Daniël
	 */
	public class GetItemCommand implements Commands.Command 
	{
		private var name:String = "get";
		
		public function GetItemCommand() 
		{
			
		}
		
		
		/* INTERFACE Command */
		
		public function execute(info:String, actor:Character):void 
		{
			if (!actor.getItem())
			{
				Console.writeOutput("This room does not have an item.");
			}
		}
		
		public function getName():String
		{
			return name;
		}
		
	}

}