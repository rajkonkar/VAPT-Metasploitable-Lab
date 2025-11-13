# Metasploitable 2 – Vulnerability Assessment and Penetration Testing (VAPT)

This project documents a full Vulnerability Assessment and Penetration Test performed against the Metasploitable 2 virtual machine in an isolated lab network as part of my internship at Codectechnologie.

## Objectives

- Identify exposed services and attack surface.
- Discover and validate vulnerabilities using both manual and automated techniques.
- Safely exploit selected vulnerabilities to demonstrate real impact.
- Produce a professional, consulting-style VAPT report.

## Tools Used

- **Kali Linux** (attacker OS)
- **Nmap** (port scanning, service detection, NSE vuln scripts)
- **Nikto** (web server scanning)
- **Enum4linux** (SMB/NetBIOS enumeration)
- **Metasploit Framework** (exploitation of vsftpd backdoor)
- **Nessus Essentials** (automated vulnerability scanning)

## Key Findings (Highlights)

- `vsftpd 2.3.4` backdoor (CVE-2011-2523) – remote root shell confirmed.
- Backdoored `UnrealIRCd` service – remote code execution.
- Weak/insecure SSL/TLS configuration on SMTP (POODLE, weak DH).
- Outdated `Samba 3.0.20` with message signing disabled.
- `distccd` remote execution exposure.
- Legacy `VNC` configuration exposing potential remote desktop compromise.
- Outdated Apache/Tomcat web stack with multiple issues.

## Repository Structure

- `main.tex` – LaTeX source for the final VAPT report.
- `reports/`
  - `Metasploitable_VAPT_Report.pdf` – final professional VAPT report (for submission).
  - `Nessus_VAPT_Report.pdf` – exported Nessus Essentials vulnerability report.
- `scans/`
  - Nmap service and vulnerability scan outputs.
- `screenshots/`
  - Evidence screenshots (Nmap, Nikto, Enum4linux, Nessus, Metasploit root shell).

## How This Demonstrates My Skills

- End-to-end methodology (recon → scanning → enumeration → exploitation → reporting).
- Practical use of industry tools (Nmap, Metasploit, Nessus).
- Ability to interpret vulnerability data and turn it into clear remediation advice.
- Professional report writing in LaTeX, following a consulting-style structure.

