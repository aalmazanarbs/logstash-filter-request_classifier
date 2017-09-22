Gem::Specification.new do |s|
  s.name          = 'logstash-filter-request_classifier'
  s.version       = '0.1.0'
  s.licenses      = ['Apache License (2.0)']
  s.summary       = 'Logstash filter plugin to classify requests from any field'
  s.description   = 'Logstash filter plugin to classify requests from any field. Now, fixed types are setup in the code.'
  s.homepage      = 'https://github.com/aalmazanarbs'
  s.authors       = ['Alejandro Almazán Cabo']
  s.email         = 'aalmazan@autentia.com'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 2.0"
  s.add_development_dependency 'logstash-devutils'
end
