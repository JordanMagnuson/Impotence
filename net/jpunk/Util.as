package net.jpunk 
{
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Util 
	{
		static public function checkArraysMatch($arrayA:Array, $arrayB:Array):Boolean
		{
			var isMatch:Boolean = true;
			if($arrayA.length == $arrayB.length) {
				for (var i:int = 0; i<$arrayA.length; i++) {
					if ($arrayA[i] != $arrayB[i]) {
						isMatch = false;
						break;
					}
				}
			} else {
				isMatch = false;
			}
			return isMatch;
		}
	}
}