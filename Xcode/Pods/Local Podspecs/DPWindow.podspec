Pod::Spec.new do |s|
  s.name         = "DPWindow"
  s.version      = "0.0.2"
  s.summary      = "In development."
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/dpostigo/DPWindow.git", :tag => s.version.to_s }
  s.platform     = :osx, '10.7'
  s.source_files = 'DPWindow/*.{h,m}'
  s.frameworks   = 'QuartzCore'
  s.requires_arc = true

  s.dependency   'CALayer-DPUtils'
  s.dependency   'NSView-DPAutolayout'
  s.dependency   'NSColor-BlendingUtils'
  # s.dependency   'NSView-DPAutolayout', :git => '/Users/danipostigo/Development/LocalPods/NSView-DPAutolayout'
  # s.dependency   'NSView-DPAutolayout', :local => '~/Development/LocalPods/NSView-DPAutolayout'
  # s.dependency 'NSView-DPAutolayout', :path =>' /Users/danipostigo/Development/LocalPods/NSView-DPAutolayout/NSView-DPAutolayout.podspec'
end
