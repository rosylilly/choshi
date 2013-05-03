require 'spec_helper'

describe UsersController do
  describe 'GET index' do
    let!(:sho_kusano) { User.create(:first_name => 'Sho', :last_name => 'Kusano') }
    let!(:rosylilly) { User.create(:first_name => 'rosylilly') }

    before { get :index }

    example do
      expect(assigns(:users)[0].name).to eq('Sho Kusano')
      expect(assigns(:users)[1].name).to eq('rosylilly')
    end
  end

  describe 'GET show' do
    let(:user) { User.create(:first_name => 'Sho', :last_name => 'Kusano') }

    before { get :show, :id => user.id }

    example do
      expect(assigns(:user).name).to eq('Sho Kusano')
    end

    example do
      expect(assigns(:user).full_name).to eq('Sho Kusano')
    end
  end
end
