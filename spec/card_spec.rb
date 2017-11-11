require 'spec_helper'

RSpec.describe 'Card' do
  let(:shape) { Triangle }
  let(:color) { Red }
  let(:fill) { Halftone }
  let(:count) { 2 }

  subject { Card.new([shape, color, fill, count]) }

  context 'card' do
    it 'has icons' do
      expect(subject).to_not be nil
      expect(subject.count).to be 2
    end

    it 'can read the shape' do
      expect(subject.shape).to be Triangle
    end

    it 'can read the color' do
      expect(subject.color).to be Red
    end

    it 'can read the fill' do
      expect(subject.fill).to be Halftone
    end
  end
end
