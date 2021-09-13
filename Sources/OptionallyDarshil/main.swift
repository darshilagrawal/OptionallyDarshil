import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.

struct OptionallyDarshil: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case about
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "OptionallyDarshil"
    var description = ""
    
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try OptionallyDarshil().publish(using: [
    .installPlugin(.splash(withClassPrefix: "")),
    .addMarkdownFiles(),
    .copyResources(),
    .generateHTML(withTheme: .basic),
    .generateRSSFeed(including: [.posts]),
    .generateSiteMap(),
])
