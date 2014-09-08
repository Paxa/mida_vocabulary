require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'

    # A set of characteristics belonging to businesses, e.g. who compose an item's target audience.
    class BusinessAudience < Mida::Vocabulary
      itemtype %r{http://schema.org/BusinessAudience}i
      include_vocabulary Mida::SchemaOrg::Audience
      include_vocabulary Mida::SchemaOrg::Thing

      # The size of business by number of employees.
      has_many 'numberofEmployees' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The size of the business in annual revenue.
      has_many 'yearlyRevenue' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The age of the business.
      has_many 'yearsInOperation' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end
    end

  end
end
