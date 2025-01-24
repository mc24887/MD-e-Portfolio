# E-Portfolio: Security and Risk Management

## Introduction
Welcome to my e-portfolio for the Security and Risk Management module. This portfolio showcases my learning journey, including reflective pieces, seminar insights, group projects, and final reports. Its goal is to highlight my skills, growth, and achievements throughout the module.



## Reflective Piece
### Reflective Study
This section contains my reflective study based on Gibbs' Reflective Cycle, skill matrices, and planned certifications. It includes a critical analysis of experiences and highlights areas for improvement, such as time management and communication skills. The iterative process of applying theoretical frameworks such as STRIDE and Monte Carlo simulations improved my understanding of risk assessment.

#### Skills and Certifications Plan
| Certification            | Purpose                                 | Timeline  |
| ------------------------ | --------------------------------------- | --------- |
| CISSP                    | Deepen cybersecurity expertise          | 12 months |
| CRISC                    | Strengthen enterprise risk management   | 18 months |
| ISO 31000 Certification  | Gain advanced risk management knowledge | 12 months |
| Agile Project Management | Improve project handling efficiency     | 9 months  |

## Seminars and Key Learnings
### Unit 1: Introductory Seminar
- Covered module structure and assessments.
- Discussed team project roles and collaborative working expectations.

### Unit 2: Risk Management Process
- Analysed differences between qualitative and quantitative risk assessments.
- Evaluated the importance of user involvement in risk management decisions.

### Unit 3: Threat Modelling Introduction
- Explored distinctions between threats and vulnerabilities.
- Reviewed popular threat modelling techniques like STRIDE, DREAD, and Attack Trees.

### Unit 4: Threat Modelling Exercises
- Created threat models for diverse scenarios (e.g., airports, banks) using STRIDE and DREAD.
- Integrated ATT&CK libraries and OWASP Threat Modelling Cookbook.
- Example from the UK Bank Scenario:
  - **Threat Identified**: Malware attack on internal banking systems.
  - **Mitigation Tools**: Multi-factor authentication, Vectra AI for behavioural analysis, Rapid7 for vulnerability scanning.

Applying STRIDE reveals the following threats to the current business operations:

| **Threat Type**             | **Description**                                    | **Impact**                                                   | **Mitigation**                                               |
| --------------------------- | -------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Spoofing**                | Unauthorized  access to unsecured Wi-Fi network    | Data  breaches, unauthorized access to sensitive information | 1. Implement WPA3 encryption.   2.  Use strong, unique passwords for network access.   3. Enable MAC address filtering to restrict access to authorized devices. |
| **Tampering**               | Manipulation  of inventory spreadsheets            | Inaccurate inventory data, financial discrepancies           | 1.  Establish role-based access controls (RBAC) to limit who can modify data.   2. Implement version control to track and audit changes in spreadsheets. |
| **Repudiation**             | Lack  of transaction logs allows denial of actions | Difficulty  in auditing, resolving disputes                  | 1.  Implement secure, tamper-evident transaction logging (Kent & Souppaya,  2006).   2. Use digital signatures to verify the integrity of transactions. |
| **Information  Disclosure** | Unencrypted  emails expose customer data           | Loss of  customer trust, potential legal liabilities         | 1. Use  end-to-end encrypted email services.   2. Establish a data classification policy to ensure sensitive information is  always protected. |
| **Denial  of Service**      | System  failures due to outdated hardware          | Operational  downtime, loss of sales                         | 1.  Upgrade outdated systems to meet current performance standards (Microsoft,  2018).   2. Implement redundancy in hardware to minimize the impact of failures. |
| **Elevation  of Privilege** | Staff  access sensitive data without controls      | Unauthorized  changes, potential insider threats             | 1.  Implement multi-factor authentication (MFA) for sensitive data access.   2. Enforce principle of least privilege (POLP) to minimize unnecessary access  rights. |

### Unit 5: Security Standards in Industry
- Examined industry-specific standards like GDPR, PCI-DSS, and HIPAA.
- Evaluated frameworks for assessing organisational compliance and mitigating risks.
- **Key Takeaways**:
  - PCI-DSS ensures safe online transactions.
  - GDPR compliance fosters trust in handling customer data.

### Unit 6: Practical Implications of Standards
- Reviewed GDPR-related case studies, focusing on breaches and resolutions.
- Example:
  - **Issue**: Lack of encryption in customer communication.
  - **Solution**: Implemented end-to-end encryption and employee training.



### Unit 7: Quantitative Risk Modelling
- Discussed methods like Monte Carlo simulations and Bayes Theorem.
- Evaluated multi-criteria decision-making tools such as TOPSIS and AHP.
- **Analysis**:
  - Monte Carlo models provide probabilistic risk insights.
  - AHP enables prioritisation of risks based on impact.

### Unit 8: Implementing Quantitative Models
- Developed quantitative models for real-world scenarios.
- Example:
  - **Scenario**: Simulated disaster recovery scenarios for a critical IT system.
  - **Outcome**: Provided actionable insights for business continuity planning.
- **Graphical Insights**:
  - Risk probability distribution charts helped prioritise mitigations.

### Unit 9: Risk, Business Continuity, and DR
- Reviewed frameworks for Business Impact Assessments (BIA), RPO, and RTO.

- Proposed recovery solutions tailored to organisational needs.

- **Table**:

  ![image-20250124203251996](C:\Users\mur_c\AppData\Roaming\Typora\typora-user-images\image-20250124203251996.png)
### Unit 10: DR Solutions Design
- Investigated cloud vendor lock-in issues and proposed multi-cloud strategies.

