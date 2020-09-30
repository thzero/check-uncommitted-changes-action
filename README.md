# Check uncommitted changes action

A GitHub action for checking if repository has uncommitted changes.

## Outputs

### `changes`

Value indicating if there are uncommitted changes in the repository. If `changed` is equal to `1`
there are uncommitted changes. No changes will return `0`.

### Example usage

```yaml
name: Check uncommitted changes
jobs:
  check-uncommitted-changes:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.head_ref }}
      - name: Make changes that are not committed
        run: echo "this is not committed" > stuff.txt
      - name: Check for uncommitted changes
        id: changes
        uses: mskri/check-uncommitted-changes-action@v1.0.0
      - name: Evaluate if there are changes
        if: steps.changes.outputs.changed == 1
        run: echo "There are uncommitted changes"
```

Note: You can change the `id` of the step but remember to change the referencing `id` on the subsequent step(s).
