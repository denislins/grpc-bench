require 'spec_helper'
require 'app/search'

RSpec.describe SearchServer do
  subject { SearchServer.new }

  describe '#search' do
    let(:request) { Search::SearchRequest.new(q: query_string) }
    let(:expected_response) { Search::SearchResponse.new(results: results) }
    let(:search_response) { subject.search(request, nil) }

    context 'when the request is valid' do
      let(:query_string) { 'mesa' }
      let(:results) { 'results for mesa' }

      it 'returns the search results' do
        expect(search_response).to eq(expected_response)
      end
    end

    context 'when the query string is empty' do
      let(:query_string) { '' }
      let(:results) { 'invalid search query' }

      it 'returns an error message' do
        expect(search_response).to eq(expected_response)
      end
    end
  end
end
