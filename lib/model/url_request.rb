require_relative "./url_kind"

module Rede
    #
    # This class is responsable for Url Request
    #
    # @attr [UrlKind] kind
    # @attr [String] url
    class UrlRequest
        attr_accessor   :kind,
                        :url

        def as_json(*a)
            {
                'kind' 					    => @kind,
                'url'                    	=> @url				
            }
        end

        def to_json(*a)
            self.as_json.to_json
        end
    end
end