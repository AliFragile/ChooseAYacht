//
//  UIImage to String.swift
//  ChooseAYacht
//
//  Created by Алина Ражева on 07.03.2023.
//

import UIKit

extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
