require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  context 'routes' do
    it { should route(:get, '/inventories').to(action: :index) }
    it { should route(:get, '/inventories/1').to(action: :show, id: 1) }
    it { should route(:post, '/inventories').to(action: :create) }
    it { should route(:get, '/inventories/new').to(action: :new) }
  end

  context 'GET #new' do
    before { get :new }

    it { should render_template('new') }
    it { should respond_with(200) }
  end

  context 'GET #index' do
    before { get :index }

    it { should render_template('index') }
    it { should respond_with(200) }
  end

  context 'GET #show' do
    before { get :show }

    it { should render_template('show') }
    it { should respond_with(200) }
  end
end
