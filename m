Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE4CEB64D9
	for <ath11k@archiver.kernel.org>; Thu, 29 Jun 2023 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o2to5KI58EAZTahEShq9eyk5VVJbWYFFY6WvKxigVLs=; b=SX0YnSi2rOB0MF
	Pos+RYyOzTX6odg7+5yf7PIaRQ2I+L4i6bclygMsBxVyXURcPSgAt3SfACl5YT6N82W2Y8KUKxA1j
	ZxcUoDtAoZ4AlYnLZwFhAppxHVYt4N69B8pHYszC3E6qaMCKuAW2wlzuNXH1W7eWGQUq43VWusC2f
	1WstdtQPMq9eBt+t87jwN+EtE67vriCbDdNmlPfR2/0xqU9ZTbx1i5vGWVOWO4NURqK7vBs+w3XzN
	gqQrxpuXiG+qrGtdYnMdekndQg18P2xFDyZXTNyhZ+VaKymArPnWu4WkSRsKSWiuK5Ul74JRWAtLJ
	jghxauQ0kbML2/0UZVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEoII-000cRl-1r;
	Thu, 29 Jun 2023 09:50:30 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEoIE-000cQW-2N
	for ath11k@lists.infradead.org;
	Thu, 29 Jun 2023 09:50:28 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35T4o2Nr017127;
	Thu, 29 Jun 2023 11:50:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	message-id:date:from:to:subject:content-type
	:content-transfer-encoding:mime-version; s=12052020; bh=7Jy2QEBb
	vJNVfggTorvC2KGLemfLoraJ1Y4x7ke4Jsw=; b=Hq8foqL00KpUazfZlYeLq6fQ
	drb9rbzVjlfxtIt8mHTNrk58KINLItIRuGH/jLJRKXfzrv1sjF++sVSy6nkqFoAs
	EKFlfj71hST4ZIuThHWFP8bDGUq4mbQFP2SdDcnz6B0rfCYw4MQMb5GqmQEKrY03
	Xk2infb2EFnldBFmLnvBxt4rKDnGJnMb+sswTHMiZ08SlEOjRRXL5jhJFTo3WBVN
	p9+wd5jKpYpRwonxo2EaMnjQd9gj/7JfvkweXT7XV68Kyuuw0/Y/GyG7QjH2k6Fp
	IP3JnqD2hKH/X63v1POFKAKu8zsf7+Q+m5XjGrLoJj4oQARqOdqXlTh4nyJiNg==
Received: from mail.beijerelectronics.com ([195.67.87.132])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 3rdqd359at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 11:50:07 +0200 (MEST)
Received: from EX01GLOBAL.beijerelectronics.com (10.101.10.25) by
 EX02GLOBAL.beijerelectronics.com (10.101.10.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.34; Thu, 29 Jun 2023 11:50:06 +0200
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.54) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.17 via Frontend Transport; Thu, 29 Jun 2023 11:50:06 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WN7lgi80RMScibLzqXEFsNVcJijJh73cACcgYrCsOgn9Ue1aHpPH/ZBVRE8j1oa9EyOIyNSoYU7QJemqWIUC4CQDjmx4mFSYn8HkW5BC/kMYxl3eyTT5czvn5toAdB9H5l75iCY0GRNfAn5NuKXB0R/TNaLx3/kiir02kiwn04i2xasG1hWHE14wg8KlnYCo2YvvMoQFh/EG/GS75e38gWCpIGWav1/ION9qvSEfxc97ga1JsMB7q+k62WGrLjrka6O3BSm5tukW2QCap3+2dgM4DxhLZnfpm+WTlQLVNmwiQXsvFn46nAuUnK/Fx6/dOBaKbi1DKXJf+s5DE48m1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jy2QEBbvJNVfggTorvC2KGLemfLoraJ1Y4x7ke4Jsw=;
 b=HzSmPt8TQ4Wu/4yC+mKxrDhKHOX/g500KJZRV8mxKXxkM/HpFxxfQdD31GMWCvcvnum7pCtqGEVIpmpU97T9FG8QYUnp/0MZK+MqejkGt10+cmi9UwrGbQmxbrnmmeAdTVfvFjJQiKKjN6XDsuM3Rhx21SgJfGMfWaYQhWU4lFsLUPh1cy9iHgjYM3MLYe6ZjiZD3oEn7UczZ/asBUUQEgHuSg6Ok70kmHIsQNhmSumuuqjKUS6F/U04XT/dGb/NTzvRe68w6o8fQTRHH/YVega4ymjNzKBAfBsUc5Hh4MnQKFUk4VAeJYRznuv2hTpXJJbwpgHyYMpDVZeRKDyDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jy2QEBbvJNVfggTorvC2KGLemfLoraJ1Y4x7ke4Jsw=;
 b=gnWTFOEGmuZxXxEz9Otlm9qV6OJVmJWeyFitYH8VbOVUaaYZU1S/rk8Wc4GFAxmByR5ALLDzGBJBYcUuOasrtnnycTi0UQ1YrdYW+hAng1N4b68kt6jK3O8WOlVNgNJL/0zCWrYBEpjKQ8qYgjx03yyzUCmwhjhgtP9P+Uj185Q=
