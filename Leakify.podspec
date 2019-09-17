#
# Be sure to run `pod lib lint Leakify.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Leakify'
  s.version          = '0.1.1'
  s.summary          = 'Bunch of higher order functions for better memory-safe syntax'

  s.description      = <<-DESC
  Tired of writing `[unowned/weak self] closures on every callback function?
  You might conside using passing method as a parameter with little help from Leakify.

  s.homepage         = 'https://github.com/wojtowiczm/Leakify'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wojtowiczm' => 'wojtowiczmichal97@gmail.com' }
  s.source           = { :git => 'https://github.com/wojtowiczm/Leakify.git', :tag => s.version.to_s }

  s.ios.deployment_target = '1.0'

  s.source_files = 'Leakify/Classes/**/*'
  
end
