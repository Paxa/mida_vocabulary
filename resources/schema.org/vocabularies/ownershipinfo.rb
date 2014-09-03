require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A structured value providing information about when a certain organization or person owned a certain product.
    class OwnershipInfo < Mida::Vocabulary
      itemtype %r{http://schema.org/OwnershipInfo}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
