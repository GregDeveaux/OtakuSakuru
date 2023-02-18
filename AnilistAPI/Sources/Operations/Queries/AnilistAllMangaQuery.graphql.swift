// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AnilistAllMangaQuery: GraphQLQuery {
  public static let operationName: String = "AnilistAllManga"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query AnilistAllManga {
        Page {
          __typename
          media(type: MANGA) {
            __typename
            title {
              __typename
              english
              romaji
            }
            description
            genres
            coverImage {
              __typename
              extraLarge
              large
              medium
              color
            }
          }
        }
      }
      """#
    ))

  public init() {}

  public struct Data: AnilistAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AnilistAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("media", [Medium?]?.self, arguments: ["type": "MANGA"]),
      ] }

      public var media: [Medium?]? { __data["media"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AnilistAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("title", Title?.self),
          .field("description", String?.self),
          .field("genres", [String?]?.self),
          .field("coverImage", CoverImage?.self),
        ] }

        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// Short description of the media's story and characters
        public var description: String? { __data["description"] }
        /// The genres of the media
        public var genres: [String?]? { __data["genres"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }

        /// Page.Medium.Title
        ///
        /// Parent Type: `MediaTitle`
        public struct Title: AnilistAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.MediaTitle }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("english", String?.self),
            .field("romaji", String?.self),
          ] }

          /// The official english title
          public var english: String? { __data["english"] }
          /// The romanization of the native language title
          public var romaji: String? { __data["romaji"] }
        }

        /// Page.Medium.CoverImage
        ///
        /// Parent Type: `MediaCoverImage`
        public struct CoverImage: AnilistAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { AnilistAPI.Objects.MediaCoverImage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("extraLarge", String?.self),
            .field("large", String?.self),
            .field("medium", String?.self),
            .field("color", String?.self),
          ] }

          /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
          public var extraLarge: String? { __data["extraLarge"] }
          /// The cover image url of the media at a large size
          public var large: String? { __data["large"] }
          /// The cover image url of the media at medium size
          public var medium: String? { __data["medium"] }
          /// Average #hex color of cover image
          public var color: String? { __data["color"] }
        }
      }
    }
  }
}
