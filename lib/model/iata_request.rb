module Rede
    #
    # This class is responsable for iata request
    #
    # @attr [String] code
    # @attr [Number] departure_tax
    class IataRequest
        attr_accessor   :code                 ,
                        :departure_tax

        def as_json(*a)
            {
                'code'                      => @code,
                'departureTax'              => @departure_tax
            }
        end

        def to_json(*a)
            self.as_json.to_json
        end
    end
end