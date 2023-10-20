Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE87C001DF
	for <ath11k@archiver.kernel.org>; Fri, 20 Oct 2023 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:From:CC:To:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RUTHMxRH5ZF0vo3vJ+iPA0sPKUOzcJ2fPe7Vi54D1YY=; b=alCBliRcEMVP0n
	Owa9MxII0D2IEA2o9WkCGREFxMBgbDtLKXC+ser0Lbp5xKOy/GAs+tpt8Yjz3A7CyVBNfGs3RxdDi
	nkZGrLSfHZt+hFUcraLUaLOLkRH3HBQfiBbWjJ8G6FrZMzq+WtIadn434w9OAyryj4rwRbqMAVeA/
	ihzenVOHPhinjgxWGE5tEszIup1mmnuMx4QAnA6QGT/i60E8K5rbXjUgyqf1frjLDjVORzqlP9jsJ
	JCnwIhvkBIkPt7ROfyk3ripoJxv3IL97tAryBKygEH25sz4oRbVa/D21yyIV52b1M8afjpEx/SwW/
	QKbKHtB/VGgvbC+tTOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtnoz-0029jP-1i;
	Fri, 20 Oct 2023 11:37:41 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtnow-0029by-0B
	for ath11k@lists.infradead.org;
	Fri, 20 Oct 2023 11:37:40 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K5j21c027620;
	Fri, 20 Oct 2023 13:37:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	message-id:date:to:cc:from:subject:content-type
	:content-transfer-encoding:mime-version; s=12052020; bh=QDrF1kZY
	vilfZ3j7F5yR+Iobv4FAfQRRV0pruFbuKIM=; b=YM4ceRsFwuDAw094zSUyQeyB
	hROQzqULAB6VcKGc14QqZzPd8SobUaBNa8q0eFx/oNMZ1ImY/4dJtaF3izJcf62y
	T3kp0a63hP+gTqamllJhWSNmM7nC1bHxlQgjtIrSCrMRfmJcWOrnAXqkUzUhp0X1
	iJXTnjGl5uAGeOetar+LKFAJV6BeibIAPJ3zYp6k3ZtiSfzIU7J5j1lB10Jvzbjm
	bpnaFVR1+pV8qLPz3YY3h/Jc6muSfbys/xR9zTEgUWGH+keuwRPcTzEgK1MxUAjd
	/n9EPxzyM/M10SxHJ3eG34UYNCwAxcvbRgQu28bPikKJ3sA7aCWsINSzLeJ1gQ==
Received: from mail.beijerelectronics.com ([195.67.87.131])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 3tueu0rk13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 13:37:09 +0200 (MEST)
Received: from EX01GLOBAL.beijerelectronics.com (10.101.10.25) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.17; Fri, 20 Oct 2023 13:37:08 +0200
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.104)
 by EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.17 via Frontend Transport; Fri, 20 Oct 2023 13:37:08 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaYSbY+rPbDg42hA3aj2YyqdiDkrH/vzCjzXLC0oyC2IGIxT6XCmaV2Soi2QKHg7bnU69Sqr5azdZwRUn/VuHNIEvRvgGUISLnfM3Jh2y7wxgeJldsIApMW79UGCggXoEmOCP4ueytxtwu1xWvbvIcWRFezXXjClDHpCDoP7nAHu73mBenkSS5QezpRy/LYzcAUU3Rfmh6UGJd2DlQhxZvytBqBvPR0+HJlH3JXI0+mMRGqar6EYBgiv/qZrLul1/k66LDrH0MnbFTZkPKaZ4fBSHIK2f05FvmMGPEeY/zihlNqQ33MhQIAkXADZbpLciyCta+X3NW7RinvrWXa2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDrF1kZYvilfZ3j7F5yR+Iobv4FAfQRRV0pruFbuKIM=;
 b=N0yPwjnJ2WAXxdR3G3dvph2ZNzjHawJoerPH7qWSLNaMQXJl02gvf0k2TBMIiO62S4En1CZzTWLZCBxoPQ5wPLxU6+4HDuNmVcYVaMeZqbga+PE2xgpev+i34iLlp2FJBemKNrTpReXnJPFVHkyKcU2LC7qSuTpSLGfPJQffIzkkAF3p9Gq2RRsg5UKym/Joito9I1f3rS93siioNPFg9seKOH3aiBv862VJzTIU+/LoCF9wGe6rn/v7lqvuyZqcgdf9j14ozhH8YsJ4R9S7M3ffPG8urrtmCBYmYvk3x8kxCNFdSfoLTJqPLvbJntAGtqoxyTKp+BEuXMAUzh9qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDrF1kZYvilfZ3j7F5yR+Iobv4FAfQRRV0pruFbuKIM=;
 b=LmXme3hJnqLSm15i6+rFVVftTZ3RB7DsUai5QDezAfWuUw3GWzAiWB+8Esjujjldv4dHbDPn1zwnhiQ46SZBPCE1b/vaB4kppe1EsQvZNkUJPX8Oolu62qUq0p7FDjUoVwE0K1L780C2vdm4iPs91xKJgTtufoTZdFffNNfWono=
