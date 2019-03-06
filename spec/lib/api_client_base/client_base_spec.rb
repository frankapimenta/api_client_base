module ApiClientBase
  RSpec.describe ClientBase do
    specify { expect(described_class).to be_a Class }
    context "has an environment defined" do
      specify { is_expected.to respond_to(:env).with(0).arguments }
      specify("development as default environment") do
        expect(subject.env).to eq :development
      end
    end
    context "sets environment on initialization" do
      subject { described_class.new(env: :staging) }
      specify { expect { subject }.not_to raise_error }
      specify { expect(subject.env).to eq :staging }
    end
    context "defines a config instance for class" do
      specify { is_expected.to respond_to(:config).with(0).arguments }
      specify { expect(subject.config).to be_instance_of Config }
    end
  end
end
