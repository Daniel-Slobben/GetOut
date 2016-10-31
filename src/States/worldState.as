package States 
{
	import Commands.GetItemCommand;
	import Commands.GoCommand;
	import Commands.UseItemCommand;
	import Commands.helpCommand;
	import Commands.inventoryCommand;
	import Commands.statCommand;
	import States.State;
	/**
	 * ...
	 * @author Slobben
	 */
	public class worldState implements States.State 
	{
		private var availableCommands:Array = [new Commands.GoCommand(), new Commands.UseItemCommand, new Commands.GetItemCommand(), new Commands.inventoryCommand(), new Commands.helpCommand(), new statCommand()];
		
		public function worldState() 
		{
			
		}		
		
		/* INTERFACE State */
		
		public function getCommands():Array 
		{
			return availableCommands;
		}
		
	}

}