# Start from https://github.com/CocoaPods/pod-template/blob/master/NAME.podspec
#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ModuleCenter'
  s.version          = '1.0.0'
  s.summary          = 'ModuleCenter components'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Contains the decomponents for ModuleCenter System.
                       DESC

  s.homepage         = 'https://github.com/'
  s.license          = 'MIT'
  s.author           = 'MIT'
  s.source           = { :path => '.' }

  s.ios.deployment_target = '9.0'

  s.source_files = 'ModuleCenter/core/**/*'
  
  # s.resources = 'assets/**/*'

end
