require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_title[name=?]", "comment[title]"

      assert_select "textarea#comment_content[name=?]", "comment[content]"
    end
  end
end
