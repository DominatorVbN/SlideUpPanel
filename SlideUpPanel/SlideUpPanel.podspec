Pod::Spec.new do |s|
s.name         = "SlideUpPanel"
s.version      = "1.0.2"
s.summary      = "SlideUpPanel is a custom control."
s.description  = "With use of SlideUpPanel we can implement Google map like slide up panel in ios."
s.homepage     = "https://github.com/DominatorVbN/SlideUpPanel"
s.license      = "MIT"
s.author             = { "DominatorVbN" => "as9039851921@gmail.com" }
s.platform     = :ios, "12.0"
s.source       = { :git => "https://github.com/DominatorVbN/SlideUpPanel.git", :tag => "1.0.2" }
s.source_files = "SlideUpPanel/**/*.{swift}"
 s.resource_bundles = {
     'MyPodBundle' => ['SlideUpPanel/**/*.xib']
 }

s.swift_version = "4.2"
end