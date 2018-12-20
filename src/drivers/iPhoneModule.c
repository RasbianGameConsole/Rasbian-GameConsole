#include <linux/module.h>
#include <linux/init.h>
#include <linux/usb.h>

static struct usb_device_id id_table[] = {
    {USB_DEVICE(0x05AC,0x12a8)}, //iPhone5/5C/5S/6
    {} 
}

static void i_probe(struct usb_interface *interface,struct usb_device_id *id){

}

static void i_disconnect(){

}

static int i_init(void){
    printk(KERN_ALERT "IPHONE INIT");
    return 0;
}

static void  i_exit(void){
    printk(KERN_ALERT "IPHONE EXIT");
}

static struct usb_driver iPhone_driver = {
    .owner = THIS_MODULE,
    .name = "iPhone Game Controller Driver",
    .probe = i_probe,
    .disconnect = i_disconnect,
    .id_table = id_table
}

module_init(i_init);
module_exit(i_exit);

