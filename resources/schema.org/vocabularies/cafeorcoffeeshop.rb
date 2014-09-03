require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :FoodEstablishment, 'mida_vocabulary/vocabularies/schemaorg/foodestablishment'
    autoload :LocalBusiness, 'mida_vocabulary/vocabularies/schemaorg/localbusiness'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # A cafe or coffee shop.
    class CafeOrCoffeeShop < Mida::Vocabulary
      itemtype %r{http://schema.org/CafeOrCoffeeShop}i
      include_vocabulary Mida::SchemaOrg::FoodEstablishment
      include_vocabulary Mida::SchemaOrg::LocalBusiness
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place
    end

  end
end
