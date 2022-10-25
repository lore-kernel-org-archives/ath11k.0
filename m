Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF17C04A95
	for <ath11k@archiver.kernel.org>; Tue, 25 Oct 2022 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:To:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jqJ5MVKOPyxXkB2khQXFCXDVuBCDxQnLNPrgftcfc7c=; b=cqBMv17zMAWUB9
	5P3Zvo3R+vnXPh15xlA0B75qm37FTswjymtF7qqDDZ4xzXGUA6FRYgXZ9Ld2CPizMbqAyTO6S6rLs
	u/nVRO6Ylqbd77i8t2LM9sqvHKKIsLlvVVxMTSeNnjy3DavJAWPDW6IR2/IvR5b54gHOBEsOLoZuK
	WXUyTNe6PV7vXKWo3IeyvhXc4DOntyEFNqyU2MdWfoH5YMVXsd4QZqtDhIVttb80Yb7y6FwvmfkCH
	3DWaSM/tAp9xKnPk3yabp8EC9/AZg+9WnfJ04N2tp4KZNCUss0UeCOZHidKjX9Ifv1md2nxCWKhB3
	udYK0MI9xe32cGxgFP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onMHB-006CEH-0J; Tue, 25 Oct 2022 15:55:37 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onMH5-006CDE-Tr
	for ath11k@lists.infradead.org; Tue, 25 Oct 2022 15:55:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105]) by mx-outbound11-89.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 25 Oct 2022 15:55:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGxNLuf/28fEuWWGsda5fKLAgECBk2AbAfVdeGxSKaw3ZC1249HWu433IoJ6dIrdvNz0HO/cQrlVSmepvWIDP33xQiaI9YKkt1kc1TN56oxmWggRCBpFyenFS0ksEoi+5PlYvbenTYW0Og8dOPiOGRc0Clv+BVlwCZgRtPAdz8hd1HVB7BVxGwIP0vdXY2L7+ddYqBVz/lglDEQQb1sHmDAKYCt9MwXyqY3Wy3Xg/BHl7SCZz+y88CUwKQT8yVrKEgJI1zKKxnjggJw//rcBWDKF1i0uSE1PYxgBweM8AGBEwzjY3FZaARR4VWGUw3pyRSul0EyALdaarey6SAjFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kmE6yCghMTYj+tXz4z26nE+N4Gnu2+efyTjq/TBeH8=;
 b=QztYgQfw/kUZgTWasnhwZlUfYH5RtKaYF+cgeHzFx5QzPcCapYv14PRogsHlIpVqx7iEXoSOftAn3W0no7+0xIalGR2lClXWkM9zurkZben1COhXDKyEEsadbQwUfLK+RADEnN0Tisqvs2sJb1AIVXSTQrYxrpK63Ub42iAKyHFl099BefBhmiBpIhdYngb5g621kE4DHljKCoJNmWBANS6a8nBgzBXmzdJV+xWq9/k2vZt0sLX9UcYYlUMd26JoOEWfv5ztS1gOsJEIIw0AZB2l/T3tNRrzxpdYznqYCrdGwGt19ph8vrycv82xc986YRj6nd3x9g7tvxlxw16EBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kmE6yCghMTYj+tXz4z26nE+N4Gnu2+efyTjq/TBeH8=;
 b=a8SbDWstOpY7vI+FKvpubv9ga37Ls1XudqgyrBFgiFarYsK7adlMTSVswQdu7Wi5X9AJBis4CpegvTK49XOIx8m8JGWy5JRbZtGe7VZJbILa6L7w5rSDNwrK/RwqnmiA7/8dLmHNr6hJW2+40HLKKyA1Lo6y7CtLURuTT+M6aglyvgAsdSd40mjs0Uv408oFRIMbcc3JlYKGfVnQEoKdNTIZAf+huR5Md5/J2I13C9H9vluR4PGDJ4R3gmaf0f6ja1kl3xPyAT8S6aWED1yiM2AC2jfa2Sufr+7S3Xd3t1cm/19kphJsxelRf1t7gSninDo2bjjH3ENG7jDXGY2G0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DM6PR10MB2921.namprd10.prod.outlook.com (2603:10b6:5:6e::18) by
 BY5PR10MB4387.namprd10.prod.outlook.com (2603:10b6:a03:211::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 15:55:21 +0000
Received: from DM6PR10MB2921.namprd10.prod.outlook.com
 ([fe80::d723:2754:99a3:a6d1]) by DM6PR10MB2921.namprd10.prod.outlook.com
 ([fe80::d723:2754:99a3:a6d1%5]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 15:55:21 +0000
Message-ID: <a636f72f-6fb6-a424-70ff-5bd67139fa72@digi.com>
Date: Tue, 25 Oct 2022 11:55:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: ath11k@lists.infradead.org
From: Anubhav Gupta <anubhav.gupta@digi.com>
Subject: QCA6391 DBDC support
X-ClientProxiedBy: CH2PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:610:59::15) To DM6PR10MB2921.namprd10.prod.outlook.com
 (2603:10b6:5:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2921:EE_|BY5PR10MB4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f625207-cb26-455c-3781-08dab6a15229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oubrV3tM93x6PWXNFleWt8qB4an/fdQBwKksSQfEBNeAw6dddMXzKPWiNuS1ngwxqPjh8KR3hxBHCXjyaI5Tk/ptqzuXfacRlosyGHwzA6/xr+fOtpgnVVrklI+FEAyu4yWCQjUoZrOWL57nwtC4UMe5RUw7LYJjTTLMLJ66YCK7uTPd46FXz3ywSgY8DmDDR7l9uEXKFVx8tZyZ1kaKeTodH/m37sKidfu0H8d6mzX96QqNAqtHgKkZoAO9lThQZuRDkOzaXqC0XZ/7DyPTN3f41qteawinxqJM82ry2IBWVazNZx2EWux6F/DEfTMvphcasrJxZutLnWbMRsc13o6zJJnCLVzBxdI8I7ZexLZRH2GBPDSn5k4AC3z17R+v3ZxJXM6/h1E2ZZlEuS75Yx0QtaXgltHUGjNGbhvrJGm7bRcizvBNdmNzUzjRuy6cp340pH63qbS2eb3I9DHGo8BNbNOlv+qhppjNFPru/JnbxVa4a0uM8ok/JgAsG/F1kEUElSg2UK9tn8Dt1eEd6/MSk9JbOIJfThrgnoCLpwlgF2I+9y25e+K2cgwvP55qHqEWRtphMd9QdQNRPLcrTk3e+lN/1NIR+cUv+whuVPLTmk3KktYP952MeklxvXt4LeCwMrDH3OXkHG+WyC0FCmjewBb7m/HEYD0kMYpo/2TXSHpMVnwnKtqt511NmBvFuf2p1pabUNH49C6DS2uvx5TV+kJ9ztB8gSRWrcCgJ51/vnj9v1Zp9sYcZN/deTxyB8mer3yI4XWjK5iD0W7xyOwzIjhB2LUzSDsbhVQi/EOWj8xw0E1Eqq2+u8SyeP4KsRvg8DY5YN2cdFnB3opNmw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2921.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39840400004)(366004)(346002)(451199015)(2906002)(31686004)(4744005)(44832011)(36756003)(8936002)(66556008)(8676002)(7116003)(41300700001)(316002)(6486002)(6916009)(5660300002)(66946007)(186003)(478600001)(2616005)(6666004)(66476007)(6506007)(86362001)(6512007)(31696002)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UXJaVXJBMlc3SytOQzlGYzBKUGFvd1l0Q3pYWStZY296Z1RPa2ZwdDZidjJL?=
 =?utf-8?B?SktQamgxOGtWRTBVOWh4eUt6NjcvUDR0L1VYU29mV2hzSjRuVnd3UFhvT3gw?=
 =?utf-8?B?bHZMQWxvMlNXaTBEZkJ6c0JNMzlPdWNWNFgvcHlkS3MvUFlRYzZaVHNmd0lQ?=
 =?utf-8?B?Mk81djcrRmFRdTFQaU9iZWpLSm5lSjBLWWpOdzVTeWZLcVo3Y1pqRzhWa1d3?=
 =?utf-8?B?bTU1MjdUZTJCbGJVVmlyTGd0WXpRc1hTUkVGK0pqSDZQaXRGek1uUnZxdmVE?=
 =?utf-8?B?YWRnVEw2ejh5SlBtaEZ6aTJ2VE12dkJaL3lvS2p1V29MbUpCZlF6UHhOK1F1?=
 =?utf-8?B?NndkMjBNUnYxYWs3VExjekhRQTl1OVJkc2JVV2FKVkpJMjROR3RnVUgyYjNL?=
 =?utf-8?B?Vk5jaVM1eVFDTm1NV1pvbnlTWnBTNjFsMFk0dlZCYzVGUnZhMGpwMWtWUDFv?=
 =?utf-8?B?eVZoVk9JcTdUL0VRU1hvTWJGV0pkTm0wbHBvc2tGaStmNS80THNKRTZWYTM4?=
 =?utf-8?B?RDdDeExVWStuNWRCVEZML3ZpOFpBSnYxZGZrL3VnMHp1dXlvWXFuNzQyTlAw?=
 =?utf-8?B?MHpQaXRlVXBCNVJ1VDYzTWllTklyZEJZdmZqcG9lb0NIUnNrT09xUkhCNTRh?=
 =?utf-8?B?eUMyRktpSkxjR2w4b0kzQjE5VVB6ZkZnRXViVlRJaEUzT2p5ekxMR1VDZjFS?=
 =?utf-8?B?eDdJNmxldXR3V3Vvakk2NElXcUhSbnlZdTVrWHlyV1dNWUpZbmVqbGNkdm52?=
 =?utf-8?B?VjRuK1JLZVBVbDgwWXBZQ3pSWmhXL0pYVUUreWdJTjRRRlhRVVJqZ1lQRlVR?=
 =?utf-8?B?NmRxeEZnSGF4WkZJRXdEK0ZreWpTQzJ0N0J0U2ZLbW5wQ0MzNHVKMkdOSjFU?=
 =?utf-8?B?M011T1RaZmtQd05POXZLVDFZbGVGc2s2VitsT2U2dm1wZGpVbzZhWlFqTnVm?=
 =?utf-8?B?QzJLRmpXTWJFeFVnYjcvaHd3bStHeS84YjZ3WVpDZ1JMZDJ4bnljSGI2S3Js?=
 =?utf-8?B?TGtabEhBRC8vdFFyYVVCUEZFTjdWZmpWTk5MbGFyWU1xZFpBQjlTbndOc1c4?=
 =?utf-8?B?RkVtK1ZldERsNjdlQ3FaZ1BoUW1hanpZdk9xQ1JOZkk4WGRoMmd2eGVzRTVJ?=
 =?utf-8?B?TXdNT2tBQXNVeG92OWx6cFg1dFNhYm11Z2x0NC8xK2ptaXozZlJ0YkYra3Fm?=
 =?utf-8?B?V2c4ckxwNXpEZDlGbVhmRGtqQ1ZXZlZ2U3lJTUJ6S2hWbEFGL096UTdrTnNu?=
 =?utf-8?B?T2tla2NUeEhPV1dxQ00rUUpEQ1NCd0NDUjUzdUNZODF5OENiTHhUNi9XWWZa?=
 =?utf-8?B?cmFvRFdrT1RpenRORUYxdHI5N045MXNHQlZ5WExVTUkrMEtsWnRZcnNpZkZq?=
 =?utf-8?B?eWU3T1prTkJNcnVqakErT21QNk9mekJqZUZUc3V4RElBSDJtVjFDYWFBMkVJ?=
 =?utf-8?B?Qk9tRE1NdW1LNjZFMFNyNjN1UmtHTU9xVzRTS1pnaGw3Q1lrc1NlM0hmWFJa?=
 =?utf-8?B?RGtKMk91eTE1dk4xR0F3R05PU25PMjU3NDhCOExpcWpBYTJJb0FjZzRWcnVW?=
 =?utf-8?B?Uk5UNFZmcFg5L0M5bzVvd3FZY3dYTjhuN1F5Q1IwZVUvWWllSExod0t4SW8r?=
 =?utf-8?B?ejFYdlhBOVE0VTBaU3FjckVMOTVLbE42NUhsTnpmK2VKeG05blo3eTRlR1RI?=
 =?utf-8?B?YmpyMEcvS1hWNUU5UkFweXZiUHh2enRyY0VnZG03eWIrWnYyQUVOUWdNaW9q?=
 =?utf-8?B?dXFvYXJVYkprelVTem9sa1diWlVZYUEzZTdEQUVMbzROS2RMRWN0elBGTkV3?=
 =?utf-8?B?Znh4UGRFbVBlM2lxd3NpZXVZVERQSTNoUHRjb2VFcFFUVnA2UzZVdWwyZjFs?=
 =?utf-8?B?dEE5WDNsTmk3Q2dLSS9MU0RBUi9OSDV4bDBBT3lwaEoySkFUVlArQmFXR3Bm?=
 =?utf-8?B?czFaaHo1RjBiN25MaTRwcEtoS0puaVRYdHV5UXNCekJkQmVoQ3A2aC9FRFhj?=
 =?utf-8?B?STZpS2E3ZFRDR3Zwa1JXYThEdTEzNzcrSWE1UlA0elJsaEg3YkhwdXk4M2Iw?=
 =?utf-8?B?dzh6eXZXaXNjUG5mYk1EVUdudkhQQzVzWEJXQndHTVRrejBFeWllOXo4UHN6?=
 =?utf-8?Q?H72bMFDRMEblYwC+VnX4oVlDC?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f625207-cb26-455c-3781-08dab6a15229
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2921.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:55:21.2487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbcL2l6uLwrbR4dCn3oEQEfQQ6qBPdFKrKjkkOHh7p0J1JNDZGuwplVq6ZmfMQXP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4387
X-BESS-ID: 1666713325-102905-5404-17935-1
X-BESS-VER: 2019.1_20221024.2147
X-BESS-Apparent-Source-IP: 104.47.70.105
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.243708 [from 
	cloudscan14-115.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_085533_281602_F5F7F504 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Team,


I am working on a QCA6391 based module from Voxmicro (E63W) on Kernel 5.19. I wanted to get some information from the Team if Kernel 5.19 supports DBDC on QCA6391?
If so, then does it support 2.4 GHz & 5GHz AP concurrently or 1 AP and 1 STA concurrently?


Thanks,
Anubhav Gupta

<http://www.youtube.com/digidotcom><http://www.youtube.com/digidotcom>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
