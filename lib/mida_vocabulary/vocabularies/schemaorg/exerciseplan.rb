require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PhysicalActivity, 'mida_vocabulary/vocabularies/schemaorg/physicalactivity'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :Energy, 'mida_vocabulary/vocabularies/schemaorg/energy'

    # Fitness-related activity designed for a specific health-related purpose, including defined exercise routines as well as activity prescribed by a clinician.
    class ExercisePlan < Mida::Vocabulary
      itemtype %r{http://schema.org/ExercisePlan}i
      include_vocabulary Mida::SchemaOrg::PhysicalActivity
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork

      # Length of time to engage in the activity.
      has_many 'activityDuration' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # How often one should engage in the activity.
      has_many 'activityFrequency'

      # Any additional component of the exercise prescription that may need to be articulated to the patient. This may include the order of exercises, the number of repetitions of movement, quantitative distance, progressions over time, etc.
      has_many 'additionalVariable'

      # Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.
      has_many 'exerciseType'

      # Quantitative measure gauging the degree of force involved in the exercise, for example, heartbeats per minute. May include the velocity of the movement.
      has_many 'intensity'

      # Number of times one should repeat the activity.
      has_many 'repetitions' do
        extract Mida::DataType::Number
      end

      # How often one should break from the activity.
      has_many 'restPeriods'

      # Quantitative measure of the physiologic output of the exercise; also referred to as energy expenditure.
      has_many 'workload' do
        extract Mida::SchemaOrg::Energy
        extract Mida::DataType::Text
      end
    end

  end
end
