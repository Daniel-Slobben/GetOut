package Commands 
{
	/**
	 * ...
	 * @author Slobben
	 */
	public class statCommand implements Command 
	{
		private var name:String = "stats"
		
		public function statCommand() 
		{
			
		}
		
		
		/* INTERFACE Commands.Command */
		
		public function execute(info:String, actor:Character):void 
		{
			Console.writeOutput("This should show you all the stats, this is not yet implemented yet.");
		}
		
		public function getName():String 
		{
			return name;
		}
		
	}

}