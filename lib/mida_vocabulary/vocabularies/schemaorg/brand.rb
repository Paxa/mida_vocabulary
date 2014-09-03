require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A brand is a name used by an organization or business person for labeling a product, product group, or similar.
    class Brand < Mida::Vocabulary
      itemtype %r{http://schema.org/Brand}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
