# Logstash Filter Plugin

This is a filter plugin for [Logstash](https://github.com/elastic/logstash).

With this plugin you can classify requested resources based on url.

It is fully free and fully open source. The license is Apache 2.0, meaning you are pretty much free to use it however you want in whatever way.

## Documentation

Logstash provides infrastructure to automatically generate documentation for this plugin. We use the asciidoc format to write documentation so any comments in the source code will be first converted into asciidoc and then into html. All plugin documentation are placed under one [central location](http://www.elastic.co/guide/en/logstash/current/).

- For formatting code or config example, you can use the asciidoc `[source,ruby]` directive
- For more asciidoc formatting tips, see the excellent reference here https://github.com/elastic/docs#asciidoc-guide

## Need Help?

Need help? Try #logstash on freenode IRC or the https://discuss.elastic.co/c/logstash discussion forum.

## Developing

### 1. Filter Plugin Developement and Testing

#### Code
- To get started, you'll need JRuby with the Bundler gem installed.

- Install dependencies
```sh
bundle install
```

#### Test

- Update dependencies

```sh
bundle install
```

- Run tests

```sh
bundle exec rspec
```

### 2. Running unpublished Filter Plugin in Logstash

#### 2.2 Run in an installed Logstash

To run the filter plugin follow this steps:

- Build your plugin gem
```sh
gem build logstash-filter-request_classifier.gemspec
```
- Install the plugin from the Logstash home
```sh
bin/logstash-plugin install logstash-filter-request_classifier.gemspec
```
- Run Logstash with the plugin
```sh
./logstash -e 'input { stdin{} } filter { request_classifier { url => "message" } } output {stdout { codec => rubydebug }}'
```

## Contributing

All contributions are welcome: ideas, patches, documentation, bug reports, complaints, and even something you drew up on a napkin.

Programming is not a required skill. Whatever you've seen about open source and maintainers or community members  saying "send patches or die" - you will not see that here.

It is more important to the community that you are able to contribute.

For more information about contributing, see the [CONTRIBUTING](https://github.com/elastic/logstash/blob/master/CONTRIBUTING.md) file.
