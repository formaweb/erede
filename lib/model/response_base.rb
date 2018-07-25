module Rede
    #
    # This class is responsable for response base
    #
    # @attr [String] return_code
    # @attr [String] return_message
    class ResponseBase 
        attr_accessor   :return_code    ,
                        :return_message
    end
end