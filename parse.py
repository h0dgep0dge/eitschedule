import csv

with open('data.csv',newline='') as csvfile:
    reader = csv.reader(csvfile,delimiter=',',quotechar='"')
    for row in reader:
        print('''DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ''',end="")
        ranges = row[5].split(',')
        name = row[0]
        room = row[1]
        day = row[2]
        time = row[3]
        length = row[4]
        print(f"('{name}','{day}',{time},{length},'{room}')")
        print('''    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES''',end='');
        comma = ''
        for r in ranges:
            startend = r.split('-')
            l = None
            if len(startend) == 1:
                l = startend[0]
            else:
                l = range(int(startend[0]),int(startend[1])+1)
            
            for week in l:
                print(comma,end='')
                comma = ','
                print(f"\n    (retslotID,{week})",end='')
        print(";\nEND $$;")
'''DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Advanced Object-Oriented Programming','tue','13:00',2,'c316')
    RETURNING Slots.slotID INTO retslotid;

    INSERT INTO Sessions (slotID,week) VALUES
        (retslotID,8),
        (retslotID,9),
        (retslotID,10),
        (retslotID,11),
        (retslotID,12),
        (retslotID,13),
        (retslotID,14),
        (retslotID,15);
END $$;'''