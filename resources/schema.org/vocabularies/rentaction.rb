require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TradeAction, 'mida_vocabulary/vocabularies/schemaorg/tradeaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of giving money in return for temporary use, but not ownership, of an object such as a vehicle or property. For example, an agent rents a property from a landlord in exchange for a periodic payment.
    class RentAction < Mida::Vocabulary
      itemtype %r{http://schema.org/RentAction}i
      include_vocabulary Mida::SchemaOrg::TradeAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
