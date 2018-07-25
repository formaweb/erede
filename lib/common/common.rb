module Rede
  class Common
    def self.null_if_empty(value)
			if value.nil? || value.empty? || value[0]["i:nil"] == "true"
        value =  nil
      end
      return value
		end
  end
end
