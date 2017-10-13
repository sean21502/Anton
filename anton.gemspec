Gem::Specification.new do |s|
   s.name          = 'anton'
   s.version       = '0.0.1'
   s.date          = '2017-10-09'
   s.summary       = 'Anton API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Sean Hite']
   s.email         = 'Seanhite@gmail.com'
   s.files         = ['lib/anton.rb']
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/anton'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
 end