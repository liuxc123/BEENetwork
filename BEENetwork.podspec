Pod::Spec.new do |s|
  s.name             = 'BEENetwork'
  s.version          = '1.0.0'
  s.summary          = '网络库封装'
  s.homepage         = 'https://github.com/liuxc123/BEENetwork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liuxc123' => 'lxc_work@126.com' }
  s.source           = { :git => 'https://github.com/liuxc123/BEENetwork.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.requires_arc          = true
  s.swift_version         = '5.0'
  s.default_subspec       = 'Core'

  s.subspec 'Core' do |ss|
      ss.source_files = 'BEENetwork/Classes/Core'
      ss.dependency 'BEENetwork/MoyaSugar'
      ss.dependency 'BEENetwork/RxMoya'
      ss.dependency 'BEENetwork/RxObjectMapper'
      ss.dependency 'Moya'
  end

  s.subspec 'Cache' do |ss|
    ss.source_files = 'BEENetwork/Classes/Cache'
    ss.dependency 'BEENetwork/Core'
  end

  s.subspec 'MoyaSugar' do |ss|
    ss.source_files = 'BEENetwork/Classes/MoyaSugar'
    ss.dependency 'Moya'
  end

  s.subspec 'RxMoya' do |ss|
    ss.source_files = 'BEENetwork/Classes/RxMoya'
    ss.dependency 'Moya'
    ss.dependency 'RxSwift', '>= 5.0.0'
  end

  s.subspec 'RxObjectMapper' do |ss|
    ss.source_files = 'BEENetwork/Classes/RxObjectMapper'
    ss.dependency 'ObjectMapper'
    ss.dependency 'Moya'
    ss.dependency 'RxSwift', '>= 5.0.0'
  end

end
