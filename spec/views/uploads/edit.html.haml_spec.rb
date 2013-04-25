require 'spec_helper'

describe "uploads/edit" do
  before(:each) do
    @upload = assign(:upload, stub_model(Upload,
      :path => "MyString",
      :name => "MyString",
      :size => 1,
      :content_type => "MyString",
      :file => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit upload form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", upload_path(@upload), "post" do
      assert_select "input#upload_path[name=?]", "upload[path]"
      assert_select "input#upload_name[name=?]", "upload[name]"
      assert_select "input#upload_size[name=?]", "upload[size]"
      assert_select "input#upload_content_type[name=?]", "upload[content_type]"
      assert_select "input#upload_file[name=?]", "upload[file]"
      assert_select "input#upload_user_id[name=?]", "upload[user_id]"
    end
  end
end
