import csv

lecturers = []
courses = []
slots = []

with open('/data/data.csv', newline='') as csvfile:
    reader = csv.reader(csvfile,delimiter=',', quotechar='"')
    for row in reader:
        match row[0]:
            case 'Lecturers':
                lecturers.append({'name':row[1],'url':row[2]})
            case 'Courses':
                courses.append({'name':row[1],'campus':row[2],'lecturer':row[3]})
            case 'Slots':
                slots.append({'courseName':row[1],'campus':row[2],'room':row[3],'day':row[4],'time':row[5],'length':row[6],'weeks':row[7]})

first = True
print('INSERT INTO Lecturers (name,url) VALUES')
for lecturer in lecturers:
    if not first:
        print(',\n',end='')
    if lecturer['url'] == '':
        print("('",lecturer['name'],"', NULL)",sep='',end='')
    else:
        print("('",lecturer['name'],"', '",lecturer['url'],"')",sep='',end='')
    first = False
print(';\n')

first = True
print('INSERT INTO Courses (name, campus,lecturerName) VALUES')
for course in courses:
    if not first:
        print(',\n',end='')
    if course['lecturer'] == '':
        print("('",course['name'],"', '",course['campus'],"', NULL)",sep='',end='')
    else:
        print("('",course['name'],"', '",course['campus'],"', '",course['lecturer'],"')",sep='',end='')
    first = False
print(';\n')

for slot in slots:
    print("DO $$",
          "DECLARE",
          "    retslotID Slots.slotID%TYPE;",
          "BEGIN",
          "    INSERT INTO Slots (courseName,campus,day,slotTime,slotLength,room)",
         f"    VALUES ('{slot['courseName']}','{slot['campus']}','{slot['day']}',{slot['time']},{slot['length']},'{slot['room']}')",
          "    RETURNING Slots.slotID INTO retslotid;\n",
          "    INSERT INTO Sessions (slotID,week) VALUES",sep='\n')
    
    ranges = slot['weeks'].split(',')
    first = True
    for r in ranges:
        startend = r.split('-')
        if len(startend) == 1:
            l = [startend[0]]
        else:
            l = range(int(startend[0]),int(startend[1])+1)
            
        for week in l:
            if not first:
                print(',')
            print(f"    (retslotID,{week})",end='')
            first = False
    print(";\nEND $$;")
