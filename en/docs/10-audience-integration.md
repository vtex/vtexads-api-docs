## Audience Integration

To segment campaigns using PII (Personally Identifiable Information), you must provide a CSV file containing user data.

### File and Data Requirements:

1.  **File Format**: The file must be a CSV encoded in UTF-8.
2.  **Submission**: The CSV file must be compressed into a ZIP archive and sent via email to your Newtail contact.
3.  **Data Columns**:
    *   `CUSTOMER_ID` (String, **Required**): A unique identifier for the customer.
    *   `EMAIL_HASHED` (String, Optional): Hashed customer email.
    *   `PHONE_HASHED` (String, Optional): Hashed primary phone number.
    *   `SOCIAL_ID_HASHED` (String, Optional): Hashed CPF number.
    *   `FIRST_NAME_HASHED` (String, Optional): Hashed first name.
    *   `LAST_NAME_HASHED` (String, Optional): Hashed last name.

### Hashing Rules:

All sensitive data fields must be hashed using the **SHA256** algorithm. Before hashing, the data must be pre-processed as follows:

1.  **Normalization**: Convert the string to lowercase and remove all spaces.
2.  **Phone Numbers**: The phone number must be formatted to the **E.164 standard** (e.g., `+14155552671`) *before* normalization and hashing.