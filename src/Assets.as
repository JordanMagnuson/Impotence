package src
{
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Assets 
	{
		[Embed(source = '../assets/door.png')] public static const DOOR:Class;
		
		[Embed(source = '../assets/nation.png')] public static const NATION:Class;
		[Embed(source = '../assets/province.png')] public static const PROVINCE:Class;
		[Embed(source = '../assets/prefecture.png')] public static const PREFECTURE:Class;
		[Embed(source = '../assets/county.png')] public static const COUNTY:Class;
		[Embed(source = '../assets/township.png')] public static const TOWNSHIP:Class;
		[Embed(source = '../assets/village.png')] public static const VILLAGE:Class;
		[Embed(source = '../assets/neighborhood.png')] public static const NEIGHBORHOOD:Class;
		
		// Person images
		[Embed(source = '../assets/person.png')] public static const PERSON:Class;
		[Embed(source = '../assets/person_01_hungry.png')] public static const PERSON_01_HUNGRY:Class;
		[Embed(source = '../assets/person_01_fed.png')] public static const PERSON_01_FED:Class;
		
		// Cursor images
		[Embed(source = '../assets/1194986058852284470bread_01.svg.png')] public static const CURSOR_BREAD:Class;
		[Embed(source = '../assets/hand_cursor.png')] public static const CURSOR_HAND:Class;
		
		// Font
		[Embed(source = '../assets/CASUALENCOUNTER.TTF', embedAsCFF = "false", fontFamily = 'casual_encounter')] public static const FONT_CASUAL_ENCOUNTER:Class;
		[Embed(source = '../assets/VERDANA.TTF', embedAsCFF = "false", fontFamily = 'verdana')] public static const FONT_VERDANA:Class;
	}
}