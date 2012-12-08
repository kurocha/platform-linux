
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

required_version "0.2"

define_target "linux" do |target|
	target.provides "Platform/linux" do
		platform_path Pathname.new("/")
		
		default architectures []
		
		buildflags [
			:architectures
		]
		
		linkflags []
		
		cflags [:buildflags]
		cxxflags [:buildflags]
		ldflags [:buildflags, :linkflags]
		
		configure []
	end
	
	target.provides :platform => "Platform/linux"
	
	target.depends "Aggregate/OpenGL/Headers"
	
	target.provides "Library/OpenGL" do
		append linkflags "-lGL"
	end
	
	target.provides "Library/OpenAL" do
		append linkflags "-lAL"
	end
	
	target.provides "Language/C++11" do
		cxxflags %W{-std=c++11 -Wno-c++11-narrowing}
	end
end
