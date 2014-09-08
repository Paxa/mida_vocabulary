require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalDevicePurpose, 'mida_vocabulary/vocabularies/schemaorg/medicaldevicepurpose'

    # The act of organizing tasks/objects/events by associating resources to it.
    class AllocateAction < Mida::Vocabulary
      itemtype %r{http://schema.org/AllocateAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A goal towards an action is taken. Can be concrete or abstract.
      has_many 'purpose' do
        extract Mida::SchemaOrg::MedicalDevicePurpose
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end
    end

  end
end
