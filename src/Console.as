package 
{ 
	import flash.display.SimpleButton;
    import flash.display.Sprite; 
    import flash.display.Stage;
    import flash.text.*; 
    import flash.events.*; 
 
    public class Console extends Sprite 
    { 
		private var player:Player;
        private var inputField:TextField = new TextField(); 
        private static var outputField:TextField = new TextField();
        private var defaultString:String = "Input command"; 
		private var defaultStringOutput:String = "Welcome!";
		private var game:Game;
		private var availableCommands:Array = ["Go", "use <item>", "get item", "inventory", "help"];
		
		private static var log:Array = new Array();
 
		
		/**
		 * this entire class needs to be better
		 * sadly i am not too good with GUI stuff. 
		 * @param	player
		 */
        public function Console(player:Player, game:Game) 
        { 
			this.game = game;
			this.player = player;
            captureText();
			createOutputBox(defaultStringOutput);
        } 
         
        public function captureText():void 
        { 
            inputField.type = TextFieldType.INPUT; 
			inputField.border = true;
			inputField.borderColor = 0x000000;
			inputField.width = 500;
            inputField.background = false; 
            addChild(inputField); 
            inputField.text = defaultString;
			
			inputField.addEventListener(KeyboardEvent.KEY_DOWN, textInputCapture);
        } 
         
        public function textInputCapture(event:KeyboardEvent):void 
        { 
			// if the key is ENTER
			if (event.charCode == 13)
			{
				var message:String = inputField.text; 
				inputField.text = "";		
				message = message.toLowerCase();
				
				// Splitting the message into an array. 
				var arrayMessage:Array = message.split(" ");
				var arrayMessageInfo:Array = message.split(" ");
				arrayMessageInfo.removeAt(0);
				var messageInfo:String = arrayMessageInfo.join(" ");
				
				var moved:Boolean = false;
				
				switch (arrayMessage[0])
				{
					case "go":
					{
						var goCommand:GoCommand = new GoCommand();
						if (!goCommand.execute(messageInfo, player))
						{
							Console.writeOutput("I don't know where to go.");
						}
						else 
						{
							game.moveEnemies();
						}
						break;
					}
					case "use":
					{
						var itemCommand:Command = new ItemCommand();
						trace(messageInfo);
						if (!itemCommand.execute(messageInfo, player))
						{
							Console.writeOutput("I dont have that item.");
						}
						break;
					}
					case "get":
					{
						if (messageInfo == "item")
						{
							var getItemCommand:Command = new GetItemCommand();
							if (!getItemCommand.execute(messageInfo, player))
							{
								Console.writeOutput("This room does not have an item.");
							}
						}
						else 
						{
							Console.writeOutput("Get what?");
						}
						break;						
					}
					case ("inventory"):
					{
						Console.writeOutput("The items in your inventory are: " + player.getInventory() );
						break;
					}
					case ("help"):
					{
						Console.writeOutput("The commands are: "+availableCommands.join(", "));
						break;
					}
					default :
					{
						writeOutput("I don't know what you mean.");
					}					
				}
				Console.writeOutput("");
			}           
        } 
		
		public static function writeOutput(message:String):void
		{
			log.unshift(message);
			
			// lets make a multiline string to output
			// this string will contain the first 15 strings in the log
			var output:String = log.join("\n");
			outputField.text = output;
		}
		
        public function createOutputBox(defaultStringOutput:String):void 
        { 
            outputField.background = true; 
            outputField.y = 130;
			outputField.width = 500;
			outputField.height = 300;
			outputField.border = true;
			outputField.borderColor = 0x000000;
			outputField.multiline = true;
            addChild(outputField); 
            outputField.text = defaultStringOutput; 
        } 
         
    } 
}