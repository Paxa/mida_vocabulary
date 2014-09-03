require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Permit, 'mida_vocabulary/vocabularies/schemaorg/permit'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A permit issued by a government agency.
    class GovernmentPermit < Mida::Vocabulary
      itemtype %r{http://schema.org/GovernmentPermit}i
      include_vocabulary Mida::SchemaOrg::Permit
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
