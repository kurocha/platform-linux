
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

required_version "0.6"

define_target "linux" do |target|
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
		ldflags [:buildflags, :linkflags]
		
		configure []
		
		default cc "clang"
		default cxx "clang++"
	end
	
	target.depends :variant

	target.provides :platform => "Platform/linux"
	
	target.depends "Aggregate/OpenGL/Headers"
	
	target.provides "Library/OpenGL" do
		append linkflags "-lGL"
	end
	
	target.provides "Library/OpenAL" do
		append linkflags "-lAL"
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
	
	target.provides "Aggregate/Display" do
		append linkflags ["-lX11", "-lGL"]
	end
end

