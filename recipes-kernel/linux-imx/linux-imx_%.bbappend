FILESEXTRAPATHS:prepend := "${THISDIR}/features:"

SRC_URI += " \
    file://ar8035.cfg \
    file://rtl8211fs.cfg \
    file://auo-g070vw01.cfg \
    file://touchscreen.cfg \
    file://phy-combo.dts;subdir=git/arch/arm64/boot/dts/freescale \
"

do_configure:prepend() {
    echo 'dtb-$(CONFIG_ARCH_MXC) += phy-combo.dtb' >> ${S}/arch/arm64/boot/dts/freescale/Makefile
}

# KERNEL_DEVICETREE:append = "phy-combo.dts"
