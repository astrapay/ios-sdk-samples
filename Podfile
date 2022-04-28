# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ios-sdk-samples' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ios-sdk-samples
  pod 'IQKeyboardManagerSwift', '6.3.0'
  pod 'Fabric'
  pod 'MaterialComponents/Snackbar'
  pod 'lottie-ios'
  pod 'Alamofire'
  pod 'SkeletonView'
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        if Gem::Version.new(config.build_settings['IPHONEOS_DEPLOYMENT_TARGET']) < Gem::Version.new('9.0')
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
        end
      end
    end
  end


end
