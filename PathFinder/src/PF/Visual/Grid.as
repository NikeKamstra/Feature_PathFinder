package PF.Visual 
{
	import PF.Calc.Singleton
	/**
	 * ...
	 * @author Nike
	 */
	public class Grid 
	{
		
		public function Grid(data:Vector.<int> = null, data2dimensional:Vector.<Vector.<int>> = null) 
		{
			if(data == null) {
				if (data2dimensional != null) {
					data = Singleton.Combine2dIntVector(data2dimensional);
				} else {
					throw new Error("There was no data send to the grid.");
				}
			}
			
		}
		
	}

}