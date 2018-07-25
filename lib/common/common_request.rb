module Rede
  class CommonRequest
        def self.post(url, obj, security)
            uri = URI(url)
            req = Net::HTTP::Post.new(uri, initheader = { 'Content-Type' => 'application/json' } )
            req.body = obj.to_json
            req.basic_auth security.affiliation, security.password 
            
            res = Net::HTTP.start(uri.hostname, uri.port, 
                                  :use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
                http.request(req)
            end

            return JSON.parse res.body
        end

        def self.put(url, obj, security)
            uri = URI(url)
            req = Net::HTTP::Put.new(uri, initheader = { 'Content-Type' => 'application/json' } )
            req.body = obj.to_json
            req.basic_auth security.affiliation, security.password 
            
            res = Net::HTTP.start(uri.hostname, uri.port,
                                  :use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
                http.request(req)
            end

            return JSON.parse res.body
        end

        def self.get(url, security)
            uri = URI(url)
            req = Net::HTTP::Get.new(uri, initheader = { 'Content-Type' => 'application/json' } )
            req.basic_auth security.affiliation, security.password 
            
            res = Net::HTTP.start(uri.hostname, uri.port,
                                  :use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
                http.request(req)
            end

            return JSON.parse res.body
        end
  end
end