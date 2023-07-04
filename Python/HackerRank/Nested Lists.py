'''
Given the names and grades for each student in a class of N students, store them in a nested list and print the name(s) of any student(s) having the second lowest grade.
Note: If there are multiple students with the second lowest grade, order their names alphabetically and print each name on a new line.
'''
===================================================================================

if __name__ == '__main__':
    s_grades = list()
    scores = set()
    for _ in range(int(input())):
        name = input()
        score = float(input())
        scores.add(score)
        s_grades.append([name,score])
        
    scores = list(scores)
    scores.sort()
    second_lowest_s = scores[1]
    students = [name for name, grade in s_grades if grade == second_lowest_s]
    students.sort()
    print("\n".join(students))
