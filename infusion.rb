
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

required_version "0.2"

define_platform "linux" do |platform|
	platform.configure do
		platform_path Pathname.new("/")
		
		default architectures []
		
		buildflags [
			:architectures
		]
		
		linkflags []
		
		ccflags [:buildflags]
		cxxflags [:buildflags]
		ldflags [:buildflags, :linkflags]
		
		configure []
	end
	
	platform.make_available! if RUBY_PLATFORM.include?("linux")
end
