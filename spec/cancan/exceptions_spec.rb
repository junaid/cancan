require "spec_helper"

describe CanCan::AccessDenied do
  describe "with action and subject" do
    before(:each) do
      @exception = CanCan::AccessDenied.new(nil, :some_action, :some_subject)
    end

    it "should have action and subject accessors" do
      @exception.action.should == :some_action
      @exception.subject.should == :some_subject
    end

    it "should have a changable default message" do
      @exception.message.should == "You are not authorized to access this page."
      @exception.default_message = "Unauthorized!"
      @exception.message.should == "Unauthorized!"
    end
  end

  describe "with only a message" do
    before(:each) do
      @exception = CanCan::AccessDenied.new("Access denied!")
    end

    it "should have nil action and subject" do
      @exception.action.should be_nil
      @exception.subject.should be_nil
      @exception.redirect_url.should == "/"
    end

    it "should have passed message" do
      @exception.message.should == "Access denied!"
    end
  end

  describe "with custom_message, action, subject and redirect_url" do
    before(:each) do
      @exception = CanCan::AccessDenied.new("you have to login to access this page.", :some_action, :some_subject, "/login")      
    end

    it "should have message, action, subject and redirect_url" do
      @exception.message.should == "you have to login to access this page."
      @exception.action.should == :some_action
      @exception.subject == :some_subject
      @exception.redirect_url == "/login"
    end    
  end
end
