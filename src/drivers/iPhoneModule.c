#include <linux/module.h>
#include <linux/init.h>
#include <linux/usb.h>



static void i_probe(struct usb_interface *interface,struct usb_device_id *id){

}

static void i_disconnect(){

}



static void  i_exit(void){
    printk(KERN_ALERT "IPHONE EXIT");
}

static struct usb_device_id id_table[] = {
    {USB_DEVICE(0x05AC,0x12a8)}, //iPhone5/5C/5S/6
    {}
};

static struct usb_driver iPhone_driver = {
    .owner = THIS_MODULE,
    .name = "iPhone Game Controller Driver",
    .probe = i_probe,
    .disconnect = i_disconnect,
    .id_table = id_table
};

static int i_init(void){
    printk(KERN_ALERT "IPHONE INIT");
    int result;
    /* register this driver with the USB subsystem */
    result = usb_register(&iPhone_driver);
    if (result)
        err("usb_register failed. Error number %d", result);
    return result;
    return 0;
}

module_init(i_init);
module_exit(i_exit);
MODULE_LICENSE("GPL v2");

