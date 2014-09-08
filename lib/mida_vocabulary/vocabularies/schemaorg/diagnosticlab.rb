require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :LocalBusiness, 'mida_vocabulary/vocabularies/schemaorg/localbusiness'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :MedicalTest, 'mida_vocabulary/vocabularies/schemaorg/medicaltest'

    # A medical laboratory that offers on-site or off-site diagnostic services.
    class DiagnosticLab < Mida::Vocabulary
      itemtype %r{http://schema.org/DiagnosticLab}i
      include_vocabulary Mida::SchemaOrg::LocalBusiness
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place

      # A diagnostic test or procedure offered by this lab.
      has_many 'availableTest' do
        extract Mida::SchemaOrg::MedicalTest
        extract Mida::DataType::Text
      end
    end

  end
end
