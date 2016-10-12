package 
{ 
	import flash.display.SimpleButton;
    import flash.display.Sprite; 
    import flash.display.Stage;
    import flash.text.*; 
    import flash.events.*; 
 
    public class Console extends Sprite 
    { 
		private var player:Character;
        private var inputField:TextField = new TextField(); 
        private var outputField:TextField = new TextField();
        private var defaultString:String = "Input command"; 
		private var defaultStringOutput:String = "Welcome!";
 
        public function Console(player:Character) 
        { 
			this.player = player;
            captureText();
			createOutputBox(defaultStringOutput);
        } 
         
        public function captureText():void 
        { 
            inputField.type = TextFieldType.INPUT; 
			inputField.border = true;
			inputField.borderColor = 0x000000;
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
				outputField.text = message;
				inputField.text = "";		
				message = message.toLowerCase();
				
				// Splitting the message into an array. 
				var arrayMessage:Array = message.split(" ");
				
				if (arrayMessage[0] == "go")
				{
					var goCommand:GoCommand = new GoCommand();
					goCommand.execute(arrayMessage[1], player);
				}
				
			}
           
        } 
             
        public function createOutputBox(defaultStringOutput:String):void 
        { 
            outputField.background = false; 
            outputField.y = 200;
			outputField.border = true;
			outputField.borderColor = 0xFFFFFF;
			outputField.multiline = true;
            addChild(outputField); 
            outputField.text = defaultStringOutput; 
        } 
         
    } 
}