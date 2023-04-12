# Vehicle_Fleet_Analysis
Data gathered from government websites and censuses, VINs decoded using NHTSA Decoder API, web application created to analyze data

DataTables & Bootstrap:
  - Styling and pagination
  
Census-Crawler:
  - Relationships for final Data Search Engine (census_data_results.cfm) found in "Result Relationships.txt"
  - Other files used for initial study

Crawler:
  - Includes scripts for creating a Search Engine for analyzing and cleaning-up Web-Crawling data
  
JS:
  - Response JavaScript obtained from "https://github.com/scottjehl/Respond"

Sampling_Queries:
  - Queries to practice and understand how to obtain data
  - Output to make sure this can work
  
Server:
  - Check the ColdFusion files in local directory with different ouptuts
  - Start-up server when called
  
Vin Decoding:
  - First way:
    - Call NHTSA API to decode VINs
      - Return JSON with info
  - Second way:
    - Using dictionaries with VIN decoding information to decode and transfer data
  - Other ways were used for initial practicing and trying methods
  - Queries used to analyze data and data quality
  
XML CFTags:
  - Used to generate and parse XML
