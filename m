Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00824EB64DC
	for <ath11k@archiver.kernel.org>; Wed, 21 Jun 2023 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBIz4FKRHr87rUalXbqdgmwUadrbx1Uxy1aKaIR8n6U=; b=TvCQonDeExGM0i
	3lZXFliA/jVrBQ5Ivrzsss09t4ROVgkYg9+xPqxq7kv6lz356VPSMlFEMCiLEuyhpcIbcCPKZcz3N
	X+JC7sq8P28g6vbEU3oqqewv0s68GHUkAmKYRr8VXQqstosKYuZXN/DhBUFJ9GyB9OeCcizTafNAD
	SwcHgf+gY7TKVeDis+u1w0xnmiwOfXKQZYR8VkLwiDiPdCItVUChQnVRi5vREwWUsUQb7yqdeBocP
	bPIiH4BAGKl3n/eyAsNKjpp0pBy7pAz/6mjNg+0k6RlBqtDsBFrPp2gImPFSlqZ4UCtyi4QrUnZr8
	zsnFY2zJaxxCRcDKZ4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBz7L-00Eqn1-1i;
	Wed, 21 Jun 2023 14:47:31 +0000
Received: from mail-mw2nam10on20720.outbound.protection.outlook.com ([2a01:111:f400:7e89::720] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBz7J-00Eqm0-0B
	for ath11k@lists.infradead.org;
	Wed, 21 Jun 2023 14:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSz5bbGzL8efFh2AoGkaAmfdszU8EMriTf9bYl5ynuQJpwdqcq1DJzxQfmdpYBxTK7xBd9tvjHSPy+zPVafNWpnAJwL5Kxzxbm8HwsPf9hYzM6+lwBkJxvWJzzk4qZTCAJfQfoaIqlbYbdoD+MPVlGYTAbd2NLRec3YjbSKxy/h9UNtIuzrnRrsyrs2IUUlBf3A6l1qAivRe2bRWEK7jU/JeX18YNbMfgqnutOY8LH9HL038piiktosiLsHghN+WBFIBxGNd32V26doR/1f5SAC1IgikljtfiH3Q588eiAKRv7/C+7cajH9oXPi6ev1B3kaVVetsNkwOthHPff8TZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I+t8x/2zRPSPNDiY5ZoG/bLFBL5OO94UvJfPzzRYls=;
 b=NjyR/sQOQepYZdQ1flDP6vW+pE4leEsI641Th+EIbFXfIVQIP2wc2YxS/Mq7B3iUkvwAW0OjGdbXXzSjcQLhuf4ueA2l5deaTtP4EFvfyYzirdHVU4ZzR4eTBOCEtLg3jsXwbC85zmOZ/TEh9tsgmWH98K+vXUBtau8djv3Ld+JBHC+sBt4TxvfdSaz+vEku7BrVietjFNr8ZCblGyhu/aTXMmlaMk+ECm7Sjer0nxijcEDWnyhqtq0wso/6cUgqc8RALFeETZPWEUb1EoEnv5KDYa8fC2YKq0nfXkL/hZ7r63pxcNHfbTvz+wlfBClbk5RE/gloQvzeNchUP7GFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I+t8x/2zRPSPNDiY5ZoG/bLFBL5OO94UvJfPzzRYls=;
 b=YVSBmtfJq9YxfrlHZTY3joq+/vmkkAWCSseTs7K/mIMjKM7wMmG+HXSY65vwNKSMQWJXcMr0hlT60LyPB+Vq7VSJAg3q42/zTgyC8a8s3mceipI0lRJ/R3KVwQEU5Ulj/JdxOsX0nwZf1cI8Oi+xR/zrsRzT2oOCcfG9siWvvu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SJ0PR13MB5623.namprd13.prod.outlook.com (2603:10b6:a03:421::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 14:47:22 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 14:47:21 +0000
Date: Wed, 21 Jun 2023 16:47:11 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 08/10] wifi: ath11k: Use RMW accessors for changing
 LNKCTL
Message-ID: <ZJMNb4Yx+K8FSJ1Z@corigine.com>
References: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
 <20230620134624.99688-9-ilpo.jarvinen@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20230620134624.99688-9-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: AM0PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:208:122::28) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SJ0PR13MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a30e948-5109-40f9-6024-08db726669c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aTaBwPbRyr/POcCXNRQ64Ajz4q7bIAoHZXhtE2jg9sqSDBwKRPJF7kBkMOVEPp0J+GBF+UyUZQ3wCANa59ZQau0LXIqPDsq1r0hD6N5gXL8BciMkzS/Wy5b3dLji8l9R4Vh0wfV8RQiqToB1uWgsZGIXRVUJmkR1P+QcNfxIKHfDxRsPUhQvaIf3J4eEL0pNDfv4bw4yFbC/JzhSyrS9t3L09TKoU1UnL+tjq8HAQcE9DoVw2ujmxYwPDo+VUBc2otYrTEj5Zf9bHPVH7rZEsksA/JftQAJK56Eg7TYsZ+tWPMJ+Gew00NPd7qbYv4Z31SdI4afQpaxqh8gi0fhwdNUateaI8ub0V2s5CfEN9q+aX//1szrVtbUD77TNrRaIT/zGJU2N5htjofBVcZl0gvWBnEf1E+6k/oviXus6kc3fLh9EpOwoaxPaPT77OoOJno48xLGDAjPqZFycyXTn2hxnWWpnGi+fDrsMZULDNMXcmcgEdOyak1FVIhzKaLBy0uY5dILcvL0abkbMBfUHH8xH5R9M9FBc1exiTSk/CclFmTHUBcT0/cbTMh3KPRFb/FZ0N2+m+plJaQLd9Li7PHkswj1TT6E1mINf1dAiqPljSpWGuzHAnUa79DoG0I/EPB0WTRP/u3oTvr0slAD6DA1b95Uy6aAPhtzvkv88ZPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(136003)(366004)(346002)(376002)(396003)(451199021)(7416002)(8676002)(54906003)(36756003)(2906002)(4744005)(86362001)(66574015)(186003)(6506007)(6512007)(2616005)(478600001)(41300700001)(8936002)(83380400001)(6666004)(6486002)(4326008)(66476007)(66556008)(6916009)(38100700002)(316002)(66946007)(5660300002)(44832011)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZXZUhhb0lEUEhpMlUzSm1BenR3NmdKd1JRMlIvRzN5MGFYYTY2RVBMWnRs?=
 =?utf-8?B?VU1IT2svZVJLWmdtZmNXVWFXV2NlVis4aWVpVk9xMHdudEEyK0dsb2c2VkRa?=
 =?utf-8?B?ak50WjkrRTRZUWtRZFRoRWo1RGlmdHFpYlgrMkI1N09UZVdUZjZrU09qQzNJ?=
 =?utf-8?B?VGpDbE1SVm44aE1kcnovY0h3Z09NNldQTHNJaktrOEM0VHAvc0JJbEl6UTds?=
 =?utf-8?B?NDR1bVNjWFNuNWtPaTRYMXdSOXhuMUIwVmdmQm5BMThocW9KYkcvTXNhcGRO?=
 =?utf-8?B?Nmc4akdxK1RjN3BVTURPS0hoV3R3aVRCY0lIK2xONlpoblo4VndGMEZ0SnE4?=
 =?utf-8?B?M05NcGVnK3V0Y1ZPYmxkOVBGMVZ0U1pmeG1VUERQVEM0WGpLUXlhZU5jbTkr?=
 =?utf-8?B?bTVzZW1QY1hSbFV6QW4vMUk2M2JSOUZkWmR1OHIwSmV3Uk5YUFJVa0p3eVFH?=
 =?utf-8?B?YWZueEJXSnRPejRaU29jY08wN2MzWDBGM1RKc0NGNU8yRjFNdGJwQnZ0czRY?=
 =?utf-8?B?aGpUZ0VDQ293Vm1QWGNQeEN1MVhJTHE0YThqTzlpZm5WODlad0NOem9ZV0Yr?=
 =?utf-8?B?ZUNBaDhkRWI5bDRTM3ZiNm9PMzlFNUgySnVTQVBRT21CS3B2aEduQnlEd3B3?=
 =?utf-8?B?bVNwZGdid1FiQnBBczVZVHJ3MnprZGJsVC9HdkgvVFR5UW1iUER3OWpPbnQ2?=
 =?utf-8?B?azVNYi9kYWw1M0lnUVVleW1WcTFsV3luSGdpSFlEQlNRaWw3ZGhzcTZmZlli?=
 =?utf-8?B?MjZSSHVERlVJNzZzZGV6alhUU1MwNUJtRkJKS2tMeFRiazdLWVJzWG1LZHcr?=
 =?utf-8?B?RmZxZFBoaHdYRmlXZFJvalN5TVpGWUVDZzlGSlBSUFpub2VVbDV2b0VMNzBq?=
 =?utf-8?B?QmlBYnFQNzJWZzdMMFcra0wrSFZrUG5ZV3d5ZW1GVTA1OHNNL05FL3hhVnlN?=
 =?utf-8?B?ZkFDZDhFc0NuQjJHUHd2UzhOcVFzQXVrc3pNRlRvbTF2cVA1cWtsM0VIZ0ZQ?=
 =?utf-8?B?VUszM1ArS0g1L1pJU1ZNVEVBeFdKNGpqbFdwbFFWY2xqbUVFYTRUS0tSeW13?=
 =?utf-8?B?YWpaYkY0eEtUaHA1MWszR3A2eEE2VnZrMy9OanFFazFSSlVnWmxsQkVndVZh?=
 =?utf-8?B?cGZScUtyTEFhZHdaaXpyMzkveStod05YNG5nL2Y5MTVSMkovTWxWL1FSUXQy?=
 =?utf-8?B?WUZodm5mNHRwLzY4dWE1aUE2YWNtU09EUjJXUnBPamZkMEc3cUNYM1d5cHZR?=
 =?utf-8?B?cG9kWGRmREg3RjRTdTNVTStNK1VyN3ozMVNjakhRNG5qNmdmZ3dYSjFNaUpN?=
 =?utf-8?B?Yys4YUEwc2JCUWdYMzQxRTBxM0lPUXdYdWk4ZTJjcC8rZytZODN2QWdKOWY3?=
 =?utf-8?B?YUpzY2E2aXRWUHVzYjY3QXkrUDBrWmF2MVJUaFBxU1VUdHFpUTJrRkFyaUU5?=
 =?utf-8?B?bnZFZHl2MWJWdWpTNzNTMnJaQnJtYWtsMzJFUmE1SStSQ1JYd0NjZ1ZCazdi?=
 =?utf-8?B?TUp2Y3NpUldKQVkxNWVqMFlIWkNuSG4wRmRRUE9oZGlkdUtHRHhWWXlKaHhQ?=
 =?utf-8?B?SjFiLzNib0Q4RndlWHdaRjBWTUpjbHNxSjZVeUZyeTg4dWJtdnNiR0hkQkEr?=
 =?utf-8?B?YjdFb0tyUmE2U3NiRTlINHM5cm1sb1BUcng4OTlNUCt6NERNRDRFQUZMUFBw?=
 =?utf-8?B?aC81SWI4cFBQc1E5YzFUaFZmR2d0aTEyNUwxbElBMlppUDdYV3lEMDlnY3pu?=
 =?utf-8?B?WWZ1bitZcHBkaXpySGYzVGVXcHhGMFFYNFNmVlE3QXdna09LUUl0c003QlFm?=
 =?utf-8?B?ZTBrM0t4eURvcE1YY1dxWHFiK3JWNThzR3cwSVYyR1ZsaHltL3FRVVRKNEdZ?=
 =?utf-8?B?TUNxNktPYTBHdm0xbFBjWERuNWM0TnZzZHBJdWl1N2NHTm12Nm8zZXdobXpL?=
 =?utf-8?B?ajQ2QUdUSHd1SDhmeWVRd2hmdWdLWGpkc0JpYzBQeEUzMmdLSThzSS9aOGlK?=
 =?utf-8?B?ZFU2dzhFS0NmS1IvR09CQko2QWtBdlViTStxcWNmOW5ybnBWMmxjbXhZNWZw?=
 =?utf-8?B?RlNBSU5FbGFKRmRGa3hJSC9yM3RWSEVWR3hXQW9WU08rNll4dlhnQUl1YjZY?=
 =?utf-8?B?SWJ4SGFUaGZIS3pwSmV6VUkySzJZbkY1NGNyNXN6SFFPZCtoK2lwY0dIM2V1?=
 =?utf-8?B?MVhmRWpaYXg3T0ZNa3VjM29wa2NDbVpBRGx0SXVzd01ZbjAzSHYydWhBYytr?=
 =?utf-8?B?aXNHeVBDOHJDUkhGYVY1cm5hd3hRPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a30e948-5109-40f9-6024-08db726669c0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 14:47:21.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2qwUjYL1TeMHCrT60FSn79MAKGph33PKoXe8jc4zCVCNW1rhwP4u03gkK5pSskVvfY5tUMbxSMhDUXaMtmuXZOLU6M0TduMk/s92arh2yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_074729_099528_A166F6F1 
