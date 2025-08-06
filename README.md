# 🎵 ETL-Pipeline-Building-Project
End-to-end ETL pipeline that extracts Spotify track data using their public API, transforms it using Python, and loads it into AWS S3 and Snowflake for analysis-fully automated and serverless.

## 🧠 Project Objective
 
 Build a robust, scalable, and automated ETL pipeline to:
 
1. Extract data from the Spotify API.  
2. Store and transform the data using AWS Lambda.
3. Adding trigger to run the extraction automatically
4. Building Analytics Tables on data files using Glue and Athena
5. Load the final dataset into Snowflake using Snowpipe.  
6. Enable insights and reporting using tools like Power BI.  
7. Maintain full automation and serverless architecture.


## 🏗️ Architecture Overview
```
Spotify API
↓
AWS Lambda (Extract)
↓
Raw S3 Bucket
↓
AWS Lambda (Transform)
↓
Processed S3 Bucket
↓
Snowpipe
↓
Snowflake
↓
Power BI  
```
            
## ⚙️ Components Used
| Layer         | Service/Tool                     | Description                                                                    |
| ------------- | -------------------------------- | ------------------------------------------------------------------------------ |
|  Extract      | Python, AWS Lambda, CloudWatch   | Fetches song, artist, and album data from Spotify API using scheduled triggers |
|  Transform    | AWS Lambda                       | Cleans and converts JSON into CSV for storage and loading                      |
|   Load        | Amazon S3 + Snowpipe + Snowflake | Automates data ingestion into Snowflake tables                                 |
|   Visualize   | Power BI                         | Optional layer to create dashboards from Snowflake data                        |


## ❄️ Snowflake Tables Created
- tblAlbum
- tblArtist
- tblSongs

## 🔐 Security Measures
- AWS secrets have been removed
- .gitignore is configured to avoid pushing sensitive files
- IAM roles configured with least privilege
- Snowpipe uses external integration with limited permissions

## 📁 Repository Structure 

├── LambdaFunctions/
│ ├── extract_lambda.py
│ ├── transform_lambda.py
├── Images/
│ └── Spotify Project Flow.jpg
├── powerbi/
│ └── Spotify Power BI Visual.pbix
├── README.md

## 📊 Power BI Visualization
- Report Name: Spotify Power BI Visual.pbix
- Data Source: Snowflake tables loaded through the ETL pipeline.
  
## 🔍 Key Visuals:
- 🎵 Top 10 albums by total tracks  
- 📅 Release trends over time  
- 👤 Artist-wise track distribution

📂 The `.pbix` file is included in the repo for quick access to reports and insights.
