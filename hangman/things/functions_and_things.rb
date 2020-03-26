def indexes_of_char(letter, array)
    output = []
    i = 0
    while i < array.length
        if array[i] == letter 
            output << i
        end
        i += 1
    end
    
    if output == []
        return false
    else
        return output
    end
end