X-CRM114-Status: GOOD (  10.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMDQ6NDY6MjJQTSArMDMwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cj4gRG9uJ3QgYXNzdW1lIHRoYXQgb25seSB0aGUgZHJpdmVyIHdvdWxkIGJlIGFjY2Vz
c2luZyBMTktDVEwuIEFTUE0KPiBwb2xpY3kgY2hhbmdlcyBjYW4gdHJpZ2dlciB3cml0ZSB0byBM
TktDVEwgb3V0c2lkZSBvZiBkcml2ZXIncyBjb250cm9sLgo+IAo+IFVzZSBSTVcgY2FwYWJpbGl0
eSBhY2Nlc3NvcnMgd2hpY2ggZG8gcHJvcGVyIGxvY2tpbmcgdG8gYXZvaWQgbG9zaW5nCj4gY29u
Y3VycmVudCB1cGRhdGVzIHRvIHRoZSByZWdpc3RlciB2YWx1ZS4gT24gcmVzdG9yZSwgY2xlYXIg
dGhlIEFTUE1DCj4gZmllbGQgcHJvcGVybHkuCj4gCj4gRml4ZXM6IGU5NjAzZjRiZGNjMCAoImF0
aDExazogcGNpOiBkaXNhYmxlIEFTUE0gTDBzTHMgYmVmb3JlIGRvd25sb2FkaW5nIGZpcm13YXJl
IikKPiBTdWdnZXN0ZWQtYnk6IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVyLmRlPgo+IFNpZ25l
ZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4K
PiBBY2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4KPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+IC0tLQo+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3Bj
aS5jIHwgMTAgKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8c2ltb24uaG9ybWFuQGNv
cmlnaW5lLmNvbT4KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEx
awo=
