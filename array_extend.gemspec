# -*- encoding: utf-8 -*-
require File.expand_path('../lib/array_extend/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Petrachi"]
  gem.email         = ["thomas.petrachi@vodeclic.com"]
  gem.description   = %q{Extend ruby Array. No override.}
  gem.summary       = %q{Adding methods [:after, :stealth_delete]}
  gem.homepage      = "https://github.com/petrachi/array_extend"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "array_extend"
  gem.require_paths = ["lib"]
  gem.version       = ArrayExtend::VERSION
end
