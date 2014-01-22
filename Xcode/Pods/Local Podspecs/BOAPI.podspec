Pod::Spec.new do |s|
  s.name         = "BOAPI"
  s.version      = "0.0.1"
  s.summary      = "Back office API"
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }
  s.source       = { :git => "https://github.com/dpostigo/DPKit.git", :tag => s.version.to_s }
  s.platform     = :osx, '10.8'
  s.frameworks   = 'Foundation', 'AppKit'
  s.requires_arc = true

  s.source_files = 'BOAPI/*.{h,m}'

  s.subspec 'Operations' do |operations|
    operations.source_files = 'BOAPI/Operations/*.{h,m}'

    operations.subspec 'account' do |account|
      account.source_files = 'BOAPI/Operations/account/*.{h,m}'
    end

    operations.subspec 'tasks' do |tasks|
      tasks.source_files = 'BOAPI/Operations/tasks/*.{h,m}'
    end

    operations.subspec 'logs' do |logs|
      logs.source_files = 'BOAPI/Operations/logs/*.{h,m}'
    end

  end

  s.subspec 'Models' do |models|
    models.source_files = 'BOAPI/Models/**/*.{h,m}'
  end

  s.subspec 'Utils' do |utils|
    utils.source_files = 'BOAPI/Utils/**/*.{h,m}'
  end

  s.dependency   'AFNetworking', '~> 2.0.3'
  s.dependency   'NSObject+AutoDescription'
  s.dependency   'NSDictionary-Deserialize'
  s.dependency   'NSObject-UserDefaults'
  s.dependency   'AutoCoding'


end
