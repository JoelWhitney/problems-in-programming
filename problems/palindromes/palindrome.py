def main():
  words = [" Madam", "Nurses Run", " Palinwho?"]
  palindromes = returnPalindromes(words)
  print(palindromes)

def returnPalindromes(words):
    return list(filter(lambda x: isPalindrome(x), words))

def isPalindrome(word):
    word = word.lower().replace(" ", "")
    return word == word[::-1]

main()
