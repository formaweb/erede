require_relative "./response_base"
require_relative "./refund_history_response"

module Rede
    #   
    # This class is responsable for refund response
    #
    # @attr [String] refund_id
    # @attr [String] tid
    # @attr [String] nsu
    # @attr [String] refund_date_time
    # @attr [String] cancel_id
    # @attr [String] status
    # @attr [Number] amount
    # @attr [Array] status_history
    # @attr [Array] links
    class RefundResponse < ResponseBase
        attr_accessor   :refund_id                   ,
                        :tid                         ,
                        :nsu                         ,
                        :refund_date_time            ,
                        :cancel_id                   ,
                        :status                      ,
                        :amount                      ,
                        :status_history              ,
                        :links

        def initialize(attributes = {})
            @return_code        = attributes[:return_code]
            @return_message     = attributes[:return_message]
            @refund_id          = attributes[:refund_id]
            @tid                = attributes[:tid]
            @nsu                = attributes[:nsu]
            @refund_date_time   = attributes[:refund_date_time]
            @cancel_id          = attributes[:cancel_id]
            @status             = attributes[:status]
            @amount             = attributes[:amount]
            @status_history     = attributes[:status_history]
            @links              = attributes[:links]
        end
                        
        # Maps the json object to sdk's response object.
        # Params:
        # +source+:: +refund_response+
        # Returns:
        # +refund_response+
        def self.map(source)
            
            response                            = RefundResponse.new()

            unless source.nil?
                response.return_code            = source["returnCode"]
                response.return_message         = source["returnMessage"]
                response.refund_id              = source["refundId"]
                response.tid                    = source["tid"]
                response.nsu                    = source["nsu"]
                response.refund_date_time       = source["refundDateTime"]
                response.cancel_id              = source["cancelId"]
                response.status                 = source["status"]
                response.amount                 = source["amount"]

                unless source["statusHistory"].nil?
                    response.status_history = Array.new()

                    for i in 0 ... source["statusHistory"].size
                        history             = RefundHistoryResponse.new()
                        history.status      = source["statusHistory"][i]["status"]
                        history.date_time   = source["statusHistory"][i]["dateTime"]
                        response.status_history.push(history)
                    end
                end

                unless source["links"].nil?
                    response.links      = Array.new

                    for i in 0 ... source["links"].size
                        response.links.push(Rede::LinksResponse.map(source["links"][i]))
                    end
                end
            end

            return response
        end
    end
end