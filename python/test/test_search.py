from app.search import SearchServer
from services import search_pb2

class TestSearch:
    def setup_method(self):
        self.server = SearchServer()

    def _create_request(self, query):
        return search_pb2.SearchRequest(q=query)

    def _create_response(self, results):
        return search_pb2.SearchResponse(results=results)

    def _perform_search(self, request):
        return self.server.Search(request, None)

    def test_when_the_request_is_valid(self):
        request = self._create_request('mesa')
        response = self._create_response('results for mesa')

        assert self._perform_search(request) == response

    def test_when_the_query_string_is_empty(self):
        request = self._create_request('')
        response = self._create_response('invalid search query')

        assert self._perform_search(request) == response
