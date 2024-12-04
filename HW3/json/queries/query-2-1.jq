.Addresses[]
| select(.zip_code | startswith("60"))
| {
    city: .city,
    zip_code: .zip_code,
    stores: (.locatedAt[] | {store_name: .name, has_warehouse: .has_warehouse})
}
