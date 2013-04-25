require 'spec_helper'

describe "uploads/index" do
  before(:each) do
    assign(:uploads, [
      stub_model(Upload,
        :path => "Path",
        :name => "Name",
        :size => 1,
        :content_type => "Content Type",
        :file => "File",
        :user_id => 2
      ),
      stub_model(Upload,
        :path => "Path",
        :name => "Name",
        :size => 1,
        :content_type => "Content Type",
        :file => "File",
        :user_id => 2
      )
    ])
  end

  it "renders a list of uploads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
