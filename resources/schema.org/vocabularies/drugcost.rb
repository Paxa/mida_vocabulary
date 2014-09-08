require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AdministrativeArea, 'mida_vocabulary/vocabularies/schemaorg/administrativearea'
    autoload :DrugCostCategory, 'mida_vocabulary/vocabularies/schemaorg/drugcostcategory'

    # The cost per unit of a medical drug. Note that this type is not meant to represent the price in an offer of a drug for sale; see the Offer type for that. This type will typically be used to tag wholesale or average retail cost of a drug, or maximum reimbursable cost. Costs of medical drugs vary widely depending on how and where they are paid for, so while this type captures some of the variables, costs should be used with caution by consumers of this schema's markup.
    class DrugCost < Mida::Vocabulary
      itemtype %r{http://schema.org/DrugCost}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The location in which the status applies.
      has_many 'applicableLocation' do
        extract Mida::SchemaOrg::AdministrativeArea
        extract Mida::DataType::Text
      end

      # The category of cost, such as wholesale, retail, reimbursement cap, etc.
      has_many 'costCategory' do
        extract Mida::SchemaOrg::DrugCostCategory
      end

      # The currency (in 3-letter ISO 4217 format) of the drug cost.
      has_many 'costCurrency'

      # Additional details to capture the origin of the cost data. For example, 'Medicare Part B'.
      has_many 'costOrigin'

      # The cost per unit of the drug.
      has_many 'costPerUnit' do
        extract Mida::DataType::Number
        extract Mida::DataType::Text
      end

      # The unit in which the drug is measured, e.g. '5 mg tablet'.
      has_many 'drugUnit'
    end

  end
end
