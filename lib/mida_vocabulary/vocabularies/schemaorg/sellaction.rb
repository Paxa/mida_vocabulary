require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TradeAction, 'mida_vocabulary/vocabularies/schemaorg/tradeaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of taking money from a buyer in exchange for goods or services rendered. An agent sells an object, product, or service to a buyer for a price. Reciprocal of BuyAction.
    class SellAction < Mida::Vocabulary
      itemtype %r{http://schema.org/SellAction}i
      include_vocabulary Mida::SchemaOrg::TradeAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
