# Linux Platform

This infusion contains a general infrastructure for building on linux.

## Teapot Configuration

The linux environment is very simple but does require a modern C++ compiler (g++-4.7 or clang 3.1+). At present there are a few external dependencies:

	apt-get install g++-4.7
	apt-get install libz-dev

A simple Teapot configuration file for linux might look like:

	source "https://github.com/infusions/"
	
	host /linux/ do
		platform "linux"
		environment[:cxx] = "g++-4.7"
		environment[:cxxflags] = "-std=c++11"
	end
