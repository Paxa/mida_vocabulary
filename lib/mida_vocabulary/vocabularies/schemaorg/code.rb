require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :SoftwareApplication, 'mida_vocabulary/vocabularies/schemaorg/softwareapplication'

    # Computer programming source code. Example: Full (compile ready) solutions, code snippet samples, scripts, templates.
    class Code < Mida::Vocabulary
      itemtype %r{http://schema.org/Code}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # Link to the repository where the un-compiled, human readable code and related code is located (SVN, github, CodePlex)
      has_many 'codeRepository' do
        extract Mida::DataType::URL
      end

      # The computer programming language.
      has_many 'programmingLanguage' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # Runtime platform or script interpreter dependencies (Example - Java v1, Python2.3, .Net Framework 3.0)
      has_many 'runtime'

      # Full (compile ready) solution, code snippet, inline code, scripts, template.
      has_many 'sampleType'

      # Target Operating System / Product to which the code applies.  If applies to several versions, just the product name can be used.
      has_many 'targetProduct' do
        extract Mida::SchemaOrg::SoftwareApplication
        extract Mida::DataType::Text
      end
    end

  end
end
