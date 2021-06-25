//
//  BoldText.swift
//  drinks
//
//  Created by Benjamin on 25/06/2021.
//

import Foundation
import UIKit

extension String {
    func wordsHighlighted(after character: Character, fontSize: CGFloat = UIFont.systemFontSize) -> NSAttributedString {
        var attributedString = NSMutableAttributedString(string: self)

        do {
            let regex = try NSRegularExpression(pattern: String(character) + ".+\\s")
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))

            results.forEach { result in
                attributedString.addAttributes(
                    [.font: UIFont.boldSystemFont(ofSize: fontSize)],
                    range: result.range)
            }
        } catch let error {
            // Handle error here
        }

        return attributedString
    }
}
