import java.util.*;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void setup() 
{
	String lines[] = loadStrings("words.txt");
	String hymn[] = loadStrings("LowellHymn.txt");

	System.out.println("there are " + lines.length + " lines");
	
	for (int i = 0 ; i < lines.length; i++)
	{
	  System.out.println(pigLatin(lines[i]));
	}

	for (int i = 0 ; i < hymn.length; i++)
	{
	  System.out.println(sentenceLatin(hymn[i]));
	}
}


public void draw()
{

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


public int findFirstVowel(String sWord)

//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1

{
	for (int i = 0; i < sWord.length(); i++)
 	{
    	if ((sWord.substring(i,i+1)).equals("a") || 
       		(sWord.substring(i,i+1)).equals("e") || 
       		(sWord.substring(i,i+1)).equals("i") ||
       		(sWord.substring(i,i+1)).equals("o") ||
       		(sWord.substring(i,i+1)).equals("u"))
    	{
     		return i;
    	}
 	}	
	
	return -1;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


public String pigLatin(String sWord)

//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord

{
	//rule 1

	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}

	//rule 2

	else if (findFirstVowel(sWord) == 0)
	{
		return sWord + "way";
	}

	//rule 3

	else if ((sWord.substring(0, 2)).equals("qu"))
	{
		return sWord.substring(2) + "quay";
	}

	//rule 4

	else if (findFirstVowel(sWord) >= 1)
	{
		return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
	}

	
	//check

	return "ERROR!";
}


public String sentenceLatin(String str)
{
	String temp = new String();

	for (int i = 0; i < str.length(); i++)
	{
		if (str.substring(i,i+1) == " ")
		{
			temp = temp + pigLatin(str.substring(i+1));
		}
	}
	
	temp = pigLatin(str);

	return temp;
}
