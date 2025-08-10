#!/usr/bin/env bash
set -euo pipefail

root="."
mkdir -p "$root/assets" "$root/modules"

# ---------- CSS ----------
cat > "$root/assets/style.css" <<'CSS'
:root{--bg:#0b1220;--panel:#0f172a;--ink:#eaf2ff;--muted:#b8c4e5;--brand:#2f54eb;--stroke:#243b6b;--r:16px}
*{box-sizing:border-box}html,body{margin:0;padding:0}
body{font-family:Segoe UI,Roboto,Arial,sans-serif;background:var(--bg);color:var(--ink)}
a{color:#cde1ff}
.header{background:var(--brand);color:#fff}
.nav{max-width:1200px;margin:0 auto;display:flex;justify-content:space-between;align-items:center;padding:14px 16px}
.hero{padding:22px 16px;text-align:center}
.container{max-width:1200px;margin:0 auto;padding:16px}
.section{background:var(--panel);border:1px solid var(--stroke);border-radius:var(--r);box-shadow:0 6px 18px rgba(0,0,0,.35);padding:18px;margin:16px 0}
.small{color:var(--muted);line-height:1.65}
.badge{display:inline-block;margin-left:8px;padding:2px 8px;border-radius:999px;border:1px solid #bfd0ff;background:#e6efff;color:#0b1f6d;font-size:.8rem}
.badge.progress{background:#fff6e5;color:#7a4d00;border-color:#ffd89a}
.badge.pending{background:#e2e8f0;color:#1f2937;border-color:#cbd5e1}
table{width:100%;border-collapse:collapse}
th,td{border:1px solid #29457a;padding:8px;text-align:left}
th{background:#0e1b34}
.footer{background:var(--brand);color:#fff;text-align:center;padding:14px;margin-top:28px}
CSS

# ---------- Index ----------
cat > "$root/index.html" <<'HTML'
<!doctype html><html lang="en"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>MSc Cyber Security – e-Portfolio</title><link rel="stylesheet" href="assets/style.css">
</head><body>
<div class="header">
  <div class="nav"><div>MSc Cyber Security</div><div>e-Portfolio</div></div>
  <div class="hero">
    <h1>About Me</h1>
    <p class="small">
      I am an MSc Cyber Security graduate student with a portfolio of secure technology projects covering system design, network defence,
      risk management, software development, and human-centric security. These include a Secure Online Shopping System, a Network Vulnerability
      Assessment using Nmap, OpenVAS, ZAP, and Wireshark, a Secure Copyright Management Application with AES-256 encryption,
      and a CPS security simulation. Each project applies industry standards such as NIST, OWASP, ISO 27001, and CWE/CWSS, combining technical
      execution with clear, evidence-based reporting.
    </p>
  </div>
</div>

<div class="container">
  <div class="section">
    <h2>Module Summary</h2>
    <table class="small" aria-label="Module Summary Table">
      <thead><tr><th>Module</th><th>Status</th><th>Impact</th></tr></thead>
      <tbody>
        <tr><td><a href="modules/launching-into-cyber-security/index.html">Launching into Cyber Security</a></td><td><span class="badge">Completed</span></td><td class="small">Designed and tested a Secure Online Shopping System (OSS) with UML, STRIDE/DREAD, and AES.</td></tr>
        <tr><td><a href="modules/network-security/index.html">Network Security</a></td><td><span class="badge">Completed</span></td><td class="small">Ran Nmap/OpenVAS/ZAP/Wireshark, verified misconfigs, produced hardening advice.</td></tr>
        <tr><td><a href="modules/security-and-risk-management/index.html">Security & Risk Management</a></td><td><span class="badge">Completed</span></td><td class="small">Risk register, STRIDE/DREAD, Monte Carlo, BC/DR aligned to ISO 31000 & NIST 800-30.</td></tr>
        <tr><td><a href="modules/secure-software-development/index.html">Secure Software Development</a></td><td><span class="badge">Completed</span></td><td class="small">Built SCMA with AES-256, RBAC, UML threat modelling, and static analysis.</td></tr>
        <tr><td><a href="modules/the-human-factor/index.html">The Human Factor</a></td><td><span class="badge">Completed</span></td><td class="small">Ethical, inclusive, behaviour-driven security culture interventions for start-ups.</td></tr>
        <tr><td><a href="modules/secure-systems-architectures/index.html">Secure System Architecture</a></td><td><span class="badge">Completed</span></td><td class="small">CWE/CWSS scoring, AD Trees, Python CPS simulation for layered defences.</td></tr>
        <tr><td><a href="modules/research-methods-and-professional-practice/index.html">Research Methods & Professional Practice</a></td><td><span class="badge progress">In Progress</span></td><td class="small">LR outline on gen-AI & email security; ethics, methodology, search strategy.</td></tr>
        <tr><td><a href="modules/principles-of-digital-forensics-and-cyber-law/index.html">Principles of Digital Forensics & Cyber Law</a></td><td><span class="badge pending">Pending</span></td><td class="small">Plan: imaging, chain of custody, tooling validation, admissible reports.</td></tr>
        <tr><td><a href="modules/dissertation/index.html">Dissertation</a></td><td><span class="badge pending">Pending</span></td><td class="small">Plan: original research with build/experiments and rigorous evaluation.</td></tr>
      </tbody>
    </table>
  </div>
</div>

<div class="footer">© 2025–2026 mc24887 | MSc Cyber Security</div>
</body></html>
HTML

mkmod(){ mkdir -p "$root/modules/$1"; cat > "$root/modules/$1/index.html" <<HTML
<!doctype html><html lang="en"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>$2 – Evidence</title><link rel="stylesheet" href="../../assets/style.css"></head><body>
<div class="header"><div class="nav"><div><a href="../../index.html" style="color:#fff;text-decoration:none">&larr; Back</a></div><div>$2 <span class="badge $4">$3</span></div></div></div>
<div class="container">
  <div class="section"><h2>Module Overview</h2><p class="small">$5</p></div>
  <div class="section"><h2>Key Submissions & Evidence</h2>
    <ul class="small">
      $6
    </ul>
    <!-- INSERT: module visuals, screenshots, code snippets below -->
  </div>
  <div class="section"><h2>Supporting Artefacts</h2><ul class="small">$7</ul></div>
  <div class="section"><h2>Reflection</h2><p class="small">$8</p></div>
  <div class="section"><h2>Skills Developed</h2><ul class="small">$9</ul></div>
  <div class="section"><h2>Professional Impact</h2><p class="small">${10}</p></div>
  <div class="section"><h2>Feedback</h2><p class="small">Email feedback to <kbd>mc24887@essex.ac.uk</kbd>.</p></div>
</div>
<div class="footer">© 2025–2026 mc24887 | MSc Cyber Security</div>
</body></html>
HTML
}

# ---------- Module Pages ----------
mkmod "launching-into-cyber-security" "Launching into Cyber Security" "Completed" "" \
"Built a Secure Online Shopping System (OSS) using UML, STRIDE/DREAD, and AES; validated with targeted tests." \
"<li><strong>Design Proposal</strong> — Use-Case/Sequence/Class diagrams; STRIDE/DREAD with mitigations. <!-- INSERT: UML_UseCase_OSS.png --></li>
<li><strong>AES Crypto</strong> — Python AES encrypt/decrypt with secure key handling; sample data validation. <!-- INSERT: Code_AESEncryption_Snippet.py --></li>
<li><strong>Secure Coding & Tests</strong> — Parameterised queries, input validation; auth/storage/retrieval tests. <!-- INSERT: Test_Cases_Auth_Storage.txt --></li>
<li><strong>Discussion & Summary</strong> — Rationale + reflection on peer feedback. <!-- INSERT: Forum_InitialPost.png --></li>" \
"<li>UML exports</li><li>STRIDE/DREAD tables</li><li>AES snippet</li><li>Test logs</li>" \
"Converted requirements into verifiable controls; defended choices with evidence of effectiveness." \
"<li>UML security modelling</li><li>Threat modelling</li><li>Python crypto</li><li>Input validation</li><li>Test design</li>" \
"Strong basis for secure design/AppSec roles where controls must be justified and demonstrated."

mkmod "network-security" "Network Security" "Completed" "" \
"Nmap/OpenVAS/ZAP/Wireshark used to enumerate services, confirm issues, and propose hardening actions." \
"<li><strong>Nmap & SSL Enum</strong> — 80/443/8080, legacy Apache, SSLv2/weak ciphers, TRACE enabled. <!-- INSERT: Nmap_Scan_Results.png --></li>
<li><strong>OpenVAS</strong> — Automated scan corroboration + awareness of scanner blind spots. <!-- INSERT: OpenVAS_Report_excerpt.png --></li>
<li><strong>ZAP</strong> — Medium: /server-status exposed (OWASP A05, CWE-538). <!-- INSERT: ZAP_Report_Screenshot.png --></li>
<li><strong>Wireshark</strong> — Unencrypted HTTP traffic; enforce TLS 1.2+. <!-- INSERT: Wireshark_TLS_Capture.png --></li>" \
"<li>Nmap outputs</li><li>OpenVAS summary</li><li>ZAP report</li><li>pcap notes</li>" \
"Reinforced value of manual verification alongside scanners; delivered specific config hardening steps." \
"<li>Service discovery</li><li>TLS hygiene</li><li>Web testing</li><li>Packet analysis</li><li>OWASP/CWE mapping</li>" \
"Directly supports pentesting and secure configuration reviews."

mkmod "security-and-risk-management" "Security & Risk Management" "Completed" "" \
"Risk register, threat models, and BC/DR designs aligned to ISO 31000 and NIST 800-30; communicated to exec/tech audiences." \
"<li><strong>Risk Identification</strong> — NIST 800-30 & STRIDE; prioritised treatments. <!-- INSERT: Risk_Register_Table.png --></li>
<li><strong>Threat Modelling</strong> — STRIDE/DREAD & ATT&CK scenarios. <!-- INSERT: ThreatModel_Bank_ADTree.png --></li>
<li><strong>DR Planning</strong> — Monte Carlo, RPO/RTO, hybrid cloud failover drills. <!-- INSERT: DR_Architecture_Diagram.png --></li>" \
"<li>Risk register</li><li>ADTree</li><li>DR diagrams</li><li>Seminar outputs</li>" \
"Balanced qualitative and quantitative techniques to drive proportionate BC/DR decisions." \
"<li>Risk assessment</li><li>Threat modelling</li><li>BC/DR</li><li>Executive reporting</li><li>Quantitative analysis</li>" \
"Supports GRC and architecture roles with board-level communication."

mkmod "secure-software-development" "Secure Software Development" "Completed" "" \
"Delivered SCMA with AES-256, RBAC, UML threat modelling, and static analysis gates." \
"<li><strong>Design</strong> — AES-256 at rest, SHA-256 passwords, RBAC; UML models. <!-- INSERT: UML_SCMA_Sequence.png --></li>
<li><strong>Coding</strong> — Python + cryptography; parameterised SQLite; key manager. <!-- INSERT: Code_SCMA_EncryptionManager.py --></li>
<li><strong>Testing</strong> — Bandit clean; Pylint 9.47; Flake8 tidy; functional tests. <!-- INSERT: Bandit_Report.png --></li>" \
"<li>Code snippets</li><li>UML</li><li>Static analysis</li><li>Test logs</li>" \
"End-to-end secure delivery with measurable quality." \
"<li>AES-256</li><li>RBAC</li><li>UML threat modelling</li><li>Static analysis</li><li>Test logging</li>" \
"Evidence for AppSec/secure dev roles."

mkmod "the-human-factor" "The Human Factor" "Completed" "" \
"Analysed social engineering, insider threats, and awareness; proposed inclusive interventions with behaviour metrics." \
"<li><strong>Critical Essay</strong> — Evidence-based analysis with actionable controls. <!-- INSERT: Essay_Excerpt.png --></li>
<li><strong>Presentation</strong> — Micro-campaigns, RBAC hygiene, Menlo principles. <!-- INSERT: Presentation_Slide.png --></li>
<li><strong>Peer Review</strong> — Criteria-based feedback improving synthesis and standards mapping. <!-- INSERT: PeerReview_Comment.png --></li>" \
"<li>Essay (Harvard refs)</li><li>Slides</li><li>Peer review notes</li>" \
"Designed people-first security that changes behaviour without blame." \
"<li>Behavioural design</li><li>Ethics</li><li>Security culture</li><li>Stakeholder comms</li>" \
"Useful for awareness leadership and policy design."

mkmod "secure-systems-architectures" "Secure System Architecture" "Completed" "" \
"CWE/CWSS-prioritised weaknesses, AD Trees for layered controls, and Python CPS simulation validating mitigations." \
"<li><strong>CWE/CWSS</strong> — Scored weaknesses (e.g., CWE-434, CWE-346). <!-- INSERT: CWSS_Scoring_Table.png --></li>
<li><strong>AD Tree</strong> — Attack/defence nodes across layers. <!-- INSERT: ADTree_Diagram.png --></li>
<li><strong>Simulation</strong> — Fernet-encrypted comms, CWE injections, CSV logs. <!-- INSERT: Results_CSV_Snippet.png --></li>" \
"<li>CWSS table</li><li>ADTree</li><li>Scripts</li><li>Logs</li>" \
"Traceability from model → design → code → evidence." \
"<li>CWE/CWSS</li><li>Architecture modelling</li><li>Crypto integration</li><li>Logging/evidence</li>" \
"Strong fit for security architecture reviews."

mkmod "research-methods-and-professional-practice" "Research Methods & Professional Practice" "In Progress" "progress" \
"Literature review on generative AI & email security; ethics, methodology, and search strategy defined." \
"<li><strong>LR Outline</strong> — Scope, RQs, databases, inclusion/exclusion, themes. <!-- INSERT: LR_Outline_Block.html --></li>
<li><strong>Ethics & Codes</strong> — ACM/BCS comparison; legal/social implications. <!-- INSERT: Forum_ACM_BCS_Post.png --></li>
<li><strong>Next Steps</strong> — Screen/code sources; structure review; prepare proposal narrative. <!-- INSERT: LR_Kanban.png --></li>" \
"<li>Outline</li><li>Source log</li><li>Forum posts</li>" \
"On course for Unit 7 LR and Unit 10 proposal." \
"<li>Critical appraisal</li><li>Referencing</li><li>Research ethics</li><li>Search design</li>" \
"Builds research rigour for dissertation."

mkmod "principles-of-digital-forensics-and-cyber-law" "Principles of Digital Forensics & Cyber Law" "Pending" "pending" \
"Planned for defensible acquisition, chain of custody, validated tools, and admissible reports." \
"<li><strong>Preparation</strong> — Imaging workflow (hashing, write blockers), SOPs, templates. <!-- INSERT: Forensics_SOP_Checklist.png --></li>" \
"<li>SOPs</li><li>Templates</li>" \
"Ready to pilot a small case and validate process." \
"<li>Chain of custody</li><li>Imaging</li><li>Reporting</li>" \
"Foundation for reliable digital investigations."

mkmod "dissertation" "Dissertation" "Pending" "pending" \
"Planned original research with build/experiments and rigorous evaluation; method selected post-scope validation." \
"<li><strong>Scope Draft</strong> — Problem framing, method options, feasibility and risks. <!-- INSERT: Dissertation_Scope_Notes.png --></li>" \
"<li>Early notes</li><li>Pilot plan</li>" \
"Targeting a publishable standard with transparent method and evidence." \
"<li>Research design</li><li>Experimentation</li><li>Academic writing</li>" \
"Capstone demonstrating independent research capability."

echo "Portfolio scaffold written."
