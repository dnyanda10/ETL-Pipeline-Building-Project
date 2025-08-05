# ETL-Pipeline-Building-Project
End-to-end ETL pipeline that extracts Spotify track data using their public API, transforms it using Python, and loads it into AWS S3 and Snowflake for analysis-fully automated and serverless.

 ##Project Objective
1-Build a robust, scalable, and automated ETL pipeline to:
2-Extract data from the Spotify API
3-Store and transform the data using AWS Lambda
4-Load the final dataset into Snowflake using Snowpipe
5-Enable insights and reporting using tools like Power BI

##Architecture Overview
Spotify API → AWS Lambda (Extract) → Raw S3 Bucket 
            → AWS Lambda (Transform) → Processed S3 Bucket 
            → Snowpipe → Snowflake → Power BI

            
##Components Used
| Layer         | Service/Tool                     | Description                                                                    |
| ------------- | -------------------------------- | ------------------------------------------------------------------------------ |
|  Extract      | Python, AWS Lambda, CloudWatch   | Fetches song, artist, and album data from Spotify API using scheduled triggers |
|  Transform    | AWS Lambda                       | Cleans and converts JSON into CSV for storage and loading                      |
|   Load        | Amazon S3 + Snowpipe + Snowflake | Automates data ingestion into Snowflake tables                                 |
|   Visualize   | Power BI                         | Optional layer to create dashboards from Snowflake data                        |


##Snowflake Tables Created
tblAlbum
tblArtist
tblSongs

Security Measures
✅ AWS secrets have been removed
✅ .gitignore is configured to avoid pushing sensitive files
✅ IAM roles configured with least privilege
✅ Snowpipe uses external integration with limited permissions

