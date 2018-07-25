require_relative "./kind"
require_relative "./three_d_secure_request"
require_relative "./iata_request"
require_relative "./url_request"

module Rede
  #
  # This class is responsable for transaction request
  #
  # @attr [String] capture
  # @attr [kind] kind
  # @attr [String] reference
  # @attr [Number] amount
  # @attr [Number] installments
  # @attr [String] card_holder_name
  # @attr [String] card_number
  # @attr [String] expiration_month
  # @attr [String] expiration_year
  # @attr [String] security_code
  # @attr [String] soft_descriptor
  # @attr [Boolean] subscription
  # @attr [String] origin
  # @attr [String] distributor_affiliation
  # @attr [ThreeDRequest] threeDSecure
  # @attr [IataRequest] iata
  # @attr [Array[UrlRequest]] urls
  class TransactionRequest
    attr_accessor   :capture                 ,
                    :kind                    ,
                    :reference               ,
                    :amount                  ,
                    :installments            ,
                    :card_holder_name        ,
                    :card_number             ,
                    :expiration_month        ,
                    :expiration_year         ,
                    :security_code           ,
                    :soft_descriptor         ,
                    :subscription            ,
                    :origin                  ,
                    :distributor_affiliation ,
                    :threeDSecure            ,
                    :iata                    ,
                    :urls                    

    def as_json(*a)
      {
          'capture'                   => @capture                 ,
          'kind'                      => @kind                    ,
          'reference'                 => @reference               ,
          'amount'                    => @amount                  ,
          'installments'              => @installments            ,
          'cardHolderName'            => @card_holder_name        ,
          'cardNumber'                => @card_number             ,
          'expirationMonth'           => @expiration_month        ,
          'expirationYear'            => @expiration_year         ,
          'securityCode'              => @security_code           ,
          'softDescriptor'            => @soft_descriptor         ,
          'subscription'              => @subscription            ,
          'origin'                    => @origin                  ,
          'distributorAffiliation'    => @distributor_affiliation ,
          'threeDSecure'              => @threeDSecure            ,
          'iata'                      => @iata                    ,
          'urls'                      => @urls                
      }
    end

    def to_json(*a)
      self.as_json.to_json(*a)
    end
  end
end