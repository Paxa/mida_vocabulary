require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :WebPage, 'mida_vocabulary/vocabularies/schemaorg/webpage'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A QAPage is a WebPage focussed on a specific Question and its Answer(s), e.g. in a question answering site or documenting Frequently Asked Questions (FAQs).
    class QAPage < Mida::Vocabulary
      itemtype %r{http://schema.org/QAPage}i
      include_vocabulary Mida::SchemaOrg::WebPage
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
