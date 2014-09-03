require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A permit issued by an organization, e.g. a parking pass.
    class Permit < Mida::Vocabulary
      itemtype %r{http://schema.org/Permit}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
