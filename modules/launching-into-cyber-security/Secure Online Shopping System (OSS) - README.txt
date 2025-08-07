Secure Online Shopping System (OSS) Implementation

Introduction:
This project aims to develop a secure online shopping system (OSS) for a local grocery store, leveraging Python and object-oriented programming (OOP) principles. The primary objective is to enhance the store's operations while ensuring robust security against potential cyber threats. This README provides a comprehensive overview of the system's design, implementation, and security measures.

System Design : UML Diagrams

Class Diagram: 
The Class Diagram illustrates the static structure of the system, highlighting essential classes such as `User`, `Product`, `Order`, `ShoppingCart`, and `Payment`. Each class comprises relevant attributes and methods, as demonstrated in the following example:

```python
import hashlib
import hmac

class User:
    def __init__(self, username, password):
        self.username = username
        self.password_hash = self._hash_password(password)

    def _hash_password(self, password):
        salt = b'secret_salt'
        return hmac.new(salt, password.encode('utf-8'), hashlib.sha256).hexdigest()

    def verify_password(self, password):
        return hmac.new(b'secret_salt', password.encode('utf-8'), hashlib.sha256).hexdigest() == self.password_hash

class Product:
    def __init__(self, product_id, name, price, stock):
        self.product_id = product_id
        self.name = name
        self.price = price
        self.stock = stock
```

Sequence Diagram: 
This diagram captures the interactions between users and the system, including user registration, product search, order placement, and payment processing. It is essential for understanding the dynamic behaviour and identifying potential vulnerabilities in the data flow.

Abuse Case Diagram:
The Abuse Case Diagram highlights possible misuse scenarios, such as unauthorised access, data breaches, and SQL injection attacks. This is crucial for identifying security threats and developing appropriate countermeasures.

Threat Modelling Techniques: 

STRIDE Model: This model helps identify security threats in six categories
1. Spoofing: Impersonation of legitimate users.
2. Tampering: Unauthorised data modifications.
3. Repudiation: Users denying their actions.
4. Information Disclosure: Exposure of sensitive information.
5. Denial of Service (DoS):Disruption of service availability.
6. Elevation of Privilege: Unauthorised actions due to elevated access rights.

DREAD Mode: The DREAD model evaluates the potential impact of security threats based on:
1. Damage Potential: The extent of harm caused.
2. Reproducibility: Ease of threat reproduction.
3. Exploitability: Effort required to exploit the threat.
4. Affected Users: Number of impacted users.
5. Discoverability: Ease of threat discovery.

Security Measures:

1. Encryption: Implement robust encryption techniques to protect sensitive data both in transit and at rest.
2. Authentication and Authorisation:  Use multi-factor authentication (MFA) and role-based access control (RBAC) to ensure secure user access.
3. Regular Security Audits: Conduct regular audits to identify and address vulnerabilities.
4. Employee Training : Educate employees on security best practices and threat response.
5. Incident Response Plan : Develop a plan for quick and effective response to security incidents.
6. Software Updates : Regularly update the system to patch known vulnerabilities.

Implementation Steps:

1. Requirements Analysis: Gather detailed business and security requirements for the OSS.
2. System Design: Create UML diagrams to visually represent the system's structure and interactions.
3. Development: Implement the OSS using Python, adhering to OOP principles and incorporating security measures.
4. Testing: Conduct rigorous testing, including functional and security testing, to identify and address vulnerabilities.
5. Deployment: Deploy the OSS in a secure environment, ensuring all security measures are in place.
6. Monitoring and Maintenance: Continuously monitor the system for potential threats and perform regular maintenance.

Usage Instructions:

1. Setup: Ensure Python and necessary libraries (e.g., `hmac`, `hashlib`) are installed.
2. Run the Application: Execute the Python scripts to start the OSS.
3. Testing: Use provided test cases to verify the functionality and security of the system.

Conclusion:
This project demonstrates the implementation of a secure online shopping system for a local grocery store, leveraging OOP principles in Python. By applying UML diagrams and threat modelling techniques, we have ensured the system's security and operational efficiency. This OSS README file provides a detailed guide to the implementation, highlighting strengths and areas for improvement.

References: 

1. Howard, M., & LeBlanc, D. (2003). Writing Secure Code. 2nd ed. Microsoft Press.
2. Shostack, A. (2014). Threat Modeling: Designing for Security. Indianapolis: Wiley.
3. Anderson, R. (2008). Security Engineering: A Guide to Building Dependable Distributed Systems. 3rd ed. Indiana: Wiley & Sons.
4. Additional references as listed in the proposal document.

