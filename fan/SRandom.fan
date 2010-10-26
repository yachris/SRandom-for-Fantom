// Class which implements Random number generation for GEP

using concurrent

using [java] java.util::Random as JRandom

**
** SRandom - produce random numbers, matching the Int.random and Float.random APIs.
**
const class SRandom
{
	**
	** Return singleton instance
	**
	static SRandom instance()
	{
		return inst
	}
	
	**
	** Seed the random number generator
	**
	Void seed(Int seedValue)
	{
/*		if (seedValue == 0 || seedValue == 1)
		{
			throw Err("SRandom seed must not be zero or one.")
		}
		
		actor.send(seedValue).get(200ms)
*/	}
	
	**
	** Works like Int.random:
	**
	** Generate a random number.  If range is null then all 2^64
	** integer values (both negative and positive) are produced with
	** equal probability.  If range is non-null, then the result
	** is guaranteed to be inclusive of the range.  Also see
	** `Float.random`, `Range.random`, and `List.random`.
	**
	** Examples:
	**   r := Int.random
	**   r := Int.random(0..100)
	**
	**
	Int randomInt(Range? r := null)
	{
		return Int.random(r)
	}
	
	**
	** Works like Float.random:
	**
	** Generate a random float between 0.0 inclusive and 1.0 exclusive.
	**
	**
	Float randomFloat()
	{
		return Float.random
	}
	
	protected new make()
	{
//		actor = Actor(ActorPool()) |msg| { receive(msg) }
	}

	private Obj? receive(Obj? msg)
	{
		JRandom jrandom := Actor.locals.getOrAdd("r") { JRandom() }
		Int val := msg
		if (val == 0)
		{
			return jrandom.nextLong
		}
		else if (val == 1)
		{
			return jrandom.nextDouble
		}
		else
		{
			jrandom.setSeed(val)
			return 0
		}
	}
	
	private static const SRandom inst := SRandom()
/*	private const Actor actor*/
}
