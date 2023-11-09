import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';

export class CdkStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const vpc = new ec2.Vpc(this, 'Vpc', {
      maxAzs: 1,
      subnetConfiguration: [
        {
          name: 'public1',
          subnetType: ec2.SubnetType.PUBLIC,
        }
      ]
    });

    const instanceSg = new ec2.SecurityGroup(this, 'instanceSg', {
      vpc,
    });
    instanceSg.addIngressRule(ec2.Peer.anyIpv4(), ec2.Port.tcp(22));
    instanceSg.addIngressRule(ec2.Peer.anyIpv4(), ec2.Port.tcp(80));

    const amiId = "ami-03b1b78bb1da5122f";
    const keyName = "kefikey";
    const instanceCount = 3;
    for(let i=1;i<=instanceCount;i++){
      const instance = new ec2.Instance(this, `isu${i}`, {
        vpc,
        instanceType: ec2.InstanceType.of(ec2.InstanceClass.T3A, ec2.InstanceSize.SMALL),
        machineImage: ec2.MachineImage.genericLinux({
          "ap-northeast-1": amiId,
        }),
        securityGroup: instanceSg,
        keyName,
      });
      new cdk.CfnOutput(this, `isu${i}PublicIpAddress`, {
        value: instance.instancePublicIp,
      })
    }

  }
}
