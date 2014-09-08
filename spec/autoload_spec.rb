require 'json'
require 'spec_helper'
require 'mida_vocabulary'

describe Mida::Vocabulary, 'auto loading' do
  before do
    Mida::SchemaOrg.forget_all!
  end
  after :all do
    Mida::SchemaOrg.forget_all!
  end

  it "should load class" do
    before_hit = $LOADED_FEATURES.dup

    Mida::SchemaOrg.const_defined?(:Airline, false).should == false
    Mida::SchemaOrg::Airline
    Mida::SchemaOrg.const_defined?(:Airline, false).should == true

    ($LOADED_FEATURES - before_hit).size.should > 0
  end

  it "should load simple vacab" do
    Mida::SchemaOrg::Thing.to_s.should == "Mida::SchemaOrg::Thing"
    Mida::SchemaOrg::Attorney.to_s.should == "Mida::SchemaOrg::Attorney"
  end

  it "should find by const name" do
    Mida::Vocabulary.find(:Thing).to_s.should == "Mida::SchemaOrg::Thing"
    Mida::Vocabulary.find(:Thing).to_s.should == "Mida::SchemaOrg::Thing"
    Mida::Vocabulary.find(:WholesaleStore).to_s.should == "Mida::SchemaOrg::WholesaleStore"
    Mida::Vocabulary.find(:OfferAggregate).to_s.should == "Mida::DataVocabulary::OfferAggregate"
  end

  it "should find by part name" do
    Mida::Vocabulary.find('http://schema.org/AutomotiveBusiness').to_s.should == "Mida::SchemaOrg::AutomotiveBusiness"
  end

  it "should load properties" do
    Mida::SchemaOrg::BlogPosting.included_vocabularies.should ==
      Set.new([Mida::SchemaOrg::Thing, Mida::SchemaOrg::CreativeWork, Mida::SchemaOrg::Article])

    props = Mida::SchemaOrg::BlogPosting.properties.keys
    props.should include('articleBody')
    props.should include('additionalType')
    props.should include('accessibilityAPI')
  end

  # Load every class an hit autoloader
  it "should load every file" do
    types = JSON.parse(File.open(File.dirname(__FILE__) + '/../resources/schema.org/vocabularies.json', 'r:utf-8', &:read))
    types.each do |type|
      next if type['name'] == 'Class'
      klass = Mida::SchemaOrg.const_get(type['name'], false)
      klass.is_a?(Class).should == true

      Mida::SchemaOrg.constants.should include(type['name'].to_sym)
      klass.to_s.should == "Mida::SchemaOrg::#{type['name']}"
    end
  end
end