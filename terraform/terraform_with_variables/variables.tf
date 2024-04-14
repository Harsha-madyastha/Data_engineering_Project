
variable "project" {
  description = "Project"
  default     = "de-zoomcamp-416715"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "EU"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "Real_Estate_Sales_project_bq"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "real-estate-sales-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}