module Rede
  #
  # This class is responsable for store affiliation's information.
  #
  # @attr [String] affiliation
  # @attr [String] password
  # @attr [String] environment
  class Security
    attr_accessor :affiliation,
                  :password,
                  :environment

      def initialize(affiliation, password, environment)
        @affiliation = affiliation
        @password = password
        @environment = environment
      end
  end
end
