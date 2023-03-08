Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441E2C742A7
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVF9aRSg0J1sxzCpzh6/v0DL9KzqoxXsP5lu10im+Lw=; b=NG0tOiOd6qn1bD
	8rSJKBfHFcJFEly55VB1mZKiqupRHAk8V/eRjLVE6TooEPtGgtHRYypa9eKS7yIsYSrhVfbgCnHcs
	DArBm14Hvg7k+FiH1yFR7VVLCXEx6h1/npiOLuMb2ny/YRuNj2BygpHpQ7JK4S4/+ppiMnVK1cAPK
	APN6p9xitD6gx2Kc4C3p5aulYOY0HNJ9nHUwqyPFpBzQ1dssQ7IDkLLfcLMPhEzo6ezM/4Y1/KiTu
	M4UrR80MwVXBAQVua0QKql6tdkynfJQ2E0L7XnJNqaREtEbKe5Ttp3UABCVdky1rfcCV2HB3F4qZg
	hQyTmK3UgUSIUmvgoCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwS5-005tM9-AS; Wed, 08 Mar 2023 16:15:41 +0000
Received: from mail-mw2nam12on20706.outbound.protection.outlook.com ([2a01:111:f400:fe5a::706] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwS1-005tL3-W9
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 16:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hq+oqvuZ5huzEK4q+jGBcq6LIPRWCrZhCF5VLLIldkUs1CX/1lOypSC1WYL77+F5pgGhmTSbK1ocPsLwfY83ngvloPKW2+4Z2cYmzXQ2vCanasyowu4h2aMkCT2euUM6JWUWYqaCL2ZwwVmPtm9h4+F3D0/LML6HPRUIvfqlz639BRsL7Rs4jJb32ZDif8mpDUKcM09OUZ915ZoitnDxPtKbYLeAQbM3CHJZ0jSBdNn3Cv1S0ksxI9BA4PNEwI0g6McaJ8XHmhmH+qbWslGOUdnJ2g9ejIh0uqcedgeklbQQxMwZ45847MiO1yESmG/2JGlXbeGLPfZA5ovart9Q7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PqcycezzpILHXLFaf/6S8AuTHS4LanQypwizpahlRo=;
 b=MS8Vkcpa82ZQ8HYciGm3/cNSWPNOJIItz6PXi7XzDsAHCzADP+qjE2TSaJOcTp97Zb+sG7LMzHcBUU48+x38OpjgFMRLazhGXM136h6wddb/3i3V9w9/X2Xi6w3b7p3g2vrijVhKbA6fVG7bM1nFb8W+2ItkfeWTS1UXppay6YO7AmGHHaepcxcaH04IR7WHeiImdaZB3vFUs3htdSI2vO+Ya8WoYZOxPXwmbboZi2LFnJi4Rka//7FEPoWp39Ym6ZN/OUcIBV8C2FHlPeBZoeZQ3JIwdrcBe7vibKV/oio65ElBBN0qHVXd0QYu+cf4wYs+R4fim0WVPV5d+S/dhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PqcycezzpILHXLFaf/6S8AuTHS4LanQypwizpahlRo=;
 b=O38GYyLTvGJIj8VL+w1CL66yzI+UQR1kMEK5HBNt6Dj6UUQsiuJOQt+smIGXc2SKJM02nipyTS62t6+bcXYjPF6Zhp7NHKU/hT1SQA0tcHAgWeVNcUyUXENY7z4E4TNIi7Rt1a5IAmhRYdi32xXkwDvrE6AEoG3Him5z/cKkwOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH2PR13MB3895.namprd13.prod.outlook.com (2603:10b6:610:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 16:15:31 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c%2]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 16:15:31 +0000
Date: Wed, 8 Mar 2023 17:15:24 +0100
From: Simon Horman <simon.horman@corigine.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] wifi: ath11k: Replace fake flex-array with
 flexible-array member