- Designed disaster recovery solutions for varying RPO/RTO metrics:
  1. **High Availability**: Active-active architecture with real-time failover.
  2. **Cost-Effective**: Warm standby architecture with asynchronous replication.
  
  ![image-20250124201738434](C:\Users\MC\AppData\Roaming\Typora\typora-user-images\image-20250124201738434.png)

### Unit 11: Future Trends in SRM
- Analysed emerging trends such as AI, DevSecOps, and automation.
- Example:
  - **Trend**: Trustworthy AI systems.
  - **Impact**: Enhanced decision-making and threat detection capabilities.
- **Reference Analysis**:
  - AI bias mitigation was discussed using frameworks like FairML.

### Unit 12: The Great Debate
- **Key Trends with Personal Perspective**

  **1. Trustworthy AI**

  - **Relevance**:
    - Trustworthy AI systems      will redefine risk detection and decision-making by enhancing robustness,      fairness, and accountability.
    - Key challenges include      poisoning attacks, model theft, and the need for ethical AI frameworks.
  - **Critical Analysis**:
    - While AI improves      efficiency, its adoption raises ethical concerns such as algorithmic bias      and accountability.
    - Organisations must      invest in explainable AI to address transparency issues.

  **2. Machine Learning for Security**

  - **Impact**:
    - Predictive analytics      enabled by machine learning will proactively mitigate risks.
    - Real-time anomaly      detection will strengthen defences against advanced cyber threats.
  - **Critical Analysis**:
    - Machine learning      models require extensive training data, which may not always be      available.
    - There’s a risk of      over-reliance on automated systems without adequate human oversight.

  **3. DevSecOps Integration**

  - **Relevance**:
    - Combining security      with development and operations ensures vulnerabilities are addressed      early in the development lifecycle.
  - **Critical Analysis**:
    - Agile security methods      like DevSecOps reduce delays but demand a cultural shift and significant      training.
    - Balancing speed with      thorough security checks remains a challenge.

  **4. Risk Modelling Techniques**

  - **Relevance**:
    - Advanced risk      modelling methods like Monte Carlo simulations provide better insights      into risk probabilities and impacts.

  | **Risk Factor**        | **Probability (%)** | **Impact on Quality (%)** | **Impact on Supply Chain  (%)** |
  | ---------------------- | ------------------- | ------------------------- | ------------------------------- |
  | Supply Chain Delays    | 20                  | Moderate (15-25)          | High (30-35)                    |
  | Quality Control Issues | 15                  | High (25-35)              | Low (5-10)                      |
  | Cybersecurity Breaches | 10                  | Moderate (10-15)          | Moderate (15-20)                |

   

  - **Critical Analysis**:
    - Quantitative models      provide actionable insights but may oversimplify complex, interconnected      risks.
    - Effective implementation      requires cross-departmental collaboration and access to reliable data.

  **5. Enterprise Risk Management (ERM)**

  - **Relevance**:
    - Aligning ERM with      business goals creates value while addressing diverse risks.
  - **Critical Analysis**:
    - ERM frameworks enhance      strategic decision-making but require substantial resources for      implementation.
    - Industry-specific      risks need tailored approaches rather than generic frameworks.

## Projects
### Risk Identification Report: Pampered Pets
- Conducted a thorough risk assessment using STRIDE and NIST frameworks.
- Proposed e-commerce solutions to enhance market reach and security.

| Threat Type       | Description       | Mitigation                      |
| ----------------- | ----------------- | ------------------------------- |
| Spoofing          | Credential theft  | Multi-factor authentication     |
| Tampering         | Data manipulation | Content Security Policies (CSP) |
| Denial of Service | System overload   | DDoS Protection Services        |

### Threat Modelling Exercise
- Applied STRIDE and DREAD for threat analysis in critical infrastructure.
- Example from banking scenario:
  - **Spoofing**: Mitigated through advanced identity protection.
  - **Information Disclosure**: Prevented by encrypting sensitive data.

![image-20250124202501634](C:\Users\MC\AppData\Roaming\Typora\typora-user-images\image-20250124202501634.png)

![image-20250124202538291](C:\Users\MC\AppData\Roaming\Typora\typora-user-images\image-20250124202538291.png)

![image-20250124202620660](C:\Users\MC\AppData\Roaming\Typora\typora-user-images\image-20250124202620660.png)

![image-20250124202639153](C:\Users\MC\AppData\Roaming\Typora\typora-user-images\image-20250124202639153.png)

![image-20250124202703887](C:\Users\MC\AppData\Roaming\Typora\typora-user-images\image-20250124202703887.png)

### Team Contract and Peer Evaluations

- Collaboratively outlined goals for group projects.
- Highlights:
  - Equal participation, fostering accountability.
  - Focused on clear communication and timely deliverables.

## References
### Academic References
- Gibbs, G. (1988). *Learning by Doing: A Guide to Teaching and Learning Methods*. Oxford: Oxford Polytechnic.
- Kolb, D. A. (1984). *Experiential Learning: Experience as the Source of Learning and Development*. Englewood Cliffs, NJ: Prentice Hall.
- Shostack, A. (2018). *Threat Modelling: Designing for Security*. New York: Wiley.
- ENISA (2022). *Cybersecurity Risk Trends in Supply Chains*. [Online]. Available at: [https://www.enisa.europa.eu](https://www.enisa.europa.eu).
- Opara-Martins, J., Sahandi, R., & Tian, F. (2014). *Critical Review of Vendor Lock-In and Its Impact on Adoption of Cloud Computing*. IEEE.
- Stoneburner, G., Goguen, A., & Feringa, A. (2002). *Risk Management Guide for Information Technology Systems*. NIST Special Publication 800-30.
- Trott, J. (2019). *Emerging Attacks on AI Systems*. International Journal of Cybersecurity, 12(4), pp. 56-72.

---
&copy; 2025 Milad Chowdhury | Security and Risk Management
