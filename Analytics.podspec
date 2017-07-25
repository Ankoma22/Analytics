Pod::Spec.new do |s|
  s.name             = 'Analytics'
  s.version          = '0.0.1'
  s.summary          = 'Single interface for the most common analytic providers'
 
  s.description      = <<-DESC
Analytics is written in Swift. It currently supports Mixpanel and Amplitude 
                       DESC
 
  s.homepage         = 'https://github.com/Ankoma22/Analytics'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andrei Malyhin' => 'ankoma22@gmail.com' }
  s.source           = { :git => 'https://github.com/Ankoma22/Analytics.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'Analytics/Analytics.swift'
 
end