# PL/SQL Execution Guide

## 📋 PL/SQL Block Structure

Every PL/SQL block must follow this structure:

```plsql
BEGIN
  your code here
END;
/
```

> **Important:** The forward slash `/` on a new line executes the block. Don't forget it!

---

## 🖥️ Running Your Code in SQL\*Plus

### Step 1: Connect to SQL\*Plus

Open your terminal and navigate to the directory containing your `.sql` file, then connect:

```bash
sqlplus
```

When prompted, enter your credentials:

- **Username:** `system`
- **Password:** `system`

### Step 2: Configure the Session

Once connected, set these crucial parameters:

```sql
SET SERVEROUTPUT ON;
SET VERIFY OFF;
```

| Parameter              | Purpose                                                            |
| ---------------------- | ------------------------------------------------------------------ |
| `SET SERVEROUTPUT ON;` | Enables output from `DBMS_OUTPUT.PUT_LINE()`                       |
| `SET VERIFY OFF;`      | Suppresses display of old and new values of substitution variables |

### Step 3: Execute Your Script

Run your SQL file with:

```sql
@your_file_name.sql
```

Replace `your_file_name` with the actual name of your `.sql` file (without the path).

---

## ✅ Complete Example

**File:** `my_script.sql`

```plsql
SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello, PL/SQL!');
END;
/
```

**Terminal:**

```bash
$ sqlplus
SQL*Plus: Release 21.0.0.0.0 - Production on Mon Mar 02 13:45:00 2026
Connected to Oracle Database 21c...

SQL> @my_script.sql
Hello, PL/SQL!

PL/SQL procedure successfully completed.
```

---

## 🔑 Key Takeaways

✨ Always use the **BEGIN...END;/** structure  
✨ Enable **SERVEROUTPUT** to see your output  
✨ Set **VERIFY OFF** to clean up your output  
✨ Use **@filename.sql** to execute your scripts
