require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TradeAction, 'mida_vocabulary/vocabularies/schemaorg/tradeaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :WarrantyPromise, 'mida_vocabulary/vocabularies/schemaorg/warrantypromise'

    # The act of taking money from a buyer in exchange for goods or services rendered. An agent sells an object, product, or service to a buyer for a price. Reciprocal of BuyAction.
    class SellAction < Mida::Vocabulary
      itemtype %r{http://schema.org/SellAction}i
      include_vocabulary Mida::SchemaOrg::TradeAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of participant. The participant/person/organization that bought the object.
      has_many 'buyer' do
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
