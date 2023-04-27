## Description of the method
Generate front-end 'ts' request service code based on 'swagger' 'OpenApi json' content.
> Currently, only the JSON format is parsed, and only the 'TS' service class is generated.
## command
`droplet request <OpenApi Url> [options]`

## parameter
- **'OpenApi Url'**, refers to the corresponding 'swagger json' directory, which supports local file absolute paths and 'url'.
- '--output' or '-o', specifying the generated code root, required.
- '--type' or '-t', which specifies the type of service request generated, currently supports 'Axios' and 'NgHttp'.

## behavior
1. This command generates 'services' and 'models' folders in the specified directory to distinguish between 'request service' and 'ts-type' files.
2. Builds using the 'axios' class library are currently supported, as well as 'HttpClient' in **angular**.
