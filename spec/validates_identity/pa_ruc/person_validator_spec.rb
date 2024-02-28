# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::PaRuc::PersonValidator do
  it 'accepts 10-1-123' do
    expect(described_class.new('10-1-123')).to be_valid
  end

  it 'accepts 10-111111-123' do
    expect(described_class.new('10-111111-123')).to be_valid
  end

  it 'accepts 1-234-123' do
    expect(described_class.new('1-234-123')).to be_valid
  end

  it 'accepts 9-234-123' do
    expect(described_class.new('9-234-123')).to be_valid
  end

  it 'accepts PE-23-123' do
    expect(described_class.new('PE-23-123')).to be_valid
  end

  it 'accepts N-42-123' do
    expect(described_class.new('N-42-123')).to be_valid
  end

  it 'accepts NB-234-123' do
    expect(described_class.new('NB-234-123')).to be_valid
  end

  it 'rejects 10-0123-123' do
    expect(described_class.new('10-0123-123')).not_to be_valid
  end

  it 'rejects 90-234-123' do
    expect(described_class.new('90-234-123')).not_to be_valid
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
