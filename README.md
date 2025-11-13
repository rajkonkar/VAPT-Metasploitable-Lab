# 🔐 Metasploitable 2 – Vulnerability Assessment & Penetration Testing (VAPT)
### **By Raj M. Konkar | Security Intern – Codectechnologies**

This repository contains a complete **Vulnerability Assessment and Penetration Test (VAPT)** performed against the intentionally vulnerable **Metasploitable 2** virtual machine in a controlled cybersecurity lab.

This project demonstrates a full penetration testing workflow, including manual enumeration, automated scanning, exploitation, and professional reporting aligned with **PTES**, **OWASP**, and industry consulting standards.

---

## 📌 Project Objectives

- Identify the exposed attack surface of the Metasploitable 2 host.
- Enumerate all accessible services using manual tools.
- Validate vulnerabilities using automated scanners.
- Exploit critical weaknesses to demonstrate realistic risk.
- Produce a **consulting-style VAPT report** with evidence and remediation steps.

---

## 🛠️ Tools & Technologies Used

| Category | Tools |
|---------|-------|
| **Scanning & Enumeration** | Nmap (Full Scan, NSE Scripts), Enum4linux, Nikto |
| **Exploitation** | Metasploit Framework |
| **Vulnerability Scanning** | Nessus Essentials |
| **Reporting** | LaTeX (professional Crunch-style format) |
| **Environment** | Kali Linux (Attacker), Metasploitable 2 (Target) |

---

## 🚀 High-Level Summary of Findings

### 🔴 Critical Vulnerabilities
- **vsftpd 2.3.4 Backdoor (CVE-2011-2523)**  
  ✔ Successfully exploited using Metasploit  
  ✔ Result: **Unauthenticated Remote Root Shell**

- **UnrealIRCd Backdoor**  
  ✔ Remote Code Execution due to malicious upstream binary

### 🟠 High Severities
- Weak SSL/TLS on SMTP (SSLv2, SSLv3, POODLE, weak DH parameters)
- Samba 3.0.20 with SMB signing disabled
- distccd remote command execution exposure
- Legacy VNC 3.3 service exposed

### 🟡 Medium Severities
- Outdated Apache & Tomcat versions
- Multiple directory indexing / info disclosure issues
- Weak HTTP headers and outdated software stacks

➡️ These issues create **multiple easy attack paths**, allowing rapid system compromise.

---

## 📂 Repository Structure

```plaintext
VAPT-Metasploitable-Lab/
│
├── scans/                 # Raw Nmap, Nikto, Enum4linux outputs
├── msflogs/               # Metasploit logs & session outputs
│
└── report/
     ├── latex/            # LaTeX source for final VAPT report
     ├── screenshots/      # Evidence screenshots
     └── Metasploitable_VAPT_Report.pdf   # Final professional report
```

---

## 📘 Professional Final Report

A fully polished, **consulting-grade** penetration testing report is available:

📄 `report/Metasploitable_VAPT_Report.pdf`

It includes:

- Executive Summary  
- Scope & Rules of Engagement  
- Full PTES Methodology  
- Manual vs Automated Vulnerability Correlation  
- Detailed Technical Findings  
- Exploitation Walkthrough (Root Shell Proof)  
- Remediation & Hardening Roadmap  
- Appendices (Evidence + Logs)

Written in LaTeX using a clean, corporate-style template.

---

## ⚡ Exploitation Proof – Root Shell

One of the major vulnerabilities exploited (vsftpd 2.3.4 backdoor) resulted in full compromise:

```
whoami
root
```

✔ **Remote Root Access Obtained**  
✔ Demonstrates complete system takeover

📷 Evidence stored in:  
`report/screenshots/metasploit_root.png`

---

## 🎯 Skills Demonstrated

- Professional penetration testing workflow  
- Network scanning & service fingerprinting  
- Nmap NSE-based vulnerability assessment  
- Web enumeration with Nikto  
- SMB/NetBIOS enumeration via Enum4linux  
- Exploitation using Metasploit (RCE → Root Shell)  
- Nessus automated scanning & report correlation  
- Cybersecurity documentation & LaTeX reporting  
- Real-world VAPT procedures and methodology  

This project mirrors the process used by actual red-team consultants and penetration testers.

---

## 🔗 Author

**Raj M. Konkar**  
Security Intern — Codectechnologies  
GitHub: https://github.com/rajkonkar

---

## 📝 Disclaimer

This assessment was conducted **only within a controlled environment** on a deliberately vulnerable machine (Metasploitable 2).  
Do **NOT** attempt these techniques on any system without explicit legal permission.

