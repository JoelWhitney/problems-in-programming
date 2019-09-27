let words = [" Madam", "Nurses Run", " Palinwho?"]

func returnPalindromes(_ words: [String]) -> [String] {
    return words.filter { isPalindrome($0) }
}

private func isPalindrome(_ word: String) -> Bool {
  let word = word.lowercased().split(separator: " ").joined(separator: "")
    return word == String(word.reversed())
}

let palindromes = returnPalindromes(words)
print(palindromes)
