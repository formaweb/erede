require_relative "./response_base"
require_relative "./three_d_secure_response"
require_relative "./authorization_response"
require_relative "./capture_response"
require_relative "./iata_response"
require_relative "./refund_response"

module Rede
    #   
    # This class is responsable for query response
    #
    # @attr [String] request_date_time
    # @attr [AuthorizationResponse] authorization
    # @attr [CaptureResponse] capture
    # @attr [IataResponse] iata
    # @attr [ThreeDSecureResponse] threeDSecure
    # @attr [Array[RefundResponse]] refunds
    # @attr [Array] links
    class QueryTransactionResponse < ResponseBase
        attr_accessor   :request_date_time           ,
                        :authorization               ,
                        :capture                     ,
                        :iata                        ,
                        :threeDSecure                ,
                        :refunds                     ,
                        :links

        def initialize(attributes = {})
            @return_code        = attributes[:return_code]
            @return_message     = attributes[:return_message]
            @request_date_time  = attributes[:request_date_time]
            @authorization      = attributes[:authorization]
            @capture            = attributes[:capture]
            @iata               = attributes[:iata]
            @threeDSecure       = attributes[:threeDSecure]
            @refunds            = attributes[:refunds]
            @links              = attributes[:links]
        end

        # Maps the json object to sdk's response object.
        # Params:
        # +source+:: +query_transaction_response+
        # Returns:
        # +query_transaction_response+
        def self.map(source)
            
            response                                = QueryTransactionResponse.new()
            
            unless source.nil?
                    response.return_code            = source["returnCode"]
                    response.return_message         = source["returnMessage"]
                    response.request_date_time      = source["requestDateTime"]
                                        
                    unless source["authorization"].nil?
                        response.authorization                    =   Rede::AuthorizationResponse.new()
                        response.authorization.date_time          =   source["authorization"]["dateTime"]
                        response.authorization.return_code        =   source["authorization"]["returnCode"]
                        response.authorization.return_message     =   source["authorization"]["returnMessage"]
                        response.authorization.affiliation        =   source["authorization"]["affiliation"]  
                        response.authorization.status             =   source["authorization"]["status"]
                        response.authorization.reference          =   source["authorization"]["reference"]
                        response.authorization.tid                =   source["authorization"]["tid"]
                        response.authorization.nsu                =   source["authorization"]["nsu"]
                        response.authorization.authorization_code =   source["authorization"]["authorizationCode"]
                        response.authorization.kind               =   source["authorization"]["kind"]
                        response.authorization.amount             =   source["authorization"]["amount"]
                        response.authorization.installments       =   source["authorization"]["installments"]
                        response.authorization.card_holder_name   =   source["authorization"]["cardHolderName"]
                        response.authorization.card_bin           =   source["authorization"]["cardBin"]
                        response.authorization.last_4             =   source["authorization"]["last4"]
                        response.authorization.soft_descriptor    =   source["authorization"]["softDescriptor"]
                        response.authorization.origin             =   source["authorization"]["origin"]
                        response.authorization.subscription       =   source["authorization"]["subscription"]
                        response.authorization.distributor_affiliation = source["authorization"]["distributorAffiliation"]
                    end

                    unless source["capture"].nil?                    
                        response.capture                    =   Rede::CaptureResponse.new()
                        response.capture.date_time          =   source["capture"]["dateTime"]
                        response.capture.nsu                =   source["capture"]["nsu"]  
                        response.capture.amount             =   source["capture"]["amount"]
                    end
                    

                    unless source["iata"].nil?
                        response.iata                    =   Rede::IataResponse.new()
                        response.iata.code               =   source["iata"]["code"]
                        response.iata.departure_tax      =   source["iata"]["departureTax"]
                    end
                    
                    unless source["threeDSecure"].nil?
                        response.threeDSecure                    =   Rede::ThreeDSecureResponse.new()
                        response.threeDSecure.cavv               =   source["threeDSecure"]["cavv"]
                        response.threeDSecure.eci                =   source["threeDSecure"]["eci"]
                        response.threeDSecure.xid                =   source["threeDSecure"]["xid"]
                        response.threeDSecure.embedded           =   source["threeDSecure"]["embedded"]
                        response.threeDSecure.url                =   source["threeDSecure"]["url"]
                        response.threeDSecure.return_code        =   source["threeDSecure"]["returnCode"]
                        response.threeDSecure.return_message     =   source["threeDSecure"]["returnMessage"]
                    end

                    unless source["refunds"].nil?
                        response.refunds                        = Array.new
                        
                        for i in 0 ... source["refunds"].size
                            
                            refund                        = Rede::RefundResponse.new()
                            refund.refund_id              = source["refunds"][i]["refundId"]
                            refund.tid                    = source["refunds"][i]["tid"]
                            refund.nsu                    = source["refunds"][i]["nsu"]
                            refund.refund_date_time       = source["refunds"][i]["refundDateTime"]
                            refund.cancel_id              = source["refunds"][i]["cancelId"]
                            refund.status                 = source["refunds"][i]["status"]
                            refund.amount                 = source["refunds"][i]["amount"]

                            response.refunds.push(refund)
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