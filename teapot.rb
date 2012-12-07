
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
end
