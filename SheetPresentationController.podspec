Pod::Spec.new do |s|
  s.name             = 'SheetPresentationController'
  s.version          = '0.1.0'
  s.summary          = 'Customizable SheetPresentationController available from iOS 11.'
  s.description      = <<-DESC
    Customizable SheetPresentationController available from iOS 11, similar to UISheetPresentationController.
  DESC
  s.homepage         = 'https://github.com/karolpiateknet/SheetPresentationController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Karol Piątek' => 'https://github.com/karolpiateknet' }
  s.source           = { :git => 'https://github.com/karolpiateknet/SheetPresentationController.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'SheetPresentationController/Classes/**/*'
end
