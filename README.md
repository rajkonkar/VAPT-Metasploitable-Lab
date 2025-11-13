# 🔐 Metasploitable 2 – Vulnerability Assessment & Penetration Testing (VAPT)
### **By Raj M. Konkar | Security Intern – Codectechnologies**

This repository contains a complete **Vulnerability Assessment and Penetration Test (VAPT)** performed against the **Metasploitable 2** virtual machine in a controlled security lab.

The project demonstrates real-world penetration testing methodologies, enumeration techniques, vulnerability discovery, exploitation, and professional reporting — all aligned with industry standards such as **PTES** and **OWASP**.

---

## 📌 **Project Objectives**

- Identify exposed attack surface on the Metasploitable 2 host.
- Enumerate services manually using standard penetration testing tools.
- Validate vulnerabilities using automated scanners.
- Safely exploit critical vulnerabilities to prove real risk.
- Produce a **corporate-style VAPT report** documenting methodology, findings, and recommendations.

---

## 🛠️ **Tools & Technologies Used**

| Category | Tools |
|---------|-------|
| **Scanning & Enumeration** | Nmap, NSE, Enum4linux, Nikto |
| **Exploitation** | Metasploit Framework |
| **Vulnerability Scanning** | Nessus Essentials |
| **Analysis & Reporting** | LaTeX (Crunch-style professional template) |
| **Platform** | Kali Linux attacker machine |

---

## 🚀 **Key Findings (High-Level Summary)**

### 🔴 **Critical Vulnerabilities**
- **vsftpd 2.3.4 Backdoor (CVE-2011-2523)**  
  → Successfully exploited via Metasploit → **Remote Root Shell**  
- **UnrealIRCd Backdoor**  
  → Remote Code Execution via maliciously modified server binary

### 🟠 **High Severity**
- Weak SSL/TLS on SMTP (SSLv2/SSLv3, POODLE, weak DH)
- Samba 3.0.20 with SMB signing disabled
- distccd Remote Command Execution exposure
- Legacy VNC 3.3 service exposed

### 🟡 **Medium Severity**
- Outdated Apache and Tomcat versions
- Misconfigurations on various services

➡️ In a real network, these issues would allow **rapid full-system compromise** with multiple redundant attack paths.

---

## 📂 **Repository Structure**

```plaintext
VAPT-Metasploitable-Lab/
│
├── scans/                # Raw Nmap/Nikto/Enum4linux outputs
├── msflogs/              # Metasploit logs and session output
│
└── report/               # Final deliverables
     ├── latex/           # LaTeX source code for the VAPT report
     ├── screenshots/     # Evidence screenshots (Nmap, Nikto, Nessus, MSF, etc.)
     └── Metasploitable_VAPT_Report.pdf   # Final consulting-style PDF


##📘 **Professional Final Report**

A full consulting-grade VAPT report is included:

📄 report/Metasploitable_VAPT_Report.pdf

The report contains:

Executive Summary

Scope & Rules of Engagement

PTES-aligned methodology

Manual + automated correlation

Detailed vulnerability analysis

Exploitation walkthrough with proof (root shell)

Recommendations & remediation roadmap

Appendix with screenshots and logs

This report is written professionally using LaTeX in the exact style used by consulting firms.

⚡ **Exploitation Proof – Root Shell**

One of the validated exploits (vsftpd backdoor):

whoami
root

→ **Full system compromise achieved successfully.**

Screenshot in:
report/screenshots/metasploit_root.png

🎯 **Skills Demonstrated**

Offensive security methodology (Recon → Exploit → Post-Exploit)

Network scanning & service fingerprinting

Using Nmap NSE for vulnerability detection

Web/app enumeration using Nikto

SMB/NetBIOS enumeration

Exploitation using Metasploit

Vulnerability analysis & interpretation

Automated vulnerability scanning with Nessus

Full professional report writing in LaTeX

Evidence-based security documentation

This project reflects the workflow of a real penetration test.

🔗 **Author**

Raj M. Konkar
Security Intern — Codectechnologies
GitHub: https://github.com/rajkonkar

📝 **Disclaimer**

This assessment was performed strictly in a controlled environment on a deliberately vulnerable machine.
Do NOT run these techniques on systems you do not have explicit permission to test.
