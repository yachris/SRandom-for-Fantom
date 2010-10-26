// Class which implements Random number generation for GEP

**
** SRandom - produce random numbers, matching the Int.random and Float.random APIs.
**
abstract const class SRandom
{
	**
	** Return singleton instance
	**
	static SRandom instance(SRandomStrategy strategy := SRandomStrategy.UnseededGenerator)
	{
		return (strategy == SRandomStrategy.UnseededGenerator) ? SRandomUnseeded.inst : SRandomSeeded.inst
	}
	
	**
	** Seed the random number generator
	**
	virtual Void seed(Int seedValue)
	{
	}
	
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
	abstract Int randomInt(Range? r := null)
	
	**
	** Works like Float.random:
	**
	** Generate a random float between 0.0 inclusive and 1.0 exclusive.
	**
	**
	abstract Float randomFloat()
	
	protected new make()
	{
	}
}

enum class SRandomStrategy
{
	UnseededGenerator,
	SeededGenerator
}
