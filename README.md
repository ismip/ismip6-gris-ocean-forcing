# ismip6-gris-ocean-forcing
Matlab/Shell workflow for generating Greenland ocean forcing for the ISMIP6 activity
Calculate distance map for a given ice sheet mask and the observed ice in contact with the ocean. Retreat mask is binned directly to the model grid.

# Workflow
### create input data (once)
```setup_data/```

### Use an existing scenario or build a test scenario (once per scenario) 
```Rates/test00/```

### Get modelled ice mask (once per initial state)
```Models/```



### Distance calculations for specific ice mask 
```mask2dist/```

### Apply retreat mask scenario
```scenario/```



# Input data
```Data/```
# Model specific 
```Models/```
# Retreat scenarios
`Rates/`


# matlab toolbox
`toolbox/`
