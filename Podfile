# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ios-sdk-samples' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  #ini diaktifkan hanya jika Anda ingin meng-test sdk dengan cara manual
#   Pods for ios-sdk-samples
#    pod 'IQKeyboardManagerSwift', '6.3.0'
#    pod 'Fabric'
#    pod 'MaterialComponents/Snackbar'
#    pod 'lottie-ios'
#    pod 'Alamofire'
#    pod 'SkeletonView'

pod 'ios-sdk-astrapay', :git => 'https://github.com/astrapay/ios-sdk-framework-astrapay.git', :branch => 'daily/gilbert-sdk-main'


   post_install do |installer|
     installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
         config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
       end
     end
   end



end
