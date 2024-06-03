require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "GET /users" do
    it "renders new user link" do
      visit users_path
      assert_text "New user"
    end
  end

  describe "GET /users/:id" do
    let(:user) { create(:user) }

    it "renders a details of a user" do
      visit user_path(user)

      assert_text "#{user.name}"
      assert_text "#{user.email}"
    end
  end

  describe "GET /users/new" do
    it "renders a new user form" do
      visit users_path

      click_on "New user"
      fill_in "Name", with: "User_Name"
      fill_in "Email", with: "aaa@mail.com"

      click_on "Create User"
      assert_text "User was successfully created."
    end
  end

  describe "GET /users/:id/edit" do
    let(:user) { create(:user)}

    it "show a details of a user" do
        visit edit_user_path(user)

        assert_text "Editing user"

        click_on "Update User"
        assert_text "User was successfully updated."
    end
  end

  describe "PATCH /users/:id/edit" do
    let(:user) {create(:user)}
    let(:new_name) {Gimei.new.kanji}
    let(:new_email) {"aaa@mail.com"}

    it "redirects to '/users/:id'" do
        visit edit_user_path(user)

        fill_in "Name", with: "#{new_name}"
        fill_in "Email", with: "#{new_email}"

        click_on "Update User"
        expect(page).to have_content("User was successfully updated.")
    end
  end

  describe "DELETE /users/:id" do
    let!(:user){ create(:user)}

    it "redirect_to '/users'" do
        visit user_path(user)

        click_on 'Destroy this user'
        expect(page).to have_content("User was successfully destroyed.")
    end
  end
end
