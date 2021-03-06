RSpec.describe Matchers::GitHost::Matcher do
  subject do
    Matchers::GitHost::Matcher.(issue_url) do |m|
      m.success(:github){ |params| params }
      m.success(:gitlab){ |params| params }
      m.failure { |params| params }
    end
  end

  context 'when string is github issue' do
    let(:issue_url) { 'https://github.com/hanami/hanami/issues/663' }
    it { expect(subject).to eq(org: 'hanami', repo: 'hanami', issue: '663') }
  end

  context 'when string is other github issue' do
    let(:issue_url) { 'https://github.com/davydovanton/sidekiq-statistic/issues/75' }
    it { expect(subject).to eq(org: 'davydovanton', repo: 'sidekiq-statistic', issue: '75') }
  end

  context 'when string is invalid github issue' do
    let(:issue_url) { 'https://api.github.com/repos/hanami/hanami/issues/663' }
    it { expect(subject).to eq(nil) }
  end

  context 'when string is github issue, containing dots' do
    let(:issue_url) { 'https://github.com/hanami/hanami.github.io/issues/663' }
    it { expect(subject).to eq(org: 'hanami', repo: 'hanami.github.io', issue: '663') }
  end

  context 'when string is gitlab issue' do
    let(:issue_url) { 'https://gitlab.com/hanami/hanami/issues/663' }
    it { expect(subject).to eq(org: 'hanami', repo: 'hanami', issue: '663') }
  end
end
