package States 
{
	import Commands.helpCommand;
	import Commands.statCommand;
	import States.State;
	/**
	 * ...
	 * @author Slobben
	 */
	public class winState implements States.State 
	{
		private var availableCommands:Array = [new statCommand(), new helpCommand()]
		
		public function winState() 
		{
			
		}
		
		
		/* INTERFACE State */
		
		public function getCommands():Array 
		{
			return availableCommands;
		}
		
	}

}