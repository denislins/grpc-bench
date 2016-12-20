from services import search_pb2


class SearchServer(search_pb2.SearchServicer):
    def Search(self, request, context):
        results = self._search_results_for(request.q)
        return search_pb2.SearchResponse(results=results)

    def _search_results_for(self, query):
        if query == '':
            return 'invalid search query'

        return 'results for %s' % query
