Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21E8C4345F
	for <ath11k@archiver.kernel.org>; Wed, 17 Apr 2024 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12qw92P+ehRKXuD7DKx5NDPUrqqCZSP9T48NEs2j/4g=; b=zBG0K3IWHy6YYPdUZY8Cj08AN6
	x1Zm0hte7PTBeV0+aCM0z3XBepin63Ecq9+JUK88gajQwgadOwY0TyJMAAFlthcnyYZP0AOoTVNd1
	kXP5NvPHwiuptDvqgYKBUJ685FMqG3/KRVhd4+4IibRadBl2QMI57irjxQstHA+y2JUMI8TWR6gAw
	NCf+3+iHekNRoeoimh2afg2mjf3OYZu7iRwQrDs4WsOOj+b5zjBqXZ19NQ6yKaz0oeXDW3pA377ok
	DhqjMLMR4M8QwqBGHGWiDScw+AIYkkJTpctXCIh2Y5CZSFQHqAwbRXJyb+99+41dURdKgknhTNHAY
	3oWoj2xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3Kg-0000000FlLz-0fgW;
	Wed, 17 Apr 2024 11:20:06 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3Kb-0000000FlJw-3gQo;
	Wed, 17 Apr 2024 11:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713352802; x=1744888802;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mbE7t7Vdct0OK9ENrs75LkNaLW80Fgs3+9C8FQ1U9DI=;
  b=lFHIfxqNAPv4KnAkGT7Q7LqXv6AiU0mn98Y1vOXNYg0Nv4AvCvTl7vOD
   bfEzsJqAnQEJVTHv7Mcmqqy5JCNY0CvHMhAuhQVzeESTElfbwtQ+yIpyJ
   cthXWLKCqu279aTGD0Y0mQrOf6CKLfM1LOEzRHx1PDNsDlmCGN5T5yRDZ
   LFfcHMWfkKEWo+6NC7Dm4X7JIr+M4k4aCsE5MW0hXIYyB798/JGzJdNEP
   vz5xvd7/vjTNNbp1z7+HKGaTwbfEuQAo4DuBa7s7jcZCpTPPDPsRP/5XY
   Rsa5ZqeFUeiqUy7vu/m5Oiig8tc0M/qh71tabjZiouqeAvGPjLpaWsnt1
   w==;
X-CSE-ConnectionGUID: qYZiaORdSneu7nluswJ/sA==
X-CSE-MsgGUID: zH9zCwhnTtOSYhyS8HrhPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12622236"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="12622236"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 04:19:17 -0700
X-CSE-ConnectionGUID: vGXt9ejqTnmjOOsBTk4QDg==
X-CSE-MsgGUID: 0KAmsj/+Qe2dgtTm2y+vyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="53544596"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Apr 2024 04:19:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 04:19:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 04:19:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 04:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nt8FW8PLh/jka9mcK3/kbBnm+VEmRG/G9gCC8Rdcyb0IKAwDtjZ4Ll1Ve9xPGmIeQKa5z5tpnm4li9Y856pVsQDtBn9Zvsg9oumt2juHwGM6PDUpm1sI70q9O6TBW7ADRBAXNgjaL6k9fvpUt1VE5o5qJHKZjSYNUgejwbI4WPLJP5QwKaY0y2W1fJTrlFBj9srtBj3B/m283HYDj0zyLo5OMhwk9sYDuUQij/AdBRPZ9PZTWAti/s/b9vC216swy5PzblrLJNR+A9GdR2s0YRE8dyZNWDHmwOCWi4k8dKPjFFJu+kaUNl8WLJ+SxiHTZvqncN5VRm6u0UcgO6RTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12qw92P+ehRKXuD7DKx5NDPUrqqCZSP9T48NEs2j/4g=;
 b=fRD52oXXK/7mSZr8QuhZwgGBTlDYOAQ7SkQaM5dFloiB4FWVHdlsPJxfZve7MUcH8/vCS3syMymtdYVabp2lgOenVoAwhEMEPLzmZLh5wWlp7c4viqaVY69g4S+za9fdgHj02eFq7MquhDv5O1GG9CwWcq/J3NCVzJNnFfbJLtK521JxsYN2CJUpQMHT1h6o8LNdDST9GqFUaJQYB0f7PDTim25HqBSXy9/xSs2GgTDgzUgTiXa66UjWp2JoOGY/BWQu3NCtz9xGDP9YKVEBnuDbPg6w3AF6o4Mkj/OgcK6Tfmd3RDA8ZeIlJJ+ahGyos38z/5uw9ZQuejhmYcf3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 11:19:15 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::654c:d66a:ec8e:45e9]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::654c:d66a:ec8e:45e9%6]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 11:19:15 +0000
Message-ID: <d4991f11-a527-429d-b71f-d4ca3a18f501@intel.com>
Date: Wed, 17 Apr 2024 13:19:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 03/10] net: create a dummy net_device
 allocator
To: Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski
	<kuba@kernel.org>, Breno Leitao <leitao@debian.org>
