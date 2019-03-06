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
    context "#file_name" do
      specify { expect(subject).to respond_to(:file_name).with(0).arguments }
      specify "has default of api_client_base.yml" do
        expect(subject.file_name).to eq 'api_client_base.yml'
      end
    end
    specify "defines configuration file name on initialization" do
      allow_any_instance_of(described_class).to receive(:load_configurations)
      expect(described_class.new(file_name: 'config.yml').file_name).to eq 'config.yml'
    end
    context "#config_path" do
      specify { expect(subject).to respond_to(:config_path).with(0).arguments }
      specify { expect(subject.config_path).to be_instance_of(Pathname) }
      specify { expect(subject.config_path.realdirpath.to_s).to eq File.expand_path("config") }
    end
    context "#file_path" do
      specify { expect(subject).to respond_to(:file_path).with(0).arguments }
      specify { expect(subject.file_path).to be_instance_of(String) }
      specify { expect(subject.file_path).to eq "#{subject.config_path}/#{subject.file_name}" }
    end
    context "#configurations" do
      subject { described_class.new env: :development }
      specify { expect(subject).to respond_to(:configurations).with(0).arguments }
      specify { expect(subject.configurations).to be_instance_of Hash }
      specify { expect(subject.configurations["ssl"]).to be_falsey }
    end
    context "#ssl" do
      subject { described_class.new env: :development }
      specify "loads configurations on init" do
        expect_any_instance_of(described_class).to receive(:load_configurations)
        subject
      end
      specify "defines @ssl" do
        subject.ssl
        expect(subject.instance_variables).to include(:@ssl)
      end
      specify { expect(subject.ssl).to be_falsey }
    end
  end
end
