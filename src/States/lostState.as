package States 
{
	import Commands.helpCommand;
	import Commands.statCommand;
	import States.State;
	/**
	 * ...
	 * @author Slobben
	 */
	public class lostState implements States.State 
	{
		private var availableCommands:Array = [new statCommand(), new helpCommand()];
		
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