require 'rspec'
require 'tree'

describe 'Tree' do
  # it 'should be a Class' do
  #   expect(Tree.is_a? Class).to be_true
  # end
  it 'should have 0 height when new' do
    tree = Tree.new
    expect(tree.height).to eq 0
  end

  it 'should have 0 age when new' do
    tree = Tree.new
    expect(tree.age).to eq 0
  end

  it 'should have 0 apples when new' do
    tree = Tree.new
    expect(tree.apples.count).to eq 0
  end

  it 'should should increase age by one year when aging' do
    tree = Tree.new
    tree.age!
    expect(tree.age).to eq 1
  end

  it 'should have more apples after adding apples' do
    tree = Tree.new
    originalCount = tree.apples.count
    tree.add_apples
    expect(tree.apples.count).to be > originalCount
  end

end

describe 'Fruit' do
end

describe 'Apple' do
end
