// The fast, unseedable random number generator class

internal const class SRandomUnseeded : SRandom
{
	override Int randomInt(Range? r := null)
	{
		return Int.random(r)
	}

	override Float randomFloat()
	{
		return Float.random
	}

	protected new make()
	{
	}

	internal static const SRandomUnseeded inst := SRandomUnseeded()
}
