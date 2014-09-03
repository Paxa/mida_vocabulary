require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An order is a confirmation of a transaction (a receipt), which can contain multiple line items, each represented by an Offer that has been accepted by the customer.
    class Order < Mida::Vocabulary
      itemtype %r{http://schema.org/Order}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
