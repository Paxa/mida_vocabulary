require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Question, 'mida_vocabulary/vocabularies/schemaorg/question'

    # An answer offered to a question; perhaps correct, perhaps opinionated or wrong.
    class Answer < Mida::Vocabulary
      itemtype %r{http://schema.org/Answer}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The number of downvotes this question has received from the community.
      has_many 'downvoteCount' do
        extract Mida::DataType::Integer
      end

      # The parent of a question, answer or item in general.
      has_many 'parentItem' do
        extract Mida::SchemaOrg::Question
        extract Mida::DataType::Text
      end

      # The number of upvotes this question has received from the community.
      has_many 'upvoteCount' do
        extract Mida::DataType::Integer
      end
    end

  end
end
