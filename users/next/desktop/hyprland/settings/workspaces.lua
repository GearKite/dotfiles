local monitor1 = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. G27Q 21502B003480"
local monitor2 = "desc:Invalid Vendor Codename - RTK 0x1366 0x13660768"

hl.workspace_rule({ workspace = "1", monitor = monitor1, default = true })
hl.workspace_rule({ workspace = "2", monitor = monitor1 })
hl.workspace_rule({ workspace = "3", monitor = monitor1 })

hl.workspace_rule({ workspace = "11", monitor = monitor1 })
hl.workspace_rule({ workspace = "12", monitor = monitor1 })
hl.workspace_rule({ workspace = "13", monitor = monitor1 })
hl.workspace_rule({ workspace = "14", monitor = monitor1 })

hl.workspace_rule({ workspace = "15", monitor = monitor2, default = true })
hl.workspace_rule({ workspace = "16", monitor = monitor2 })
hl.workspace_rule({ workspace = "17", monitor = monitor2 })
hl.workspace_rule({ workspace = "18", monitor = monitor2 })
