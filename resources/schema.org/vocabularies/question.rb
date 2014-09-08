require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Answer, 'mida_vocabulary/vocabularies/schemaorg/answer'

    # A specific question - e.g. from a user seeking answers online, or collected in a Frequently Asked Questions (FAQ) document.
    class Question < Mida::Vocabulary
      itemtype %r{http://schema.org/Question}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The answer that has been accepted as best, typically on a Question/Answer site. Sites vary in their selection mechanisms, e.g. drawing on community opinion and/or the view of the Question author.
      has_many 'acceptedAnswer' do
        extract Mida::SchemaOrg::Answer
        extract Mida::DataType::Text
      end

      # The number of answers this question has received.
      has_many 'answerCount' do
        extract Mida::DataType::Integer
      end

      # The number of downvotes this question has received from the community.
      has_many 'downvoteCount' do
        extract Mida::DataType::Integer
      end

      # An answer (possibly one of several, possibly incorrect) to a Question, e.g. on a Question/Answer site.
      has_many 'suggestedAnswer' do
        extract Mida::SchemaOrg::Answer
        extract Mida::DataType::Text
      end

      # The number of upvotes this question has received from the community.
      has_many 'upvoteCount' do
        extract Mida::DataType::Integer
      end
    end

  end
end
