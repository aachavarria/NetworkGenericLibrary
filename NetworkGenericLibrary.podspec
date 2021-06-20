#
# Be sure to run `pod lib lint NetworkGenericLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NetworkGenericLibrary'
  s.version          = '0.0.2'
  s.summary          = 'Network generic layer to do get/post/put/delete'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 Network generic layer to create get, post, put, and delete easly
                       DESC

  s.homepage         = 'https://github.com/aachavarria/NetworkGenericLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aachavarria' => 'aronchj7@live.com' }
  s.source           = { :git => 'https://github.com/aachavarria/NetworkGenericLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'NetworkGenericLibrary/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NetworkGenericLibrary' => ['NetworkGenericLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.swift_version = '4.0'
end
