package States 
{
	import Commands.statCommand;
	import States.State;
	/**
	 * ...
	 * @author Slobben
	 */
	public class lostState implements States.State 
	{
		private var availableCommands:Array = [new statCommand()];
		
		public function lostState() 
		{
			
		}
		
		
		/* INTERFACE State */
		
		public function getCommands():Array 
		{
			return availableCommands;
		}
		
	}

}