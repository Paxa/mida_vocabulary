require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # Used to describe membership in a loyalty programs (e.g. "StarAliance"), traveler clubs (e.g. "AAA"), purchase clubs ("Safeway Club"), etc.
    class ProgramMembership < Mida::Vocabulary
      itemtype %r{http://schema.org/ProgramMembership}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The organization (airline, travelers' club, etc.) the membership is made with.
      has_many 'hostingOrganization' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals. Supercedes members, musicGroupMember. Inverse property: memberOf.
      has_many 'member' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A unique identifier for the membership.
      has_many 'membershipNumber'

      # The program providing the membership.
      has_many 'programName'
    end

  end
end
