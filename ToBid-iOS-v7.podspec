#
#  Be sure to run `pod spec lint ToBidAd-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = 'ToBid-iOS-v7'
  spec.version      = '2.6.0'
  spec.summary      = 'ToBid-iOS is a SDK from Sigmob providing AD service.'
  spec.description      = <<-DESC
  ToBid-iOS provides ADs which include native、banner、splash、RewardVideo、Interstitial etc.
                       DESC

  spec.homepage     = 'https://www.sigmob.com/'
  spec.license      = { :type => 'MIT' }
  spec.author       = { 'Codi' => 'codi.zhao@sigmob.com' }
  spec.platform     = :ios, '9.0'
  spec.ios.deployment_target = '9.0'
  spec.source       = { :http => 'http://sdkres.sigmob.cn/ToBid/ios/2.6.0_776debba29b53065bd34ce7f69e89533/tobid_release_ios_2.6.0_20230320.zip' }
  spec.xcconfig = { 'VALID_ARCHS' => 'armv7 arm64 x86_64','VALID_ARCHS[sdk=iphoneos*]' => 'armv7 arm64','VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64', 'OTHER_LDFLAGS' => ['-lObjC'] }
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.requires_arc = true
  spec.default_subspec = 'ToBidSDK'

  # 默认的核心模块
  spec.subspec 'ToBidSDK' do |ss|
    ss.frameworks = 'ImageIO','StoreKit', 'CFNetwork', 'CoreMedia', 'AdSupport', 'CoreMotion', 'MediaPlayer', 'CoreGraphics', 'AVFoundation', 'CoreLocation', 'CoreTelephony', 'SafariServices', 'MobileCoreServices', 'SystemConfiguration', 'AudioToolbox'
    ss.weak_framework = 'WebKit', 'UIKit', 'Foundation'
    ss.libraries = 'c++', 'z', 'sqlite3'
    ss.vendored_frameworks = ['tobid-sdk-ios/Core/WindMillSDK.xcframework']
    ss.preserve_paths = 'tobid-sdk-ios/Core/WindMillSDK.xcframework'
    ss.dependency 'ToBid-iOS/SigmobAd-iOS'
  end

  spec.subspec 'SigmobAd-iOS' do |ss|
     ss.vendored_frameworks = ['tobid-sdk-ios/Core/WindSDK.xcframework']
     ss.preserve_paths = 'tobid-sdk-ios/Core/WindSDK.xcframework'
     ss.dependency 'ToBid-iOS/WindFoundation'
  end

  spec.subspec 'WindFoundation' do |ss|
     ss.vendored_frameworks = ['tobid-sdk-ios/Core/WindFoundation.xcframework']
     ss.preserve_paths = 'tobid-sdk-ios/Core/WindFoundation.xcframework'
  end

  spec.subspec 'TouTiaoAdapter' do |ss|
     ss.ios.deployment_target = '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/csj/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/csj/*.xcframework'
     ss.resource = 'tobid-sdk-ios/AdNetworks/csj/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/csj/*.bundle','tobid-sdk-ios/AdNetworks/csj/*.framework','tobid-sdk-ios/AdNetworks/csj/*.a'
     ss.dependency 'ToBid-iOS/ToBidSDK'
     ss.frameworks = 'UIKit', 'MapKit', 'WebKit', 'MediaPlayer', 'CoreLocation', 'AdSupport', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'StoreKit', 'SystemConfiguration', 'MobileCoreServices', 'CoreMotion', 'Accelerate','AudioToolbox','JavaScriptCore','Security','CoreImage','AudioToolbox','ImageIO','QuartzCore','CoreGraphics','CoreText',"DeviceCheck"
     ss.weak_frameworks = 'AppTrackingTransparency', 'DeviceCheck'
     ss.libraries = 'c++', 'resolv', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
  end

  spec.subspec 'AdmobAdapter' do |ss|
     ss.ios.deployment_target = '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/admob/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/admob/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/admob/*.a', 'tobid-sdk-ios/AdNetworks/admob/*.xcframework'
     ss.frameworks = "AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","CoreTelephony","CoreVideo","MediaPlayer","MessageUI","MobileCoreServices","QuartzCore","Security","StoreKit","SystemConfiguration"
     ss.libraries = 'z','sqlite3'
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'AppLovinAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/applovin/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/applovin/*.xcframework'
     ss.resource  = 'tobid-sdk-ios/AdNetworks/applovin/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/applovin/*'
     ss.frameworks = "AdSupport","AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","CoreMotion","CoreTelephony","MessageUI","SafariServices","StoreKit","SystemConfiguration","UIKit","WebKit"
     ss.weak_framework = 'AppTrackingTransparency'
     ss.libraries = "z","sqlite3","xml2"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'MintegralAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/mintegral_global/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/mintegral_global/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/mintegral_global/*'
     ss.frameworks = "SystemConfiguration","CoreGraphics","Foundation","UIKit","AdSupport","StoreKit","QuartzCore","CoreTelephony","MobileCoreServices","Accelerate","AVFoundation","WebKit"
     ss.weak_framework = 'AppTrackingTransparency'
     ss.libraries = 'z'
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'GDTAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/gdt/*.a', 'tobid-sdk-ios/AdNetworks/gdt/lib/*.a'
     ss.source_files = 'tobid-sdk-ios/AdNetworks/gdt/lib/*.h'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/gdt/*'
     ss.frameworks = "StoreKit","Security","CoreTelephony","AdSupport","CoreLocation","QuartzCore","SystemConfiguration","AVFoundation"
     ss.weak_framework = 'WebKit'
     ss.libraries = 'z', 'xml2'
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'IronSourceAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/ironSource/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/ironSource/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/ironSource/*'
     ss.frameworks = "AdSupport","AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreLocation","CoreMedia","CoreTelephony","CoreVideo","Foundation","MobileCoreServices","QuartzCore","Security","StoreKit","SystemConfiguration"
     ss.libraries = "z"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'VungleAdapter' do |ss|
     ss.platform     = :ios, '10.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/vungle/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/vungle/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/vungle/*'
     ss.frameworks = "AdSupport","AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","MediaPlayer","QuartzCore","StoreKit","SystemConfiguration"
     ss.weak_frameworks = "WebKit","UIKit","Foundation"
     ss.libraries = "z"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'UnityAdsAdapter' do |ss|
     ss.platform = :ios
     ss.ios.deployment_target = '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/unity/*.a'
     # ss.ios.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/unity/UnityAds.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/unity/*'
     ss.dependency 'ToBid-iOS/ToBidSDK'
     ss.dependency 'UnityAds', '4.5.0'
  end

  spec.subspec 'KSAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/kuaishou/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/kuaishou/KSAdSDK.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/kuaishou/*'
     ss.frameworks = "Foundation","UIKit","MobileCoreServices","CoreGraphics","Security","SystemConfiguration","CoreTelephony","AdSupport","CoreData","StoreKit","AVFoundation","MediaPlayer","CoreMedia","WebKit","Accelerate","CoreLocation","AVKit","MessageUI","QuickLook","AudioToolBox","JavaScriptCore","CoreMotion"
     ss.libraries = "z","resolv.9","sqlite3","c++","c++abi"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'BaiduAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/baidu/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/baidu/*.framework'
     ss.resource  = 'tobid-sdk-ios/AdNetworks/baidu/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/baidu/*'
     ss.frameworks = "CoreLocation","SystemConfiguration","CoreGraphics","CoreMotion","CoreTelephony","AdSupport","SystemConfiguration","QuartzCore","WebKit","MessageUI","SafariServices","AVFoundation","EventKit","QuartzCore","CoreMedia","StoreKit"
     ss.libraries = "c++"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'KlevinAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/klevin/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/klevin/*.framework'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/klevin/*'
     ss.frameworks = "StoreKit","SystemConfiguration","CoreTelephony","AVKit","AVFoundation","CoreMedia"
     ss.weak_frameworks = "AdSupport","AppTrackingTransparency","WebKit"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'AdScopeAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios/AdNetworks/adscope/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios/AdNetworks/adscope/*.framework'
     ss.preserve_paths = 'tobid-sdk-ios/AdNetworks/adscope/*'
     ss.frameworks = "AdSupport","AVFoundation","AVKit","Accelerate","AudioToolbox","AppTrackingTransparency","CoreData","CoreLocation","CoreMedia","CoreMotion","CoreGraphics","CoreTelephony","CoreImage","CoreText","Foundation","MediaPlayer","MessageUI","MobileCoreServices","MapKit","QuartzCore","QuickLook","SystemConfiguration","Security","StoreKit","WebKit","UIKit","ImageIO","SafariServices","JavaScriptCore","DeviceCheck"
     ss.libraries = "z","c++","sqlite3","xml2","bz2","c++abi","resolv.9","iconv","c"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end
  
end