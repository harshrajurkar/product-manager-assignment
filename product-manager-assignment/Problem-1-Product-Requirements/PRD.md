# Product Requirements Document (PRD)

## 1. Title
Container Image Vulnerability Dashboard

---

## 2. Problem Statement
Users managing large repositories of container images (e.g., Docker images) face a challenge in identifying which images have vulnerabilities — especially critical ones that require immediate fixes. With thousands of images, manual inspection is not scalable. A clear, actionable dashboard is needed to surface key information and guide remediation.

---

## 3. Goals
- Provide visibility into vulnerabilities in container images.
- Enable users to filter and prioritize based on severity (Critical, High, Medium, Low).
- Allow quick identification of images requiring fixes.
- Support easy navigation and search across thousands of images.
- Provide drill-downs for vulnerability details and fix recommendations.

---

## 4. Target Users
- **DevOps Engineers** – manage container images and deployments.
- **Security Analysts** – responsible for vulnerability management.
- **Engineering Managers** – want visibility into risk posture.

---

## 5. Features & Functionality

### 🔸 Dashboard View
- Overview panels:
  - Total Images Scanned
  - Total Vulnerabilities (with breakdown by severity)
  - % Images with Critical or High vulnerabilities
- Top 5 Most Vulnerable Images
- Filters: Time range, Image type, Severity

### 🔸 Image List View
- Table showing:
  - Image Name
  - Repository
  - Scan Status
  - Vulnerabilities by Severity
  - Last Scan Time
- Sorting: by severity count, scan date, name
- Filters: Severity, Registry, Tags

### 🔸 Image Detail View
- Image metadata (repo, tag, size)
- List of vulnerabilities:
  - CVE ID
  - Severity
  - Affected package
  - Fix available (Y/N)
  - Path
- Suggested Fix / Remediation Option
- “Ignore” or “Mark as Fixed” buttons

### 🔸 Optional
- Export vulnerabilities to CSV/PDF
- Notifications for new critical findings

---

## 6. User Flow

1. User logs in and lands on Dashboard.
2. They view total vulnerabilities and filter for critical ones.
3. Click on a specific image to view its vulnerability details.
4. Identify a fixable issue and take action.
5. (Optional) Export report or assign to engineer.

---

## 7. Non-Functional Requirements
- Scalable: Must support >10,000 images
- Secure: Role-based access (read-only, editor)
- Fast: Dashboards must load within 2 seconds
- API-first design

---

## 8. Success Metrics
- Time to identify critical images
- % vulnerabilities fixed over time
- Reduction in critical issues after X days
- User engagement (login frequency, filters used)

---

## 9. Assumptions
- Images are stored in a connected registry (e.g., DockerHub, ECR, etc.)
- Vulnerability database is updated regularly (e.g., NVD, Snyk)
- User has permission to act on images

---

## 10. Future Enhancements
- Auto-remediation for known fixable issues
- Integration with CI/CD pipelines
- Role-based reporting dashboards

