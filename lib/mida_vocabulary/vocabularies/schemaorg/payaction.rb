require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TradeAction, 'mida_vocabulary/vocabularies/schemaorg/tradeaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An agent pays a price to a participant.
    class PayAction < Mida::Vocabulary
      itemtype %r{http://schema.org/PayAction}i
      include_vocabulary Mida::SchemaOrg::TradeAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
