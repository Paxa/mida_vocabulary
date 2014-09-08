require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'

    # A brand is a name used by an organization or business person for labeling a product, product group, or similar.
    class Brand < Mida::Vocabulary
      itemtype %r{http://schema.org/Brand}i
      include_vocabulary Mida::SchemaOrg::Thing

      # A logo associated with an organization.
      has_many 'logo' do
        extract Mida::DataType::URL
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end
    end

  end
end
