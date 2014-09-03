require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TradeAction, 'mida_vocabulary/vocabularies/schemaorg/tradeaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of giving money to a seller in exchange for goods or services rendered. An agent buys an object, product, or service from a seller for a price. Reciprocal of SellAction.
    class BuyAction < Mida::Vocabulary
      itemtype %r{http://schema.org/BuyAction}i
      include_vocabulary Mida::SchemaOrg::TradeAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
