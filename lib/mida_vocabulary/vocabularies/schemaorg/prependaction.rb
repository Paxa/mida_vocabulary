require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :InsertAction, 'mida_vocabulary/vocabularies/schemaorg/insertaction'
    autoload :UpdateAction, 'mida_vocabulary/vocabularies/schemaorg/updateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of inserting at the beginning if an ordered collection.
    class PrependAction < Mida::Vocabulary
      itemtype %r{http://schema.org/PrependAction}i
      include_vocabulary Mida::SchemaOrg::InsertAction
      include_vocabulary Mida::SchemaOrg::UpdateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
