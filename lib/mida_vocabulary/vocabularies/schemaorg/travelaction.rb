require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MoveAction, 'mida_vocabulary/vocabularies/schemaorg/moveaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Distance, 'mida_vocabulary/vocabularies/schemaorg/distance'

    # The act of traveling from an fromLocation to a destination by a specified mode of transport, optionally with participants.
    class TravelAction < Mida::Vocabulary
      itemtype %r{http://schema.org/TravelAction}i
      include_vocabulary Mida::SchemaOrg::MoveAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # The distance travelled, e.g. exercising or travelling.
      has_many 'distance' do
        extract Mida::SchemaOrg::Distance
        extract Mida::DataType::Text
      end
    end

  end
end
