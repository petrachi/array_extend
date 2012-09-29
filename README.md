# ArrayExtend

Extend ruby Array. No override.

## Installation

Add this line to your application's Gemfile:

    gem 'array_extend'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install array_extend

## Usage

* after(val)

Return the value after the one pass in argument

Demo

	["hello", "world"].after("hello")	#=> "world"
	["hello", "world"].after("world")	#=> nil
	["hello", "world"].after("none")		#=> nil

Code

	def after val
    	self[index(val) + 1] if self.include? val
	end


* stealth_delete! *vals
* stealth_delete *vals

Delete value(s) passed by, but return the array instead of the deleted value

Demo

	["ruby", "the", "programmer", "best", "friend"].stealth_delete! "ruby"
	#=> ["the", "programmer", "best", "friend"] 
	
	["ruby", "the", "programmer", "best", "friend"].stealth_delete! "ruby", "best", "programmer"
	#=> ["the", "friend"] 
	
	["ruby", "the", "programmer", "best", "friend"].stealth_delete! "hello"
	#=> ["ruby", "the", "programmer", "best", "friend"]

Code

	def stealth_delete! *vals
	  vals.each do |val|
	    delete val
	  end
	  return self
	end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
