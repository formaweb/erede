require_relative "./response_base"
require_relative "./refund_response"

module Rede
    
    # @attr [Array[Refunds]] refunds
    # @attr [Array[Linkds]] links
    class RefundListResponse < ResponseBase
        attr_accessor   :refunds    ,
                        :links
                        
        def initialize(attributes = {})
            @return_code    = attributes[:return_code]
            @return_message = attributes[:return_message]
            @refunds        = attributes[:refunds]
            @links          = attributes[:links]
        end

        def self.map(source)            
            response = RefundListResponse.new()

            unless source.nil?
                response.return_code    = source["returnCode"]
                response.return_message = source["returnMessage"]
                response.refunds        = Array.new
                
                unless source["refunds"].nil?
                    for i in 0 ... source["refunds"].size
                        response.refunds.push(Rede::RefundResponse.map(source["refunds"][i]))
                    end
                end
                
                 unless source["links"].nil?
                    response.links = Array.new

                    for i in 0 ... source["links"].size
                        response.links.push(Rede::LinksResponse.map(source["links"][i]))
                    end
                end
            end

            return response
        end 
    end
end