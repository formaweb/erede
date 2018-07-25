module Rede    
    #   
    # This class is responsable for iata response
    #
    # @attr [String] code
    # @attr [Number] departure_tax
    class IataResponse
        attr_accessor   :code                        ,
                        :departure_tax               
    end
end