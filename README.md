# wappalyzer.cr

Analyzes a provided URL and returns any services it uses.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  wappalyzer.cr:
    github: duraki/wappalyzer.cr
```

## Usage

```crystal
require "wappalyzer.cr"
```

#### Scan website

```crystal
require "wappalyzer.cr"

Wappalyzer::Scanner.new(url).analyze
```

## Development

## Contributing

1. Fork it (<https://github.com/0xduraki/wappalyzer.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [0xduraki](https://github.com/duraki) Halis Duraki - creator,
maintainer
