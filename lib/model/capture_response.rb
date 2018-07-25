module Rede
    #   
    # This class is responsable for transaction response
    #
    # @attr [String] date_time
    # @attr [String] nsu
    # @attr [Number] amount
    class CaptureResponse
        attr_accessor   :date_time                   ,
                        :nsu                         ,
                        :amount                      
    end
end