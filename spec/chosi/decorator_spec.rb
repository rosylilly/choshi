require 'spec_helper'

describe Chosi::Decorator do
  let(:source) { mock('source') }
  let(:view_context) { mock('view_context') }

  subject(:decorator) { described_class.new(source, view_context) }

  describe '#source' do
    subject { decorator.source }

    it { should == source }
  end

  describe '#view_context' do
    subject { decorator.view_context }

    it { should == view_context }
  end

  describe '#helper' do
    subject { decorator.helper }

    it { should == view_context }
  end

  describe '#method_missing' do
    subject(:method_missing) { decorator.send(:hello) }

    context 'when exists #hello' do
      example 'should call #hello' do
        source.expects(:hello).once
        method_missing
      end
    end

    context "when don't exists #hello" do
      example 'should raise NoMethodError' do
        expect { method_missing }.to raise_error(NoMethodError)
      end
    end
  end
end
