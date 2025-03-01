# Secure Software Development January 2025

### Unit 3: Introduction to Programming Languages: Activity - Buffer Overflow Activities – C and Python

#### Part I: C Code – `bufoverflow.c`

##### Code Analysis
```
```c
#include <stdio.h>

int main(int argc, char **argv)
{
    char buf[8]; // buffer for eight characters
    printf("enter name:");
    gets(buf);   // read from stdin (vulnerable function)
    printf("%s\n", buf); // print out data stored in buf
    return 0;    // 0 as return value
}
```

- **Key Issue**: `buf` is allocated for 8 bytes, but `gets()` does not perform boundary checks.
- **Security Flaw**: Classic buffer overflow vulnerability if the user inputs more than 7 characters plus a null terminator.

##### Compilation & Execution

1. Compile

    (example using GCC):

   ```
   gcc bufoverflow.c -o bufoverflow
   ```

2. Run:

   ```
   ./bufoverflow
   ```

   - **When input ≤ 8 chars**: Prints back the input normally.
   - **When input > 8 chars**: Triggers undefined behaviour. Modern systems often detect a “stack smashing” attempt, terminating the program.

##### Observations

- Output for Short Input:

  ```
  enter name: John
  John
  ```

- Output for Long Input

   (≥10 characters):

  ```
  *** stack smashing detected ***: terminated
  Aborted (core dumped)
  ```

  or it may produce a segmentation fault or corrupt memory.

- **Meaning**: The runtime detects the buffer overflow (modification of stack metadata) and forcibly stops the program to mitigate potential exploitation.

------

#### Part II: Python Code – `Overflow.py`

##### Code Analysis

```
buffer = [None] * 10
for i in range(0, 11):
    buffer[i] = 7
print(buffer)
```

- Creates a list `buffer` of length 10.
- Attempts to assign a value to indices 0 through 10 (`range(0, 11)`), which leads to an out-of-bounds assignment on the final iteration.

##### Execution & Result

```
python overflow.py
```

- Python immediately raises an 

  ```
  IndexError
  ```

  ```
  Traceback (most recent call last):
    File "overflow.py", line X, in <module>
      buffer[i] = 7
  IndexError: list assignment index out of range
  ```

- **No Memory Corruption**: Python’s runtime prevents accidental overwriting of adjacent memory locations.

#### Comparison with C

- **C**: Relies on the programmer to ensure buffer lengths are not exceeded, leading to potential vulnerabilities.
- **Python**: Uses **built-in bounds checking**, raising an exception rather than silently corrupting memory.

------

#### Using Pylint

#### Installation & Usage

1. Install:

   ```
   pip install pylint
   ```

2. Run on a Python file (e.g.)

   ```
   overflow.py
   ```

   ```
   pylint overflow.py
   ```

#### Output & Fixes

- Pylint may highlight:

  - **Index out of range** potential bug.
  - **Style** or **convention** issues (e.g., naming, spacing).

- Suggested Fix : Adjust the loop to 

  ```
  range(0, 10)
  ```

   or 

  ```
  range(len(buffer))
  ```

  :

  ```
  buffer = [None] * 10
  for i in range(len(buffer)):  # or range(0, 10)
      buffer[i] = 7
  print(buffer)
  ```

------

#### Summary of Findings

1. **C Program (Buffer Overflow)**
   - Reading more data than allocated triggers **stack corruption** or **segmentation fault**.
   - Demonstrates risk of functions like `gets()` (deprecated) and the importance of safer alternatives like `fgets()`.
2. **Python Program (IndexError)**
   - Python enforces boundary checks, raising an `IndexError` instead of overwriting memory.
   - Shows how higher-level languages protect against certain classes of memory bugs.
3. **Pylint**
   - Encourages best coding practices and highlights potentially unsafe indexing.
   - While Python inherently prevents direct buffer overflows, logical errors can still occur.

**Key Takeaway**: Understanding how lower-level languages handle memory is vital for secure coding. Tools like Pylint (for Python) or linters/static analysers for C (e.g., clang-tidy) assist in catching errors early.

------

#### References

- Python Software Foundation (2025) *Python Documentation*. Available at: https://docs.python.org/3/ (Accessed: 1 March 2025).
- Pylint (2025) *Static Code Analysis Tool*. Available at: https://pylint.pycqa.org/ (Accessed: 1 March 2025).



### Unit 5: Future Trends in Secure Software Development of the module: Moving Beyond Microservices

#### Introduction

Building on the microservices paradigm, modern software development has shifted towards architectures that streamline deployment, enhance scalability, and embed security throughout the development lifecycle (Lewis and Fowler, 2014). This shift is driven by the rising complexity of distributed systems, the need for rapid feature releases, and an increasingly significant focus on secure software practices (Souppaya and Scarfone, 2016). Containers, serverless computing, and service meshes represent key advancements that extend beyond traditional microservices, enabling teams to concentrate on application logic rather than infrastructure management.

#### Containerisation and Orchestration

Containers, popularised by technologies such as Docker, encapsulate applications and their dependencies to maintain consistent environments across development, testing, and production (Pahl, 2015). Coupled with orchestration platforms like Kubernetes, containers can be automatically scaled, monitored, and updated, resulting in greater operational efficiency and reliability (Kubernetes, 2023).

#### Serverless and Function-as-a-Service (FaaS)

Serverless computing, often delivered via Function-as-a-Service (FaaS), reduces infrastructure overhead by allowing developers to deploy discrete functions that run solely in response to events or triggers (AWS, 2023). This approach offers cost-effectiveness—billing only for actual execution—and expedites feature delivery by removing the need for teams to manage the underlying infrastructure (Eivy, 2017).

#### Service Mesh and Observability

Service meshes, such as Istio, add a dedicated infrastructure layer to manage service-to-service communication, enforce security policies, and collect telemetry data (IBM, 2022). Coupled with observability tools (e.g., Prometheus and Grafana), they enable teams to maintain detailed insights into distributed systems, aiding in both proactive performance management and rapid incident response (NIST, 2019).

#### Conclusion

Modern software development continues to evolve beyond microservices to embrace container orchestration, serverless computing, and advanced service mesh solutions. These innovations align with industry-wide demands for agility, scalability, and integrated security strategies. Forward-thinking organisations must adapt to these paradigms to ensure efficient workflows and robust security postures in an era of increasingly complex distributed environments.

---

#### Formative Activity: RESTful API Creation

This section aligns with the following learning outcomes:

1. **Critically analyse development problems** and determine appropriate methodologies, tools, and techniques for programming solutions.  
2. **Design and develop computer programs** to meet specified briefs, and critically evaluate resulting solutions.  
3. **Implement and refine team skills** in a virtual, professional environment, reflecting real-life organisational roles and structures.

Below are summarised answers to the formative activities based on the `api.py` script (which uses Flask and Flask-RESTful to create a basic RESTful API).

#### API Code

```python
from flask import Flask
from flask_restful import Api, Resource, reqparse
 
