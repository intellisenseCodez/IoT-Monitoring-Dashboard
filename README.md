# 📊 IoT Energy Monitoring Dashboard (AWS Native & Serverless)

This project provides a **real-time, serverless, and cost-effective IoT data monitoring solution** for energy consumption tracking using AWS services. It ingests data from IoT devices, processes and stores it efficiently, and visualizes insights in an interactive dashboard via **Amazon QuickSight**.

---

## 🚀 Project Objective

XYZ Limited needs a robust system to monitor **real-time energy consumption** from IoT-connected devices installed in apartments. This solution aims to:

- Minimize operational cost
- Ensure real-time visibility
- Support fault-tolerance and scalability
- Maintain security and compliance

---

## 🧱 Architecture Overview

![Architecture Diagram](./image/IOT%20Monitoring%20Architecture.png)

### 🔄 Data Flow:
1. **IoT Devices** publish energy metrics via MQTT.
2. **AWS IoT Core** ingests messages securely (TLS).
3. **IoT Rule** routes data to **Amazon Kinesis Firehose**.
4. **Firehose** batches and delivers data to **Amazon S3**.
5. **Amazon Athena** queries the stored data via SQL.
6. **Amazon QuickSight** visualizes metrics in real-time dashboards.

---

## ⚙️ AWS Services Used

| Service               | Purpose                                                |
|-----------------------|--------------------------------------------------------|
| AWS IoT Core          | Ingests MQTT messages from IoT devices                 |
| IoT Rules             | Applies filters and routes data to Kinesis             |
| Amazon Kinesis Firehose | Buffers and batches streaming data to S3             |
| Amazon S3             | Stores raw and processed IoT data                      |
| AWS Glue (optional)   | Catalogs S3 data for Athena queries                    |
| Amazon Athena         | Executes SQL queries over S3 data                      |
| Amazon QuickSight     | Visualizes query results in dashboards                 |
| IAM                   | Secures access and enforces least-privilege policies  |

---

## 🔐 Security Considerations

- **Data Encryption**: 
In Transit: Data transmitted from IoT devices to AWS IoT Core, as well as between services (Kinesis, Lambda, S3, etc.), is encrypted using TLS (Transport Layer Security) to ensure the confidentiality of sensitive data.


- **IAM Roles and Policies**:
AWS Identity and Access Management (IAM) roles and policies are configured to ensure least-privilege access. Each service only has the permissions necessary to perform its specific tasks (e.g., IoT Core only sends data to Kinesis).

---

## 💰 Cost Optimization Strategies

- **Fully serverless** (no EC2 or manually managed infrastructure)
- **Kinesis Firehose batching** reduces write costs to S3
- **Athena pay-per-query model**
- **S3 lifecycle policies** (optional) to transition or delete old data

---

## 📈 Scalability & Reliability

- **Auto-scaling ingestion** with IoT Core and Kinesis
- **Decoupled services** for modular failure recovery
- **High-availability** storage and compute layers (S3, Athena, QuickSight)

---

## 📂 Project Structure

```bash
.
├── modules/
│   ├── iot_core/
│   ├── firehose/
│   ├── s3/
│   ├── athena/
│   └── quicksight/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── README.md
└── README.md
```


## 🧪 How to Deploy
1. Install Terraform

2. Configure AWS CLI:
```bash
aws configure
```
3. Initialize Terraform:
```bash
terraform init
```
4. Plan & Apply:
```bash
terraform plan
terraform apply
```

