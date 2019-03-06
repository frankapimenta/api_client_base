module ApiClientBase
  RSpec.describe Config do
    context "defines an environment" do
      specify { is_expected.to respond_to(:env).with(0).arguments }
    end
  end
end
