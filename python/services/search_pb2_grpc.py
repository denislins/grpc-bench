import grpc
from grpc.framework.common import cardinality
from grpc.framework.interfaces.face import utilities as face_utilities

import search_pb2 as search__pb2
import search_pb2 as search__pb2


class SearchStub(object):

  def __init__(self, channel):
    """Constructor.

    Args:
      channel: A grpc.Channel.
    """
    self.Search = channel.unary_unary(
        '/search.Search/Search',
        request_serializer=search__pb2.SearchRequest.SerializeToString,
        response_deserializer=search__pb2.SearchResponse.FromString,
        )


class SearchServicer(object):

  def Search(self, request, context):
    context.set_code(grpc.StatusCode.UNIMPLEMENTED)
    context.set_details('Method not implemented!')
    raise NotImplementedError('Method not implemented!')


def add_SearchServicer_to_server(servicer, server):
  rpc_method_handlers = {
      'Search': grpc.unary_unary_rpc_method_handler(
          servicer.Search,
          request_deserializer=search__pb2.SearchRequest.FromString,
          response_serializer=search__pb2.SearchResponse.SerializeToString,
      ),
  }
  generic_handler = grpc.method_handlers_generic_handler(
      'search.Search', rpc_method_handlers)
  server.add_generic_rpc_handlers((generic_handler,))
