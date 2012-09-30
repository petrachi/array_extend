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
  end
  
  # maps an '&&' operation through all elements of array
  def tautology?
    self.inject(true){ |res, elt| res && elt.present? }
  end
  
  # allow to compact by left side, or right side. this only delete the "extreme positioned" nils values
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

  # duplicate method without self modification
  [:stealth_delete, :compact_by].each do |method_name|
    define_method method_name do |*args|
      array = self.dup
      eval "array.#{ method_name }! *args"
      return array
    end
  end
end
