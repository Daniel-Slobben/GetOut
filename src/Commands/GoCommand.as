package Commands 
{
	import Commands.Command;
	/**
	 * ...
	 * @author ...
	 */
	public class GoCommand implements Commands.Command 
	{
		private var name:String = "go";
		
		public function GoCommand() 
		{
			super();			
		}
		
		public function execute(direction:String, actor:Character):void
		{
			if (actor is Enemy)
			{
				actor.go(direction);
				return;
			}
			if (!actor.go(direction))
			{
				Console.writeOutput("I don't know where to go.");
			}
			else 
			{
				Game.moveEnemies();
			}
		}
		
		public function getName():String
		{
			return name;
		}
	}
}