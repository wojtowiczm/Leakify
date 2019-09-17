#
# Be sure to run `pod lib lint Leakify.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Leakify'
  s.version          = '0.1.0'
  s.summary          = 'Bunch of higher order functions for better memory-safe syntax'

  s.description      = <<-DESC
  In Swift we have to avoid Strong Reference Cycles Between Class Instances.
  Often strong reference cycle occurs because closures, like classes, are reference types. When you assign a closure to a property, you are assigning a reference to that closure. 
                       DESC

  s.homepage         = 'https://github.com/wojtowiczm/Leakify'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wojtowiczm' => 'michal.wojtowicz@kissdigital.com' }
  s.source           = { :git => 'https://github.com/wojtowiczm/Leakify.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Leakify/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Leakify' => ['Leakify/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
