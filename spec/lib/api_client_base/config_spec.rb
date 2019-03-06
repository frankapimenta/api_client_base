module ApiClientBase
  RSpec.describe Config do
    context "defines an environment" do
      specify { is_expected.to respond_to(:env).with(0).arguments }
      specify { expect(subject.env).to eq :default }
    end
    specify "defines environment on initialization" do
      expect(described_class.new(env: :development).env).to eq :development
    end
    specify "sets environment" do
      expect(subject.env).to eq :default
      subject.env = :production
      expect(subject.env).to eq :production
    end
  end
end
