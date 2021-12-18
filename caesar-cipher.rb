def welcome_message 
    puts "This is the Caesar Cipher.
        Your message will be encrypted by shifting the letters in the alphabet by the number that you choose to shift.
        Only a person who knows the shift number will be able to decrypt your message.
        Enter the message you would like to encrypt:"
    input_msg = gets.chomp
    return input_msg
end

def shift_message
    puts "Enter the number by which the numbers will shift:"
    input_shift = gets.chomp.to_i
    if input_shift > 25
        puts "You can't shift by more than 25, it would loop around."
        shift_message
    end
    return input_shift
end

def caesar_cipher(string, shift)
    ascii_array = string.split("").map {|char| char.ord}
    ascii_array.map! do |num|
        case num
        when 65..90
            num += shift
            if num > 90
                num -= 26
            end
        when 97..122
            num += shift
            if num > 122
                num -= 26
            end
        else num
        end
        num.chr
    end
    ascii_array.join("")
end

input_msg = welcome_message
input_shift = shift_message
result = caesar_cipher(input_msg, input_shift)
puts "Your encrypted message is: '#{result}.'"