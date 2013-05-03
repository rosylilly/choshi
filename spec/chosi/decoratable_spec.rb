require 'spec_helper'

class Foo; end
class FooDecorator < Chosi::Decorator; end
class Foo::Bar; end
class Foo::BarDecorator < Chosi::Decorator; end

describe Chosi::Decoratable do
  let(:view_context) { stubs('view_context') }

  subject(:decoratable) do
    Object.new.tap do |decoratable|
      decoratable.extend(described_class)
      decoratable.stubs(:view_context).returns(view_context)
    end
  end

  describe '#decorate' do
    let(:object) { Hash.new }
    let(:decorator) { Class.new(Chosi::Decorator) }

    context 'without decorator option' do
      subject(:decorated_object) { decoratable.decorate(object) }

      example do
        decoratable.expects(:decorator_for).with(object).returns(decorator)
        expect(decorated_object).to be_a(decorator)
      end
    end

    context 'with decorator option' do
      subject(:decorated_object) do
        decoratable.decorate(object, decorator: decorator)
      end

      example do
        expect(decorated_object).to be_a(decorator)
      end
    end
  end

  describe '#decorator_for' do
    subject(:decorator) { decoratable.decorator_for(object) }

    context 'when object is a instance of Foo' do
      let(:object) { Foo.new }

      it { should == FooDecorator }
    end

    context 'when object is a instance of Foo::Bar' do
      let(:object) { Foo::Bar.new }

      it { should == Foo::BarDecorator }
    end
  end
end
