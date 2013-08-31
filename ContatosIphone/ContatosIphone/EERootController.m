//
//  EEViewController.m
//  ContatosIphone
//
//  Created by Fabio Marinho on 24/08/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "EERootController.h"
#import "AddressBook/AddressBook.h"
#import "EEContato.h"

@interface EERootController ()

@end

@implementation EERootController
@synthesize contatos,tabela;
- (void)viewDidLoad
{
    [super viewDidLoad];

	ABAddressBookRef addr = ABAddressBookCreate();
    self.contatos = [EEContato getContatosFromAddressBook:addr];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL) animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


- (void)dealloc {
    [tabela release];
    [contatos release];
    [super dealloc];
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    EEContato *c = [self.contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = c.dados.primeiroNome;
    
    return cell;
    

}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    EEContato *c = [self.contatos objectAtIndex:indexPath.row];
    
    NSString *message = [[NSString alloc] initWithFormat:@"%@\n%@\n%@",c.dados.primeiroNome,c.dados.ultimoNome,c.dados.email] ;
    
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"contato" message:  message delegate:nil cancelButtonTitle:@"Entendi" otherButtonTitles:nil] autorelease];
    [alert show];
    [self.tabela deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    int count = [self.contatos count];
    return count;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *) tableView{
    return 1;
}


@end
