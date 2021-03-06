require 'shared/active_model_lint'
require 'shared/record_typing'

describe NRB::BeerXML::Water do

  it_behaves_like :ActiveModel

  it { should validate_presence_of :amount }
  it { should validate_presence_of :bicarbonate }
  it { should validate_presence_of :calcium }
  it { should validate_presence_of :chloride }
  it { should validate_presence_of :magnesium }
  it { should validate_presence_of :sodium }
  it { should validate_presence_of :sulfate }

  it { should validate_numericality_of :amount }
  it { should validate_numericality_of :bicarbonate }
  it { should validate_numericality_of :calcium }
  it { should validate_numericality_of :chloride }
  it { should validate_numericality_of :magnesium }
  it { should validate_numericality_of(:ph).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(14).allow_nil }

  it { should validate_numericality_of :sodium }
  it { should validate_numericality_of :sulfate }

  it_behaves_like :record_typing do
    let(:type) { :water }
  end

end
