# 🛡️ Container Image Vulnerability Dashboard - PRD

## 1. What is this project about?

When developers use containers (like Docker), they often don’t know if the images inside them have **security issues** (vulnerabilities). This project is about building a **dashboard** that shows all those issues clearly — like a control panel — so users can take action fast.

---

## 2. Why is it needed?

Let’s say you're a DevOps engineer or security analyst managing hundreds of container images. It's almost impossible to manually check which ones are vulnerable. This dashboard helps answer:
- Which images are risky?
- What kind of issues are there?
- What can I do about them?

---

## 3. Who is this for?

- 🧑‍💻 DevOps Engineers – managing images & deployments
- 🛡️ Security Teams – tracking vulnerabilities
- 👨‍💼 Engineering Managers – need visibility & reports

---

## 4. Key Features

### 🧮 Dashboard
- Total images scanned
- Total vulnerabilities found
- Breakdown by severity: Critical / High / Medium / Low
- Top 5 most vulnerable images
- Filters: Time range, severity

### 📋 Image List View
- Image name, repository, and scan status
- Count of issues by severity
- Last scanned time
- Filter and sort options

### 🔍 Image Detail Page
- Image info (name, tag, size)
- List of vulnerabilities with:
  - CVE ID (issue identifier)
  - Severity level
  - Affected package
  - Fix available? (Yes/No)
- Buttons: "Ignore", "Mark as Fixed"

### 📤 Optional Goodies
- Export to CSV/PDF
- Email alerts for new issues

---

## 5. How it works (User Flow)

1. You log in to the dashboard
2. You see a summary of all image issues
3. You click on a specific image to view details
4. You decide what action to take (fix, ignore, export)
5. You repeat this as new images or issues appear

---

## 6. Our Setup (Real Example)

- ✅ Built a GoLang web app that shows current **date & time**
- 🐳 Containerized it using **Docker**
- ☁️ Pushed image to **DockerHub**
- ☸️ Deployed it to **AWS EKS** with 2 pods
- 🌍 Exposed app using a **LoadBalancer** (you can visit it from the browser!)

---

## 7. What makes this better?

- Simple UI for thousands of images
- Fast, human-friendly overview
- Focused on real-world use cases
- Based on **real cloud infrastructure**

---

## 8. Future Ideas

- Automatically fix known issues
- Add login + role management
- Integrate with CI/CD pipelines for real-time scanning

---

## 9. Success = 🚀

- You can find critical images in under 1 minute
- More vulnerabilities get fixed
- Dashboards load fast even for 10,000+ images
