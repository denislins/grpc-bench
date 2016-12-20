require 'grpc'
require 'services/search_services_pb'

class SearchServer < Search::Search::Service
  def search(request, options)
    results = search_results_for(request.q)
    Search::SearchResponse.new(results: results)
  end

  private

  def search_results_for(query)
    return 'invalid search query' if query.empty?
    "results for #{query}"
  end
end
