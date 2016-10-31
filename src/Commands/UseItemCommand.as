package Commands 
{
	import Commands.Command;
	/**
	 * ...
	 * @author Daniël
	 */
	public class UseItemCommand implements Commands.Command 
	{
		private var name:String = "use";
		
		public function UseItemCommand() 
		{
			
		}
		
		
		/* INTERFACE Command */
		
		public function execute(info:String, actor:Character):void 
		{
			if (!actor.useItem(info))
			{
				Console.writeOutput("I dont have that item.");
			}
		}
		
		public function getName():String
		{
			return name;
		}
		
	}

}