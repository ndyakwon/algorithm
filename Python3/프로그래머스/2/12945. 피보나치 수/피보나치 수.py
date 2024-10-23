def solution(n):
    number = [0, 1]
    
    for i in range(2, n+1):
        number.append(number[i-1] + number[i-2])
    
    return number[n] % 1234567