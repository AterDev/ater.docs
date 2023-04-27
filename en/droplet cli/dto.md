## Description of the method
Generate a DTO file corresponding to the entity.

## command
`droplet dto <entity path> [options]`

## parameter
- **'entity path'**, corresponds to the full path of the entity .cs file, supports absolute and relative paths, such as '.\Models\User.cs'.
- '--output' or '-o', the directory where the generated dto file is stored, the default path is '[./share]'.
- '--force' or '-f', override, defaults to 'false'.

## behavior
1. This command will generate the folder corresponding to the entity in the specified 'output' directory, if the entity file is 'User.cs', a 'UserDtos' subfolder will be created, and the corresponding dtos file will be generated to this directory.
2. If the corresponding DTO already exists, the default is not to generate a new one, and use '-f' to force overwriting.