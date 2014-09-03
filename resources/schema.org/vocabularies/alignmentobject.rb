require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An intangible item that describes an alignment between a learning resource and a node in an educational framework.
    class AlignmentObject < Mida::Vocabulary
      itemtype %r{http://schema.org/AlignmentObject}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
