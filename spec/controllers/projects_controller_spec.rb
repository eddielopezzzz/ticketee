require 'spec_helper'

describe ProjectsController do
  
  let(:user) do
    user = Factory(:user)
    user.confirm!
    user
  end
  
  context "standard users" do
    it "cannot access the new action" do
      sign_in(:user, user)
      get :new
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that.")
    end
    
    it "cannot access the show action" do
      sign_in(:user, user)
      get :show, :id => project.id
      response.should redirect_to(projects_path)
      flash[:alert].should eql("The project you were looking for could not be found.")
    end
  end
  
  it "displays an error for a missing project" do
    get :show, :id =>"blah"
    response.should redirect_to(projects_path)
    message = "The project you were looking for could not be found"
    flash[:alert].should eql(message)
  end
end
