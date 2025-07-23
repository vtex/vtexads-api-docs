# 4. Data Security

Data security is a fundamental pillar of our platform. From the outset, our architecture was designed to ensure that no sensitive information is collected and that user data remains protected and non-identifiable at all times.

## Non-Identifiable Data

We do not collect sensitive user data, such as names, emails, or personal documents. The information we do receive, like emails or identification numbers (PII - Personally Identifiable Information), already arrives on our platform as an irreversible cryptographic hash.

This means the original data is never transmitted to or stored in our systems. The result is an anonymous identifier that allows us to group behaviors and audiences without ever knowing who the actual user is.

**Why is this secure?**

*   **Irreversibility:** The hashing process is a one-way street. Even if someone gained access to the hash, they could not uncover the original data.
*   **Anonymity:** Since we do not store the original data, we have no way of identifying the user. For all intents and purposes, the data is anonymous.

## Encryption in Transit and at Rest

All data, whether they are anonymous identifiers or information about campaigns and ads, is handled with the highest security standards:

*   **Encryption in Transit:** All communication between our systems and with partners is conducted using secure protocols like TLS 1.2+, ensuring that data cannot be intercepted during transfer.
*   **Encryption at Rest:** Data stored in our databases and file systems is encrypted. We use robust and market-recognized solutions such as **Amazon RDS**, **Amazon S3**, **Amazon Redshift** and **Snowflake**, which apply AES-256 encryption, one of the most secure algorithms in existence.

## Restricted Access

Access to data is strictly controlled and limited to a select group of senior engineers and analysts. Every access is audited and monitored, and permissions are granted based on the principle of least privilege, meaning each person has access only to what is strictly necessary to perform their job.

This combination of non-identifiable data, end-to-end encryption, and rigorous access control ensures that your information and that of your customers are always secure.
