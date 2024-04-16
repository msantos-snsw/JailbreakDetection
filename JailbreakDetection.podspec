Pod::Spec.new do |s|
  s.name             = "JailbreakDetection"
  s.version          = "0.1.0"
  s.summary          = "iOS Device Jailbreak Detection Library"
  s.homepage         = "https://github.com/msantos-snsw/JailbreakDetection"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Marlon Santos" => "marlon.santos@service.nsw.gov.au" }
  s.source           = { :git => "https://github.com/msantos-snsw/JailbreakDetection.git", :tag => s.version.to_s }

  s.platform     = :ios, '12.4'
  s.ios.deployment_target = '12.4'
  s.requires_arc = true

  s.source_files = 'Sources/JailbreakDetection/**/*.{swift}'
end
