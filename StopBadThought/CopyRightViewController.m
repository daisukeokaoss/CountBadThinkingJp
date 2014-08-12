//
//  CopyRightViewController.m
//  StopBadThought
//
//  Created by おかやん on 2014/07/25.
//  Copyright (c) 2014年 ナノソフトウェア. All rights reserved.
//

#import "CopyRightViewController.h"

@interface CopyRightViewController ()
- (IBAction)ReturnToMain:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextView *LicenseTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *ReturnButton;

@end

@implementation CopyRightViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ReturnButton.title = NSLocalizedString(@"Return", nil);
    
 
    NSString *SkySemiCopyright = NSLocalizedString(@"Skysemi_License", nil);
    NSString *JSFlatButtonLicense = @"JSQFlatButton\nMIT License\nCopyright (c) 2013 Jesse Squires\nhttp://www.hexedbits.com\n\nPermission is hereby granted, free of charge, to any person obtaining a copy of this software andassociated documentation files (the \"Software\"), to deal in the Software without restriction, includingwithout limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sellcopies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.";
    NSString *UIColorPlusHexString =@"UIColor+HexString\nCopyright (c) 2013, Micah Hainline\nAll rights reserved.\n\nRedistribution and use in source and binary forms, with or without\n\nmodification, are permitted provided that the following conditions are met:\n\n1. Redistributions of source code must retain the above copyright notice, thislist of conditions and the following disclaimer.\n2. Redistributions in binary form must reproduce the above copyright notice,this list of conditions and the following disclaimer in the documentation\nand/or other materials provided with the distribution.\n\nTHIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED ANDON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\n\nThe views and conclusions contained in the software and documentation are thoseof the authors and should not be interpreted as representing official policies,either expressed or implied, of the FreeBSD Project.";
    self.LicenseTextView.text = [NSString stringWithFormat:@"%@%@%@",SkySemiCopyright,JSFlatButtonLicense, UIColorPlusHexString];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ReturnToMain:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
