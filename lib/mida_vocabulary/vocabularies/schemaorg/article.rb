require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An article, such as a news article or piece of investigative report. Newspapers and magazines have articles of many different types and this is intended to cover them all.
    class Article < Mida::Vocabulary
      itemtype %r{http://schema.org/Article}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The actual body of the article.
      has_many 'articleBody'

      # Articles may belong to one or more 'sections' in a magazine or newspaper, such as Sports, Lifestyle, etc.
      has_many 'articleSection'

      # The page on which the work ends; for example "138" or "xvi".
      has_many 'pageEnd' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end

      # The page on which the work starts; for example "135" or "xiii".
      has_many 'pageStart' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end

      # Any description of pages that is not separated into pageStart and pageEnd; for example, "1-6, 9, 55" or "10-12, 46-49".
      has_many 'pagination'

      # The number of words in the text of the Article.
      has_many 'wordCount' do
        extract Mida::DataType::Integer
      end
    end

  end
end
