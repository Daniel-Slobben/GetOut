package Commands 
{
	import Commands.Command;
	/**
	 * ...
	 * @author Slobben
	 */
	public class helpCommand implements Commands.Command 
	{
		private var name:String = "help";
		
		public function helpCommand() 
		{
			
		}
		
		
		/* INTERFACE Command */
		
		public function execute(info:String, actor:Character):void 
		{
			Console.writeOutput("The currently available commands are: " + Player(actor).getHelp() );
		}
		
		public function getName():String
		{
			return name;
		}
		
	}

}