Received: from VE1P192MB0734.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:16c::15)
 by DB9P192MB1754.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:395::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 09:50:05 +0000
Received: from VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 ([fe80::2b55:6124:7ada:b077]) by VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 ([fe80::2b55:6124:7ada:b077%4]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 09:50:05 +0000
Message-ID: <68290980-5bfb-c88c-be78-954f9591c135@westermo.com>
Date: Thu, 29 Jun 2023 11:50:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
Subject: ath11k: BigEndian platform support?
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:800:16c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P192MB0734:EE_|DB9P192MB1754:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b828fa-2f96-444e-9704-08db78863747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hGm2mAUZZ/yqGTZ9osXvFfPzc7xIiG0rKlPRKpJx9hfU5I7/DJShIHL6Vqz9chZdzLu7rc4uyVsFeqs/qeuB/k7jykps7iAJZSajVHzIJSLi2/LHnl77/Jxi/sZUJJ05Dp2na+JEfyay23n4P5G+He3HLEk/Mh8nlfcDF9h2r6qAvXqfhoaj3+7dX6g49HcT97I3XTDi91eVcTQCRrfeU0IUUGbXs/cKnvpeh8bULrqPIPt9R5DziTL2S/b447+XOAopWE0cZ4VOd4PJHByZ8hh8h38yRISq0iK9GuM+z/67ha8p3vpJBoP1Uh7umf0itF68RWw2VTrGr1XAWw1tr+Ai6N+zVqktNa9FjXGPH1mZ8soFeRXFUqaYdX/1kIK/PZvLaEIvgGI7pt1U4ybg8oYg+MscGjUfIPQqqpabW2Oh3KX0yveRcXp6Tv3useCebzrabOqNsjQwUYFy+M4e3DEi2asFuThQgsGkeF+2VXlrzmOtc6bp70duOxXnewXaaTdxVErMEtvvAy7AsAFe44xNaCZEYlA6Jfy3O/cJLeRSVzZy3mqtpXtZ/x0HVzNSv2cwOeS50TuUFc2MRo7wtjFwQ8zdytzLK+JLKYWSDy0viGoz7/jM25YSY3QPOv9sNcmsNcIwE8x2UF7J4566CQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1P192MB0734.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(451199021)(6512007)(36756003)(41300700001)(478600001)(83380400001)(2616005)(6506007)(186003)(6486002)(26005)(2906002)(66556008)(558084003)(31696002)(5660300002)(44832011)(316002)(38100700002)(8936002)(8676002)(66946007)(66476007)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXk0ZmRuVHR4UGE1cFA5Y0loNGV5VEFsWXZuZ1NDNWxIM2gyTExUM0NmaG5m?=
 =?utf-8?B?RVVESDJyM0Zlb05ySytlTE52RHV5ZjcrVno2RWJzcGdQdit5cDZFYnczSXRz?=
 =?utf-8?B?ZzBEbVZQYkNicDhxWGFXRUc2dmxTNUU2UFBkbk0ydVovRFBzWjkwSVhZalo4?=
 =?utf-8?B?Tlltcnp2QldjNVRyZXVGLytoYXpXek9sQWkwQkx6dk9uYVdNc0FaYmtza0Vm?=
 =?utf-8?B?ZUN3cWhTNVBmVXlnL1ZKQkJPZUtqRURVVld5cUdGUHZCWVo0ZW11WFZ1ZktF?=
 =?utf-8?B?U3gwdVE5dUozTGkxNHA2d0JRN0ZnUElpZmtoVzhSQlhYNEVZeUhrWWxoaVVs?=
 =?utf-8?B?cXJtRWlrUDdBNldabnhqUUlLMkh1S3pPZUZyTnlRdFNyNlNhMTY4clFmNWN3?=
 =?utf-8?B?ZW9hSXY5UDFCVEx0MzBYbHBuY2cvR1E0R05IOEUrMGJ3WXMxMUcvMTVidzVH?=
 =?utf-8?B?b25kK0VnRU5mdzRkR3A5Q1RwaFpEL0lPWHJ2RTU0YjlSOFM0bHM1bHJZc29k?=
 =?utf-8?B?MStwaUNkMFNwOExZL1BNWFJWWEcvZEplMlc2SWVITHFDdElBai9nYktpUUFk?=
 =?utf-8?B?SGZ1TkRuVWFLUHdPOE9aL3RBTzZPWkVWdXFVdkRiakpBTFpLM1JtV05ZejZO?=
 =?utf-8?B?aHhka3F1NEp4RXVuQkRlc0xjLzlaTjYrWGIrNGVqeS8xZERCTHJuL0N2WUxM?=
 =?utf-8?B?cDRFSEVtQjRqZDU4MExTaUVvK3h1Ymo5WlU0U0NPQjd6d2VLTTUwVGJoZnpZ?=
 =?utf-8?B?Y1lQZXBJK1U3a0pObGpnaisxak1ORGgwZVVoYUJza2ErN09kanUwVlBRMUhS?=
 =?utf-8?B?VWt2RldNQ2Q3aUVZTitWMFZUNTNweHBRZStVSU9uekNhUlFtUkxFYmN4MDhC?=
 =?utf-8?B?V0NtY1VYbEtjRkgyMzVpbzJQZGNMTW9hRkppdVRuTXVROTF3VmJ4Tm9aY0t4?=
 =?utf-8?B?MklNSmdJTnhhR1Jnbjhkd1V2OHkvUmxubjR2ZWZXMERlTEFoS1JZSGtHd2Rw?=
 =?utf-8?B?V3dNRVA1UXJiWXA0QkdQVk1HMEJ6M0llS1F4V0N4NVljb2NUTit4V1kvY3NQ?=
 =?utf-8?B?Z1M1V2ZhZmlScGlicmRiMDd2YTg3aXU0T2QxMHZJelNUcXJOZU9OemFuM3FD?=
 =?utf-8?B?SU54dU13Y3dzWFlxZTJsR0p1Vm1idTFGQVFMVkl2Sm04ZWVXOENhUVVwK2ZM?=
 =?utf-8?B?Z1M5bzh5M2ltMGsrT2t1Zmo4WTdBYzJqL2hCbWRlUFg5YlJaeWNQMEVodW1O?=
 =?utf-8?B?WFlla0xUSDdESDVySzNtcGdGT1VIQ2RPYjk5c2NQRk1LNzhrVXltSGFxcnNq?=
 =?utf-8?B?b0RQQXBoTVNRWXZDUk5NVk5sbXJIc1kyYXkrZGhjK0lXWW1Wam01UEZMS1By?=
 =?utf-8?B?a3IxeWZIc2hBNzM1dWJCSnk1ZC9PZ2YxU1RmbWtoR0M4VVB4SWF1VlNxMitT?=
 =?utf-8?B?alpFU2xpK3ZQZ2syZlJrQXVmN3RtemJLRWQ5UjkxNUc5MGE2V1ZTL3J4NGdl?=
 =?utf-8?B?RmczUExobE96VFZKRXBQZG1iYTRxbVllUG1OVFgvZXN6QjZraDR3ZmFyQzZy?=
 =?utf-8?B?Vmo0TDV3Q2xqNjVHWUVvM0hHTzRDMnhwRUlkSjFxdTZjczhCNS9YdklBcktl?=
 =?utf-8?B?d01SSmo1aU1JbSsxVGNQOWlxb2wyZFpwT1pZYUpZT3VZR0psVUVHa1pwOHUy?=
 =?utf-8?B?dWFZdlhoNXo0bHZOS0ttSnc4dWcwWVRQODlOS2JFU2FLcTIrenZKSm9yZTVR?=
 =?utf-8?B?Q0xQdXZ0UDJJOHozRDRsdWMwUHlJaFhvTnk2NEJ2Tnd1VHhBNFNpeUpJamlG?=
 =?utf-8?B?dnh3SE1mMTJ2aDE3V0Z4V0NSdWZhOGlVS01JRUU4L25DdnNtMHhONml5YkZO?=
 =?utf-8?B?akc2eExoSjZRUFhBQUVpZyt4MkloSEFKeTRKdU1YdVByS2xNM1dDSURhVk9U?=
 =?utf-8?B?ZURZMHA2QUVZR3JiNGF1b1UyNmhHT2MyTDV4OGxHbExNRzFWMTRhZzVhUW4v?=
 =?utf-8?B?bkZXSFQ3TEwzZytKS1FCcTFkVXVQTGpNcnFNa0RmNFE1bVFUYVFWTGlLdWN1?=
 =?utf-8?B?cWczcXhjSUlNNThRQkVka2hmNHBwbFNqU0FFMXI0S1lFbjJybHg1cnowQ0lk?=
 =?utf-8?Q?a2lufLfke/VgzLRa6wfaDdfFi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b828fa-2f96-444e-9704-08db78863747
X-MS-Exchange-CrossTenant-AuthSource: VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 09:50:05.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHywLyZUjNIg3KYDBj+NhUtjwFin2x6iLwBXXdqjfRwyOzHqssi5ihbdp/CaPOyxhJ1ffTLqeAA0JdvgtG3ldQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1754
X-OrganizationHeadersPreserved: DB9P192MB1754.EURP192.PROD.OUTLOOK.COM
X-CrossPremisesHeadersPromoted: EX01GLOBAL.beijerelectronics.com
X-CrossPremisesHeadersFiltered: EX01GLOBAL.beijerelectronics.com
X-OriginatorOrg: westermo.com
X-Proofpoint-GUID: NFZeGYqJ26MtYNQ-355WqLOznbYKKWZe
X-Proofpoint-ORIG-GUID: NFZeGYqJ26MtYNQ-355WqLOznbYKKWZe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_025027_457301_9B35D9FF 
X-CRM114-Status: UNSURE (   6.06  )
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

Hi kvalo,


I am trying to get the QCN9074 module to work on a BigEndian PowerPC 
platform. My question would be, has anyone done it yet? If not, what 
kind of effort would you estimate for porting or are there any firmware 
limitations?


Best regards

Alexander Wilhelm


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
