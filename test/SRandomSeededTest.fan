// Test the SRandomSeeded class
//
// Licensed under the Academic Free License version 3.0

class SRandomSeededTest : Test
{
	Void testUnboundedRange()
	{
		sr := SRandomSeeded.inst
		min := 1
		max := 0
		10000.times
		{
			val := sr.randomInt
			if (val < min)
			{
				min = val
			}
			if (val > max)
			{
				max = val
			}
		}
		verify(min < max)
		verify(min < -1000000)
		verify(max > 1000000)
	}
	
	Void testBoundedRange()
	{
		sr := SRandomSeeded.inst
		min := 1
		max := 0
		10000.times
		{
			val := sr.randomInt(0..100)
			if (val < min)
			{
				min = val
			}
			if (val > max)
			{
				max = val
			}
		}
		verifyEq(0, min)
		verifyEq(100, max)
	}
	
	Void testSeededInts()
	{
		// No seed
		sr := SRandomSeeded.inst
		set1 := [,]
		10.times
		{
			set1.add(sr.randomInt)
		}
		set2 := [,]
		10.times
		{
			set2.add(sr.randomInt)
		}
		
		// different
		verifyNotEq(set1, set2)

		// seed
		set1 = [,]
		sr.seed(12321)
		10.times
		{
			set1.add(sr.randomInt)
		}
		set2 = [,]
		sr.seed(12321)
		10.times
		{
			set2.add(sr.randomInt)
		}
		
		// same
		verifyEq(set1, set2)
	}
}
