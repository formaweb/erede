require 'uri'
require 'net/https'
require 'json'
require_relative "./common/common_request"
require_relative "./model/security"
require_relative "./model/environment_type"
require_relative "./model/query_transaction_response"
require_relative "./model/refund_list_response"
require_relative "./model/return_code"

module Rede
    class Query
        attr_accessor :security

        private :security

        # Default Constructor that initialize Security object.
        def initialize(affiliation, password, environment)
            @security = Rede::Security.new(affiliation, password, environment)
        end

        # Calls query method.
        # Params:
        # +query+:: +query+ The request data
        def get_transaction_by_tid(tid)
            response = get_transaction(tid, nil)
        end

        # Calls query method.
        # Params:
        # +query+:: +query+ The request data
        def get_transaction_by_reference(reference)
            response = get_transaction(nil, reference)
        end

        # Calls query method.
        # Params:
        # +query+:: +query+ The request data
        def get_transaction(tid, reference)
            begin
                #creating url
                url = "#{@security.environment}/transactions"
                url = url + "?tid=#{tid}&reference=#{reference}"

                # make the request.
                json_response = Rede::CommonRequest.get(url, @security)

                # mapping the result.
                response = Rede::QueryTransactionResponse.map(json_response)

            rescue Exception => e
                response = Rede::QueryTransactionResponse.new(:return_code => Rede::ReturnCode::UNSUCCESSFUL, :return_message => e.message)
            end

            return response
        end

        # Calls refund method.
        # Params:
        # +tid+:: requested tid.
        # +refund_id+:: requested refund_id.
        def get_refund(tid, refund_id)
            begin
                #creating url
                url = "#{@security.environment}/transactions/#{tid}/refunds/#{refund_id}"
                # make the request.
                json_response = Rede::CommonRequest::get(url, @security)

                # mapping the result.
                response = Rede::RefundResponse.map(json_response)

            rescue Exception => e
                response = Rede::RefundResponse.new(:return_code => Rede::ReturnCode::UNSUCCESSFUL, :return_message => e.message)
            end

            return response
        end
        
        # Calls refundList method.
        # Params:
        # +tid+:: requested tid.
        def get_refunds(tid)
            begin
                #creating url
                url = "#{@security.environment}/transactions/#{tid}/refunds"

                # make the request.
                json_response = Rede::CommonRequest::get(url, @security)

                # mapping the result.
                response = Rede::RefundListResponse.map(json_response)

            rescue Exception => e
                response = Rede::RefundListResponse.new(:return_code => Rede::ReturnCode::UNSUCCESSFUL, :return_message => e.message)
            end

            return response
        end
    end
end