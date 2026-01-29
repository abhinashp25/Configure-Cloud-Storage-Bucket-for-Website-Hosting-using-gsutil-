# Script: setup_static_website.sh
# Purpose: Configure a GCS bucket for static website hosting
# Author: Abhinash Pradhan

# Set your Cloud Storage bucket name
BUCKET_NAME="qwiklabs-gcp-01-c140d24672cf-bucket"

echo "Configuring bucket for static website hosting..."

# Set index and error pages for the website
gsutil web set -m index.html -e error.html gs://$BUCKET_NAME

echo "Enabling public access to website files..."

# Grant public read access using IAM (recommended approach)
gsutil iam ch allUsers:objectViewer gs://$BUCKET_NAME

echo "Website configuration completed successfully."

# Optional verification
echo "Verifying website configuration:"
gsutil web get gs://$BUCKET_NAME

echo "Listing bucket contents:"
gsutil ls gs://$BUCKET_NAME

echo "-------------------------------------------"
echo " Static website setup completed successfully!"
