
# Secure CPS Communication Simulation

## Project Summary

This project presents a simulated **Cyber-Physical System (CPS)** featuring **six IoT sensors** communicating securely with a central controller. The architecture integrates:
- **Fernet-based AES encryption** for confidentiality
- **Quality of Service (QoS)** simulation to test reliability under packet loss and latency
- CWE-driven design addressing real-world security threats

### Research Hypothesis

Client-side encryption, combined with simulated QoS conditions, improves delivery reliability and mitigates key vulnerabilities in distributed IoT systems, including:

- CWE-319 (Cleartext Transmission)
- CWE-400 (Resource Exhaustion)
- CWE-770 (Allocation Without Limits)
- CWE-693 (Improper Input Protection)

## Devices Simulated

Each client mimics a real IoT device, sending encrypted data to a controller:
- `client_temp.py`: Temperature Sensor
- `client_motion.py`: Motion Detector
- `client_humidity.py`: Humidity Sensor
- `client_door.py`: Door Sensor
- `client_smoke.py`: Smoke Detector
- `client_energy.py`: Energy Consumption Monitor

## How to Run

### Prerequisites
```bash
pip install cryptography
```

### Steps
1. Open **Terminal 1**:
   ```bash
   python controller.py
   ```

2. Open **Terminal 2–7**, and run each sensor:
   ```bash
   python client_temp.py
   python client_motion.py
   ...
   ```

Ensure the following files are in the same directory:
- All `.py` scripts
- `shared_key.key`
- `qos_utils.py`

## Security Features and CWE Mitigation

| **CWE Reference** | **Vulnerability**         | **Mitigation Strategy**                           |
| ----------------- | ------------------------- | ------------------------------------------------- |
| CWE-319           | Cleartext Transmission    | All data is encrypted using Fernet symmetric keys |
| CWE-400           | Resource Exhaustion       | QoS delay/drop, pacing and retry limiting         |
| CWE-770           | Allocation Without Limits | Input formatting and length constraints enforced  |
| CWE-693           | Improper Input Protection | Invalid inputs logged; parser fails gracefully    |

## QoS Simulation

The `qos_utils.py` module introduces:
- **Random latency** between 0.1 and 0.5 seconds
- **10% chance** of simulated packet drop

These factors test the system’s resilience under degraded conditions.

## Output Files

- `log_controller.txt`:  
  Logs each successfully received and decrypted message with timestamp and source

- `results.csv`:  
  Stores per-client test metrics: timestamp, latency, encryption status, drop result, and CWE triggered

- `shared_key.key`:  
  Pre-generated symmetric key (AES) for Fernet encryption

> Note: These outputs were analysed for traceability and referenced in Sections 6 and 8 of the final report.

## Code Structure

### `controller.py`
- Listens for incoming encrypted messages
- Decrypts using Fernet and logs each result
- Responds with encrypted ACK
- Logs decode errors (e.g. malformed input)

### `client_*.py`
- Encrypts message: `[Sensor] value at TIMESTAMP`
- Applies delay and drop simulation via `simulate_qos()`
- Sends a message to the controller via TCP socket

### `qos_utils.py`
- Function: `simulate_qos()`  
  → Returns `(success_bool, delay_time)`

### `results.csv`
- Timestamped results of each interaction
- Includes: latency, encrypted?, dropped?, CWE triggered

### `log_controller.txt`
- Logs successful message delivery for audit or IDS-style monitoring

## Example Test Result (from results.csv)



| **Timestamp**       | **Client**  | **Sensor Value** | **Latency (s)** | **Dropped** | **Encrypted** | **CWE Triggered** | **Outcome** |
| ------------------- | ----------- | ---------------- | --------------- | ----------- | ------------- | ----------------- | ----------- |
| 2025-06-09T11:30:42 | Temperature | 22.5°C           | 0.323           | False       | True          | CWE-319           | Delivered   |
| 2025-06-09T11:31:00 | Smoke       | Level 4 detected | 0.211           | True        | True          | CWE-770           | Dropped     |

## Limitations and Future Enhancements

- **Static Key**: Pre-shared key used; future implementations should support TLS or certificate-based key exchange  
- **Transport Protocol**: TCP is used for simplicity; MQTT over TLS is more scalable  
- **Monitoring Gaps**: No IDS or anomaly detection integrated  
- **Scalability**: Clients are manually run in sequence; future versions could use container orchestration (e.g. Docker, Kubernetes)

*Further reflection and academic analysis are included in the full report submission.*

## References

- Jain, S.M. (2023) *Linux Containers and Virtualisation*. Apress.  
- Mishra, A.D. & Mustafa, K. (2022) 'A review on security requirements specification by formal methods'. *Concurrency and Computation*, 34(5), e6702.  
- OWASP Foundation (2023) *Proactive Controls*. Available at: https://owasp.org [Accessed 5 June 2025]  
- MITRE Corporation (2025) *CWE Database*. Available at: https://cwe.mitre.org [Accessed 5 June 2025]  
- NIST (2015) *SP 800-82r2: Guide to ICS Security*. Available at: https://nvlpubs.nist.gov [Accessed 5 June 2025]  
