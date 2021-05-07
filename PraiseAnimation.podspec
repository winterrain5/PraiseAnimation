
Pod::Spec.new do |s|
  s.name             = 'PraiseAnimation'
  s.version          = '0.2.0'
  s.summary          = 'Like animation'


  s.description      = <<-DESC
Like animation
                       DESC

  s.homepage         = 'https://github.com/winterrain5/PraiseAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'winterrain5' => '913419042@qq.com' }
  s.source           = { :git => 'https://github.com/winterrain5/PraiseAnimation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'PraiseAnimation/Classes/**/*'

end
