require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :ChooseAction, 'mida_vocabulary/vocabularies/schemaorg/chooseaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of expressing a preference from a fixed/finite/structured set of choices/options.
    class VoteAction < Mida::Vocabulary
      itemtype %r{http://schema.org/VoteAction}i
      include_vocabulary Mida::SchemaOrg::ChooseAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
