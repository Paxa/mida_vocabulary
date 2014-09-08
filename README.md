# Mida Vocabulary

## Description
Vocabularies for gem Mida and gem green_monkey

Main goal - make lightweight vocabulary set, that not requires nokogiri

## Refresh data

* Make new `vocabularies.json` using schema.org_scraper
* put it in `resources/schema.org`
* run `ruby generate.rb`
* copy `resources/schema.org/vocabularies/*` => `lib/mida_vocabulary/vocabularies/schemaorg`

## Licence
This software is licensed under the MIT Licence.
