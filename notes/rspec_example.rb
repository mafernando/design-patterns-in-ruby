require 'rspec/autorun'

class Dog
  def talk!
    'BARK'
  end
end

RSpec.describe Dog do
  it 'barks when spoken to' do
    expect(Dog.new.talk!).to eq('BARK')
  end
end
