Gem::Specification.new do |s|
  s.name        = 'erede'
  s.version     = '1.0.5'
  s.date        = '2017-04-06'
  s.summary     = "Rede"
  s.description = "Rede Integration Client"
  s.authors     = ["Rede"]
  s.email       = 'suporte.ecommerce@userede.com.br'
  s.files       = [ "lib/common/common.rb",
                    "lib/common/common_request.rb",
                    "lib/model/authorization_response.rb",
                    "lib/model/capture_response.rb",
                    "lib/model/environment_type.rb",
                    "lib/model/return_code.rb",
                    "lib/model/iata_request.rb",
                    "lib/model/iata_response.rb",
                    "lib/model/kind.rb",
                    "lib/model/links_response.rb",
                    "lib/model/on_failure_type.rb",
                    "lib/model/query_transaction_response.rb",
                    'lib/model/refund_history_response.rb',
                    "lib/model/refund_list_response.rb",
                    "lib/model/refund_request.rb",
                    "lib/model/refund_response.rb",
                    "lib/model/response_base.rb",
                    "lib/model/security.rb",
                    "lib/model/three_d_secure_request.rb",
                    "lib/model/three_d_secure_response.rb",
                    "lib/model/transaction_request.rb",
                    "lib/model/transaction_response.rb",
                    "lib/model/url_kind.rb",
                    "lib/model/url_request.rb",
                    "lib/acquirer.rb",
                    "lib/query.rb"
                  ]
  s.homepage    = 'https://www.userede.com.br/'
  s.license     = 'MIT'
  s.platform    = Gem::Platform::RUBY
  s.add_dependency("xml-simple")
  s.add_dependency("httpi")
end