Received: from PR3P192MB0730.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4f::17)
 by AM9P192MB1014.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 11:37:07 +0000
Received: from PR3P192MB0730.EURP192.PROD.OUTLOOK.COM
 ([fe80::c5c7:6f84:3980:45c2]) by PR3P192MB0730.EURP192.PROD.OUTLOOK.COM
 ([fe80::c5c7:6f84:3980:45c2%4]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 11:37:06 +0000
Message-ID: <19ce2c57-4173-4418-919d-3648caf85061@westermo.com>
Date: Fri, 20 Oct 2023 13:37:05 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Subject: wifi: ath11k: QCN9074 numof stations
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To PR3P192MB0730.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:4f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0730:EE_|AM9P192MB1014:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d423126-2f6d-4e35-c79c-08dbd160e373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0K57xLDAKrAyRriHaRh4MoM43VnuFT06VQxw/dl02WWFJTm4KM6Ttk8SKIhZpMixr+cNmzfFfMJtN+nMDCRY9yvEFwAHn5l9sWa+HStgw4x1Izk44cXHwhMMm7o0A0wE+ffOhtcx8dPqvn7jF27O0cqqE38pDw6yy4/HZ4OYLjBOlNnFMQHBdxcVznIOBhnQ8QzA/8mdZuwYi+QW6HdSnHidiK8sFE6HQq3TOQIOaFcaXi7rJL6dNBZqo7I1FhyXdE6H17S7dDySqIppQYghOLxEIP23n0gUlKVkLlL6imv4XA5V3eIiSTq9t/o+MKEPb/XRJHcKx+kctVcNFkGJKj3OBhqWnCzol+meOnQOUP/C4XSZJYzIJQWNiJaHM9etbNpnKXsPk8+KcmtCJqeKOpC1X8eABMKq8PWEsiHkHpLwZ6Wi/44vpVafL/zsk8mrh5YcdTvZBxWZeYumERtI+xyrXHt0W6THa6JqX/neZu1Qobb9l1sqXsEHY7o03CXixCpOgM/SKF87yrYJoI4wmloxWwDVL0jSSQ09MBT4bt4f4HjbPbQlPuKnOSA8AwrrtX7KA9hkUo1va5bJXR7R3Nfm/IqzNjAjajjEtdYbh9DxnsjuB/7hCLDBCpumElP9AyoVLwljoYGd46IfyDl/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0730.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39850400004)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(6506007)(38100700002)(31696002)(2616005)(86362001)(6512007)(478600001)(6486002)(83380400001)(26005)(31686004)(66476007)(6916009)(316002)(66946007)(66556008)(41300700001)(4326008)(44832011)(5660300002)(36756003)(2906002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFxQWZDL0tJaU9NWWdWUmlRSWVJQ3hXT3RHTHFPdUkxUkRNbHBFaFkwZEs4?=
 =?utf-8?B?UFpiRnVGbDhKTis1Q0RoaVBlVVhMTGJtNmdJZ281N2JmZ2FqbVVWSExVOVhl?=
 =?utf-8?B?OFhkUHlXNk5UMkdTb0ZySFkrRXErQ2JCK3hRVEt6RThhN2pJQWVZMWxiVmpQ?=
 =?utf-8?B?dnhQZWhoNUU1YVhscjlyd09McCtPVi83NVpCK294MHI2NVAwSmt0bkpWc2cz?=
 =?utf-8?B?elNCcEo5VVVxczd4L2ZPb3M4WnYxM0R0dzdHdE9UanN4alpEak0xZVQ2ZVgy?=
 =?utf-8?B?MkJ1VEtZSFdtSUFqNm9OTm52UlhFdWlpcVZXUjZPaUV0by9VaUkzSVBDQ0s3?=
 =?utf-8?B?RUd0c3JXTkhSdVQ5NjFCTEFnM1RlQU12a1BSZWVJRmJLcVJoejlvSXBUM0Ri?=
 =?utf-8?B?eG9nYklGNEtuWS83MzlvTmlrUFM2ekFEQkxpT2ZhTGhQdjdGTmR3amlsTzBB?=
 =?utf-8?B?bDlwN2hvWXFEWmpYdGUxSzRpMzl4bnpKMXpOdi9jckpGV1ZQdTBrOHEyUG1C?=
 =?utf-8?B?TjUzdXpOK3IwcmcxS1dVMXJFNE56REYvcGhsakVZT0pQWFZhWUloVnByczJr?=
 =?utf-8?B?VUQ2ZEJaMlF1bjl4WjZsRXlJNFNVbzJIRCtsTHJjUDg0c3hJL0VjSWszWEdT?=
 =?utf-8?B?ZE00YS9LNEMyaUxXUGE0d0F6Rno3YjBOQXB5Q1NlV3JINXlPS2ZxWGdhL1BY?=
 =?utf-8?B?ck9XTjJiZHZkUDJaMHBNanhDSDJqbzdZcmoyWEFkTitVTkdZaWlCTUltUUti?=
 =?utf-8?B?Yk1IMHpRRGRCS1RnZTNIcndIZGVrTElTT2d1VFJaMzBZR3BKRDNjTzdKRlpm?=
 =?utf-8?B?NjQ1a3VTczl5ckw4UUE3dm9XVmVwajFVWVFzdmtna0hpek5FR3ZvblZBTFhy?=
 =?utf-8?B?ZXdWdm9PT1lYN1lIMVRZaDhBdHBrR016SUg5ZFo0NFBNYXZva3VXUmlWUmh6?=
 =?utf-8?B?SjlwbG4zNUl5L0p4cUZDdDM5WHNLeWZ3Y0w0dWtUUHN0R21JQUtJaTVHRUp1?=
 =?utf-8?B?dHB4WEtyNnpVUU11WFl6TUQ3N0xIOFdDRmtpM2tDSTZ5MHFSWERUWHFPeTBq?=
 =?utf-8?B?OWdnUm5IOGkyZ0M5VjlqaDAzazVwTEhZVHdLa2pWSHViUEFiUmdQN1V6S1R1?=
 =?utf-8?B?UXRyNUQzbFdvSnNGUFZSMHQ2d3JoNjdWVjFEMThBOCsrZDN6aDhPbmp1TjRh?=
 =?utf-8?B?V0lFWVc5NmNuZ2dCRERXaCtOVS9DcFdkOXU0c1hsVXJpb0NKV2JYUFZFRlcy?=
 =?utf-8?B?ams5NGxRbDJZOU1tVUpiOG1Rd0dCWU9NYmRyRVRCS20xRm1PSlFyMnZUeEE1?=
 =?utf-8?B?bElIVHdKQ2pKV3BIZDBpRkQwVkZ4T3pGQUw0VW9tWTB5OGJaaU94czl4ZVdU?=
 =?utf-8?B?eUthTjRmYmlhK3VPZlMvbUNSQzNZUjNwL3BtNkpwRUh2dkVnMU9EYmdialdR?=
 =?utf-8?B?NGptYnRrODdXUjlCa2htSFF0c3JBS1Q0Q0Q0MnRJdndVZUkzWE9DYVRZRVZH?=
 =?utf-8?B?WFJrWjlsYnBTSW5ta0ZBa2hGdjEzemdQQWF2Z0xYdkhmWmNtK1NsbHJkY2tt?=
 =?utf-8?B?M3Yzdm85RXU2a1BIaDdyNnVKZlNvbU5kTjUvai8rU0NyVmgxN2hKK0FISFhD?=
 =?utf-8?B?Ulg1TVN5RVRDRm9iWFpCVDlabmtaMm5JUVpvRmhpbDV1ZVpvZ0JveTRlSStr?=
 =?utf-8?B?ZFZKaVhLNDBIdGhnWnNwcnFWOWpId3N6NjlWNnh4NXFya3dldmZNTVVkU2JQ?=
 =?utf-8?B?eFlnQUhxSHVudnZ0NUVCcDFYVXhpekExbUxSTUw5WHVLRDdkUHZRUXNZRWFM?=
 =?utf-8?B?M0k1KzB1RVAzaWZJcEVLSk9ING5XZVkvN0ZmLytHbS9vV1VHUlNLR0pFcEpi?=
 =?utf-8?B?dzFodEN5WGFxRXhrMXlhMFRwWFFuWW9MK1Y0Q1pxMzk5eC92M2pvUXQzRy92?=
 =?utf-8?B?b01Tb1F2WnBndEhMMG9QZlVrMDBIYThKSlZ5REk3ZFlzalV6cG9mMU1CbDBr?=
 =?utf-8?B?NHFkNVExdTlsNytpWkx5L1QxOGppSnZaT0E1UnpSVVR3ci9aT1pOdTJkMDZV?=
 =?utf-8?B?RU91VTZ1bG52Qmt3OG41SExvZVV3SWR4Qzk3VUk0NlJPQi81eGNWb1RBbXIx?=
 =?utf-8?Q?mX51v07aky8tZYDiBXmkNb7p5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d423126-2f6d-4e35-c79c-08dbd160e373
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0730.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:37:06.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCIxVkDJMeL1BVp14XDu9x60YAMvXVtstzFHb24IhwIVx7ylA+YwoDxF4fGbSwjixCXYpkLiWdMOqgze8xwmbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB1014
X-OrganizationHeadersPreserved: AM9P192MB1014.EURP192.PROD.OUTLOOK.COM
X-CrossPremisesHeadersPromoted: EX01GLOBAL.beijerelectronics.com
X-CrossPremisesHeadersFiltered: EX01GLOBAL.beijerelectronics.com
X-OriginatorOrg: westermo.com
X-Proofpoint-ORIG-GUID: M9m4usYQm9RYbTZxHTj5yswVrX5Mm-Tb
X-Proofpoint-GUID: M9m4usYQm9RYbTZxHTj5yswVrX5Mm-Tb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_043738_879352_EDDD5049 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi kvalo,

I am running the QCN9074 module in AP mode and have understanding problems regarding the number of clients supported by this module. I use the kernel v5.15.92 and the following firmware version: '2.7.0.1/WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1'. If I boot the module without any special parameter, the firmware should be in the 'hwmode=0', right? I don't know exactly how to determine it. The 'iw' tool shows the following line: 'Maximum associated stations in AP mode: 512'. Then the AP supports up to 128 clients without errors. When trying to connect the 129 client, the AP crashes and kicks out one client after the other. I see the following errors in the log:

ath11k_pci 0002:01:00.0: failed to update rx tid queue, tid 0 (-105)
ath11k_pci 0002:01:00.0: failed to update reo for rx tid 0: -105
wlan1: HW problem - can not stop rx aggregation for 00:00:5b:00:03:26 tid 0
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 0 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 1 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 2 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 3 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 4 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 5 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 6 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 7 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 8 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 9 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 10 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 11 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 12 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 13 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 14 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 15 (-105)
ath11k_pci 0002:01:00.0: failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid 16 (-105)
ath11k_pci 0002:01:00.0: failed to send WMI_PEER_DELETE cmd
ath11k_pci 0002:01:00.0: failed to delete peer vdev_id 0 addr 00:00:5b:00:03:26 ret -108
ath11k_pci 0002:01:00.0: Failed to delete peer: 00:00:5b:00:03:26 for VDEV: 0
ath11k_pci 0002:01:00.0: Found peer entry 00:03:7f:12:d6:d6 n vdev 0 after it was supposedly removed
ath11k_pci 0002:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
ath11k_pci 0002:01:00.0: Failed to set beacon mode for VDEV: 0
ath11k_warn: 32 callbacks suppressed
ath11k_pci 0002:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
ath11k_pci 0002:01:00.0: Failed to set beacon mode for VDEV: 0
ath11k_pci 0002:01:00.0: failed to send WMI_BCN_TMPL_CMDID
ath11k_pci 0002:01:00.0: failed to submit beacon template command: -108
ath11k_pci 0002:01:00.0: failed to update bcn template: -108
ath11k_pci 0002:01:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
ath11k_pci 0002:01:00.0: failed to set BA BUFFER SIZE 256 for vdev: 0
ath11k_pci 0002:01:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
ath11k_pci 0002:01:00.0: Failed to set dtim period for VDEV 0: -108
ath11k_pci 0002:01:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
ath11k_warn: 7 callbacks suppressed

Is the firmware running in the wrong mode or are there other limitations?


Best regards
Alexander Wilhelm

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
