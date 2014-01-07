require 'spec_helper'

describe "Mutations::FloatMoneyFilter" do

  it "allows string with dollar sign" do
    f = Mutations::FloatMoneyFilter.new
    filtered, errors = f.filter("$3.14")
    assert_equal 3.14, filtered
    assert_equal nil, errors
  end

  it "allows string with commas" do
    f = Mutations::FloatMoneyFilter.new
    filtered, errors = f.filter("3,123.14")
    assert_equal 3123.14, filtered
    assert_equal nil, errors
  end

  it "allows string with negatives" do
    f = Mutations::FloatMoneyFilter.new
    filtered, errors = f.filter("-3,123.14")
    assert_equal -3123.14, filtered
    assert_equal nil, errors
  end

  it "allows string with plus signs" do
    f = Mutations::FloatMoneyFilter.new
    filtered, errors = f.filter("+3,123.14")
    assert_equal 3123.14, filtered
    assert_equal nil, errors
  end

  it "doesnt't allow other strings, nor does it allow random objects or symbols" do
    f = Mutations::FloatFilter.new
    ["zero", {}, [], Object.new, :d].each do |thing|
      filtered, errors = f.filter(thing)
      assert_equal :float, errors
    end
  end

end
