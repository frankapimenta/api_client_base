module ApiClientBase
  RSpec.describe ClientBase do
    specify { expect(described_class).to be_a Class }
    context "has an environment defined" do
      specify { is_expected.to respond_to(:env).with(0).arguments }
      specify("development as default environment") do
        expect(subject.env).to eq :development
      end
    end
  end
end
