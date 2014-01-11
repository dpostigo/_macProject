Pod::Spec.new do |s|
  s.name         = "JMSimpleDate"
  s.version      = "0.0.1"
  s.summary      = "Utilities for Mac OS X."
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/jamescmartinez/JMSimpleDate.git", :branch => 'master' }
  s.platform     = :osx, '10.7'
  s.source_files = 'JMSimpleDate/*.{h,m}'
  s.requires_arc = true


end
