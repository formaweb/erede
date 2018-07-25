module Rede
    #   
    # This class is responsable for links from HATEOAS
    #
    # @attr [String] method
    # @attr [String] rel
    # @attr [String] href
    class LinksResponse
        attr_accessor   :method     ,
                        :rel        ,
                        :href

        # Maps the json object to sdk's links object.
        # Params:
        # +source+:: +links_response+
        # Returns:
        # +links_response+
        def self.map(source)
            
            response                        = LinksResponse.new()

            unless source.nil?
                    response.method         = source["method"]
                    response.rel            = source["rel"]
                    response.href           = source["href"]
            end

            return response
        end
    end
end