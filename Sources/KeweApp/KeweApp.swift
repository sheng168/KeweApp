// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct Tab: Codable, Identifiable {
    public var label: String
    public var systemImage: String
    public var id: String
    var enable = true
    
    public init(label: String, systemImage: String, tag: String, enable: Bool = true) {
        self.label = label
        self.systemImage = systemImage
        self.id = tag
        self.enable = enable
    }
}

public struct Section: Codable, Identifiable {
    public var id: String
    public var detail: String
    
    public init(id: String, detail: String) {
        self.id = id
        self.detail = detail
    }
}