Message-ID: <ZAi0nNtWKa8H5xfl@corigine.com>
References: <ZAe5L5DtmsQxzqRH@work>
Content-Disposition: inline
In-Reply-To: <ZAe5L5DtmsQxzqRH@work>
X-ClientProxiedBy: AM0PR02CA0174.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::11) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH2PR13MB3895:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da0c463-02b0-43c4-d39c-08db1ff056e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/mIqhD2wHzFpWcsq/f28eUeK5lWxbpgHR/mSDtGR490RLCQqLznQjku/pQjxQk+ryTX5d2pu6ZbRMpjuLaz4VtrnHO0ZLdWfq2rOP3YZtl3kgJhAVW9Ofwci3jC0qGPw/TBiT04qbZ7UBzzH5vo7TAlwtUeeGS5H18EGuOcOIjR4O6o6/2ETM1XmKXIvJuBxpMHMbk/N+zYFJtJvCnKo5YpK2/phf/TQeqxrIELxMUHTMVq3Cv9/TM7FiPt+ZefdWO8atKtLPYQRSXihyZ/KZ4By5d3g+iZjRSdyVDU00NSx6A+9jSdcEKAODD0YMxO8qj/3ApqjCUFcXYBDsHxtPBYB1IE33kUav69/QukXVXWX9kJR+RUhNrNPnL/2YGt4KBiNVjoVFjaW87/XsWlRZbfnvJOJ//Ogb3oqfKBsRQLowQt0CW7GtVtZdJAZwEn8VUbDMJuSuOhbyRgIVl8GA24NzFXgwRsnTG4pVJXkvDWPVfKkJnweAvQA0cok5P8hBx99uNQcp6YbxwVUOHmLAMODLNrVuIOi96KAruc4qq9GOaNoXVoWKd27j0oeCoz4dwdSQ0QXP4V75xZS3se5JnnDRhBtkdI34PP85/QtWkGBU6Cc37rHeo8P36B010twq5njRKqWSNTqmqk6TP7aIKIVxbdqQl9Qn4VVqMlm3bM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39840400004)(376002)(346002)(396003)(451199018)(5660300002)(8676002)(4326008)(36756003)(44832011)(8936002)(6916009)(6666004)(6506007)(41300700001)(4744005)(66946007)(2906002)(86362001)(38100700002)(66556008)(66476007)(7416002)(6486002)(966005)(54906003)(6512007)(478600001)(316002)(83380400001)(186003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Wm1TRDZWNy9zeUpkbDh1eEUrUnF0dDdTVVdvL0dEREIrY2JNRmZDS1htOTZt?=
 =?utf-8?B?NDlSR2tJRGNNRS9MazJMcVA5S0J4QnM3SVl2WjQ4RTJVYVpJQlhqdGZuSXpE?=
 =?utf-8?B?WDY0aW4xUElET3ljdUxpU2JyN3p3QkhvVDlxZFY2SkU5TW1pMmwySUtSMDZt?=
 =?utf-8?B?Y1V5c0k2eVlrL0liV2ZvclhZMWVyUEd5cGhoTmVRaTQvZWNvUWYxZ1NoUHll?=
 =?utf-8?B?Vk03SWtheFBnWmxsazMybkJNZHl0ekN2eVJsWDJBeHF2YUc0YzNEWGRYTVkr?=
 =?utf-8?B?aE5veUxtUW1HV1VDTE52NWJNNXpqWjkyWm1rTWRoQ2M3ZXU5THl6NXBDVWJD?=
 =?utf-8?B?UlJ3MWsySzZqK3d6YXdkTEI5RFJRZVhuc2phcFBndlBSU0ZwUXNneTlFTHJu?=
 =?utf-8?B?MXdTV0dLOUFUc2RCVzY0QjFodWxSZll4Q01GOGRicUtQWm5tNnpjN0NodVVO?=
 =?utf-8?B?NWVmLytDYVJKbi9mMzJlOTB5dkdtRnVZcjZ6QzlLbDdEejFpdGZZb0dtTHdM?=
 =?utf-8?B?REVMMFZlY2hIbHBOUWJyelBkbGZBU2EwSUF1Q3crclVWemtjWFhmM21tVDdo?=
 =?utf-8?B?cWVsMTdpK1NsOCs4SU5IMEZoS0NHNjJPYmVjb3VvM1RzS0xobEtsQUNEYzhB?=
 =?utf-8?B?Y0JNZU53MUZuN0lmaXJIMFFnTUtuc29FOW1KblJNNmRTZUdUVncrbE51RkZ5?=
 =?utf-8?B?Ykp0N2dRVUhiVHlFQ3M1eW1ma3ozZTBjME13N3k5RGxUcnFRR0J0UjZnbSsz?=
 =?utf-8?B?QjZ3TVQ1aTlyTUI4R3oxTU92QU03VHVLN24rZnRpTURWMERpRnVCdDdMTm92?=
 =?utf-8?B?Q2UrMDVNbkdYRmxKMCtvTmUzRmk3MjlNTHQvMHRkVUhwS0ZzU1NVQ2NyUlRo?=
 =?utf-8?B?ZTJrUFRnZVZXd1orZVBaMlRxekpMbGNyL3NQMWVBS2d5bGcyMXRWdWpsVzN2?=
 =?utf-8?B?QUdJc3djNDRCV3NNd0RrZWVJaFlscGJsOTBHZnFXd0RKa1B0ZDZvY2g2QUJ1?=
 =?utf-8?B?UkhFOER2eDVWTmxvMy9Xc2RlcHRjUkJ4R3dIZXRYZkhFZDB3YW9GMEZUQTVu?=
 =?utf-8?B?djVacVBOQ1d1WXRISVlQcUUxRXNrdXhONVF6WkdjeWJVNE5reDZxTm5FcDZR?=
 =?utf-8?B?UFZrOEtFelJCenM1a0lXRWxSNzA4Ujc1dTNORmM1K0gydHNYczd3TU9xa0o2?=
 =?utf-8?B?OGJjZ3dRS0xwMXhLY0NWUTVvVTJIVVpBQ0RFVDQyMnRHeEhSZWdsbWdJdzU5?=
 =?utf-8?B?YmtrdFdMVi8zVDdJL28rc1JZYUphNnEvcmx3cFlrakZJUXJTdUdsSGFGWG5V?=
 =?utf-8?B?dU1UN3lGWCtjN0tSaU1GRk1BeTk1K1RYbjk4MEUzOW5GcEh6YkcvNkxyR29l?=
 =?utf-8?B?SmYraXhZV21ubk1UaWw4aWN1ZWRTTGVhSktmMmFhV2Q0Y1RQNzNZRHlrdktq?=
 =?utf-8?B?NThuMHVQY1h3Yk1CWFMyaW1CcFhld2J1VnJhRlYwQzNvRVJtRWNEWUFiYTF1?=
 =?utf-8?B?UW5KYXdVdnVLVFpKNVVEM20zQ2JzTGJoS1ZpR1dNalNlcHBFQzkwUy9kTzdO?=
 =?utf-8?B?R1RGOGlnMXJ5OVhvYUlxTXdXMWtHQ3pmOS9FNHFsL1hCQkNxbmY0WTdlYy9Y?=
 =?utf-8?B?WS9BOU9qSjBTdEU0bU1DNjVvaE5vVkdOVDBJUzFFM3k5d1ZvS09DRm14bXlO?=
 =?utf-8?B?MHN4VnltVzc3VWNkZ0tpS0ZCZWNMNjdEKzRKQ0tTbjllNS9TR1NiYzBmL2pW?=
 =?utf-8?B?WXJWL2xOZDVZV3ZBeDlWOUVrRVEyekxPdlhUUXZwY1pyMzdrckV4QnFhRVFy?=
 =?utf-8?B?akp5YktPZk1ObU0xNFl4S1hmdEhyYUQ2VzhzR0F2Q3pRSEMrdmE5a1RwOE5X?=
 =?utf-8?B?NG9PaFZDQTFSdXNDWVNjZnc1ZUE4bVh4NFQxV1NxZm8zQUxKS3FHL1Z4cTBX?=
 =?utf-8?B?ZUNtMHRKbmJ3WlgvbFBGSGJnL09oajgwa3ZpWWZHc2NlN0R4Y2J0bHM5YzI5?=
 =?utf-8?B?V2pUVmdqMC9VUlFIR2RqaHczaC9NVE5jbnd2L0pYcnNxWWR1RU9ianluUmVD?=
 =?utf-8?B?QkE3UUJrWkVIeXI3aFRQYlVnMlBvYUJoYVhhOU1wbDVLY1RtQm9GZkVodi9z?=
 =?utf-8?B?eGdJZjc2TTBoNkFWb1F5eUFvcnhpMklvMktiZkY1MndKQ0ErYy85WlhvWmY4?=
 =?utf-8?B?ZXhITUVhOHk3ZVVLVzA4Nld5NWF6ZzBNT1d3UCtyZTl3cXA5Mm92SHljM0tu?=
 =?utf-8?B?bUpSQU9rUkQyWCttRUJZc0EzcGl3PT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da0c463-02b0-43c4-d39c-08db1ff056e0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 16:15:31.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fu6kRQCXsZ5aAdz1sddOOHqp5DwmWO4jINeFzmyD2QzuQjzWXMh52sZ4WIWHS0PxcSm0YBymuGfme7NhH9HNLif0iVj4v9fHg4o07gjiIPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_081538_280480_CC45DEBF 
