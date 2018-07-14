#
# Be sure to run `pod lib lint captcha-harvester-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'captcha-harvester-ios'
  s.version          = '0.1.0'
  s.summary          = 'ReCaptcha harvester for iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
captcha-harvester-ios is a reCaptcha harvester for iOS allowing you to harvest recaptcha tokens for a specific domain and sitekey. You can access these tokens and use them in your own project.
                       DESC

  s.homepage         = 'https://github.com/kraj011/captcha-harvester-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'David Krajewski' => 'davidkrajewski@yahoo.com' }
  s.source           = { :git => 'https://github.com/kraj011/captcha-harvester-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/DynxSZN'

  s.ios.deployment_target = '8.0'
  
  s.swift_version = '3.2'

  s.source_files = 'captcha-harvester-ios/Classes/**/*'
  
  # s.resource_bundles = {
  #   'captcha-harvester-ios' => ['captcha-harvester-ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Webkit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
