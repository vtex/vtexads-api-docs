## Audience Integration

Audience integration can be done in two ways:

1.  **Real-Time Segmentation:** Sending audience data directly in the [ad request](./4-api-integration.md#ad-targeting).
2.  **Batch Submission:** Sending files with audience data to an S3 bucket.

### Batch Submission

The integration connection will occur through the periodic sending of audiences to our S3. Access credentials must be requested from your Newtail contact.

*   **File Format:** `Parquet` with `Snappy` compression.
*   **Directory Pattern:** Files must be written in the following directory pattern:
    `PREFIX/audiences/YYYY/mm/dd/TIMESTAMP.parquet.snappy`

| Attribute | Description | Example |
| :--- | :--- | :--- |
| `PREFIX` | The prefix will be provided by Newtail. | `xyz` |
| `YYYY` | 4-digit year of generation. | `2023` |
| `mm` | Two-digit month of generation (January = 01 and December = 12). | `09` |
| `dd` | Two-digit day of generation (from 01 to 31). | `31` |
| `TIMESTAMP`| Timestamp is the number of seconds since 1970 (the file name can be anything, the timestamp is just a suggestion that will never be repeated). | `1694812122` |

> **Recommendation for submission:** In the initial integration, it is essential that all data be sent. This data can be sent in multiple files (depending on the size of the base, a good number is 1 million lines per file). After the first integration, the ideal is to send only the delta of the rows that had any modification.

### Audience File Attributes

Most attributes are not mandatory, however, the more complete this information is, the better the relevance will be.

> The columns are **case-sensitive**. Keep the column names as they are presented.

| Column | Type | Required? | Description |
| :--- | :--- | :--- | :--- |
| `CUSTOMER_ID` | String | Yes | Unique customer identifier. |
| `EMAIL_HASHED` | String | No | PII based on the customer's email. |
| `PHONE_HASHED` | String | No | PII based on the customer's primary phone number. |
| `SOCIAL_ID_HASHED` | String | No | PII based on the customer's CPF. |
| `FIRST_NAME_HASHED` | String | No | PII based on the customer's First Name. |
| `LAST_NAME_HASHED` | String | No | PII based on the customer's Last Name. |
| `GENDER` | String | No | Indicates the customer's gender (`F` for female, `M` for male, `O` for others, `NULL` for unidentified). |
| `AGE` | Int | No | Indicates the customer's age. |
| `CEP` | String | No | Indicates the customer's postal code. |
| `COUNTRY` | String | No | Indicates the user's country. |
| `STATE` | String | No | Indicates the state where the customer resides. |
| `CITY` | String | No | Indicates the city where the customer resides. |
| `NEIGHBORHOOD` | String | No | Indicates the neighborhood where the customer resides. |
| `AUDIENCES` | String | No | A list of audiences, separated by a semicolon (;). |
| `NBO_PRODUCTS` | String | No | A list of product SKUs, separated by a semicolon (;). |
| `NBO_CATEGORIES` | String | No | A list of categories, separated by a semicolon (;). The list can receive a category tree using " > " as a separator (e.g., `Tablets;Beverages > Non-Alcoholic Beverages;Books > Gastronomy > Bar and Restaurant Guides`). |

### Field Hashing

Confidential data must be encrypted before being sent using the **SHA256** algorithm.

*   `EMAIL_HASHED`
*   `PHONE_HASHED`
*   `SOCIAL_ID_HASHED`
*   `FIRST_NAME_HASHED`
*   `LAST_NAME_HASHED`

> Before generating the hash of the data, it is necessary to remove all **SPACES** and convert its values to **LOWERCASE**.
> For the `PHONE_HASHED` attribute, it will be necessary to format it in the **E.164** standard and include the country calling code.

#### E.164 Format

1.  Remove all non-numeric characters, such as spaces, hyphens, parentheses, and symbols.
2.  Add the country code with the plus sign (+) at the beginning.
3.  Add the area code (if applicable) without the leading zero.
4.  Include the local phone number without the leading zero (if applicable).

**Example:**

*   A phone number from the United States, with area code 212 and local number 555-1234, would be formatted as: `+12125551234`

#### Creating a HASH in Python

```python
import re
import hashlib

hash_obj = hashlib.sha256()

def create_hash(x):
    cleaned = re.sub('\s+', '', x.lower())
    hash_obj.update(cleaned.encode('utf-8'))
    return hash_obj.hexdigest()

create_hash(' Allan ') #=> 8c01ade3cb71d3ac7c718ed5a0c565155a4c05a216d9e59013c5d7b49e916914
```
