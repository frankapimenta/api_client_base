RSpec.describe ApiClientBase do
  specify "has class Error defined" do
    expect(ApiClientBase::Error).to be_a Class
  end
end
