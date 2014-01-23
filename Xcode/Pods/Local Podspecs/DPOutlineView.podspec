Pod::Spec.new do |s|
  s.name         = "DPOutlineView"
  s.version      = "0.0.1"
  s.summary      = "DPOutlineView."
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }


  s.dependency     'DPKit'
  s.dependency     'NSView-DPFrameUtils'
  s.frameworks   = 'Foundation', 'QuartzCore'
  s.platform     = :osx, '10.7'
  s.source       = { :git => "https://github.com/dpostigo/DPOutlineView.git", :tag => s.version.to_s }
  s.source_files = 'DPOutlineView/*.{h,m}'


  s.requires_arc = true


  s.subspec 'Objects' do |objects|
    objects.source_files = 'DPOutlineView/Objects/*.{h,m}'
  end


  s.subspec 'Utilities' do |utilities|
    utilities.source_files = 'DPOutlineView/Utilities/*.{h,m}'
  end




end
