// Add PMCR

DefinitionBlock ("", "SSDT", 2, "ACDT", "PMCR", 0x00000000)
{
    External(_SB.PCI0.LPCB, DeviceObj)
    Scope (_SB.PCI0.LPCB)
    {
        Device (PMCR)
        {
            Name (_HID, EisaId ("APP9876"))
            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0xFE000000,
                    0x00010000 
                    )

            })
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}