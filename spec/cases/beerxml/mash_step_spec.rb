require 'shared/active_model_lint'
require 'shared/record_typing'

describe NRB::BeerXML::MashStep do

  it_behaves_like :ActiveModel

  let(:subject) { described_class.new type: type }
  let(:type) { "Temperature" }

  it { should validate_presence_of(:step_temp) }
  it { should validate_presence_of(:step_time) }
  it { should validate_presence_of(:type) }

  it { should validate_inclusion_of(:type).in_array(%w(Decoction Infusion Temperature)) }

  it { should validate_numericality_of(:end_temp).allow_nil }
  it { should validate_numericality_of(:infuse_amount).allow_nil }
  it { should validate_numericality_of(:ramp_time).is_greater_than_or_equal_to(0).allow_nil }
  it { should validate_numericality_of(:step_temp) }
  it { should validate_numericality_of(:step_time).is_greater_than_or_equal_to(0) }

  context "Decoction steps" do
    let(:type) { "Decoction" }
    it { should_not validate_presence_of :infuse_amount }
  end


  context "Infusion steps" do
    let(:type) { "Infusion" }
    it { should validate_presence_of :infuse_amount }
  end


  context "Temperature steps" do
    let(:type) { "Temperature" }
    it { should_not validate_presence_of :infuse_amount }
  end


  it_behaves_like :record_typing do
    let(:type) { :mash_step }
  end

end
