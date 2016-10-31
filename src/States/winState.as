package States 
{
	import Commands.statCommand;
	import States.State;
	/**
	 * ...
	 * @author Slobben
	 */
	public class winState implements States.State 
	{
		private var availableCommands:Array = [new statCommand()]
		
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