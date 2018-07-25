require_relative "./response_base"

module Rede
    #   
    # This class is responsable for transaction response
    #
    # @attr [String] date_time
    # @attr [String] affiliation
    # @attr [String] status
    # @attr [String] reference
    # @attr [String] tid
    # @attr [String] nsu
    # @attr [String] authorization_code
    # @attr [Kind]   kind
    # @attr [Number] amount
    # @attr [Number] installments
    # @attr [String] card_holder_name
    # @attr [String] card_bin
    # @attr [String] last_4
    # @attr [String] soft_descriptor
    # @attr [Number] origin
    # @attr [String] subscription
    # @attr [String] distributor_affiliation
    class AuthorizationResponse < ResponseBase
        attr_accessor   :date_time                   ,
                        :affiliation                 ,
                        :status                      ,
                        :reference                   ,
                        :tid                         ,
                        :nsu                         ,
                        :authorization_code          ,
                        :kind                        ,
                        :amount                      ,
                        :installments                ,
                        :card_holder_name            ,
                        :card_bin                    ,
                        :last_4                      ,
                        :soft_descriptor             ,
                        :origin                      ,
                        :subscription                ,
                        :distributor_affiliation     
    end
end