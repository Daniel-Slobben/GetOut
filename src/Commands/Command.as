package Commands 
{
	/**
	 * ...
	 * @author ...
	 */
	public interface Command 
	{
		
		public function Command()
		
		function execute(info:String, actor:Character):void
		
		function getName():String
		
	}

}