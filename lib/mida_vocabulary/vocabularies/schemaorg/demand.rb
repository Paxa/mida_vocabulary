require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services. For describing demand using this type, the very same properties used for Offer apply.
    class Demand < Mida::Vocabulary
      itemtype %r{http://schema.org/Demand}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
