require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of expressing a preference from a set of options or a large or unbounded set of choices/options.
    class ChooseAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ChooseAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of object. The options subject to this action.
      has_many 'option' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end
    end

  end
end