app = Flask(__name__)
api = Api(app)
 
users = [
    {
        "name": "James",
        "age": 30,
        "occupation": "Network Engineer"
    },
    {
        "name": "Ann",
        "age": 32,
        "occupation": "Doctor"
    },
    {
        "name": "Jason",
        "age": 22,
        "occupation": "Web Developer"
    }
]
 
class User(Resource):
    def get(self, name):
        for user in users:
            if(name == user["name"]):
                return user, 200
        return "User not found", 404
 
    def post(self, name):
        parser = reqparse.RequestParser()
        parser.add_argument("age")
        parser.add_argument("occupation")
        args = parser.parse_args()
 
        for user in users:
            if(name == user["name"]):
                return "User with name {} already exists".format(name), 400
 
        user = {
            "name": name,
            "age": args["age"],
            "occupation": args["occupation"]
        }
        users.append(user)
        return user, 201
 
    def put(self, name):
        parser = reqparse.RequestParser()
        parser.add_argument("age")
        parser.add_argument("occupation")
        args = parser.parse_args()
 
        for user in users:
            if(name == user["name"]):
                user["age"] = args["age"]
                user["occupation"] = args["occupation"]
                return user, 200
        
        user = {
            "name": name,
            "age": args["age"],
            "occupation": args["occupation"]
        }
        users.append(user)
        return user, 201
 
    def delete(self, name):
        global users
        users = [user for user in users if user["name"] != name]
        return "{} is deleted.".format(name), 200
      
api.add_resource(User, "/user/<string:name>")
 
app.run(debug=True)
```

## Questions and Answers

### Question 1

**Which command was used to run the `api.py` code, and what did you observe?**

- Answer : The script can be run with:

  ```
  python api.py
  ```

  This command starts the Flask development server on 

  ```
  http://127.0.0.1:5000/
  ```

  , displaying real-time logs in the terminal to confirm the API is active.

### Question 2

**What happens when the command `w3m http://127.0.0.1:5000/user/Ann` is run, and why?**

- **Answer**: The `w3m` command sends a GET request, returning Ann’s user details in JSON with a **200 (OK)** status. Since “Ann” is present in the `users` list, her information is successfully retrieved.

### Question 3

**What happens when the command `w3m http://127.0.0.1:5000/user/Adam` is run, and why?**

- **Answer**: The API returns **“User not found”** and a **404 (Not Found)** status. There is no user named “Adam” in the `users` list, so the resource cannot be located.

### Question 4

**What capability is achieved by the Flask library?**

- **Answer**: Flask streamlines the creation of web applications and APIs by providing lightweight scaffolding for routing, request handling, and templating (Grinberg, 2018). When extended with Flask-RESTful, it allows for straightforward endpoint definition and parsing of JSON-based requests.
