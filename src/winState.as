package 
{
	import Commands.statCommand;
	/**
	 * ...
	 * @author Slobben
	 */
	public class winState implements State 
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