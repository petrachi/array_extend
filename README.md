# ArrayExtend

Extend ruby Array. No override.

## Support

Validate for Ruby 1.9.3 and Ruby ree-1.8.7

## Installation

Add this line to your application's Gemfile:

    gem 'array_extend'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install array_extend

## Usage

### after

Return the value after the one pass in argument

Demo

```ruby
	["hello", "world"].after("hello")	#=> "world"
	["hello", "world"].after("world")	#=> nil
	["hello", "world"].after("none")		#=> nil
```

Code

```ruby
	def after val
    	self[index(val) + 1] if self.include? val
	end
```


### stealth_delete

Delete value(s) passed by, but return the array instead of the deleted value

```ruby
	stealth_delete! *vals
	stealth_delete *vals
```

Demo

```ruby
	["ruby", "the", "programmer", "best", "friend"].stealth_delete! "ruby"
	#=> ["the", "programmer", "best", "friend"] 
	
	["ruby", "the", "programmer", "best", "friend"].stealth_delete! "ruby", "best", "programmer"
	#=> ["the", "friend"] 
	
	["ruby", "the", "programmer", "best", "friend"].stealth_delete! "hello"
	#=> ["ruby", "the", "programmer", "best", "friend"]
```

Code

```ruby
	def stealth_delete! *vals
	  vals.each do |val|
	    delete val
	  end
	  return self
	end
```



### tautology?

Return true if all elements in array are presents. Usefull to check if all passed_by args are -really- presents for example. 

Demo

```ruby
	[true, true, true].tautology?						#=> true
	[true, false, true].tautology?						#=> false
	[1, 2, "hello", "world", {:one => 1}].tautology?	#=> true
	[1, 2, nil, "hello"].tautology?						#=> false
	[1, 2, [], {}].tautology?							#=> false
```

Code

```ruby
	def tautology?
  		self.inject(true){ |res, elt| res && elt.present? }
	end
```


### compact_by

Allow to compact, only by one side (right or left). Usefull to delete nil values to the end of an array
BTW : I use here the rails "blank?" method, instead of the ruby "nil?" that is used in array#compact!

```ruby
	compact_by! side
	compact_by side
```

Arguments : 'side' must be in %w{right left}

Demo

```ruby
	
	[nil, nil, "hello", "world", nil].compact_by :right
	#=> [nil, nil, "hello", "world"]
	
	[nil, nil, "hello", "world", nil].compact_by :left
	#=> ["hello", "world", nil]
	
	[nil, nil, "hello", nil, "world"].compact_by :left
	#=> ["hello", nil, "world"]
	
	[nil, [], "hello", nil, "world"].compact_by :left
	#=> #=> ["hello", "world"]
	
	["hello", "world"].compact_by :left
	#=> ["hello", "world"]
```

Code

```ruby
	def compact_by! side
		case side
		when :right, "right"
			while self.last.blank?
				self.pop
			end

		when :left, "left"
			while self.first.blank?
				self.shift
			end

		else
			raise ArgumentError, "'side' argument must be in %w{right left}"
		end

		self
	end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
