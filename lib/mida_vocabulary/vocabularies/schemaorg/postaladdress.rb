require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :ContactPoint, 'mida_vocabulary/vocabularies/schemaorg/contactpoint'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The mailing address.
    class PostalAddress < Mida::Vocabulary
      itemtype %r{http://schema.org/PostalAddress}i
      include_vocabulary Mida::SchemaOrg::ContactPoint
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
