# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ios-sdk-samples' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  #ini diaktifkan hanya jika Anda ingin meng-test sdk dengan cara manual
#   Pods for ios-sdk-samples
#       pod 'IQKeyboardManagerSwift', '6.3.0'
#       pod 'Fabric'
#       pod 'MaterialComponents/Snackbar'
#       pod 'lottie-ios', '3.2.2'
#       pod 'Alamofire'
#       pod 'SkeletonView', '1.30.4'
#
#       post_install do |installer|
#         installer.pods_project.targets.each do |target|
#           target.build_configurations.each do |config|
#             config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
#           end
#         end
#       end

pod 'ios-sdk-astrapay', '~> 0.0.0.18'
#
#
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end



end
