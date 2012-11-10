
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

required_version "0.1"

define_platform "linux" do |platform|
	platform.configure do
		platform_path Pathname.new("/")
		
		default architectures ["-arch i386", "-arch x86_64"]
		
		buildflags {[
			architectures
		]}
		
		cflags {[
			buildflags
		]}

		cxxflags {[
			buildflags
		]}
		
		configure []
	end
	
	platform.make_available! if RUBY_PLATFORM.include?("linux")
end
