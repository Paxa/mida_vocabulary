require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of transferring/moving (abstract or concrete) animate or inanimate objects from one place to another.
    class TransferAction < Mida::Vocabulary
      itemtype %r{http://schema.org/TransferAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
