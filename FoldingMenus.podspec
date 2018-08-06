

Pod::Spec.new do |s|
  s.name         = "FoldingMenus"
  s.version      = "0.0.1"
  s.swift_version = "4.0"
  s.summary      = "Folded and unfolded buttons"
  s.homepage     = "https://github.com/jinShine/FoldingMenusButton"
  # s.screenshots  = ""
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "jinShine" => "seungjin429@naver.com" }
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/jinShine/FoldingMenusButton.git", :tag => s.version.to_s }
  s.source_files  = "FoldingMenus/*.swift"
  s.requires_arc = true
end
