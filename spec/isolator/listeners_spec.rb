# frozen_string_literal: true

require "spec_helper"

RSpec.describe Isolator::Listeners do
  subject { described_class }

  let(:listener_double) { double(enable!: true, disable!: true, infer!: true) }

  before { described_class.register(listener_double) }
  after { described_class.reset }

  describe '.enable!' do
    it 'enables listners' do
      expect(listener_double).to receive(:enable!).once

      described_class.enable!
    end
  end

  describe '.infer!' do
    it 'disables listeners' do
      expect(listener_double).to receive(:disable!).once

      described_class.infer!
    end

    it 'makes listeners to infer' do
      expect(listener_double).to receive(:infer!).once

      described_class.infer!
    end
  end
end
