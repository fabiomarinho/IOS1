//
//  EEViewController.m
//  ExemploDownload
//
//  Created by Fabio Marinho on 10/08/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "EEViewController.h"
#import "AFHTTPRequestOperation.h"

@interface EEViewController ()

@end

@implementation EEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    progressBar.progress = 0.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startDownload:(id)sender {
    NSURL *url = [NSURL URLWithString:downloadField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSString *saveFileName = [self downloadSavePathFor: url.lastPathComponent];
    NSLog(@"Salvando arquivo em %@", saveFileName);
    AFHTTPRequestOperation *operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request] autorelease];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:saveFileName append:NO];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *op, NSHTTPURLResponse *response)
    {
        [atividade stopAnimating];
        atividade.hidden = YES;
        [self showMessage:@"Download finalizado com sucesso"];
    }
     
    failure:^(AFHTTPRequestOperation *op, NSError *error)
    {
        [self showMessage:
         [NSString stringWithFormat:@"Erro no download: %@",error.localizedDescription]];
    }
    
    ];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        progressBar.progress = (float) totalBytesRead / (float) totalBytesExpectedToRead;
        
    }
     ];
    
    progressBar.hidden = NO;
    atividade.hidden = NO;
    [atividade startAnimating];
    [operation start];
    
    
}


-(NSString *) downloadSavePathFor:(NSString *) filename{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    return [documentsPath stringByAppendingPathComponent:filename];

}

-(void) showMessage:(NSString *) message{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Aviso" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease];
    [alert show];
}

-(BOOL) shouldAutorotate{
    return YES;
}

- (void)dealloc {
    [downloadField release];
    [progressBar release];
    [atividade release];
    [super dealloc];
}

@end
