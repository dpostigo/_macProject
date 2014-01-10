Pod::Spec.new do |s|
  s.name         = "DDSplitView"
  s.version      = "0.0.3"
  s.summary      = "DPSplitView for Mac OS X."
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/dpostigo/DDSplitView.git", :tag => s.version.to_s }
  s.platform     = :osx, '10.7'
  s.source_files = 'DDSplitView/*.{h,m}'
  s.frameworks   = 'AppKit'
  s.requires_arc = true

end
