require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A structured value representing a monetary amount. Typically, only the subclasses of this type are used for markup.
    class PriceSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/PriceSpecification}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
