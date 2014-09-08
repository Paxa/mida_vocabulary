require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :LocalBusiness, 'mida_vocabulary/vocabularies/schemaorg/localbusiness'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # A food-related business.
    class FoodEstablishment < Mida::Vocabulary
      itemtype %r{http://schema.org/FoodEstablishment}i
      include_vocabulary Mida::SchemaOrg::LocalBusiness
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place

      # Indicates whether a FoodEstablishment accepts reservations. Values can be Boolean, an URL at which reservations can be made or (for backwards compatibility) the strings Yes or No.
      has_many 'acceptsReservations' do
        extract Mida::DataType::Boolean
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # Either the actual menu or a URL of the menu.
      has_many 'menu' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # The cuisine of the restaurant.
      has_many 'servesCuisine'
    end

  end
end
