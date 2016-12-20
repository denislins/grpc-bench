import time
import grpc

from concurrent import futures
from services import search_pb2
from app.search import SearchServer


def serve():
  server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
  search_pb2.add_SearchServicer_to_server(SearchServer(), server)
  server.add_insecure_port('[::]:50051')
  server.start()

  try:
    while True:
      time.sleep(60 * 60 * 24)
  except KeyboardInterrupt:
    server.stop(0)

if __name__ == '__main__':
  serve()
