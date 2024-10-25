def gcd(a, b):
    for i in range(min(a, b), 0, -1):
        if a % i == 0 and b % i == 0:
            return i
    return -1
    
def solution(arr):
    answer = 1
    for i in arr:
        answer = answer * i // gcd(answer, i)
    return answer
            