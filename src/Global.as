package src 
{
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Global 
	{
		// Depth definitions
		public static var depth:int;
		public static const NEIGHBORHOOD:int = 0;
		public static const VILLAGE:int = 1;
		public static const TOWNSHIP:int = 2;
		public static const COUNTY:int = 3;
		public static const PREFECTURE:int = 4;
		public static const PROVINCE:int = 5;
		public static const NATION:int = 6;
		
		// Global variables
		public static var fedNations:Array = [];
		public static var fedProvinces:Array = [];
		public static var fedPrefectures:Array = [];
		public static var fedCounties:Array = [];
		public static var fedTownships:Array = [];
		public static var fedVillages:Array = [];
		public static var fedNeighborhoods:Array = [];
		public static var fedPeople:Array = [];
		
		public static var continentIndex:int = 0;
		public static var nationIndex:int = 0;
		public static var provinceIndex:int = 0;
		public static var prefectureIndex:int = 0;
		public static var countyIndex:int = 0;
		public static var townshipIndex:int = 0;
		public static var villageIndex:int = 0;
		public static var neighborhoodIndex:int = 0;
		
		// Global entities
		public static var player:Player;
		
	}

}