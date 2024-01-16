import SwiftUI

enum 💾Option {
    enum FontWeight: String, CaseIterable, Identifiable {
        case ultraLight, thin, light, regular, medium, semibold, bold, heavy, black
        var id: Self { self }
        var value: Font.Weight {
            switch self {
                case .ultraLight: .ultraLight
                case .thin: .thin
                case .light: .light
                case .regular: .regular
                case .medium: .medium
                case .semibold: .semibold
                case .bold: .bold
                case .heavy: .heavy
                case .black: .black
            }
        }
        var label: LocalizedStringKey {
            switch self {
                case .ultraLight: "ultraLight"
                case .thin: "thin"
                case .light: "light"
                case .regular: "regular"
                case .medium: "medium"
                case .semibold: "semibold"
                case .bold: "bold"
                case .heavy: "heavy"
                case .black: "black"
            }
        }
    }
    enum FontDesign: String, CaseIterable, Identifiable {
        case `default`, serif, rounded, monospaced
        var id: Self { self }
        var value: Font.Design {
            switch self {
                case .default: .default
                case .serif: .serif
                case .rounded: .rounded
                case .monospaced: .monospaced
            }
        }
        var label: LocalizedStringKey {
            switch self {
                case .default: "default"
                case .serif: "serif"
                case .rounded: "rounded"
                case .monospaced: "monospaced"
            }
        }
    }
    struct Color: RawRepresentable, Codable {
        var r, g, b: Double
        var rawValue: String {
            .init(data: try! JSONEncoder().encode(self),
                  encoding: .utf8)!
        }
        init?(rawValue: String) {
            do {
                self = try JSONDecoder().decode(Self.self, from: rawValue.data(using: .utf8)!)
            } catch {
                return nil
            }
        }
        var value: SwiftUI.Color { .init(red: self.r, green: self.g, blue: self.b) }
        init(_ ⓢwiftUIColor: SwiftUI.Color) {
            if let ⓒolor = ⓢwiftUIColor.cgColor?.components {
                self.r = Double(ⓒolor[0])
                self.g = Double(ⓒolor[1])
                self.b = Double(ⓒolor[2])
            } else {
                (self.r, self.g, self.b) = (0, 0, 0)
            }
        }
    }
}
