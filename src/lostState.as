package 
{
	import Commands.statCommand;
	/**
	 * ...
	 * @author Slobben
	 */
	public class lostState implements State 
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