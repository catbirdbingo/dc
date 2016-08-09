require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :title => "MyString",
      :body => "MyText",
      :is_done => false,
      :user => nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_body[name=?]", "task[body]"

      assert_select "input#task_is_done[name=?]", "task[is_done]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"
    end
  end
end
