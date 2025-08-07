
                                                                      Secure Online Shopping System (OSS) Implementation

Introduction:
This project aims to develop a secure online shopping system (OSS) for a local grocery store, using Python and object-oriented programming (OOP) principles. The primary goal is to enhance the store's operations while ensuring robust security against potential cyber threats. This document provides a comprehensive overview of the system design, implementation, and security measures applied.

System Design: UML Diagrams

Class Diagram:
The Class Diagram represents the static structure of the system, including key classes such as `User`, `Product`, `Order`, `ShoppingCart`, and `Payment`. Each class includes attributes and methods relevant to their roles.

Sequence Diagram:
The Sequence Diagram captures the interaction between users and the system, such as user registration, product search, order placement, and payment processing. This helps in understanding the dynamic behaviour and potential vulnerabilities in the data flow.

Abuse Case Diagram:
The Abuse Case Diagram highlights potential misuse cases, such as unauthorised access, data breaches, and SQL injection attacks. This is crucial for identifying security threats and developing countermeasures.

Example of Class Diagram:

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

Threat Modelling Techniques: STRIDE Model and DREAD Model 

The STRIDE model helps identify security threats in six categories:
1. Spoofing: Impersonation of legitimate users.
2. Tampering: Unauthorized data modifications.
3. Repudiation: Users denying their actions.
4. Information Disclosure: Exposure of sensitive information.
5. Denial of Service (DoS): Disruption of service availability.
6. Elevation of Privilege: Unauthorized actions due to elevated access rights.

The DREAD model evaluates the potential impact of security threats based on:
1. Damage Potential: The extent of harm caused.
2. Reproducibility: Ease of threat reproduction.
3. Exploitability: Effort required to exploit the threat.
3. Affected Users: Number of impacted users.
4. Discoverability: Ease of threat discovery.

Security Measures:
1. Encryption: Implement robust encryption techniques to protect sensitive data both in transit and at rest.
2. Authentication and Authorisation : Use multi-factor authentication (MFA) and role-based access control (RBAC) to ensure secure user access.
3. Regular Security Audits: Conduct regular audits to identify and address vulnerabilities.
4. Employee Training: Educate employees on security best practices and threat response.
5. Incident Response Plan: Develop a plan for quick and effective response to security incidents.
6. Software Updates: Regularly update the system to patch known vulnerabilities.

Implementation Steps:
1. Requirements Analysis: Gather detailed business and security requirements for the OSS.
2. System Design: Create UML diagrams to visually represent the system's structure and interactions.
3. Development: Implement the OSS using Python, adhering to OOP principles and incorporating security measures.
4. Testing: Conduct rigorous testing, including functional and security testing, to identify and address vulnerabilities.
5. Deployment: Deploy the OSS in a secure environment, ensuring all security measures are in place.
6. Monitoring and Maintenance**: Continuously monitor the system for potential threats and perform regular maintenance.

Usage Instructions:
1. Setup: Ensure Python and necessary libraries (e.g., `hmac`, `hashlib`) are installed.
2. Run the Application: Execute the Python scripts to start the OSS.
3. Testing: Use provided test cases to verify the functionality and security of the system.

Conclusion:
This project demonstrates the implementation of a secure online shopping system for a local grocery store, leveraging OOP principles in Python. By applying UML diagrams and threat modelling techniques, we have ensured the system's security and operational efficiency. Information in this README file provides a detailed guide to the implementation, highlighting strengths and areas for improvement.

References:
1.Howard, M., & LeBlanc, D. (2003). Writing Secure Code. 2nd ed. Microsoft Press.
2.Shostack, A. (2014). Threat Modeling: Designing for Security. Indianapolis: Wiley.
3.Anderson, R. (2008). Security Engineering: A Guide to Building Dependable Distributed Systems. 3rd ed. Indiana: Wiley & Sons.
4.Other relevant references as listed in the proposal document.
