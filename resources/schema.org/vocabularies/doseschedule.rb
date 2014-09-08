require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A specific dosing schedule for a drug or supplement.
    class DoseSchedule < Mida::Vocabulary
      itemtype %r{http://schema.org/DoseSchedule}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The unit of the dose, e.g. 'mg'.
      has_many 'doseUnit'

      # The value of the dose, e.g. 500.
      has_many 'doseValue' do
        extract Mida::DataType::Number
      end

      # How often the dose is taken, e.g. 'daily'.
      has_many 'frequency'

      # Characteristics of the population for which this is intended, or which typically uses it, e.g. 'adults'.
      has_many 'targetPopulation'
    end

  end
end
