// build.fan
//
// Licensed under the Academic Free License version 3.0

using build

class Build : BuildPod
{
	new make()
	{
		podName    = "srandom"
		summary    = "Factory for a Fantom random number generator which supports seeds."
		depends    = ["sys 1.0+", "util 1.0+", "concurrent 1.0+"]
		srcDirs    = [`fan/`, `test/`, `examples/`]
	}
}
