require 'rspec'
require 'tree'

describe 'Tree' do
  before { @tree = Tree.new }

  it 'should have 0 height when new' do
    expect(@tree.height).to eq 0
  end

  it 'should have 0 age when new' do
    expect(@tree.age).to eq 0
  end

  it 'should have 0 apples when new' do
    expect(@tree.apples.count).to eq 0
  end

  it 'should increase age by one year when aging' do
    @tree.age!
    expect(@tree.age).to eq 1
  end

  it 'should increase in height when aging' do
    @tree.age!
    originalHeight = @tree.height
    @tree.age!
    expect(@tree.height).to be > originalHeight
  end

  it 'should have more apples after adding apples' do
    originalCount = @tree.apples.count
    @tree.add_apples
    expect(@tree.apples.count).to be > originalCount
  end

  it 'should return an apple when picking an apple' do
    @tree.add_apples
    appleColors = [:red, :green, :yellow]
    picked = @tree.pick_an_apple!
    expect(appleColors.include? picked.color).to be_truthy
  end

  it 'should have one less apple after picking an apple' do
    @tree.add_apples
    originalCount = @tree.apples.count
    @tree.pick_an_apple!

    expect(@tree.apples.count).to eq originalCount - 1
  end

  it 'should raise an error when picking an apple when there are no apples' do
    expect { @tree.pick_an_apple! }.to raise_error NoApplesError
  end

end

describe 'Fruit' do
end

describe 'Apple' do
end
