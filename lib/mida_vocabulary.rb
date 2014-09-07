start_time = Time.now
$LOAD_PATH.unshift File.dirname(__FILE__)

# Mida is a Microdata parser and extractor.


Dir[File.dirname(__FILE__) + '/mida_vocabulary/*.rb'].each { |f| require f }

require 'mida_vocabulary/vocabularies/genericvocabulary'
require 'mida_vocabulary/vocabularies/schemaorg'
require 'mida_vocabulary/vocabularies/data_vocabulary'