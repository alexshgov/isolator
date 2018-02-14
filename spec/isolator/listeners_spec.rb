# frozen_string_literal: true

require "spec_helper"

RSpec.describe Isolator::Listeners do
  subject { described_class }

  let(:listener_double) { double(enable!: true, disable!: true, infer!: true) }

  before { described_class.register(listener_double) }

  describe '.enable!' do
    it 'enables listners' do
      expect(listener_double).to receive(:enable!).once

      described_class.enable!
    end
  end

  describe '.infer!' do
    after { described_class.infer! }

    it 'disables listeners' do
      expect(listener_double).to receive(:disable!).once
    end

    it 'makes listeners to infer' do
      expect(listener_double).to receive(:infer!).once
    end
  end
end
