Pod::Spec.new do |spec|
  spec.name         = "FBView"
  spec.version      = "0.0.1"
  spec.summary      = "A superset of view helpers"
  spec.description = "Just another library for iOS to help when working with UIViews by using either code or interface builder (storyboard, xib)"

  spec.homepage     = "https://github.com/Felip38rito/FBView"
  spec.license      = "MIT"
  spec.author             = { "Felip38rito" => "felipe.correia.wd@gmail.com" }
  spec.source       = { :git => "https://github.com/Felip38rito/FBView.git", :tag => "#{spec.version}" }
  spec.source_files  = "FBView/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"
end
