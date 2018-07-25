require 'uri'
require 'net/https'
require 'json'
require_relative "./common/common_request"
require_relative "./model/security"
require_relative "./model/environment_type"
require_relative "./model/transaction_request"
require_relative "./model/transaction_response"
require_relative "./model/refund_request"
require_relative "./model/refund_response"
require_relative "./model/query_transaction_response"
require_relative "./model/three_d_secure_request"
require_relative "./model/on_failure_type"
require_relative "./model/refund_list_response"
require_relative "./model/return_code"
require_relative "./model/links_response"

module Rede
    # Main class of SDK. Contain all methods to authorize, capture or cancel a transaction.
    class Acquirer
        attr_accessor :security

        # Default Constructor that initialize Security object.
        def initialize(affiliation, password, environment)
          @security = Rede::Security.new(affiliation, password, environment)
        end

        # Calls transaction method.
        # Params:
        # +authorize+:: +transaction+ The request data
        def authorize(transaction)
            begin
                #creating url
                url = "#{@security.environment}/transactions"

                # make the request.
                json_response = Rede::CommonRequest::post(url, transaction, @security)

                # mapping the result.
                response = Rede::TransactionResponse.map(json_response)

            rescue Exception => e
              response = Rede::TransactionResponse.new(:return_code => Rede::ReturnCode::UNSUCCESSFUL, :return_message => e.message)
            end

            return response
        end

        # Calls capture method.
        # Params:
        # +transaction+:: The request data.
        # +tid+:: Tid.
        def capture(tid, transaction)
            begin
                #creating url
                url = "#{@security.environment}/transactions/#{tid}"

                # make the request.
                json_response = Rede::CommonRequest::put(url, transaction, @security)

                # mapping the result.
                response = Rede::TransactionResponse.map(json_response)

            rescue Exception => e
              response = Rede::TransactionResponse.new(:return_code => Rede::ReturnCode::UNSUCCESSFUL, :return_message => e.message)
            end

            return response
        end

        # Calls refund method.
        # Params:
        # +refund+:: +refund+ The request data
        def refund(tid, refund)
            begin
                #creating url
                url = "#{@security.environment}/transactions/#{tid}/refunds"

                # make the request.
                json_response = Rede::CommonRequest::post(url, refund, @security)

                # mapping the result.
                response = Rede::RefundResponse.map(json_response)

            rescue Exception => e
              response = Rede::RefundResponse.new(:return_code => Rede::ReturnCode::UNSUCCESSFUL, :return_message => e.message)
            end

            return response
        end
    end
end
