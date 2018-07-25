require_relative "./response_base"
require_relative "./three_d_secure_response"

module Rede
    #   
    # This class is responsable for transaction response
    #
    # @attr [String] reference
    # @attr [String] tid
    # @attr [String] nsu
    # @attr [String] authorization_code
    # @attr [String] date_time
    # @attr [Number] amount
    # @attr [Number] installments
    # @attr [String] card_bin
    # @attr [String] last_4
    # @attr [ThreeDSecureResponse] threeDSecure
    # @attr [Array] links
    class TransactionResponse < ResponseBase
        attr_accessor   :reference                   ,
                        :tid                         ,
                        :nsu                         ,
                        :authorization_code          ,
                        :date_time                   ,
                        :amount                      ,
                        :installments                ,
                        :card_bin                    ,
                        :last_4                      ,
                        :threeDSecure                ,
                        :links

        def initialize(attributes = {})
            @return_code         = attributes[:return_code]
            @return_message      = attributes[:return_message]
            @reference           = attributes[:reference]
            @tid                 = attributes[:tid]
            @nsu                 = attributes[:reference]
            @authorization_code  = attributes[:authorization_code]
            @date_time           = attributes[:date_time]
            @amount              = attributes[:amount]
            @installments        = attributes[:installments]
            @card_bin            = attributes[:card_bin]
            @last_4              = attributes[:last_4]
            @threeDSecure        = attributes[:threeDSecure]
            @links               = attributes[:links]
        end

        # Maps the json object to sdk's response object.
        # Params:
        # +source+:: +transaction_response+
        # Returns:
        # +transaction_response+
        def self.map(source)
            
            transaction_response                                = TransactionResponse.new()

            unless source.nil?
                    transaction_response.return_code            = source["returnCode"]
                    transaction_response.return_message         = source["returnMessage"]
                    transaction_response.reference              = source["reference"]
                    transaction_response.tid                    = source["tid"]
                    transaction_response.nsu                    = source["nsu"]
                    transaction_response.authorization_code     = source["authorizationCode"]
                    transaction_response.date_time              = source["dateTime"]
                    transaction_response.amount                 = source["amount"]
                    transaction_response.installments           = source["installments"]
                    transaction_response.card_bin               = source["cardBin"]
                    transaction_response.last_4                 = source["last4"]                 

                    unless source["threeDSecure"].nil?
                        transaction_response.threeDSecure                    =   Rede::ThreeDSecureResponse.new()
                        transaction_response.threeDSecure.cavv               =   source["threeDSecure"]["cavv"]
                        transaction_response.threeDSecure.eci                =   source["threeDSecure"]["eci"]
                        transaction_response.threeDSecure.xid                =   source["threeDSecure"]["xid"]  
                        transaction_response.threeDSecure.embedded           =   source["threeDSecure"]["embedded"]
                        transaction_response.threeDSecure.url                =   source["threeDSecure"]["url"]  
                        transaction_response.threeDSecure.return_code        =   source["threeDSecure"]["returnCode"]   
                        transaction_response.threeDSecure.return_message     =   source["threeDSecure"]["returnMessage"]
                    end
                    
                    unless source["links"].nil?
                        transaction_response.links      = Array.new

                        for i in 0 ... source["links"].size
                            transaction_response.links.push(Rede::LinksResponse.map(source["links"][i]))
                        end
                    end
            end

            return transaction_response
        end
    end
end