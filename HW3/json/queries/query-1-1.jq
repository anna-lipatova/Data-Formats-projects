.store_branches[]
| {
    store_name: .name,
    cash_registers: [
        .cash_registers[]
        | {
            register_id: .id,
            is_self_checkout: .is_self_checkout,
            operated_by: .operated_by
        }
    ]
}
