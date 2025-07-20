# 🚀 Terraform on GCP with Azure DevOps CI/CD  
[![Build Status](https://dev.azure.com/myOrg-101/tf-gcp-with-ado/_apis/build/status/terraform-ci?branchName=main)](https://dev.azure.com/myOrg-101/tf-gcp-with-ado/_build/latest?definitionId=2&branchName=main)

## 🎯 Project Overview  
This project uses **Terraform** to manage infrastructure on **Google Cloud Platform (GCP)**, with a CI/CD pipeline built in **Azure DevOps**. It follows best practices like:  
- Separate stages for validation, planning, and applying changes  
- Manual approvals for production and destruction  
- Secure state management using **Terraform Cloud**  
- Reusable Terraform steps via YAML templates  
- Linting with `tflint` and formatting checks with `terraform fmt`  
- Enforced `required_version` in Terraform configuration  
- Plan artifacts uploaded and reused in Apply stage  

---

## 🔁 CI/CD Workflow  

### 1. Development  
- Developers push code to a feature branch  
- A Pull Request (PR) triggers:  
  - ✅ **Validate**: Check syntax and formatting  
  - 📋 **Plan**: Preview changes  

### 2. Production Deployment  
- Merging to `main` triggers:  
  - ✅ Validate  
  - 📋 Plan  
  - 🛑 **Manual Approval**  
  - 🚀 **Apply**: Deploys to GCP  

### 3. Optional: Destroy  
- Triggered manually with `RunDestroy = true`  
- Requires separate manual approval  

---

## 🧱 Pipeline Stages  
1. **Validate** – Checks Terraform syntax and formatting  
2. **Plan** – Shows what will change (dry run)  
3. **Apply** – Deploys changes (requires approval)  
4. **Destroy** – Deletes resources (requires approval and `RunDestroy = true`)  

---

## 🔧 Prerequisites  
- Azure DevOps project  
- GCP project with billing enabled  
- Terraform Cloud account (free tier works)  

---

## ⚙️ Setup Guide  

### Terraform Cloud  
1. Create a **Workspace** (CLI-driven)  
2. Generate an **API Token**  
3. Add GCP credentials as environment variables:  
   - `GOOGLE_CREDENTIALS` (JSON key)  
   - `GOOGLE_PROJECT` (Project ID)  

### Azure DevOps  
1. **Import this repo**  
2. **Create a Variable Group**:  
   - Name: `terraform-secrets`  
   - Add `TF_API_TOKEN` (mark as secret)  
3. **Set up Environments**:  
   - `prod-approval` and `prod-destroy-approval` with manual checks  
4. **Create Pipeline**:  
   - Use existing YAML: `/.azure-pipelines.yml`  

---

## 🛠️ How to Use  

### Development  
1. Create a branch from `main`  
2. Make changes and push  
3. Open a PR – Validate and Plan run automatically  

### Deployment  
1. Merge PR to `main`  
2. Pipeline runs Validate and Plan  
3. Wait for manual approval  
4. Apply runs and deploys to GCP  

### Destroying Infrastructure  
1. Run pipeline manually  
2. Set `RunDestroy = true`  
3. Wait for approval in `prod-destroy-approval`  
4. Resources are deleted  

---

## 🤝 Contributing  
Contributions are welcome!  
Please format your code with `terraform fmt` and ensure it passes validation.
