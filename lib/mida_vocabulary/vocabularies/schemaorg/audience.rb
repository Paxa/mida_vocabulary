require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AdministrativeArea, 'mida_vocabulary/vocabularies/schemaorg/administrativearea'

    # Intended audience for an item, i.e. the group for whom the item was created.
    class Audience < Mida::Vocabulary
      itemtype %r{http://schema.org/Audience}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The target group associated with a given audience (e.g. veterans, car owners, musicians, etc.)
      #    domain: Audience
      #    Range: Text

      has_many 'audienceType'

      # The geographic area associated with the audience.
      has_many 'geographicArea' do
        extract Mida::SchemaOrg::AdministrativeArea
        extract Mida::DataType::Text
      end
    end

  end
end