CC: <davem@davemloft.net>, <pabeni@redhat.com>, <edumazet@google.com>,
	<elder@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <nbd@nbd.name>,
	<sean.wang@mediatek.com>, <Mark-MC.Lee@mediatek.com>, <lorenzo@kernel.org>,
	<taras.chornyi@plvision.eu>, <ath11k@lists.infradead.org>,
	<ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<geomatsi@gmail.com>, <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>,
	<leon@kernel.org>, <dennis.dalessandro@cornelisnetworks.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<bpf@vger.kernel.org>, <idosch@idosch.org>, Ido Schimmel <idosch@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
References: <20240411135952.1096696-1-leitao@debian.org>
 <20240411135952.1096696-4-leitao@debian.org>
 <20240412191626.2e9bfb4a@kernel.org>
 <ebe80c29-4884-488d-ab83-c020f9c3bc81@intel.com>
 <e0d5741ee053c11fe078fc8afe6cf4a92e274095.camel@sipsolutions.net>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <e0d5741ee053c11fe078fc8afe6cf4a92e274095.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0001.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::8)
 To DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 609aa0a5-3855-47e5-1709-08dc5ed036c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Awf46Ez1vT7UOAHRKgIzivW8Hk1Fd+bjpS3a6FGZv1cFjlGne/PQNfiTyhs0X8Rgr0sgtU1fAXlrtbpkRclS5DfaKOaoS98BZUpIMe9+qEDfm2+J7W84MxoHSywhZXMYi+4vMW+XA8XUOP4WTDtkxlGUj9nvzu26QHXpuNEGzCPaoGRHM87GdV5PwYO9wo78/0ncqRBWt2/QaQOSW5Oy4Nk9kfw3J9T0x5VLfoJhdvQ1vtcKZaE5/FcmpGZ/Ye/KdgeQjsv4hlWDbfpqvzm3sz+gGLRPtqgNy6hCVx+GO6RUHotxPT5ih3UJcoDaXXoNvvSQVxXUHIWRdCOuhnV+XS6T/WH0OI6dq1343JgZRJQPpuc/BOOD+Ta0EZnVtzTjbTRMkwVu3QDlyM1KoBmPGSIAYUTPYYejLReI67sFAbu38E3FYXp+rbHL8+oY+oGkG6bDNN0onwbfCKIXt9ecX0yEJgnDsrmT7345ano5WLZBdW8Hz5cIIw6QYmWseOomY77P+MioaUMAPzpyvAWSm7ogjR8hzA+dr+qq90VVHXhHaac929b/x/R4/JGhtztrv2kyyoGgK3UwTQ2rvUpGmxf+PUecqdQkQADdLnfXloUAhGO6KwW3phC7OVMWnGapT53GlkvB/HUf5vLAXo7QPS7+wZtrOdz1NzcUSMBYEA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akIvZmNDRElYc1VuL1RqZk55UlVRL2NZS2M1aFF1enh6WVZvMk13ZWNnLzZl?=
 =?utf-8?B?eDd4bU5IbU1YbnlCTTl4dE5xLytLUmZvZ0JhQkY0c2tNTmlEVW9yNW9zYnBM?=
 =?utf-8?B?NDZ5ZllmdlVwRDB1TEIxK2JRd1EycVU3Q0FXMEhwMEl3OTkrVnh5Tm91d3do?=
 =?utf-8?B?SnZUQ0ptcWFybmhyOWpvZFdqYWhQRkR1NU5VZ3N0bzRoMTFIWDlsWktBRDhz?=
 =?utf-8?B?REZTYXNiZlMrOUM5bElXTjNmQ2ZoWkkvaHQ5M0FOcS9BdldTeVl6VXFCVGg4?=
 =?utf-8?B?VGZCWWNRdGNkVEZsNWt5TTErRzd1SjVVVTR1STlUbFlvQ2htQWhsRVlwYVpv?=
 =?utf-8?B?NlNqRXpYc29aaWVraFJxRXhsUThHWndPKysvQ1JNSkFLWGdxd2VWdktsZGRi?=
 =?utf-8?B?WFlIamZRb09VVy9tanJaV3BsZWZGSTFocVlKanNKWkc5SFg1R2RXUW1EWDMr?=
 =?utf-8?B?M2dVUWJHdERocVJnRVNtbEQwNTlwZTlGQkFZOEVYZXJRMjRFK0c1N2xKdTN4?=
 =?utf-8?B?amlnV2thMjVueHZPbWxpREdzZFQyeDdzZUx6cCtGR3orb1hIa3h5dWNBeGRs?=
 =?utf-8?B?V2MrRExFbDREU3pEZWxPdTh3UEJNcC82YUhIYkN2UHNwSXF4NGZ0TDJ3SUNk?=
 =?utf-8?B?WGdXelU1azVmbk1pbk9zTUMzeHZLd08wUVhTVFBjNjA4bGkrNzYxMDZseWZw?=
 =?utf-8?B?LzFEYlNuTDlvdzZCRXVEcUhYejhuRE5kQWJGblc3cThxMS9WVVE3RHdvd0tx?=
 =?utf-8?B?SWhUQWsyOUdYQ2dxbGxXVG1ETXcra2NpNW4xcEtXdnFocXZuV3U2cVYvZmdX?=
 =?utf-8?B?eWVKRzhGZ1Q3bERaMEE4QmFNd2Y2b1NYSHVmclF3TnJLVXV1Y3UwcStnRE05?=
 =?utf-8?B?bkhQWDR5UUZUaHd6Mi9RTnAySG9pWm83dmpzbUpkN1NpV3lTV1lCWjlSOGdi?=
 =?utf-8?B?TFcxVGZzUHd5OXFDMVJyRmJKSkthNWsxT3FERmJXakthalRrWnJtNjN1cC82?=
 =?utf-8?B?cFdYMmVOWHhUK1c5dXdvdjJvMy8ybktoaEdQYjlCd2p0OUNNR2hXcCthWExv?=
 =?utf-8?B?emRvZGtldnhzZFRzd21rcjg5KzYvM3p1SFRoTHVqaHpMZ1E4NExzV1U5dURN?=
 =?utf-8?B?cURzT2dneUZmL09qWlF3R2FXNnVDTUpoUEZpcDlhODNid1hsWllOR2p1Rzkv?=
 =?utf-8?B?N1U4cERQbkgrVCtvU09nV0pFZU5vRDNqTlpwWDlmbXVXZGprakRVK2ZCNy9v?=
 =?utf-8?B?V1BVR1pzWTdhTk5RMjhhUWQwM2h1UnhCVXFacm5OSWlUeFRPbEdXamNraHJh?=
 =?utf-8?B?YnJnZUpUbHZCemlrS0IwczVZcmhVUm9aYXRwdjJOeXY2VzZqUGpOb3RwYkUr?=
 =?utf-8?B?TkdXcEkrN3owSjZjZXJQNjNOWFZRTnFFTm8yMk5nTlFhcmlVT1gweVRLZC9v?=
 =?utf-8?B?d0VVSkZITVI0SDJzb0RkVjd6c2k1M0lGRGR0NEladkxqOW1jTVlaY29rRGE2?=
 =?utf-8?B?T3BhTmR0TlEwSklBbXBjdkM1WW16UXVBRmFTUkl4OTg5RGtrV2JrSTk4MlE5?=
 =?utf-8?B?RUdGY3M2aFBEdmlWbnFtazNDdWNvaW5MOXBKcmZTYlhOR29uRG9MMjhpSlVa?=
 =?utf-8?B?K0NCOHhxREw4VDNWOWQwYk1Ic1p3a1h4ZDR3RmRVc0RCeExVSmtkcjRiZVQ1?=
 =?utf-8?B?WThlOVo2Z2V5Zi9JRW9RZjBWU2ZDZlhnRHgxR3dNc1dzWFROdTNqTlM1WURk?=
 =?utf-8?B?Y3pycFhFS3BCLzgyWTBhVFVueEpFb2hSbi8yWkI0NTNlVmhMUHBRTHRPV1ll?=
 =?utf-8?B?Q0RnaExvWVlGbDRLZDNzSkFTV2Z5V3ZDc2Y1MlUrSGFlamthb0ZkWEU2UUZU?=
 =?utf-8?B?L1gwbU5UMmdQU0x2RkQ3Vml4eHp6cks1dFFOMmRxUzZYNm1qMCthYWF0TUpH?=
 =?utf-8?B?YlU0YUFqM2dUYmxIVnlUUHZybmdxZXBMejhUNVJhQUtQTStWSUJGNUY2cytP?=
 =?utf-8?B?QW5JbUxZdjhKcnhGMC9CcmRYNDhLa2tPSlZwSy85em9sb0pNZ1ZTOXFOQVhk?=
 =?utf-8?B?U1hMMXd6eStGVlp3RDJvMmpycHAwdHlrWnVINGpEdTdsUFR2aGNEdkw1eUtu?=
 =?utf-8?B?d3I4ejNBWkJwN011SUJPZUZidUMwRkI5d1MrcEMyRUI0Q3lpd2RqNlBsUTVo?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 609aa0a5-3855-47e5-1709-08dc5ed036c2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 11:19:14.9519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ho/rNch7z9JcYur1XY9KZUlS2nSeZLLJTSNjn5CJfPmukc1x5tm1EKHd7i3LUcgH4OioA6FwRc1AzvkxfA72padJMSqzNeX5hs9OI58hS7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_042002_032791_581AADE7 
X-CRM114-Status: UNSURE (   8.42  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 17 Apr 2024 13:11:38 +0200

> On Wed, 2024-04-17 at 12:51 +0200, Alexander Lobakin wrote:
>> Just FYI: kdoc accepts only this pattern:
>>
>>  * @last_param: blah
>>  *
>>  * Return: blah
>>
>> NOT
>>
>>  * Returns: blah
> 
> Actually, it does accept that, the regex is "returns?". It's just

Hmm, I was sure I had warnings on "Returns:"... Not sure now.

> documented only as "Return" . IMHO it sometimes reads nicer as "Returns"
> depending on how you phrase it, but ...
> 
> johannes

Thanks,
Olek

