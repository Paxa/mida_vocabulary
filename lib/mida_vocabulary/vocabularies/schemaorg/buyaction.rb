require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TradeAction, 'mida_vocabulary/vocabularies/schemaorg/tradeaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :WarrantyPromise, 'mida_vocabulary/vocabularies/schemaorg/warrantypromise'

    # The act of giving money to a seller in exchange for goods or services rendered. An agent buys an object, product, or service from a seller for a price. Reciprocal of SellAction.
    class BuyAction < Mida::Vocabulary
      itemtype %r{http://schema.org/BuyAction}i
      include_vocabulary Mida::SchemaOrg::TradeAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider. Supercedes merchant, vendor.
      has_many 'seller' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The warranty promise(s) included in the offer.
      has_many 'warrantyPromise' do
        extract Mida::SchemaOrg::WarrantyPromise
        extract Mida::DataType::Text
      end
    end

  end
end
