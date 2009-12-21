require 'spec_helper'

describe MembersController do
  mock_models :member

  as :visitor, :get => :new do
    it { should respond_with(:success) }
  end

  as :visitor, :get => :index do
    before { Member.should_receive(:metrics).and_return({}) }
    before { Member.should_receive(:dormant).and_return([]) }
    before { Member.should_receive(:active).and_return([])  }
    it { should respond_with(:success) }
    it { should render_template(:index)}
  end

  as :visitor, :get => :show, :id => 'foo' do
    before { Member.should_receive(:find).with('foo').and_return(mock_member) }
    it { should respond_with(:success) }
    it { should render_template(:show) }
  end
  
  as :visitor, :get => :edit, :id => 'foo' do
    before { Member.should_receive(:find).with('foo').and_return(mock_member) }
    it { should render_template(:edit) }
  end
  
  as :visitor, :post => :update, :id => 'foo', :member => 'someinput' do
    before { Member.should_receive(:find).with('foo').and_return(mock_member) }
    before { mock_member.should_receive(:update_attributes).with('someinput').and_return(true) }
    it { should redirect_to(member_url(mock_member)) }
  end

  as :visitor, :post => :create, :member => 'someparams' do
    describe "with valid params" do
      before { Member.should_receive(:new).with('someparams').and_return(mock_member) }
      before { mock_member.should_receive(:save).and_return(true) }
      it { should redirect_to(members_url) }
    end
  end
  
  as :visitor, :get => :edit, :id => "foo" do
    before { Member.should_receive(:find).with("foo").and_return(mock_member) }
    it { should render_template(:edit) }
  end
  
  as :visitor, :post => :update, :id => "bar", :member => 'someparams' do
    before { Member.should_receive(:find).with("bar").and_return(mock_member) }
    before { mock_member.should_receive(:update_attributes).with("someparams").and_return(true) }
    it { should redirect_to(member_url(mock_member)) }
  end
  
  
end