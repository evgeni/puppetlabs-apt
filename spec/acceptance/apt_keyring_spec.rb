# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'apt::keyring' do
  context 'when using default values and source specified explicitly' do
    keyring_pp = <<-MANIFEST
     apt::keyring { 'puppetlabs-keyring.gpg':
  	 source => 'https://apt.puppetlabs.com/keyring.gpg',
    }
    MANIFEST

    it 'applies idempotently' do
      retry_on_error_matching do
        idempotent_apply(keyring_pp)
      end
    end

    it 'expects file to be present at default location' do
      run_shell('rm /etc/apt/keyrings/puppetlabs-keyring.gpg')
    end
  end
end
