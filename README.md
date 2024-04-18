# Cincinnati Housing Sales Price Tracking

## Description
This project aims to track the sales ratio in Cincinnati, calculated as the ratio of the sale price to the assessed value. The dataset used is sourced from data.gov[https://catalog.data.gov/dataset/real-estate-sales-2001-2018], specifically the Real Estate Sales 2001-2021 GL dataset, which contains information on real estate sales in the Connecticut region.

The dataset, maintained by the Office of Policy and Management, includes details such as town, property address, date of sale, property type (residential, apartment, commercial, industrial, or vacant land), sales price, and property assessment. 

Annual real estate sales are reported by grand list year (October 1 through September 30 each year), providing insights into the real estate market trends over time.

Additionally, the project incorporates data from the FHFA House Price Indexes (HPIs)[https://catalog.data.gov/dataset/fhfa-house-price-indexes-hpis-948c6], which provide a comprehensive collection of public, freely available house price indexes that measure changes in single-family home values based on data from all 50 states and over 400 American cities, extending back to the mid-1970s. This data is utilized to compare selling trends in price relative to changes in the housing price index.


## Problem Statement
The primary goal of this project is to visualize the sales ratio distribution across the state of Connecticut. A lower sales ratio indicates a higher selling price relative to the assessed value, indicating regions with potentially better buying and selling options in the state.

## Used Technologies
For this project, the following tools were utilized:

- Google Cloud Platform (GCP) - primary cloud provider
- Google Cloud Storage (GCS) - data lake storage under GCP
- BigQuery - data warehouse storage under GCP
- Python - primary programming language
- Docker - containerization (docker-compose)
- Airflow - orchestration tool for pipeline
- Terraform - Infrastructure-as-Code (IaC) tool
- Google Data Studio - data visualizations

## Reproducing from Scratch
To reproduce this project entirely from scratch, follow these steps:

1. Set up a GCP account and create a service account with appropriate permissions.
2. Set up Terraform to build the infrastructure.
3. Configure Docker, Dockerfile, and docker-compose to run Airflow.
4. Run the provided DAGs to execute the data pipelines.
5. Create your dashboard using Google Data Studio.

For detailed instructions, refer to the respective sections in the README file present in each folder. Also link to the datasets and also to the dashboard is present in the paths.txt[https://github.com/Harsha-madyastha/Data_engineering_Project/blob/main/paths.txt] file.

## Contact
For any questions or inquiries, feel free to open a pull request or contact [harsha.manjunath1996@gmail.com].

