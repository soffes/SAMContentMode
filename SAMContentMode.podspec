Pod::Spec.new do |spec|
  spec.name = 'SAMContentMode'
  spec.version = '0.1.3'
  spec.authors = {'Sam Soffes' => 'sam@soff.es'}
  spec.homepage = 'https://github.com/soffes/SAMContentMode'
  spec.summary = 'Content mode calculations for CGRect.'
  spec.source = {:git => 'https://github.com/soffes/SAMContentMode.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.requires_arc = true
  spec.ios.frameworks = 'UIKit', 'CoreGraphics'
  spec.osx.frameworks = 'CoreGraphics'
  spec.source_files = 'SAMContentMode'
end
