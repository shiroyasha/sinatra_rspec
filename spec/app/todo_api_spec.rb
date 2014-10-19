require "spec_helper"

RSpec.describe TodoApi do

  def app
    TodoApi
  end

  describe "GET todos" do
    context "no todos" do
      it "returns no todos" do
        get "/"

        expect(last_response.body).to eq("")
        expect(last_response.status).to eq 200
      end
    end

    context "several todos" do
      before do
        @todos = ["hello", "world", "!"]
        $db = @todos
      end

      it "returns all the todos" do
        get "/"

        expect(last_response.body).to eq @todos.join("\n")
        expect(last_response.status).to eq 200
      end
    end
  end

  describe "POST todo" do
    it "returns status 200" do
      post "/", :todo => "hello rspec"

      expect(last_response.status).to eq 200
    end

    context "todo param missing" do
      it "returns status 400" do
        post "/"

        expect(last_response.status).to eq 400
      end
    end
  end

end
