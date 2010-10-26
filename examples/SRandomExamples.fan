// Show some examples of how the SRandom behavior works

class SRandomExamples
{
	static Void main()
	{
		examples := SRandomExamples()
		examples.showUnseeded
	}
	
	Void showUnseeded()
	{
		sr := SRandom.instance
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
