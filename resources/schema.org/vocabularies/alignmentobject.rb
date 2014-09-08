require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An intangible item that describes an alignment between a learning resource and a node in an educational framework.
    class AlignmentObject < Mida::Vocabulary
      itemtype %r{http://schema.org/AlignmentObject}i
      include_vocabulary Mida::SchemaOrg::Thing

      # A category of alignment between the learning resource and the framework node. Recommended values include: 'assesses', 'teaches', 'requires', 'textComplexity', 'readingLevel', 'educationalSubject', and 'educationLevel'.
      has_many 'alignmentType'

      # The framework to which the resource being described is aligned.
      has_many 'educationalFramework'

      # The description of a node in an established educational framework.
      has_many 'targetDescription'

      # The name of a node in an established educational framework.
      has_many 'targetName'

      # The URL of a node in an established educational framework.
      has_many 'targetUrl' do
        extract Mida::DataType::URL
      end
    end

  end
end
