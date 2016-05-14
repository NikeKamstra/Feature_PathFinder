package PF.Calc 
{
	/**
	 * ...
	 * @author Nike
	 */
	public class Singleton 
	{
		static public const c_WindowHeight:int = 300;
		static public const c_WindowWidth:int = 500;
		
		public function Singleton() 
		{
			
		}
		
		static public function Combine2dIntVector(vector:Vector.<Vector.<int>>):Vector.<int> {
			var secondLength:int = vector[1].length;
			var length:int = vector.length * secondLength;
			var returnVector:Vector.<int> = new Vector.<int>(length);
			
			for (var i:int = 0; i < vector.length; i++) 
			{
				for (var j:int = 0; j < vector[i].length; j++) 
				{
					var index:int = secondLength * i + j;
					returnVector[index] = vector[i][j];
				}
			}
			return returnVector;
		}
	}

}