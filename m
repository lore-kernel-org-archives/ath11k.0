Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9CCECAAD3
	for <ath11k@archiver.kernel.org>; Mon, 19 Sep 2022 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:To:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zB3xSvwYPeFkLNjoZelOG3i2UvCbRwLiQE5Jv4TsE/s=; b=ObIeSOzce2GalM
	wOxbLWBvhZDXEhILBPllGaslNAqRPyyAiHuTuP2RB0l6s64JEpd/qpr0cqDVbx5Hj01bioycSLhS2
	oPIne5JZBAm93hf1beqg0BK8wrMf/hhpI+D/b/jAqYYDPf8EM+0lPH1POGic7g6R6USTEJTAosG+b
	IXnKJNgNt+NM5CvYsWWjMWgadY7o6SpLcQkg304Bc4tfn9ViH2Iz+yLdsvxptPyvlemNWJ+GGaN2a
	tpIcThgnuC++iLKni4+UddkPuv8poqyiSSem97TKkCUCSueFTNrEt8qXmGIiDiYdkr/MZvec707om
	bHH5zlujH399gdg7Rdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaLSq-00DljU-Gl; Mon, 19 Sep 2022 18:25:52 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaLSl-00DleM-Mu
	for ath11k@lists.infradead.org; Mon, 19 Sep 2022 18:25:51 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102]) by mx-outbound14-83.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 19 Sep 2022 18:25:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSTG+ba3Ud3EeaUFhseR8QHNCJbl+cB0NY/9kKTaw3k15SAICOEViDFoZqcIFzMGkVxn2aSXJ1pv4O6/WQivSQVnPqLkPCdK5OJJKuyABrQ3AMzBi2UQ6wvdHzYHCuSWAiRA+XOW5eITzJRLd6qBT0LfNX5WHE5kojwExesnf4G19uRIlqmF9LTxwoCqFF8wAOc75DjnQirg5CXDUMrxcN3ymZDr+hGqIG+eR8XrE1C2xf01lldPV6ajykO1z4xreyo5skvtTwaggxgF0bDf0EhGBCg7SKL3+c45BPk8Ihi7wPA5NkjcUa0KPEzLNZ9+HKOBTXwuDHNDBL+OU4UwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJi0gcMOeNtZg2nxPfY2KnEPB4+AWkVKCl8copgK130=;
 b=cck7HaA/XPHbjt4llRLCVoktu6EDDeK3lxB7g7LpICoIOVoPIkezsx23nXj+LG19P/8I4Im1unMhk61lLjBbqFdElNi6pY6M12biLdIfKQT0doIjhu0ROoLSOmmT8xxMTBoYH5LakxD4GktN26yz3mgnnDJ9S0wKX5a1dtmRDzazlnntmbogbaJrMe2hyDBrGaeTF5G7anrZ96RMHsrG9zlJLizt41NfEgZi1LOGpZGLXCLW4N5mWAZdUmwaG9fgnteIZshfhH1bz1lEW/yCFXAmYCGeTPRAYmnZao7O32S4rObqyGTJCzTkTmLO1G8MBZVzXZRgm9lVQKtOuaqK6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJi0gcMOeNtZg2nxPfY2KnEPB4+AWkVKCl8copgK130=;
 b=uz843mOyvjJiCmm9WrYn3AR2jR46ICsIb2Jt9xVc3NKC2eWx3E6O+e7Zb0EefFDYhGyFU1/oUc27gLQdZrTuJ3ePyU7oquQhwStNybF45TPItlwDidTVpvti5Gh+a/fZ5IobpAHGgPSsGMe5KUSRh+7n3ybKiuJpFf8/eQvZ52s51IsUHxzHNlGLhu9rrfHmjw6/0W9X6gCvWR8iSKWK9R3RA4UqL4VSSTXaI8iSmfpVArvz8GThgyRwuM0/CYusU6tEnkSgT61pxMcHrhgqReRiFwFKrzJdH8JwyBJzWoW3pQpDbxuc8/Nhu0huvlSngLGffjSU+CYGg4l1qmYCRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4561.namprd10.prod.outlook.com (2603:10b6:303:9d::15)
 by CH0PR10MB4971.namprd10.prod.outlook.com (2603:10b6:610:c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 18:25:36 +0000
Received: from CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::6808:2537:3960:21dc]) by CO1PR10MB4561.namprd10.prod.outlook.com
 ([fe80::6808:2537:3960:21dc%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 18:25:36 +0000
Message-ID: <19387dbc-11dd-a664-203f-911cb7ce27e3@digi.com>
Date: Mon, 19 Sep 2022 20:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: ath11k@lists.infradead.org
From: Robert Hodaszi <robert.hodaszi@digi.com>
Subject: QCN9074 monitor-mode crash
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To CO1PR10MB4561.namprd10.prod.outlook.com
 (2603:10b6:303:9d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4561:EE_|CH0PR10MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 597e8100-ea15-4b20-39d6-08da9a6c58b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sjuX33YkIv6cvQG+U73m5OPtOb63bVEQb+/99QFP13cHMroIwnRM26j1IlZVqbHLa0w2YQM+zqoSQrqccgwKqR9L4IkJOWVXFI2GHHP30F/tt42qb6PkOUKxzL99l8sCrHYkPcVBsYKeV15KJ9TNyEW2nNDeu3carggQ2jVDeF0JnRq11Vo4WrORDUu4p6uwr0aY+YzYiC8LoiZ7I67/LbqnvqIECwPVkdU13IaFF0uPouWEmBAMOs842p6AP8UdEOW4JSzwltZRsFu5uIUmMNXvdhpyWoew7ZJZhMIt8ar9PCrRF8Wt4PXyXImSXQEFqwD9G+1G0LBFhcavkHxYws6IVaGRfGU3vvWRhAHHNwFGr2jfbS102S76gXU68sW/rbxcliQU4ec1K9jQeLn13h6CKE0fy9/cfWkha/uWyxsy2zmE8+sI5HfoiBGPs4E/+EJC9xkxVLHgnTmiMSed5yQoSlhUxCcUJeINGul+OBTbiq3ASGnCv2SElDGnq7j+ZJ1fkKowZO2bud4yGeuzm+RMa1eDIZDcHXH2rUptnnQ2KC1v+6ILxXHRuNiMtkQ79dPVepNjDbhhUpfPowmUp3r5Hw3XXzjHhvFeMybpH/wi3W7MFs5Hm3CHibptRkKzKH6pgd2Sj/SUPVsySg3vspDmwmy2T3LGIWSZbYJS3c/qj2pEocItoT/Qbugv3vPOwQ7RWoDuk8JYDSj4LcsMu1GmqRagkLLW+b2yw1br6VI+EDqcygoZD6feroHJydNHVyanOTCJr1obRp/GrrbcpXj/eDLQNx9ZZ9X9/b9hekfVAF4hR7yj3SzCe3dbCrKc
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4561.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(366004)(136003)(376002)(396003)(451199015)(83380400001)(31686004)(186003)(45080400002)(2616005)(966005)(2906002)(38100700002)(6916009)(316002)(31696002)(6486002)(86362001)(8936002)(6506007)(36756003)(6666004)(41300700001)(478600001)(66476007)(66556008)(66946007)(8676002)(6512007)(26005)(44832011)(55236004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?clJOT00wUEJxdHpYdjBldGJnNENvenFUL0FtQVVxMjBqNEt5bGJhdUdTckNF?=
 =?utf-8?B?NGxPZUZxRGZsOFZVaGd4OUZ4WWJvRXp4NlRlSnRTVXg5Mmx0N2NUVDRFRWZX?=
 =?utf-8?B?VHRod3RBVmJoZVRCcFhKSDNIVDlGQjJsRlRETDdsYi9uT2FCdWd0czVhK29J?=
 =?utf-8?B?RFNiNFM5Y3NoZTEwSEUramkrVlNVVnpsNWJBNUxRYlpXZHZtQ0wrclFQcUtF?=
 =?utf-8?B?K1RROEhhdVNpUzI3SXFxamZ2L3FsVGpwZDZLd0xWbzI2VWNyZmdHbjFTdUFO?=
 =?utf-8?B?dTBkeG9mTEJJZ0x1NGxNeTQ4dVRRRE90ZlpFY2s1R2hjbTZqWnpNS2ZaQjJH?=
 =?utf-8?B?NUV5TFMxWHZqelArejhNeHZrNExYQlkzNUs1YSt4Q3V1aVcvTG1JNGZKbFA5?=
 =?utf-8?B?TGdHNEI0WEUwbjFJSGhuRWlHd2dxZndWUk5OVTQwdXk2bkZIWVpyQWlvREFS?=
 =?utf-8?B?bGxEblJIR1oza1hLR0FUSnFlZi9POS9jSFpYZm9EUTkvbUdlZk0xVUExUUVR?=
 =?utf-8?B?VEJSV0JEb3d4RFhHcC9zWnM4eGlkS3BPeFFqeExXcFhWYTFsUWlKb0l6c09G?=
 =?utf-8?B?d0hVT013ZUFKdlJ3bUxjblhsTnRiM3BDVEt1RFpEUUd6QlIzdkxxM0RXM1VB?=
 =?utf-8?B?OThLYlM3OVJlMy9HVTJaS1praXJneXhJT0NIcXo2VTAxS09qL2duNFdKRkF4?=
 =?utf-8?B?dnY1cWovTXpaQ1pGZ29EUGVQWk5YdStHak41endKZ0dwd0g4QjBEOU9YU1d6?=
 =?utf-8?B?L2I4SXdWV0pQRUVvOTU0bDRvSCt2SCthcGRuT1FNd3pVSDVaSU1PU2tUaEJK?=
 =?utf-8?B?eVhTQ3RuYkIxaDJUNFBOZVBvRWV5ZUlLMXNRWDl5cStiYnlkV3NRRTgvSHlt?=
 =?utf-8?B?UHAvdUFVL1ZtSjJMQTNya291NkdXZXV5Yk52L2xMMWxBcEQybzE2U1FxNXRn?=
 =?utf-8?B?OWFuWEh1b0M3QmRZNnZ3TDc3OVJkQ0NDVEt2VEpqbGRzZWU4VGluUnd1RWdF?=
 =?utf-8?B?bVpRUU84TnlZUks5cGl5ZjZHQjM1UUs4T2Y3SUJVa2c1d2ozN1Z5eU9TaDRl?=
 =?utf-8?B?dGxXUTZwODBZNzdCQW5YaFh5dGFGWkxMMUUrQzZ2L1pPdE1rUzJZMEpGOS9Z?=
 =?utf-8?B?ampnMGtQYXBYbFd5RlhpSDRYVm04bmFyZzlBM2xrMTBybi8wcEZ6dVFrci9h?=
 =?utf-8?B?ZWFRVzhob2hFMGR2VjdjZnIveVR6TkxhLy9GZmpDYUxTU3REVUtYK1B1UUNM?=
 =?utf-8?B?Q0x1Znk2TUJKMXVNenJ3dFBSZjFGVHprR052VDV6THJTcnBNcHJSWC92dnZM?=
 =?utf-8?B?L0dkRjBLdmlSa1NUSGdCOGtrVHhZMnFJaGNTNWRkcWdWTXozQmJlb2hYRVRn?=
 =?utf-8?B?WkVkRUdtdjZtTzZQSk1rTDRRaURzcU5aSHNYTW1KTHJBNlpkVHlNYWtXYUZo?=
 =?utf-8?B?TUw5TDY2T2xjM1NQVnVRRUFRMWVzcllwdTdObGVxbThieUtVbVlud1lCQ0Rs?=
 =?utf-8?B?MXJnQTJoNTlTMGtpbmZSYVdlU05OemdNUC9zampHZTNtUWtXSVNWTURBc0VI?=
 =?utf-8?B?Y1JVb3hnUWpQMUJpNkdiSUJPdjZlRVhNY0hQWFAreW5VaFkzZURDcXhlNEw0?=
 =?utf-8?B?R3o3ZnZjYk5OU2lHUExSZVd3cHhCVzhEQlR4QTYzRWpGWEFsdFBMMnRFZU5j?=
 =?utf-8?B?bjQzOHhrcEcwNG9YKzdRQXRkcnRVeGxJQS80dzh0WDJuUW12T3hCMUZvQkRj?=
 =?utf-8?B?VVF5VkJoam9FMUo1SzhjNFA1WTd1VlU5WU5KSDlmc0dSUWIyNUtBK0hqcFpQ?=
 =?utf-8?B?ZjhQT3p5NFNoUy9Lb2puZUd2dW14YWdkZkdpZ0o4WEFJMUIyQkY3dWpBcFRM?=
 =?utf-8?B?NUFHZDUxbmNxODNYUGpOZWlPenhOYndTazFRdGN4dnBlSTY1YzgrMjlQMHdv?=
 =?utf-8?B?NUl0YTRvaVFoMHhKY1ZXT2tIL0YwSVl6Z1VmZ296UmtLZ1BEKzd2d3ZKbVVT?=
 =?utf-8?B?akUrS28vRGRrb1k1b0YxL3pnRWM5UlE4VzdRcVE5bld3K1R0eCt3YkE5K0RT?=
 =?utf-8?B?SHRLUkFMTEhoMnMvRmNPWnhLYjE2SmxOSFlOWUNxS3lEQVZLd2dSUVNodTl3?=
 =?utf-8?Q?SfeuICQ2PwZNkX2LBSx6Fpive?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597e8100-ea15-4b20-39d6-08da9a6c58b1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4561.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 18:25:36.4795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jChdCIgDSOB7wHat7XgLOmfe8ZhweDjsDa+jvOAz83jYSXED9TJnOZ9c23fKadksx3qJCFmKrwRR9kqkBH2pDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4971
X-BESS-ID: 1663611939-103667-5593-1394-1
X-BESS-VER: 2019.1_20220817.2044
X-BESS-Apparent-Source-IP: 104.47.55.102
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.242909 [from 
	cloudscan20-113.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.50 BSF_SC0_MV0963_2       META:  
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MV0963_2
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_112548_851398_5D082BDB 
X-CRM114-Status: GOOD (  13.39  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SGksCgpJJ20gdHJ5aW5nIHRvIG1ha2UgdGhlIG1vbml0b3ItbW9kZSB3b3JraW5nIG9uIGEgUUNO
OTA3NCBtb2R1bGUsIGJ1dCBpdCAKaXMgY3Jhc2hpbmcgd2l0aCB0aGUgZm9sbG93aW5nIGxvZzoK
CiAgICAjIEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAw
MDAwMDAwMDAwMDA2NAogICAgI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbCBt
b2RlCiAgICAjUEY6IGVycm9yX2NvZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UKICAgIFBH
RCAwIFA0RCAwCiAgICBPb3BzOiAwMDAwIFsjMV0gU01QCiAgICBDUFU6IDAgUElEOiAxMSBDb21t
OiBrc29mdGlycWQvMCBOb3QgdGFpbnRlZCA1LjE5LjAtYWMwICMyMQogICAgSGFyZHdhcmUgbmFt
ZTogRGlnaSBJbnRlcm5hdGlvbmFsIFRyYW5zUG9ydCBXUjY0L1RyYW5zUG9ydCBXUjY0LAogICAg
QklPUyBNVjY0LTAwMSAxMS8wNy8yMDE4CiAgICBSSVA6IDAwMTA6YXRoMTFrX2RicmluZ19idWZf
Y2xlYW51cCsweGNiMC8weGQ1MCBbYXRoMTFrXQogICAgQ29kZTogMGQgODMgZTAgMDMgYzMgMGYg
MWYgNDQgMDAgMDAgOGIgNDcgNzAgNDggYzEgZTggMGYgODMgZTAgMGYgYzMKICAgIDBmIDFmIDQ0
IDAwIDAwIDhiIDQ3IDcwIDQ4IGMxIGU4IDEzIDgzIGUwIDAzIGMzIDBmIDFmIDQ0IDAwIDAwIDw4
Yj4KICAgIDQ3IDY0IDQ4IGMxIGU4IDA4IDgzCiAgICAgwqBlMCAwMyBjMyAwZiAxZiA0NCAwMCAw
MCA4YiA0NyA2NCA0OCBjMSBlOAogICAgUlNQOiAwMDE4OmZmZmZhOGNlYzAwNzNjOTggRUZMQUdT
OiAwMDAxMDI0NgogICAgUkFYOiBmZmZmZmZmZmMwNGRjMTAwIFJCWDogZmZmZjg4Y2M1NGZlMjI3
MCBSQ1g6IDAzMDAwMDAwMDAwMDAwMDAKICAgIFJEWDogZmZmZjg4Y2M1NDI3M2UwMCBSU0k6IGZm
ZmY4OGNjNTkwMGFkNjAgUkRJOiAwMDAwMDAwMDAwMDAwMDAwCiAgICBSQlA6IGZmZmY4OGNjNTRm
ZTFmYzAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAwMAogICAgUjEw
OiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogZmZmZmZmZmZhOTljNmJhMCBSMTI6IGZmZmY4OGNjNTQy
NzNlMDAKICAgIFIxMzogZmZmZjg4Y2M1OTAwYWQ2MCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1
OiAwMDAwMDAwMDAwMDAwMDAwCiAgICBGUzrCoCAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZm
ZmY4OGNjYjkwMDAwMDAoMDAwMCkKICAgIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKICAgIENTOsKg
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCiAgICBDUjI6IDAw
MDAwMDAwMDAwMDAwNjQgQ1IzOiAwMDAwMDAwMDVjNDBhMDAwIENSNDogMDAwMDAwMDAwMDEwMDZi
MAogICAgQ2FsbCBUcmFjZToKICAgICDCoDxUQVNLPgogICAgIMKgYXRoMTFrX2RwX3R4X2h0dF9t
b25pdG9yX21vZGVfcmluZ19jb25maWcrMHg5NjkvMHgzYTAwIFthdGgxMWtdCiAgICAgwqBhdGgx
MWtfZHBfdHhfaHR0X21vbml0b3JfbW9kZV9yaW5nX2NvbmZpZysweDFmM2EvMHgzYTAwIFthdGgx
MWtdCiAgICAgwqBhdGgxMWtfZHBfcnhfcHJvY2Vzc19tb25fcmluZ3MrMHgyYzMvMHg0ZjAgW2F0
aDExa10KICAgICDCoGF0aDExa19kcF9zZXJ2aWNlX3NybmcrMHgxNWIvMHg3MjAgW2F0aDExa10K
ICAgICDCoGF0aDExa19wY2ljX2NlX2lycXNfZW5hYmxlKzB4MTBjLzB4MTYwIFthdGgxMWtdCiAg
ICAgwqBfX25hcGlfcG9sbCsweDFmLzB4MTAwCiAgICAgwqBuZXRfcnhfYWN0aW9uKzB4MTJkLzB4
MjUwCiAgICAgwqBfX2RvX3NvZnRpcnErMHhhYS8weDFkMgogICAgIMKgPyBzb3J0X3JhbmdlKzB4
MjAvMHgyMAogICAgIMKgcnVuX2tzb2Z0aXJxZCsweDE1LzB4MjAKICAgICDCoHNtcGJvb3RfdGhy
ZWFkX2ZuKzB4OWQvMHgxMzAKICAgICDCoGt0aHJlYWQrMHhhZS8weGQwCiAgICAgwqA/IGt0aHJl
YWRfY29tcGxldGVfYW5kX2V4aXQrMHgyMC8weDIwCiAgICAgwqByZXRfZnJvbV9mb3JrKzB4MWYv
MHgzMAogICAgIMKgPC9UQVNLPgogICAgTW9kdWxlcyBsaW5rZWQgaW46IHFydHJfbWhpIHFydHIg
YXRoMTFrX3BjaSBtaGkgYXRoMTFrIHFtaV9oZWxwZXJzCiAgICBuZl9jb25udHJhY2tfbmV0bGlu
ayBhcnB0YWJsZV9maWx0ZXIgYXJwX3RhYmxlcyBpcDZ0YWJsZV9tYW5nbGUKICAgIGlwNnRhYmxl
X3JhdyBpcDZ0YWJsZV9uYXQKICAgIGlwNnRfYWggaXA2dGFibGVfZmlsdGVyIGlwNl90YWJsZXMg
eHRfVENQTVNTIHh0X21hcmsgeHRfY29ubm1hcmsKICAgIGlwdGFibGVfbWFuZ2xlIHh0X0NUIGlw
dGFibGVfcmF3IGlwdGFibGVfbmF0IHh0X3NldCB4dF90Y3B1ZHAKICAgIHh0X2Nvbm50cmFjayB4
dF9MT0cgbmZfbG9nX3N5cwogICAgbG9nIHh0X2xpbWl0IHh0X2FkZHJ0eXBlIGlwX3NldF9oYXNo
X25ldGlmYWNlIGlwX3NldF9oYXNoX25ldAogICAgaXBfc2V0X2hhc2hfaXAgaXBfc2V0IG5mbmV0
bGluayBuZl9uYXRfcHB0cCBuZl9jb25udHJhY2tfcHB0cAogICAgbmZfbmF0X3RmdHAgbmZfY29u
bnRyYWNrX3RmdHAgbmZfCiAgICBuYXRfZnRwIG5mX2Nvbm50cmFja19mdHAgbmZfbmF0IG5mX2Nv
bm50cmFjayBuZl9kZWZyYWdfaXB2NgogICAgbmZfZGVmcmFnX2lwdjQgaXB0YWJsZV9maWx0ZXIg
aXBfdGFibGVzIHhfdGFibGVzIGF0aDEwa19wY2kKICAgIGF0aDEwa19jb3JlIGF0aCBpMmNfZGVz
aWdud2FyZV9wY2kgaTIKICAgIGNfY2NneF91Y3NpIGkyY19kZXNpZ253YXJlX2NvcmUKICAgIENS
MjogMDAwMDAwMDAwMDAwMDA2NAogICAgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBd
LS0tCiAgICBSSVA6IDAwMTA6YXRoMTFrX2RicmluZ19idWZfY2xlYW51cCsweGNiMC8weGQ1MCBb
YXRoMTFrXQogICAgQ29kZTogMGQgODMgZTAgMDMgYzMgMGYgMWYgNDQgMDAgMDAgOGIgNDcgNzAg
NDggYzEgZTggMGYgODMgZTAgMGYgYzMKICAgIDBmIDFmIDQ0IDAwIDAwIDhiIDQ3IDcwIDQ4IGMx
IGU4IDEzIDgzIGUwIDAzIGMzIDBmIDFmIDQ0IDAwIDAwIDw4Yj4KICAgIDQ3IDY0IDQ4IGMxIGU4
IDA4IDgzCiAgICAgwqBlMCAwMyBjMyAwZiAxZiA0NCAwMCAwMCA4YiA0NyA2NCA0OCBjMSBlOAog
ICAgUlNQOiAwMDE4OmZmZmZhOGNlYzAwNzNjOTggRUZMQUdTOiAwMDAxMDI0NgogICAgUkFYOiBm
ZmZmZmZmZmMwNGRjMTAwIFJCWDogZmZmZjg4Y2M1NGZlMjI3MCBSQ1g6IDAzMDAwMDAwMDAwMDAw
MDAKICAgIFJEWDogZmZmZjg4Y2M1NDI3M2UwMCBSU0k6IGZmZmY4OGNjNTkwMGFkNjAgUkRJOiAw
MDAwMDAwMDAwMDAwMDAwCiAgICBSQlA6IGZmZmY4OGNjNTRmZTFmYzAgUjA4OiAwMDAwMDAwMDAw
MDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAwMAogICAgUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIx
MTogZmZmZmZmZmZhOTljNmJhMCBSMTI6IGZmZmY4OGNjNTQyNzNlMDAKICAgIFIxMzogZmZmZjg4
Y2M1OTAwYWQ2MCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1OiAwMDAwMDAwMDAwMDAwMDAwCiAg
ICBGUzrCoCAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4OGNjYjkwMDAwMDAoMDAwMCkK
ICAgIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKICAgIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCiAgICBDUjI6IDAwMDAwMDAwMDAwMDAwNjQgQ1IzOiAw
MDAwMDAwMDVjNDBhMDAwIENSNDogMDAwMDAwMDAwMDEwMDZiMAogICAgS2VybmVsIHBhbmljIC0g
bm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbiBpbiBpbnRlcnJ1cHQKICAgIEtlcm5lbCBPZmZz
ZXQ6IDB4MjcwMDAwMDAgZnJvbSAweGZmZmZmZmZmODEwMDAwMDAgKHJlbG9jYXRpb24gcmFuZ2U6
CiAgICAweGZmZmZmZmZmODAwMDAwMDAtMHhmZmZmZmZmZmJmZmZmZmZmKQoKClRoaXMgaXMgd2l0
aCB0aGUgNS4xOSBrZXJuZWwuIFRoZSBOVUxMIHBvaW50ZXIgZXhjZXB0aW9uIGlzIGhhcHBlbmlu
ZyBoZXJlOgoKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3N0YWJsZS9saW51eC5naXQvdHJlZS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFr
L2h3LmMjbjQ0NAoKZGVzYyBpcyBOVUxMLCBhbmQgaXQgaXMgY2FsbGVkIGZyb20gaGVyZToKCiAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUv
bGludXguZ2l0L3RyZWUvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kcF9yeC5jP2g9
djUuMTkjbjI0NTkKCgpJIGZvdW5kIHRoaXMgY29tbWl0IGluIHRoZSBoaXN0b3J5OgoKICAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51
eC5naXQvY29tbWl0L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvZHBfcnguYz9oPXY1
LjE5JmlkPTAxZDJmMjg1ZTNlNWI2MjlkZjljNjE1MTRlN2VlMDdhNTRkMGVlZDkKClRoaXMgcmVt
b3ZlZCBzZXR0aW5nIHRoZSBSWF9GTEFHX09OTFlfTU9OSVRPUiBmbGFnIGluIAphdGgxMWtfZHBf
cnhfbW9uX2RlbGl2ZXIoKSwgc28gdGhhdCBmbGFnIGlzIG5vdCBzZXQgYW55bW9yZSBhbnl3aGVy
ZSwgCmJ1dCBhdGgxMWtfZHBfcnhfZGVsaXZlcl9tc2R1KCkgY2hlY2tzIHRoYXQsIGFuZCBjYWxs
cyAKYXRoMTFrX2RwX3J4X2hfbXNkdV9zdGFydF9kZWNhcF90eXBlKCksIGlmIGl0IGlzIG5vdCBz
ZXQgKHNvIGJhc2ljYWxseSAKYWx3YXlzPykuIElmIEkgYWRkIHRoYXQgZmxhZyBzZXR0aW5nIGJh
Y2ssIHNlZW1zIGNyYXNoIGlzIGdvbmUsIGFuZCB0aGUgCmRyaXZlciBpcyB3b3JraW5nIGFzIGV4
cGVjdGVkLiBCdXQgSSBkb24ndCBoYXZlIGRlZXAgZW5vdWdoIGtub3dsZWRnZSB0byAKa25vdywg
d2h5IGl0IHdhcyByZW1vdmVkLgoKUGxlYXNlIGFkdmljZSEKClRoYW5rcywKUm9iZXJ0CgoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
