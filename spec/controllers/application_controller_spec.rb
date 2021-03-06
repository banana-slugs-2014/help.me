require 'spec_helper'

describe ApplicationController do
  let(:myuser){FactoryGirl.create :user}

  context "when logged in" do
    before(:each){
      session[:user_id] = myuser.uid
    }
    context '#current_user' do
      it "should return the user" do
        expect(controller.current_user).to eq myuser
      end
    end

    context '#logged_in?' do
      before{
        controller.stub(current_user: myuser)
      }
      it {expect(controller.logged_in?).to be_true}
    end
  end

  context "When not logged in" do
    before(:each){session.clear}
    context '#current_user' do
      it "should return the user" do
        expect(controller.current_user).to be_nil
      end
    end

    context '#logged_in?' do
      before{
        controller.stub(current_user: nil)
      }
      it {expect(controller.logged_in?).to be_false}
    end
  end
end