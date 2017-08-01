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

  s.ios.deployment_target = '9.0'

  s.source_files = ['Analytics/Analytics/*.swift']

  s.pod_target_xcconfig = {
    'OTHER_SWIFT_FLAGS' => '$(inherited) -D HAS_MIXPANEL -D HAS_AMPLITUDE -D HAS_FABRIC'
  }

  mixpanel         = { :spec_name => "Mixpanel",            :dependency => "Mixpanel-swift-appex" }
  amplitude        = { :spec_name => "Amplitude",           :dependency => "Amplitude-iOS" }
  fabric           = { :spec_name => "Fabric",              :dependency => "Fabric"}

  analytic_providers = [mixpanel, amplitude, fabric]

  s.subspec 'Mixpanel' do |sp|
    sp.source_files = ["Analytics/Analytics/Providers/MixpanelProvider.swift"]
    sp.dependency "Mixpanel-swift-appex"
  end

  s.subspec 'Amplitude' do |sp|
    sp.source_files = ["Analytics/Analytics/Providers/AmplitudeProvider.swift"]
    sp.dependency "Amplitude-iOS"
  end

  s.subspec 'Fabric' do |sp|
    sp.source_files = ["Analytics/Analytics/Providers/FabricProvider.swift"]
    sp.dependency "Fabric"
    sp.dependency "Crashlytics"
  end

end
