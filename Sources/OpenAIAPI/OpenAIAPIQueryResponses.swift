//
//  OpenAIAPIQueryResponses.swift
//
//  Created by Nico Tranquilli on 05/02/23.
//

import Foundation

public struct OpenAIAPICompletionResponse: Codable {
    public let id: String
    public let object: String
    public let created: TimeInterval
    public let model: String
    public let choices: [OpenAIAPICompletionChoice]
    public let usage: OpenAIAPIUsage
}
public struct OpenAIAPIEditResponse: Codable {
    public let object: String
    public let created: TimeInterval
    public let choices: [OpenAIAPIEditChoice]
    public let usage: OpenAIAPIUsage
}
public struct OpenAIAPICompletionChoice: Codable {
    public let text: String
    public let index: Int
    //public let logprobs: ..
    public let finish_reason: String
}
public struct OpenAIAPIEditChoice: Codable {
    public let text: String
    public let index: Int
    //public let logprobs: ..
}
public struct OpenAIAPIUsage: Codable {
    public let prompt_tokens: Int
    public let completion_tokens: Int
    public let total_tokens: Int
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.total_tokens < rhs.total_tokens
    }
}

public struct OpenAIAPIModelsResponse: Codable {
    public let data: [OpenAIAPIModelResponse]
    public let object: String
}
public struct OpenAIAPIModelResponse: Codable {
    public let id: String
    public let object: String
    public let owned_by: String
    public let permission: [OpenAIAPIPermission]
    public let root: String?
    public let parent: String?
}
public struct OpenAIAPIPermission: Codable {
    public let id: String
    public let object: String
    public let created: TimeInterval
    public let allow_create_engine: Bool
    public let allow_sampling: Bool
    public let allow_logprobs: Bool
    public let allow_search_indices: Bool
    public let allow_view: Bool
    public let allow_fine_tuning: Bool
    public let organization: String
    public let group: String?
    public let is_blocking: Bool
}
