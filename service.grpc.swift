//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: service.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Dispatch
import Foundation
import SwiftGRPC
import SwiftProtobuf

internal protocol GameRoomRequestCall: ClientCallUnary {}

fileprivate final class GameRoomRequestCallBase: ClientCallUnaryBase<Message, Empty>, GameRoomRequestCall {
  override class var method: String { return "/GameRoom/Request" }
}

internal protocol GameRoomRequestColorCall: ClientCallUnary {}

fileprivate final class GameRoomRequestColorCallBase: ClientCallUnaryBase<Empty, Flag>, GameRoomRequestColorCall {
  override class var method: String { return "/GameRoom/RequestColor" }
}


/// Instantiate GameRoomServiceClient, then call methods of this protocol to make API calls.
internal protocol GameRoomService: ServiceClient {
  /// Synchronous. Unary.
  func request(_ request: Message, metadata customMetadata: Metadata) throws -> Empty
  /// Asynchronous. Unary.
  @discardableResult
  func request(_ request: Message, metadata customMetadata: Metadata, completion: @escaping (Empty?, CallResult) -> Void) throws -> GameRoomRequestCall

  /// Synchronous. Unary.
  func requestColor(_ request: Empty, metadata customMetadata: Metadata) throws -> Flag
  /// Asynchronous. Unary.
  @discardableResult
  func requestColor(_ request: Empty, metadata customMetadata: Metadata, completion: @escaping (Flag?, CallResult) -> Void) throws -> GameRoomRequestColorCall

}

internal extension GameRoomService {
  /// Synchronous. Unary.
  func request(_ request: Message) throws -> Empty {
    return try self.request(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func request(_ request: Message, completion: @escaping (Empty?, CallResult) -> Void) throws -> GameRoomRequestCall {
    return try self.request(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func requestColor(_ request: Empty) throws -> Flag {
    return try self.requestColor(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func requestColor(_ request: Empty, completion: @escaping (Flag?, CallResult) -> Void) throws -> GameRoomRequestColorCall {
    return try self.requestColor(request, metadata: self.metadata, completion: completion)
  }

}

internal final class GameRoomServiceClient: ServiceClientBase, GameRoomService {
  /// Synchronous. Unary.
  internal func request(_ request: Message, metadata customMetadata: Metadata) throws -> Empty {
    return try GameRoomRequestCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func request(_ request: Message, metadata customMetadata: Metadata, completion: @escaping (Empty?, CallResult) -> Void) throws -> GameRoomRequestCall {
    return try GameRoomRequestCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func requestColor(_ request: Empty, metadata customMetadata: Metadata) throws -> Flag {
    return try GameRoomRequestColorCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func requestColor(_ request: Empty, metadata customMetadata: Metadata, completion: @escaping (Flag?, CallResult) -> Void) throws -> GameRoomRequestColorCall {
    return try GameRoomRequestColorCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
internal protocol GameRoomProvider: ServiceProvider {
  func request(request: Message, session: GameRoomRequestSession) throws -> Empty
  func requestColor(request: Empty, session: GameRoomRequestColorSession) throws -> Flag
}

extension GameRoomProvider {
  internal var serviceName: String { return "GameRoom" }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  internal func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    switch method {
    case "/GameRoom/Request":
      return try GameRoomRequestSessionBase(
        handler: handler,
        providerBlock: { try self.request(request: $0, session: $1 as! GameRoomRequestSessionBase) })
          .run()
    case "/GameRoom/RequestColor":
      return try GameRoomRequestColorSessionBase(
        handler: handler,
        providerBlock: { try self.requestColor(request: $0, session: $1 as! GameRoomRequestColorSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

internal protocol GameRoomRequestSession: ServerSessionUnary {}

fileprivate final class GameRoomRequestSessionBase: ServerSessionUnaryBase<Message, Empty>, GameRoomRequestSession {}

internal protocol GameRoomRequestColorSession: ServerSessionUnary {}

fileprivate final class GameRoomRequestColorSessionBase: ServerSessionUnaryBase<Empty, Flag>, GameRoomRequestColorSession {}

