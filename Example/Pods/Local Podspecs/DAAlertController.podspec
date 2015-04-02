Pod::Spec.new do |s|
  s.name             = "DAAlertController"
  s.version          = "0.1.3"
  s.summary          = "DAAlertController is pretty much a UIAlertController for both iOS 8 and 7."
  s.homepage         = "https://github.com/daria-kopaliani/DAAlertController"
  s.license          = 'MIT'
  s.author           = { "Daria Kopaliani" => "daria.kopaliani@gmail.com" }
  s.source           = { :git => "https://github.com/daria-kopaliani/DAAlertController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DAAlertController' => ['Pod/Assets/*.png']
  }
end
