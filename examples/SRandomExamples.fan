// Show some examples of how the SRandom behavior works
//
// Licensed under the Academic Free License version 3.0

class SRandomExamples
{
	static Void main()
	{
		examples := SRandomExamples()
		examples.showUnseeded
		echo("\n~~~~~~~~~~~~~~~~~~~~~~~~\n")
		examples.showSeeded
	}
	
	Void showUnseeded()
	{
		sr := SRandom.instance
		echo("These sets of random numbers should NOT match, as the unseedable generator is used:")
		echo("Two sets of random Ints, should be in the (approximate) range of -2^64..2^64:")
		showRandomIntsFullRange(sr)
		showRandomIntsFullRange(sr)
		echo
		
		echo("Two sets of random Ints, should be in the range of 0..20:")
		showRandomIntsInRange(sr)
		showRandomIntsInRange(sr)
		echo
		
		echo("Two sets of random Floats, should be in the range of [0..1):")
		showRandomFloats(sr)
		showRandomFloats(sr)
	}
	
	Void showSeeded()
	{
		sr := SRandom.instance(SRandomStrategy.SeededGenerator)
		echo("These sets of random numbers should match, as the seed is reset before each is generated:")
		echo("Two sets of random Ints, should be in the (approximate) range of -2^64..2^64:")
		sr.seed(1010101)
		showRandomIntsFullRange(sr)
		sr.seed(1010101)
		showRandomIntsFullRange(sr)
		echo
		
		echo("Two sets of random Ints, should be in the range of 0..20:")
		sr.seed(1010101)
		showRandomIntsInRange(sr)
		sr.seed(1010101)
		showRandomIntsInRange(sr)
		echo
		
		echo("Two sets of random Floats, should be in the range of [0..1):")
		sr.seed(1010101)
		showRandomFloats(sr)
		sr.seed(1010101)
		showRandomFloats(sr)
	}
	
	Void showRandomIntsFullRange(SRandom sr)
	{
		buf := StrBuf()
		10.times
		{
			buf.add(sr.randomInt)
			buf.add(" ")
		}
		echo(buf.toStr)
	}
	
	Void showRandomIntsInRange(SRandom sr)
	{
		buf := StrBuf()
		10.times
		{
			buf.add(sr.randomInt(0..20))
			buf.add(" ")
		}
		echo(buf.toStr)
	}
	
	Void showRandomFloats(SRandom sr)
	{
		buf := StrBuf()
		10.times
		{
			buf.add(sr.randomFloat)
			buf.add(" ")
		}
		echo(buf.toStr)
	}
}
