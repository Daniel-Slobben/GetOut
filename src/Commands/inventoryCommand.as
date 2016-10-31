package Commands 
{
	import Commands.Command;
	/**
	 * ...
	 * @author Slobben
	 */
	public class inventoryCommand implements Commands.Command 
	{
		private var name:String = "inventory";
		
		public function inventoryCommand() 
		{
			
		}
		
		
		/* INTERFACE Command */
		
		public function execute(info:String, actor:Character):void
		{
			Console.writeOutput("The items in your inventory are: " + Player(actor).getInventory() );
		}
		
		public function getName():String
		{
			return name;
		}
		
	}

}