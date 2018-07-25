require_relative "./on_failure_type"
module Rede
    #
    # This class is responsable for ThreeDSecure Request
    #
    # @attr [String] eci
    # @attr [String] cavv
    # @attr [String] xid
    # @attr [Boolean] embedded
    # @attr [OnFailureType] on_failure
    # @attr [String] user_agent 
    class ThreeDSecureRequest
        attr_accessor   :eci                 ,
                        :cavv                ,
                        :xid                 ,
                        :embedded            ,
                        :on_failure          ,
                        :user_agent

        def as_json(*a)
            {
                'eci' 					        => @eci,
                'cavv' 					        => @cavv,
                'xid' 					        => @xid,
                'embedded' 					    => @embedded,
                'onFailure' 					=> @on_failure,
                'userAgent' 					=> @user_agent
            }
        end

        def to_json(*a)
            self.as_json.to_json(*a)
        end
    end
end