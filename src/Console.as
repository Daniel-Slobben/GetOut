package 
{ 
	import Commands.Command;
	import Commands.GetItemCommand;
	import Commands.GoCommand;
	import Commands.UseItemCommand;
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
		private var initializer:Initializer;
		
		private static var log:Array = new Array();
 
		
		/**
		 * this entire class needs to be better
		 * sadly i am not too good with GUI stuff. 
		 * @param	player 
		 * @param   initializer 
		 */
        public function Console(player:Player, initializer:Initializer) 
        { 
			this.initializer = initializer;
			this.player = player;
            captureText();
			createOutputBox(defaultStringOutput);
        }
         
		/**
		 * gets triggered when the player presses enter
		 * parses the input and sends the correct command
		 * @param	event the keypress
		 */
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
				
				for each (var command:Command in player.getCurrentState().getCommands())
				{
					if (arrayMessage[0] == command.getName())
					{
						Console.writeOutput("");
						Console.writeOutput(message);
						command.execute(messageInfo, player);
					}
				}				
			}           
        } 
		
		/**
		 * writes a message to the output
		 * @param	message
		 */
		public static function writeOutput(message:String):void
		{
			log.unshift(message);
			
			// lets make a multiline string to output
			// this string will contain the first 15 strings in the log
			var output:String = log.join("\n");
			outputField.text = output;
		}
		
		/**
		 * Creates the outputBox
		 * @param	defaultStringOutput
		 */
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
		
		/**
		 * initializes the captureText field
		 */
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
         
    } 
}