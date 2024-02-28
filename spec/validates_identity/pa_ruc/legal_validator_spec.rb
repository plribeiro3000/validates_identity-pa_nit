# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::PaRuc::LegalValidator do
  it 'accepts 10121212-1-2000' do
    expect(described_class.new('10121212-1-2000')).to be_valid
  end

  it 'accepts 123456789-2-2045' do
    expect(described_class.new('123456789-2-2045')).to be_valid
  end

  it 'accepts 101111111-1-1999 (third generation of RUC for entities)' do
    expect(described_class.new('101111111-1-1999')).to be_valid
  end

  it 'accepts 999999999-2-2015 (fourth generation of RUC for commercial entities)' do
    expect(described_class.new('999999999-2-2015')).to be_valid
  end

  it 'accepts 23121212-3-2019 (fourth generation of RUC for non-commercial entities)' do
    expect(described_class.new('23121212-3-2019')).to be_valid
  end

  it 'rejects 10-01-23-123' do
    expect(described_class.new('10-01-23-123')).not_to be_valid
  end

  it 'rejects AA-123-123' do
    expect(described_class.new('AA-123-123')).not_to be_valid
  end

  it 'rejects 1-1' do
    expect(described_class.new('1-1')).not_to be_valid
  end

  it 'rejects 0-12-12' do
    expect(described_class.new('0-12-12')).not_to be_valid
  end

  it 'rejects 1-0-1' do
    expect(described_class.new('1-0-1')).not_to be_valid
  end

  it 'rejects 1-0' do
    expect(described_class.new('1-0')).not_to be_valid
  end

  it 'rejects A' do
    expect(described_class.new('A')).not_to be_valid
  end

  it 'accepts blank string' do
    expect(described_class.new('')).to be_valid
  end

  it 'accepts nil' do
    expect(described_class.new(nil)).to be_valid
  end
end
