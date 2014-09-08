require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TradeAction, 'mida_vocabulary/vocabularies/schemaorg/tradeaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :RealEstateAgent, 'mida_vocabulary/vocabularies/schemaorg/realestateagent'

    # The act of giving money in return for temporary use, but not ownership, of an object such as a vehicle or property. For example, an agent rents a property from a landlord in exchange for a periodic payment.
    class RentAction < Mida::Vocabulary
      itemtype %r{http://schema.org/RentAction}i
      include_vocabulary Mida::SchemaOrg::TradeAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of participant. The owner of the real estate property.
      has_many 'landlord' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A sub property of participant. The real estate agent involved in the action.
      has_many 'realEstateAgent' do
        extract Mida::SchemaOrg::RealEstateAgent
        extract Mida::DataType::Text
      end
    end

  end
end
