//
//  EMMPatient.m
//  bmiCalc
//
//  Created by Eric Martin on 6/25/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

#import "EMMPatient.h"

EMMPatient* SecretPatient;

//#define Male YES
//#define Female NO

@implementation EMMPatient
@synthesize height,weight,age,gender,imperial;
+(EMMPatient *)thePatient
{
    if(SecretPatient == nil)
    {
        SecretPatient=[[EMMPatient alloc]init];
    }
    return SecretPatient;
}
-(float)bmi
{
    float _height = [height floatValue];
    float _weight = [weight floatValue];
    if(!imperial)
    {
        return _weight/(_height*_height);
    }
    else
    {
        return (_weight/(_height*_height)) * 703 ;
    }
}

-(float)bmr
{
    float _height = [height floatValue];
    float _weight = [weight floatValue];
    int _age = [age intValue];
    if(!imperial)
    {
        if (gender == YES)
        {
            return 66.0 + 13.7*_weight + 500.0*_height - 6.8*_age;
        }
        else
        {
            return 655 + 9.6*_weight + 0.018*_height - 4.7*_age;
        }
    }
    else
    {
        if (gender == YES)
        {
            return 66 + 6.23*_weight + 152.4*_height - 6.8*_age;
        }
        else
        {
            return 655 + 4.35*_weight + 56.4*_height - 4.7*_age;
        }
    }
}


@end
