Pod::Spec.new do |s|
  s.name         = "DPKit"
  s.version      = "0.0.5"
  s.summary      = "Utilities for Mac OS X."
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/dpostigo/DPKit.git", :tag => s.version.to_s }
  # s.platform     = :osx, '10.7'
  s.requires_arc = true


  s.ios.deployment_target = '4.3'
  s.osx.deployment_target = '10.7'

  # s.source_files = 'DPKit/*.{h,m}'
  # s.osx.source_files = 'DPKit/*.{h,m}', 'CALayer-DPUtils-OSX/*.{h,m}'


  s.subspec 'Shared' do |shared|
    shared.osx.source_files = 'DPKit/shared/**/*.{h,m}'
    shared.ios.source_files = 'DPKit/shared/**/*.{h,m}'
  end

  s.subspec 'Mac OS X' do |mac|
    mac.platform = :osx, '10.7'
    mac.source_files = 'DPKit/osx/**/*.{h,m}', 'DPKit/shared/**/*.{h,m}'
  end



  # s.subspec 'iOS' do |iphone|
  #   iphone.platform = :ios, '4.3'
  #   iphone.source_files = 'DPKit/ios/**/*.{h,m}'
  # end

  # s.frameworks = 'QuartzCore'
  # s.ios.frameworks = 'UIKit'
  # s.osx.dependency 'DPKit'

  s.osx.frameworks   = 'QuartzCore', 'AppKit'
  s.osx.dependency   'NSView-DPAutolayout'
  s.ios.frameworks   = 'AppKit', 'UIKit'





end
