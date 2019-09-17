
Pod::Spec.new do |s|
  s.name             = 'Leakify'
  s.version          = '0.1.3'
  s.summary          = 'Bunch of higher order functions for better memory-safe syntax'

  s.description      = <<-DESC
  Tired of writing `[unowned/weak self] closures on every callback function?
  You might conside using passing method as a parameter with little help from Leakify.
DESC

  s.homepage         = 'https://github.com/wojtowiczm/Leakify'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wojtowiczm' => 'wojtowiczmichal97@gmail.com' }
  s.source           = { :git => 'https://github.com/wojtowiczm/Leakify.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'

  s.source_files = 'Leakify/Source/**/*'
  
end
