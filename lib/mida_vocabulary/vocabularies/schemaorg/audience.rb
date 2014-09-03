require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Intended audience for an item, i.e. the group for whom the item was created.
    class Audience < Mida::Vocabulary
      itemtype %r{http://schema.org/Audience}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
