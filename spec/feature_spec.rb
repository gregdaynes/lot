require 'spec_helper'

RSpec.describe 'Color' do
  context 'red' do
    subject { Red.new }

    it { is_expected.to be_a Red }
    it { is_expected.to_not be_a Green }
    it { is_expected.to_not be_a Blue }
  end

  context 'green' do
    subject { Green.new }

    it { is_expected.to_not be_a Red }
    it { is_expected.to be_a Green }
    it { is_expected.to_not be_a Blue }
  end

  context 'blue' do
    subject { Blue.new }

    it { is_expected.to_not be_a Red }
    it { is_expected.to_not be_a Green }
    it { is_expected.to be_a Blue }
  end
end

RSpec.describe 'Shape' do
  context 'triangle' do
    subject { Triangle.new }

    it { is_expected.to be_a Triangle }
    it { is_expected.to_not be_a Square }
    it { is_expected.to_not be_a Circle }
  end

  context 'Square' do
    subject { Square.new }

    it { is_expected.to_not be_a Triangle }
    it { is_expected.to be_a Square }
    it { is_expected.to_not be_a Circle }
  end

  context 'Circle' do
    subject { Circle.new }

    it { is_expected.to_not be_a Triangle }
    it { is_expected.to_not be_a Square }
    it { is_expected.to be_a Circle }
  end
end

RSpec.describe 'Fill' do
  context 'empty' do
    subject { Empty.new }

    it { is_expected.to be_a Empty }
    it { is_expected.to_not be_a Halftone }
    it { is_expected.to_not be_a Solid }
  end

  context 'halftone' do
    subject { Halftone.new }

    it { is_expected.to_not be_a Empty }
    it { is_expected.to be_a Halftone }
    it { is_expected.to_not be_a Solid }
  end

  context 'Solid' do
    subject { Solid.new }

    it { is_expected.to_not be_a Empty }
    it { is_expected.to_not be_a Halftone }
    it { is_expected.to be_a Solid }
  end
end
