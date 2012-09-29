require "array_extend/version"

class Array
  # returns the value after the given value. wraps around. defaults to first element in array.
  def after val
    self[index(val) + 1] if self.include? val
  end
  
  # delete value(s) but return self instead of deleted value
  def stealth_delete! *vals
    vals.each do |val|
      delete val
    end
    return self
  end
  
  # duplicate method without self modification
  [:stealth_delete].each do |method_name|
    define_method method_name do |*args|
      array = self.dup
      eval "array.#{ method_name }! *args"
      return array
    end
  end
end
