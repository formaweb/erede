module Rede
    #
    # This class is responsable for refund request.
    #
    # @attr [Number] amount
    # @attr [Array[UrlRequest]] urls
    class RefundRequest
        attr_accessor   :amount,
                        :urls                   

        def as_json(*a)
            {
                'amount' 	=> @amount,
                'urls' 		=> @urls
            }
        end

        def to_json(*a)
            self.as_json.to_json(*a)
        end
    end
end