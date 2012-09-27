require "array_extend/version"

class Array
  def stealth_delete! *args
    delete *args
    return self
  end
  
  def stealth_delete_from_collection! collection
    collection.each do |val|
      delete val
    end
    return self
  end
  
  ["stealth_delete", "stealth_delete_from_collection"].each do |method_name|
    define_method method_name do |*args|
      array = self.dup
      eval "array.#{ method_name }! *args"
      return array
    end
  end
end
