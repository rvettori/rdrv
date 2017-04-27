require 'rails_helper'

RSpec.describe Contact, type: :model do
  it{ is_expected.to validate_presence_of(:name)}
  it{ is_expected.to validate_presence_of(:email)}
  it{ is_expected.to validate_presence_of(:nationality)}
  
  let(:contact){ build(:contact) }

  it 'must be error when born date is less then 16 years' do
    contact.born_at = Date.today - 10.years
    expect(contact.valid?).to be_falsey
    expect(contact.errors.messages[:born_at].first).to eql 'born must be greatter then equal 16 years'
  end

  it 'must be valid when born date is greatter then equals 16 years' do
    contact.born_at = Date.today - 18.years
    expect(contact.valid?).to be_truthy
    expect(contact.errors.messages[:born_at]).to be_empty
  end 

  it 'must be valid email' do
    contact.email = 'rafael.vettori@resultadosdigitais.com.br'
    expect(contact.valid?).to be_truthy
    expect(contact.errors.messages[:email]).to be_empty
  end

  it 'must be invalid email' do
    contact.email = 'rafael.vettori@other company'
    expect(contact.valid?).to be_falsey
    expect(contact.errors.messages[:email]).to_not be_empty
  end

end
