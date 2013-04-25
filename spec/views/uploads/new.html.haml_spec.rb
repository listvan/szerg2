require 'spec_helper'

describe "uploads/new" do
  before(:each) do
    assign(:upload, stub_model(Upload,
      :path => "MyString",
      :name => "MyString",
      :size => 1,
      :content_type => "MyString",
      :file => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new upload form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", uploads_path, "post" do
      assert_select "input#upload_path[name=?]", "upload[path]"
      assert_select "input#upload_name[name=?]", "upload[name]"
      assert_select "input#upload_size[name=?]", "upload[size]"
      assert_select "input#upload_content_type[name=?]", "upload[content_type]"
      assert_select "input#upload_file[name=?]", "upload[file]"
      assert_select "input#upload_user_id[name=?]", "upload[user_id]"
    end
  end
end
