require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :title => "MyString",
      :body => "MyText",
      :is_done => false,
      :user => nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_body[name=?]", "task[body]"

      assert_select "input#task_is_done[name=?]", "task[is_done]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"
    end
  end
end
