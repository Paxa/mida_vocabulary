require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Review, 'mida_vocabulary/vocabularies/schemaorg/review'

    # The act of producing a balanced opinion about the object for an audience. An agent reviews an object with participants resulting in a review.
    class ReviewAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ReviewAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of result. The review that resulted in the performing of the action.
      has_many 'resultReview' do
        extract Mida::SchemaOrg::Review
        extract Mida::DataType::Text
      end
    end

  end
end
