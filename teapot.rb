
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "1.0.0"

define_target "platform-linux" do |target|
	target.provides "Platform/linux" do
		default platform_name "linux"
		default platform_path Pathname.new("/")
		
		default architectures []
		
		buildflags [
			:architectures
		]
		
		linkflags []
		
		cflags [:buildflags]
		cxxflags [:buildflags]
		ldflags [:buildflags, lambda {linkflags.reverse}]
		
		configure []
	end
	
	target.depends :variant
	
	target.depends :compiler

	target.provides :platform => "Platform/linux"
	
	target.provides "Library/OpenAL" do
		append linkflags "-lopenal"
	end

	target.provides "Library/z" do
		append linkflags "-lz"
	end

	target.provides "Library/bz2" do
		append linkflags "-lbz2"
	end
	
	target.provides "Language/C++11" do
		cxxflags %W{-std=c++11 -Wno-c++11-narrowing}
	end
end

define_target "compiler-clang" do |target|
	# The default compiler for linux unless an explicit one is specified:
	target.priority = 10
	
	target.provides "Compiler/clang" do
		default cc "clang"
		default cxx "clang++"
		
		append cxxflags "-D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_"
	end
	
	target.provides :compiler => "Compiler/clang"
end

define_target "linux-x11" do |target|
	target.depends "Aggregate/OpenGL/Headers"
	
	target.provides "Aggregate/Display" do
		append linkflags ["-lX11"]
	end
	
	target.provides "Library/OpenGL" do
		append linkflags "-lGL"
	end
end
