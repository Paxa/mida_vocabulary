require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalCondition, 'mida_vocabulary/vocabularies/schemaorg/medicalcondition'

    # A set of characteristics belonging to people, e.g. who compose an item's target audience.
    class PeopleAudience < Mida::Vocabulary
      itemtype %r{http://schema.org/PeopleAudience}i
      include_vocabulary Mida::SchemaOrg::Audience
      include_vocabulary Mida::SchemaOrg::Thing

      # Expectations for health conditions of target audience
      has_many 'healthCondition' do
        extract Mida::SchemaOrg::MedicalCondition
        extract Mida::DataType::Text
      end

      # Audiences defined by a person's gender.
      has_many 'requiredGender'

      # Audiences defined by a person's maximum age.
      has_many 'requiredMaxAge' do
        extract Mida::DataType::Integer
      end

      # Audiences defined by a person's minimum age.
      has_many 'requiredMinAge' do
        extract Mida::DataType::Integer
      end

      # The gender of the person or audience.
      has_many 'suggestedGender'

      # Maximal age recommended for viewing content.
      has_many 'suggestedMaxAge' do
        extract Mida::DataType::Number
      end

      # Minimal age recommended for viewing content.
      has_many 'suggestedMinAge' do
        extract Mida::DataType::Number
      end
    end

  end
end
