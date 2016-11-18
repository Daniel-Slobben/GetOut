package 
{
	import Commands.Command;
	import Commands.GoCommand;
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends Character 
	{
		private var alive:Boolean = true;
		private var regeneration:int = 10;
		private var damage:int = -20;
		
		public function Enemy(worldSize:Array, roomMap:Object) 
		{
			super(worldSize, roomMap);
			location = [Math.floor(Math.random() * worldSize[0]), Math.floor(Math.random() * worldSize[1])];
			currentLocation = roomMap[location[0] + "_" + location[1]];
			
		}
		
		public function action():void
		{
			if (alive)
			{
				trace("AI at location: " + currentLocation.getLocation());			
				moveAI();
				checkForPlayer();
				addHealth(regeneration);
			}
		}
		
		/**
		 * Checks the surroundings for player
		 */
		private function checkForPlayer():void 
		{
			var x:int = location[0];
			var y:int = location[1];
			for (var i:int = -1; i < 2; i++)
			{
				for (var j:int = -1; j < 2; j++)
				{
					var neighbour_x:int = x + i;
					var neighbour_y:int = y + j;
					
					// this is us
					if (i == 0 && j == 0)
					{
						// nothing
					}
					// edges of the map
					else if (neighbour_x < 0 || neighbour_y < 0 || neighbour_x >= worldSize[1] || neighbour_y >= worldSize[0])
					{
						// north
					}
					else if (roomMap[[neighbour_x]+"_"+[neighbour_y]].isOccupied() != null)
					{
						var huntedPlayer:Player = roomMap[[neighbour_x] + "_" + [neighbour_y]].isOccupied();
						huntedPlayer.addHealth(damage);
						Console.writeOutput("You got hit by an enemy!");
						trace("DMG was done at location: "+location);
					}
				}
			}
		}
		
		/**
		 * Function for deciding where the AI should go
		 * Moves them randomly
		 */
		private function moveAI():void
		{
			var command:Command = new GoCommand();
			var randomNumber:int = Math.floor(Math.random() * 4);
			var direction:String = "north"; //just to be safe.
			
			if (randomNumber == 0)
			{
				direction = "north";
			}
			else if (randomNumber == 1)
			{
				direction = "east";
			}
			else if (randomNumber == 2)
			{
				direction = "south";
			}
			else if (randomNumber == 3)
			{
				direction = "west";
			}
			command.execute(direction, this);			
		}
		
		override public function checkHealth():void 
		{
			trace("AI HEALTH IS NOW: " + health);
			trace();
			if (health < 1)
			{
				alive = false;
			}
		}
		
	}

}