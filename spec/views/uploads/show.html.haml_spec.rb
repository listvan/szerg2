require 'spec_helper'

describe "uploads/show" do
  before(:each) do
    @upload = assign(:upload, stub_model(Upload,
      :path => "Path",
      :name => "Name",
      :size => 1,
      :content_type => "Content Type",
      :file => "File",
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Path/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Content Type/)
    rendered.should match(/File/)
    rendered.should match(/2/)
  end
end
