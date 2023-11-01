import Foundation

protocol NetworkClientProtocol {

    func request(_ request: NetworkServiceRequest) async throws -> (Data, URLResponse)
}

final class NetworkClient {

    // MARK: - Private properties

    private let session = URLSession.shared

    // MARK: - Init

    init() {}
}

// MARK: - NetworkClientProtocol

extension NetworkClient: NetworkClientProtocol {
    
    func request(_ request: NetworkServiceRequest) async throws -> (Data, URLResponse) {
        try await self.session.data(for: self.makeUrlRequest(request))
    }
}

// MARK: - Helpers

private extension NetworkClient {

    func makeUrlRequest(
        _ request: NetworkServiceRequest
    ) -> URLRequest {
        var components = URLComponents()
        components.scheme = BaseURLComponents.scheme
        components.host = BaseURLComponents.host
        components.path = request.path.path

        var queryItems: [URLQueryItem] = []
        self.setParameters(on: &queryItems, for: request)

        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }

        var urlRequest = URLRequest(
            url: components.url!,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
        )
        urlRequest.httpMethod = request.method.rawValue


        return urlRequest
    }

    private func setParameters(
        on queryItems: inout [URLQueryItem],
        for request: NetworkServiceRequest
    ) {
        queryItems.append(
            contentsOf: request.parameters.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        )
    }
}
