# find empty groups.
get-adgroup -filter * | where {-Not($_ | get-adgroupmember)} | Select Name