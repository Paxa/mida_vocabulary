require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :LocalBusiness, 'mida_vocabulary/vocabularies/schemaorg/localbusiness'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # A jewelry store.
    class JewelryStore < Mida::Vocabulary
      itemtype %r{http://schema.org/JewelryStore}i
      include_vocabulary Mida::SchemaOrg::LocalBusiness
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place
    end

  end
end
