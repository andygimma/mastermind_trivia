require 'spec_helper'

describe ApiController do

  describe "GET 'questions'" do
    it "returns http success" do
      get 'questions'
      response.should be_success
    end
  end

end
