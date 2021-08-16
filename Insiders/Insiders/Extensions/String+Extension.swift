import UIKit

extension String {
    var isEmailValid: Bool {
        do {
            let emailPattern = #"^\S+@\S+\.\S+$"#
            let regex = try NSRegularExpression(pattern: emailPattern, options: .caseInsensitive)
            let sourceRange = NSRange(self.startIndex..<self.endIndex, in: self)
            return regex.firstMatch(in: self, options: [], range: sourceRange) != nil
        } catch {
            return false
        }
    }

    var isPasswordValid: Bool {
        do {
            let passwordPattern = #"(?=.{6,})"#
            let regex = try NSRegularExpression(pattern: passwordPattern, options: [])
            let sourceRange = NSRange(self.startIndex..<self.endIndex, in: self)
            return regex.firstMatch(in: self, options: [], range: sourceRange) != nil
        } catch {
            return false
        }
    }
}
