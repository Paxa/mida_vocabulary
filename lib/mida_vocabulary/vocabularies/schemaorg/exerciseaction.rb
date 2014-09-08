require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PlayAction, 'mida_vocabulary/vocabularies/schemaorg/playaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :Diet, 'mida_vocabulary/vocabularies/schemaorg/diet'
    autoload :Distance, 'mida_vocabulary/vocabularies/schemaorg/distance'
    autoload :ExercisePlan, 'mida_vocabulary/vocabularies/schemaorg/exerciseplan'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :SportsActivityLocation, 'mida_vocabulary/vocabularies/schemaorg/sportsactivitylocation'
    autoload :SportsEvent, 'mida_vocabulary/vocabularies/schemaorg/sportsevent'
    autoload :SportsTeam, 'mida_vocabulary/vocabularies/schemaorg/sportsteam'

    # The act of participating in exertive activity for the purposes of improving health and fitness
    class ExerciseAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ExerciseAction}i
      include_vocabulary Mida::SchemaOrg::PlayAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of location. The course where this action was taken.
      has_many 'course' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # A sub property of instrument. The diet used in this action.
      has_many 'diet' do
        extract Mida::SchemaOrg::Diet
        extract Mida::DataType::Text
      end

      # The distance travelled, e.g. exercising or travelling.
      has_many 'distance' do
        extract Mida::SchemaOrg::Distance
        extract Mida::DataType::Text
      end

      # A sub property of instrument. The exercise plan used on this action.
      has_many 'exercisePlan' do
        extract Mida::SchemaOrg::ExercisePlan
        extract Mida::DataType::Text
      end

      # Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.
      has_many 'exerciseType'

      # A sub property of location. The original location of the object or the agent before the action.
      has_many 'fromLocation' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # A sub property of participant. The opponent on this action.
      has_many 'opponent' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A sub property of location. The sports activity location where this action occurred.
      has_many 'sportsActivityLocation' do
        extract Mida::SchemaOrg::SportsActivityLocation
        extract Mida::DataType::Text
      end

      # A sub property of location. The sports event where this action occurred.
      has_many 'sportsEvent' do
        extract Mida::SchemaOrg::SportsEvent
        extract Mida::DataType::Text
      end

      # A sub property of participant. The sports team that participated on this action.
      has_many 'sportsTeam' do
        extract Mida::SchemaOrg::SportsTeam
        extract Mida::DataType::Text
      end

      # A sub property of location. The final location of the object or the agent after the action.
      has_many 'toLocation' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end
    end

  end
end
