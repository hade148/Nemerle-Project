# תרגיל 0 – VMTranslator בשפת Nemerle

## מה הפרויקט הזה עושה?

תוכנית Nemerle שמבצעת את דרישות תרגיל 0 של קורס "עקרונות שפות תכנות":

1. מקבלת מסלול לתיקייה מהמשתמש
2. מוצאת את כל קבצי ה-`.vm` בתיקייה
3. מעבדת כל שורה בכל קובץ:
   - `buy <product> <amount> <price>` ← קורא לפונקציית HandleBuy
   - `sell`/`cell <product> <amount> <price>` ← קורא לפונקציית HandleSell
4. יוצרת קובץ פלט `<DirName>.asm` בתיקייה עצמה
5. מדפיסה סיכומי TOTAL BUY ו-TOTAL CELL גם לקובץ וגם למסך

---

## התקנה

### שלב 1 – הורדת Nemerle

1. גשו לאתר הרשמי של Nemerle:
   **http://nemerle.org/Download**

2. הורידו את הקובץ:
   `Nemerle-v1.2.547.0-net40-setup.msi`
   (גרסה עבור .NET 4.0, תואמת Windows)

3. הריצו את ה-installer והתקינו – ברירת המחדל: `C:\Program Files\Nemerle`

4. **(אופציונלי)** הוסיפו את הנתיב לסביבת PATH של Windows:
   - לחצו `Win+R`, הקלידו `sysdm.cpl`
   - כרטיסיית **Advanced** ← **Environment Variables**
   - בסעיף **System variables** – בחרו `Path` ← **Edit** ← **New**
   - הכניסו: `C:\Program Files\Nemerle`

---

## הידור (Compilation)

### שיטה א׳ – דרך build.bat (הכי פשוט)

לחצו פעמיים על `build.bat` שבתיקיית הפרויקט.  
הקובץ `VMTranslator.exe` ייוצר אוטומטית.

### שיטה ב׳ – שורת פקודה (Command Prompt)

```cmd
cd c:\Users\yosef\Desktop\Nemerle-Project
"C:\Program Files\Nemerle\ncc.exe" Main.n -o VMTranslator.exe
```

---

## הרצה

```cmd
VMTranslator.exe
```

כאשר התוכנית מבקשת נתיב, הכניסו לדוגמה:
```
C:\Users\yosef\Desktop\Nemerle-Project
```

הפלט ייכתב לקובץ `Nemerle-Project.asm` בתוך אותה תיקייה.

---

## דוגמת פלט

בהנתן:

**InputA.vm:**
```
cell bread 3 4.5
buy cheese 2 5.3
```

**InputB.vm:**
```
buy chocolate 5 2.5
cell eggs 30 20.7
```

**הקובץ הנוצר `<Dir>.asm`:**
```
InputA
$$$ CELL bread $$$
13.5
### BUY cheese ###
10.6
InputB
### BUY chocolate ###
12.5
$$$ CELL eggs $$$
621.0
TOTAL BUY: 23.1
TOTAL CELL: 634.5
```

---

## מבנה הקבצים

```
Nemerle-Project/
├── Main.n           ← קוד המקור בשפת Nemerle
├── build.bat        ← סקריפט הידור
├── InputA.vm        ← קובץ קלט לדוגמה
├── InputB.vm        ← קובץ קלט לדוגמה
└── README.md        ← המדריך הזה
```

---

## הערות

- שפת Nemerle היא שפה היברידית (functional + OO) עבור פלטפורמת .NET
- הקומפיילר הוא `ncc.exe`
- ניתן לפתוח את הקוד בכל עורך טקסט (Notepad++, VS Code, ...)
- אין integration מלא ל-Visual Studio בגרסאות חדשות – מומלץ VS Code
