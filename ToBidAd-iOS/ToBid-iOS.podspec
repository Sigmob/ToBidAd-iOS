#
#  Be sure to run `pod spec lint ToBidAd-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = 'ToBid-iOS'
  spec.version      = '4.6.9'
  spec.summary      = 'ToBid-iOS is a SDK from Sigmob providing AD service.'
  spec.description      = <<-DESC
  ToBid-iOS provides ADs which include native、banner、splash、RewardVideo、Interstitial etc.
                       DESC

  spec.homepage     = 'https://www.sigmob.com/'
  spec.license      = { :type => 'MIT' }
  spec.author       = { 'Codi' => 'codi.zhao@sigmob.com' }
  spec.platform     = :ios, '9.0'
  spec.ios.deployment_target = '9.0'
  spec.source       = { :http => "https://sdkres.sigmob.cn/ToBid/ios/4.6.9_38d1a67246e8a30122557bcde08c4cda/tobid_release_ios_cn_4.6.9_20251226.zip" }
  spec.xcconfig = { 'VALID_ARCHS' => 'armv7 arm64 x86_64','VALID_ARCHS[sdk=iphoneos*]' => 'armv7 arm64','VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64', 'OTHER_LDFLAGS' => ['-lObjC'] }
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.requires_arc = true
  spec.default_subspec = 'ToBidSDK'

  # 默认的核心模块
  spec.subspec 'ToBidSDK' do |ss|
    ss.frameworks = 'ImageIO','StoreKit', 'CFNetwork', 'CoreMedia', 'AdSupport', 'CoreMotion', 'MediaPlayer', 'CoreGraphics', 'AVFoundation', 'CoreLocation', 'CoreTelephony', 'SafariServices', 'MobileCoreServices', 'SystemConfiguration', 'AudioToolbox'
    ss.weak_framework = 'WebKit', 'UIKit', 'Foundation','Network'
    ss.libraries = 'c++', 'z', 'sqlite3'
    ss.vendored_frameworks = ['tobid-sdk-ios-cn/Core/*.xcframework']
    ss.preserve_paths = 'tobid-sdk-ios-cn/Core/*.xcframework'
  end

  spec.subspec 'TouTiaoAdapter' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/csj/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/csj/*.xcframework'
     ss.resource = 'tobid-sdk-ios-cn/AdNetworks/csj/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/csj/**/*'
     ss.frameworks = 'UIKit', 'MapKit', 'WebKit', 'MediaPlayer', 'CoreLocation', 'AdSupport', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'StoreKit', 'SystemConfiguration', 'MobileCoreServices', 'CoreMotion', 'Accelerate','AudioToolbox','JavaScriptCore','Security','CoreImage','AudioToolbox','ImageIO','QuartzCore','CoreGraphics','CoreText'
     ss.weak_frameworks = 'AppTrackingTransparency', 'DeviceCheck', 'CoreML', 'CoreHaptics'
     ss.libraries = 'c++', 'resolv', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'CSJMediationAdapter' do |ss|
    ss.ios.deployment_target = '11.0'
    ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/gromore/*.a'
    ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/gromore/*.xcframework'
    ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/gromore/**/*'
   #  ss.frameworks = 'UIKit', 'MapKit', 'WebKit', 'MediaPlayer', 'CoreLocation', 'AdSupport', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'StoreKit', 'SystemConfiguration', 'MobileCoreServices', 'CoreMotion', 'Accelerate','AudioToolbox','JavaScriptCore','Security','CoreImage','AudioToolbox','ImageIO','QuartzCore','CoreGraphics','CoreText'
   #  ss.weak_frameworks = 'AppTrackingTransparency', 'DeviceCheck', 'CoreML','CoreAudioTypes'
   #  ss.libraries = 'c++', 'resolv', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
    ss.dependency 'ToBid-iOS/TouTiaoAdapter'
  end


  spec.subspec 'MintegralAdapter' do |ss|
     ss.platform     = :ios, '10.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/mintegral-cn/*.a'
       #  ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/mintegral-cn/*.xcframework'
   #   ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/mintegral-cn/**/*'
       #  ss.frameworks = "SystemConfiguration","CoreGraphics","Foundation","UIKit","AdSupport","StoreKit","QuartzCore","CoreTelephony","MobileCoreServices","Accelerate","AVFoundation","WebKit"
       #  ss.weak_framework = 'AppTrackingTransparency'
       #  ss.libraries = 'z','sqlite3','xml2'
     ss.dependency 'MintegralAdSDK/BidNativeAd', '7.7.6'
     ss.dependency 'MintegralAdSDK/BidRewardVideoAd', '7.7.6'
     ss.dependency 'MintegralAdSDK/BidNativeAdvancedAd', '7.7.6'
     ss.dependency 'MintegralAdSDK/BidBannerAd', '7.7.6'
     ss.dependency 'MintegralAdSDK/BidSplashAd', '7.7.6'
     ss.dependency 'MintegralAdSDK/NewInterstitialAd', '7.7.6'
     ss.dependency 'MintegralAdSDK/BidNewInterstitialAd', '7.7.6'
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'GDTAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/gdt/*.a'
   #   ss.source_files = 'tobid-sdk-ios-cn/AdNetworks/gdt/lib/*.h'
   #   ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/gdt/**/*'
   #   ss.frameworks = "StoreKit","Security","CoreTelephony","AdSupport","CoreLocation","QuartzCore","SystemConfiguration","AVFoundation","JavaScriptCore"
   #   ss.weak_framework = 'WebKit'
   #   ss.libraries = 'z', 'xml2','sqlite3',"c++","c++abi"
     ss.dependency 'ToBid-iOS/ToBidSDK'
     ss.dependency 'GDTMobSDK', '4.15.65'
  end

  spec.subspec 'VungleAdapter' do |ss|
     ss.platform     = :ios, '12.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/vungle/*.a'
   #   ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/vungle/*.xcframework'
   #   ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/vungle/**/*'
   #   ss.frameworks = "AdSupport","AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","MediaPlayer","QuartzCore","StoreKit","SystemConfiguration"
   #   ss.weak_frameworks = "WebKit","UIKit","Foundation"
   #   ss.libraries = "z"
     ss.dependency 'VungleAds', '7.4.0'
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'UnityAdsAdapter' do |ss|
     ss.platform = :ios
     ss.ios.deployment_target = '12.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/unity/*.a'
     # ss.ios.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/unity/UnityAds.xcframework'
   #   ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/unity/**/*'
     ss.dependency 'ToBid-iOS/ToBidSDK'
     ss.dependency 'UnityAds', '4.12.2'
  end

  spec.subspec 'KSAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/kuaishou/*.a'
   #   ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/kuaishou/*.xcframework'
   #   ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/kuaishou/**/*'
   #   ss.frameworks = "Foundation","UIKit","MobileCoreServices","CoreGraphics","Security","SystemConfiguration","CoreTelephony","AdSupport","CoreData","StoreKit","AVFoundation","MediaPlayer","CoreMedia","WebKit","Accelerate","CoreLocation","AVKit","MessageUI","QuickLook","AudioToolBox","JavaScriptCore","CoreMotion","Photos"
   #   ss.libraries = "z","resolv.9","sqlite3","c++","c++abi"
     ss.dependency 'KSAdSDK', '4.11.30.1'
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'BaiduAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/baidu/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/baidu/*.framework'
     ss.resource  = 'tobid-sdk-ios-cn/AdNetworks/baidu/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/baidu/**/*'
     ss.frameworks = "CoreLocation","SystemConfiguration","CoreGraphics","CoreMotion","CoreTelephony","AdSupport","SystemConfiguration","QuartzCore","WebKit","MessageUI","SafariServices","AVFoundation","EventKit","QuartzCore","CoreMedia","StoreKit"
     ss.libraries = "c++"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'MSAdAdapter' do |ss|
     ss.platform     = :ios, '10.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/meishu/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/meishu/*.xcframework'
     ss.resource  = 'tobid-sdk-ios-cn/AdNetworks/meishu/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/meishu/**/*'
     ss.frameworks = "AdSupport","AVFoundation","CoreLocation","CoreMotion","CoreImage","CoreTelephony","Foundation","Security","StoreKit","UIKit","WebKit","SystemConfiguration"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end
  
  spec.subspec 'KlevinAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/klevin/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/klevin/*.framework'
     ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/klevin/**/*'
     ss.frameworks = "StoreKit","SystemConfiguration","CoreTelephony","AVKit","AVFoundation","CoreMedia"
     ss.weak_frameworks = "AdSupport","AppTrackingTransparency","WebKit"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'AdScopeAdapter' do |ss|
     ss.platform     = :ios, '10.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/adscope/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/adscope/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/adscope/**/*'
     ss.frameworks = "AdSupport","AVFoundation","AVKit","Accelerate","AudioToolbox","AppTrackingTransparency","CoreData","CoreLocation","CoreMedia","CoreMotion","CoreGraphics","CoreTelephony","CoreImage","CoreText","Foundation","MediaPlayer","MessageUI","MobileCoreServices","MapKit","QuartzCore","QuickLook","SystemConfiguration","Security","StoreKit","WebKit","UIKit","ImageIO","SafariServices","JavaScriptCore","DeviceCheck"
     ss.libraries = "z","c++","sqlite3","xml2","bz2","c++abi","resolv.9","iconv","c"
     ss.dependency 'ToBid-iOS/ToBidSDK'
  end

  spec.subspec 'AdmobAdapter' do |ss|
     ss.ios.deployment_target = '12.0'
     ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/admob/*.a'
     # ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/admob/*.xcframework'
   #   ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/admob/**/*'
     # ss.frameworks = "AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","CoreTelephony","CoreVideo","MediaPlayer","MessageUI","MobileCoreServices","QuartzCore","Security","StoreKit","SystemConfiguration"
     # ss.libraries = 'z','sqlite3'
     ss.dependency 'ToBid-iOS/ToBidSDK'
     ss.dependency 'Google-Mobile-Ads-SDK', '11.10.0'
  end

  spec.subspec 'QuMengAdapter' do |ss|
   ss.ios.deployment_target = '11.0'
   ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/qumeng/*.a'
   # ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/qumeng/**/*'
   ss.dependency 'ToBid-iOS/ToBidSDK'
   ss.dependency 'QuMengAdSDK', '1.3.7'
  end

  spec.subspec 'JADYunAdapter' do |ss|
   ss.ios.deployment_target = '11.0'
   ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/jadYun/*.a'
   # ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/jadYun/**/*'
   ss.dependency 'ToBid-iOS/ToBidSDK'
   ss.dependency 'JADYun', '2.6.8'
  end

  spec.subspec 'OctopusAdapter' do |ss|
   ss.ios.deployment_target = '11.0'
   ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/octopus/*.a'
   ss.dependency 'ToBid-iOS/ToBidSDK'
   ss.dependency 'OctopusSDK', '2.5.10.18'
  end

  spec.subspec 'MercuryAdapter' do |ss|
   ss.ios.deployment_target = '10.0'
   ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/mercury/*.a'
   ss.dependency 'ToBid-iOS/ToBidSDK'
   ss.dependency 'MercurySDK', '4.5.8'
  end

spec.subspec 'BidResultAdapter' do |ss|
   ss.ios.deployment_target = '9.0'
   ss.source_files = [
      'tobid-sdk-ios-cn/AdNetworks/bidresult/*.h',
    ]
   ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/bidresult/*.a'
   ss.public_header_files = 'tobid-sdk-ios-cn/AdNetworks/bidresult/*.h'
   ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/bidresult/**/*'
   ss.dependency 'ToBid-iOS/ToBidSDK'
end


  spec.subspec 'AppLovinAdapter' do |ss|
   ss.platform     = :ios, '11.0'
   ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/applovin/*.a'
   # ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/applovin/**/*'
   ss.libraries = "z","sqlite3","xml2"
   ss.dependency 'AppLovinSDK', '13.0.0'
   ss.dependency 'ToBid-iOS/ToBidSDK'
 end
   
   spec.subspec 'IronSourceAdapter' do |ss|
      ss.platform     = :ios, '12.0'
      ss.vendored_libraries = 'tobid-sdk-ios-cn/AdNetworks/ironSource/*.a'
      # ss.vendored_frameworks = 'tobid-sdk-ios-cn/AdNetworks/ironSource/*.xcframework'
      # ss.preserve_paths = 'tobid-sdk-ios-cn/AdNetworks/ironSource/**/*'
      # ss.frameworks = "AdSupport","AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreLocation","CoreMedia","CoreTelephony","CoreVideo","Foundation","MobileCoreServices","QuartzCore","Security","StoreKit","SystemConfiguration"
      # ss.libraries = "z"
      ss.dependency 'IronSourceSDK', '8.2.0.0'
      ss.dependency 'ToBid-iOS/ToBidSDK'
   end
  
end
