public class Solution {
    private Dictionary<char, string> phoneMap = new Dictionary<char, string>() {
        {'2', "abc"},
        {'3', "def"},
        {'4', "ghi"},
        {'5', "jkl"},
        {'6', "mno"},
        {'7', "pqrs"},
        {'8', "tuv"},
        {'9', "wxyz"}
    };
    
    private List<string> output = new List<string>();
    
    public IList<string> LetterCombinations(string digits) {
        if (string.IsNullOrEmpty(digits)) {
            return new List<string>();
        }
        
        Backtrack("", digits);
        return output;
    }
    
    private void Backtrack(string combination, string nextDigits) {
        if (nextDigits.Length == 0) {
            output.Add(combination);
        }
        else {
            foreach (char letter in phoneMap[nextDigits[0]]) {
                Backtrack(combination + letter, nextDigits.Substring(1));
            }
        }
    }
}