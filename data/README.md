# Data used in the analysis

## Good practises
* every dataset gets its own directory
* every directory gets a file `_meta.json` with content as shown below

```json
{
    "source": {
        "<glob pattern>": [
            "<source of the data (ideally a link)>"
        ]
    },
    "description": {
        "<glob pattern>": [
            "<description>"
        ]
    },
    "notes": {
        "<glob pattern>": [
            "<notes i.e., used for...; pitfalls>"
        ]
    }
}
```

## Contents

### [external](./external/)

* datasets received from third parties


### [interim](./interim/)

* intermediates
* results from intermediate processing steps and/or processing substeps

### [processed](./processed/)

* final processed result
* data after all processing steps have been completed
* this data is used for
    * training
    * validation
    * testing
    * further analysis

### [raw](./raw/)

* original, raw data
* for example
    * observations
    * spectra
    * lightcurves
    * images

> [!CAUTION]
> data in this directory is **IMMUTABLE**.
> do **NOT** edit this directory.

### [results](./results/)

* final results of the analysis
* tables that
    * summarize findings
    * end up in the paper (and/or [summary.md](../summary.md))
