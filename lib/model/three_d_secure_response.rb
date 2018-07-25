require_relative "./response_base"

module Rede
    #   
    # This class is responsable for ThreeDSecure response
    #
    # @attr [String] cavv
    # @attr [String] eci
    # @attr [String] xid
    # @attr [Boolean] embedded
    # @attr [String] url
    class ThreeDSecureResponse < ResponseBase
        attr_accessor   :cavv      ,
                        :eci       ,
                        :xid       ,
                        :embedded  ,
                        :url                                 
    end
end