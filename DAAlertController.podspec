#
# Be sure to run `pod lib lint DAAlertController.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DAAlertController"
  s.version          = "1.0.1"
  s.summary          = "DAAlertController is pretty much a UIAlertController for both iOS 8 and 7."
  s.description      = <<-DESC
                       An optional longer description of DAAlertController

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/daria-kopaliani/DAAlertController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Daria Kopaliani" => "daria.kopaliani@gmail.com" }
  s.source           = { :git => "https://github.com/daria-kopaliani/DAAlertController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DAAlertController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
