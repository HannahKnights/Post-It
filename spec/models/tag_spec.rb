require 'spec_helper'


describe Tag do

  it "reuses tags if they exist already" do
    2.times { create(:post) }
    expect(Post.count).to eq 2
    expect(Tag.count).to eq 1
  end

  it "converts tags to downcase" do
    create(:post, content: '#TesT')
    expect(Tag.first.name).to eq 'test'
  end

end
