def letter_combinations(digits)
    return [] if digits.empty?
    
    phone_map = {
        '2' => 'abc',
        '3' => 'def',
        '4' => 'ghi',
        '5' => 'jkl',
        '6' => 'mno',
        '7' => 'pqrs',
        '8' => 'tuv',
        '9' => 'wxyz'
    }
    
    @output = []
    
    def backtrack(combination, next_digits, phone_map)
        if next_digits.empty?
            @output << combination
        else
            phone_map[next_digits[0]].each_char do |letter|
                backtrack(combination + letter, next_digits[1..-1], phone_map)
            end
        end
    end
    
    backtrack("", digits, phone_map)
    @output
end