module ContextMacros
  def context_create
    fill_in      "body", with: "example body"
    attach_file  "context_img", "app/assets/images/dog.jpg"
    fill_in      "category",    with: "category"
    click_on "登録する"
  end

  def context_edit
    fill_in      "body", with: "edit body"
    attach_file  "context_img", "app/assets/images/dog.jpg"
    fill_in      "category",    with: "edit"
    click_on "登録する"
  end
end