X-CRM114-Status: UNSURE (   7.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMDcsIDIwMjMgYXQgMDQ6MjI6MzlQTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBaZXJvLWxlbmd0aCBhcnJheXMgYXMgZmFrZSBmbGV4aWJsZSBhcnJheXMg
YXJlIGRlcHJlY2F0ZWQgYW5kIHdlIGFyZQo+IG1vdmluZyB0b3dhcmRzIGFkb3B0aW5nIEM5OSBm
bGV4aWJsZS1hcnJheSBtZW1iZXJzIGluc3RlYWQuCj4gCj4gQWRkcmVzcyAyNSBvZiB0aGUgZm9s
bG93aW5nIHdhcm5pbmdzIGZvdW5kIHdpdGggR0NDLTEzIGFuZAo+IC1mc3RyaWN0LWZsZXgtYXJy
YXlzPTMgZW5hYmxlZDoKPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2RlYnVnZnNf
aHR0X3N0YXRzLmM6MzA6NTE6IHdhcm5pbmc6IGFycmF5IHN1YnNjcmlwdCA8dW5rbm93bj4gaXMg
b3V0c2lkZSBhcnJheSBib3VuZHMgb2Yg4oCYY29uc3QgdTMyWzBd4oCZIHtha2Eg4oCYY29uc3Qg
dW5zaWduZWQgaW50W13igJl9IFstV2FycmF5LWJvdW5kcz1dCj4gCj4gVGhpcyBoZWxwcyB3aXRo
IHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gdGlnaHRlbiB0aGUgRk9SVElGWV9TT1VSQ0UKPiByb3V0
aW5lcyBvbiBtZW1jcHkoKSBhbmQgaGVscCB1cyBtYWtlIHByb2dyZXNzIHRvd2FyZHMgZ2xvYmFs
bHkKPiBlbmFibGluZyAtZnN0cmljdC1mbGV4LWFycmF5cz0zIFsxXS4KPiAKPiBMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvMjEKPiBMaW5rOiBodHRwczovL2dpdGh1
Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvMjY2Cj4gTGluazogaHR0cHM6Ly9nY2MuZ251Lm9yZy9w
aXBlcm1haWwvZ2NjLXBhdGNoZXMvMjAyMi1PY3RvYmVyLzYwMjkwMi5odG1sIFsxXQo+IFNpZ25l
ZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KClJl
dmlld2VkLWJ5OiBTaW1vbiBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+CgoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
