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
    specify "should load configurations on setting new env" do
      expect(subject.env).to eq :default
      expect(subject).to receive(:def_methods_for_loaded_configurations).and_call_original

      subject.env = :test

      expect(subject.env).to eq :test
      expect(subject.ssl).to be_truthy
      expect(subject.api_auth_token).to eq 'test-secret'
    end
    context "#api_auth_token" do
      subject { described_class.new env: :development }
      specify { expect(subject).to respond_to(:api_auth_token).with(0).arguments }
      specify { expect(subject.api_auth_token).to eq 'secret' } #defined in config file
    end
    context "#api_auth_token=" do
      subject { described_class.new env: :development }
      specify { expect(subject).to respond_to(:api_auth_token=).with(1).arguments }
      specify "sets token" do
        expect(subject.api_auth_token).to eq 'secret' # loaded from file
        subject.api_auth_token = "new token"
        expect(subject.api_auth_token).to eq "new token"
      end
    end
    context "#file_name" do
      specify { expect(subject).to respond_to(:file_name).with(0).arguments }
      specify "has default of api_client_base.yml" do
        expect(subject.file_name).to eq 'api_client_base.yml'
      end
    end
    specify "raises error if given file_name on initialization does not exist" do
      expect { described_class.new(file_name: 'config.yml') }.to raise_error Error, "configuration file /Users/frankpimenta/Development/Gems/api_client_base/config/config.yml does not exist"
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
      specify{ expect(subject.ssl).to be_falsey }
    end
    context("#ssl=") do
      subject { described_class.new env: :development }
      specify "changes value" do
        expect(subject.ssl).to be_falsey
        subject.ssl = true
        expect(subject.ssl).to be_truthy
      end
    end
  end
end
