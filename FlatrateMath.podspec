Pod::Spec.new do |s|
  s.name             = 'FlatrateMath'
  s.version          = '0.1.0'
  s.summary          = 'Benchmark math for flat-rate dev subscriptions vs a fully loaded senior hire.'

  s.description      = <<-DESC
  Given a hire profile (salary, benefits, taxes, bonus, retirement match,
  upfront hiring cost) and a subscription fee, FlatrateMath computes the fully
  loaded monthly and annual cost of both lanes, the annual saving, break-even
  request volumes, and effective per-request costs. Pure Foundation, no
  dependencies, deterministic output, Linux-ready.
                       DESC

  s.homepage         = 'https://www.poketdev.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'James Verlander' => 'hello@poketdev.com' }
  s.source           = { :git => 'https://github.com/scrapertweeter3-prog/flatrate-math-swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  s.swift_version = '5.9'

  s.source_files = 'Sources/FlatrateMath/**/*.swift'
end
