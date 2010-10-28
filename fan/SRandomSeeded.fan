// The slower, seedable random number generator class
//
// Licensed under the Academic Free License version 3.0

using [java] java.util::Random as JRandom

using concurrent

internal const class SRandomSeeded : SRandom
{
	override Void seed(Int seedValue)
	{
		if (seedValue == 0 || seedValue == 1)
		{
			throw Err("SRandom seed must not be zero or one.")
		}

		actor.send(seedValue).get(200ms)
	}

	override Int randomInt(Range? r := null)
	{
		// The following code was stolen bodily :-) from the Fantom source code:
		// src/sys/java/fan/sys/FanInt.java
		Int v := actor.send(0).get(200ms)
		if (r == null) return v
		if (v < 0) v = -v
		start := r.start
		end  := r.end
		if (r.inclusive()) ++end
		if (end <= start) throw ArgErr("Range end < start: " + r)
		
		return start + (v % (end-start))	   
	}

	override Float randomFloat()
	{
		return actor.send(1).get(200ms)
	}

	protected new make() : super()
	{
		actor = Actor(ActorPool()) |msg| { receive(msg) }
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

	internal static const SRandomSeeded inst := SRandomSeeded()
	private const Actor actor
}
