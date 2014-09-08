require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTest, 'mida_vocabulary/vocabularies/schemaorg/medicaltest'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalImagingTechnique, 'mida_vocabulary/vocabularies/schemaorg/medicalimagingtechnique'

    # Any medical imaging modality typically used for diagnostic purposes.
    class ImagingTest < Mida::Vocabulary
      itemtype %r{http://schema.org/ImagingTest}i
      include_vocabulary Mida::SchemaOrg::MedicalTest
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # Imaging technique used.
      has_many 'imagingTechnique' do
        extract Mida::SchemaOrg::MedicalImagingTechnique
      end
    end

  end
end
