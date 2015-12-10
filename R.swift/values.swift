//
//  values.swift
//  R.swift
//
//  Created by Mathijs Kadijk on 31-01-15.
//  From: https://github.com/mac-cain13/R.swift
//  License: MIT License
//

import Foundation

let ResourceFilename = "R.generated.swift"

let Header = [
  "// This is a generated file, do not edit!",
  "// Generated by R.swift, see https://github.com/mac-cain13/R.swift",
].joinWithSeparator("\n")


let Imports = [
  "import UIKit",
  "import Rswift",
].joinWithSeparator("\n")

let IndentationString = "  "

let Ordinals = [
  (number: 1, word: "first"),
  (number: 2, word: "second"),
  (number: 3, word: "third"),
  (number: 4, word: "fourth"),
  (number: 5, word: "fifth"),
  (number: 6, word: "sixth"),
  (number: 7, word: "seventh"),
  (number: 8, word: "eighth"),
  (number: 9, word: "ninth"),
  (number: 10, word: "tenth"),
  (number: 11, word: "eleventh"),
  (number: 12, word: "twelfth"),
  (number: 13, word: "thirteenth"),
  (number: 14, word: "fourteenth"),
  (number: 15, word: "fifteenth"),
  (number: 16, word: "sixteenth"),
  (number: 17, word: "seventeenth"),
  (number: 18, word: "eighteenth"),
  (number: 19, word: "nineteenth"),
  (number: 20, word: "twentieth"),
]

// Roughly based on http://www.unicode.org/Public/emoji/1.0//emoji-data.txt
let emojiRanges = [
  0x2600...0x27BF,
  0x1F300...0x1F6FF,
  0x1F900...0x1F9FF,
  0x1F1E6...0x1F1FF,
]

let BlacklistedCharacters = { () -> NSCharacterSet in
  let blacklist = NSMutableCharacterSet(charactersInString: "")
  blacklist.formUnionWithCharacterSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
  blacklist.formUnionWithCharacterSet(NSCharacterSet.punctuationCharacterSet())
  blacklist.formUnionWithCharacterSet(NSCharacterSet.symbolCharacterSet())
  blacklist.formUnionWithCharacterSet(NSCharacterSet.illegalCharacterSet())
  blacklist.formUnionWithCharacterSet(NSCharacterSet.controlCharacterSet())
  blacklist.removeCharactersInString("_")

  emojiRanges.forEach {
    let range = NSRange(location: $0.startIndex, length: $0.endIndex - $0.startIndex)
    blacklist.removeCharactersInRange(range)
  }

  return blacklist
}()

// Extensions
let AssetFolderExtensions: Set<String> = ["xcassets"]
let AssetExtensions: Set<String> = ["launchimage", "imageset"] // Note: "appiconset" is not loadable by default, so it's not included here
let ImageExtensions: Set<String> = ["tiff", "tif", "jpg", "jpeg", "gif", "png", "bmp", "bmpf", "ico", "cur", "xbm"] // See "Supported Image Formats" on https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIImage_Class/
let FontExtensions: Set<String> = ["otf", "ttf"]
let StoryboardExtensions: Set<String> = ["storyboard"]
let NibExtensions: Set<String> = ["xib"]

let CompiledResourcesExtensions: Set<String> = AssetFolderExtensions.union(StoryboardExtensions).union(NibExtensions)

let SwiftKeywords = ["class", "deinit", "enum", "extension", "func", "import", "init", "internal", "let", "operator", "private", "protocol", "public", "static", "struct", "subscript", "typealias", "var", "break", "case", "continue", "default", "do", "else", "fallthrough", "for", "if", "in", "return", "switch", "where", "while", "as", "dynamicType", "false", "is", "nil", "self", "Self", "super", "true", "__COLUMN__", "__FILE__", "__FUNCTION__", "__LINE__"]
