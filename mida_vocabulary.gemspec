Gem::Specification.new do |s|
  s.name        = "mida_vocabulary"
  s.summary     = "Microdata vocabularies for mida parser/extractor library"
  s.description = "Microdata schema.org vocabularies"
  s.version     = "0.1.2"
  s.author      = "Pavel Evstigneev"
  s.email       = "pavel.evst@gmail.com"
  s.homepage    = %q{http://github.com/Paxa/mida_vocabulary}
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>=1.9'
  s.files       = `git ls-files`.split("\n")
  s.executables = []
  s.extra_rdoc_files = ['README.md']
  s.add_dependency('blankslate')
  s.add_development_dependency('rspec', '~> 2.7.0' )
  s.add_development_dependency('bundler')
end