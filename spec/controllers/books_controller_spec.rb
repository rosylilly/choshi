require 'spec_helper'

describe BooksController do
  render_views

  describe 'GET index' do
    let!(:user) { User.create(:first_name => 'Yamada', :last_name => 'Taro') }
    let!(:book) { Book.create(:user => user, :title => 'hon') }

    before { get :index, :user_id => user.id }

    example do
      expect(response.body).to match("#{user.first_name}'s")
      expect(response.body).to match(book.title)
      expect(response.body).to match("#{user.first_name} #{user.last_name}")
    end
  end
end
