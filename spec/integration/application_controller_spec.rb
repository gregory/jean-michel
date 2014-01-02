require_relative '../spec_helper'

describe 'it should return result' do
  it 'has content' do
    visit '/'
    page.must_have_content 'Hello World'
  end
end
