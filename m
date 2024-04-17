Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DDAC04FF9
	for <ath11k@archiver.kernel.org>; Wed, 17 Apr 2024 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9Mvm2yerUHplXHw/kjYOLBj8wSB3MUEFmc2wqRvQe4=; b=gbhS3WWPm99GqO6GQCIvghbi0y
	3i1EJ0hSWuUjBNvAHFo3+/be36uz83XS9rSB9xk2oFzVs+JMSTN8eTTCaZhXDtFWvfFG4eEfrl8Wd
	uzBInUrTtgsgQOKGriDFgoWmSxBh+Ats6sHnHUL4I6x0F/txOTxPo08/aXCK9gjrOpZffqc0eRsTG
	OTPhjbGZi+T6ZqtvW9DoFF6v7OXIbqIu4diWTR9wo4nzSbz4jKakqOtjymosG8iOusCDlBpFhy5zj
	ki7t5jPMeelos0lQvj4W1wHyK6WtR1C/LpH9whyrEpABiBz9bqN7WZzu/lJMjHEfm+cVbckSrfoFN
	EWPM4lZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2t2-0000000Fg5m-2bP2;
	Wed, 17 Apr 2024 10:51:32 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2sy-0000000Fg4o-2B5i;
	Wed, 17 Apr 2024 10:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713351089; x=1744887089;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ia7MXYsd1uJPiWmFQWjfpzBjxLTOCLJNWjZznaC21b8=;
  b=cBEIdEkpE7bdwdyzl9CIAJIPtq1s9/q22KeJ83wbkw9+mVtsFNx7hgUI
   6+52InW5F8myLR6trnsHtKMciV22tzUQzX4FbGFCZlxyoDJLsMwvQazQD
   gCwmIUlQo4NAfNUYfe1ZZAgro4VTatoA/guun5VtDz4KPe4T8H2BkcKI/
   ITmOfeHRLJPV/CqZFz2m6iqW2n07YopYyJVD+8OjXWAj6GGdvDtnMLoPB
   982wxWQBTQkYrBZ57u9jzuBtdrbkZ/G1D8YDOemCM9d4k8E56LoZ4lsK2
   yOgx1WoECD5cv2tDAWMuyH9RsZTZRe7pt/5GgiEjeqtkvnVDUEFHqcZc9
   Q==;
X-CSE-ConnectionGUID: K7gxYULBRlaDz5nP70ayEw==
X-CSE-MsgGUID: UeQ/zkahRiC8oYxMkh0y5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8694290"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8694290"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:51:25 -0700
X-CSE-ConnectionGUID: M0LVTSGWTEWE5XXjZyjAHQ==
X-CSE-MsgGUID: VxzZ9oDCTgSei2/jnLTddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="27020681"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Apr 2024 03:51:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 03:51:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 03:51:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 03:51:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 03:51:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I++ztPF+XUUCBKTaSbSgye4S8De1WVJ4ZRyJ9bBCYooAUEJ7SX/wkvw94U197qwkLo1GbFq2OmUfQHiTNWM7dsNM5GzoYya7IkIuWLJ+zpIgvtQhf973WGrncMLqFu/JP37jQBiybzOJmawSyFv0YeS5U7nt1l9jfK3aM9YcSZGyNC2Icgcyk2bHp7lbADIlgsgGTj0qzzC3CVw5SvB7zekS2CxLAqLBe1uQvuqNvY4mWKB7v0VTZh30MN/u+5FyGOfNcxgSpAJGMUsG+eKcr2/zasonETB1D6I2wDaxWGOTp/B3Iungm/IHSw7LF3WjQ93LvXDVcDmfv79G8OJqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9Mvm2yerUHplXHw/kjYOLBj8wSB3MUEFmc2wqRvQe4=;
 b=FZh7TCis0A9xLtEZjP4A8lovFiyxD0YTKDAbjur00pgOr+XxxOOKo5MCV2NxOJgDQ7DWaU4gw4P7O3TC+SIWnwlXFNx9Yy7P6JCRbY+6zrisPZ1PspmP0ut6ocxmFLYG6eCpiiSE+mj9jfmdULf9LplGJ9Vp29itW8fv1hP4yE2gVz4f7Vg1H/IHo3SyYzFJ1fYc3zjEGopqWJKJgU/qa8BsGXDfe3XtS7P+QHkhowuH9oV9Wibrau3ig0Qm5DDBy0tWJt+10EsvQg9WrZgTDnI/9U6cEjGeJ5l1Zb6qrHvofTK6VhMKoUOaYglJeZS2+BtUFmMLUspnTIRZBqdz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Wed, 17 Apr
 2024 10:51:21 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::654c:d66a:ec8e:45e9]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::654c:d66a:ec8e:45e9%6]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 10:51:20 +0000
Message-ID: <ebe80c29-4884-488d-ab83-c020f9c3bc81@intel.com>
Date: Wed, 17 Apr 2024 12:51:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 03/10] net: create a dummy net_device
 allocator
To: Jakub Kicinski <kuba@kernel.org>, Breno Leitao <leitao@debian.org>
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
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <20240412191626.2e9bfb4a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::18) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|PH7PR11MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 8801ad41-d2e4-43f9-afbc-08dc5ecc511f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcuzjObDAXDrImcdlT+8QKXlXk01t1h3lTXugVAwl4O6bbbg368r04Rz4rAfwuHMAsIKIeu73OxNo5iTU8dO22f9rmgacqAOGPHhbJ0wC1JqyL5niMeNy9ONu+vs0K9gt+tnbBBKUi7ko8P4N+LZH0TeJaGixuHiuNSKReRk/5iLZBK8AjI+uqvO9OBJfT2aUyXUr7dSb7q5Lafd+o/mmc6JQZwls7Sy79QKvnyy+jH1/O5WWBNaorYdCwaDE5nr01eEhW5B71pXiQfh5Ct7rzqrpFCqjiZGl2wOPyOvwll1RdSpArjHSLMiQcvLhcXGtSWrc1bTw0EWE436oPaDMpUaUoJ7rQUZ7V7v7Fh0lcf6ZQ0cl37/Ylh7hNDY40yRNPEdle8So2tkxT5fviWCWaa16WL51zFlOlz+kFW/2+uBbNTLIzh9cB0C8x7N2P4eYT9sOzpR4qskbhhU83V0UBVpzdnRoyQjKpX8IRNX4Vw3Sq/K2vabLdJQ9zQsuj7oaK1bpdr2lE9fUEu4HCdh1dWFKZUY1PVDUeXzon9rmq6I0qCKpMDiw+czD8Hw9lq/XuEEupd4s7H6ZDH1haLEDwGHxRXenFNm6Ug76QcnQwV4bZ0HvmT9uH49K+qtipCWBKUHCzN9wKfLXm7Q8nctiA9Vk7x253XxEeEnTpBo48o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ditEbXNvOHNxbVJ6ellkY3E3UGVRNlN0T29JZ3BQaExBYjlMVFErTnRrSHRi?=
 =?utf-8?B?SHM0Y3JBR2dwODNyeCtYZnBHcVVtN0J6STlYWUhuV2VVRVVPNkhoYmMzamx3?=
 =?utf-8?B?eENDSHUzQTF1cUtTbFNFNlMwQ0VyZXhXaG1YTG1oTFpReTJUcjIrdXo4L1JQ?=
 =?utf-8?B?L2c0bXlmdDJnd2dQQjFsNzMyUDVLTjVjd3E5d3ByTHF2aTRNSHI0NnlBMHRE?=
 =?utf-8?B?TEF6cHZLZjlHTmJKTHY5V3o4T1Foc0FMTFBuQ3JrbzZNR2hIUmJYa0Nqc1I5?=
 =?utf-8?B?VndTblBWUEM1T0RibElqdnJKSU1LRHRUSmxqWVVoQ0FBMHpNOFBTSzh2SVB4?=
 =?utf-8?B?V3QzanB3SDdud2R5bll1eFRlaEhTMkZKYlNTMlp3V3VIUVhKMkN0OGFHTmpL?=
 =?utf-8?B?ci90dGhxRjgwUUg4UHRtR0xKMzFteDV4c1IwTFJIc0s5dGFORGh2OHpUd1Vs?=
 =?utf-8?B?WldaKzZjdGUvME5jby9KZStMN0ZMdVBTS3lJWU1WNjd5US9uUk9GZlVOeGta?=
 =?utf-8?B?VGtTaFpWdlN5SlIrSXFKV0dKbkRyc3ducE9oYXhzYkhFa0ZSdHdwMUxOK2xp?=
 =?utf-8?B?YzBLaG03MkZlb0xQSHRlMnl3YWNwWE9RZGt4aURiSk1URkVIQUhnd2QrK0hB?=
 =?utf-8?B?OG9kYWlMWExYMzM1bVFZVitIeE1mK1VZeHZNdWRZNEZPSENBYXlpZVRpTE5P?=
 =?utf-8?B?VGNHSkl6cEhrcW1aaTR2YkdwVVhFdDBDQ05Fd3Z3blhpd2d2VVNjZzUxNHNz?=
 =?utf-8?B?dmdWSFNGWDR0dWc2cWpWQ2k4Rm1VVEM1SXpld25kM0l4c0w5bkFyOGdOWGgz?=
 =?utf-8?B?ajN5d2tNWjAzbnVrUVVHRHA1dTRoZmUzdE1ENmlvVXQ4bkFqNDc4YUYwMGRE?=
 =?utf-8?B?SW9EMnhJbnVvZ0JuTHlSZzNWTm1TMUZ2eDYzQUdvMDZramhtNXNOa2YrTWVp?=
 =?utf-8?B?bTNOcGxZWjB0REI5TStoczcvNzIvNWJIVXJqMkNTOTZlM3VwSTNmWWlKckEz?=
 =?utf-8?B?cjQzUkJRSU9XK0tnZzFwUDlhM3g1bENxMzV1ZWNGT3JXVWU3T0hDSlpUQlda?=
 =?utf-8?B?SkJsUndRdVZmSktPdlkxM2x3cGVGbE52ZVRReFdNS0lKTFJtRy9aQjg1SHpp?=
 =?utf-8?B?YTZOb29YUU5GUnRnODlqTUJwNHdFbkcxWGszdFYyRi9LMzBFWUo4Qnl2TUp4?=
 =?utf-8?B?cGx2YTUrbmlqVUdaQkYvNXVpekFVaE5sMWs5ZzBrWTlJenVqeGVxSUplOWtD?=
 =?utf-8?B?K2dMR1h5L0xCWWltWUFtanVYQXJMcEQyeFVtaFRlMGpiQ3BlOGtjU3lLcm41?=
 =?utf-8?B?ZHdHQ2sxd21FNFgzeXpLc0JBU3NSclBZMjhBL1FWYWtoZlVWdXVKY3AvN3Js?=
 =?utf-8?B?QUViUkpRQWwrY1JVQjZOMCtoQnFZelhMM1BFS0dlODZYcGJUcVh3Z3QrUWRi?=
 =?utf-8?B?ZTVjc0NINmtIUWQzbk41RkFKdWNDS0dvSjlTVlZVcUIzQjkwWHNHK3lqMi9F?=
 =?utf-8?B?RUE3NU00K05XRmNlSklNY0UyZXBCbjZ5UTkyeGxseEN3U2Qxa1NTYjBIQzZR?=
 =?utf-8?B?djF6eUw1MkRBdW4wL3Z1RGRkMUk0V0dLMk93ZHZOWTNwNUwrcUtLMHZ1NzdP?=
 =?utf-8?B?bG1EN1IwUWZkVlFhYjBvZ2tEaGZkNE11LzNjMEVYRVdEa2ZSc09KeTZjWmVo?=
 =?utf-8?B?RDM0RGdlTXZYQWNzemhGOTY5OHUrOFhPemFBbWZGL09OaDl2NUlvSGVRL1pQ?=
 =?utf-8?B?T0NIU1M0NUVTczJnWWhMdEFuemhGZUFzTmtRSERvd28zV1pIMFJPQlYwUGcv?=
 =?utf-8?B?MjU5R1p5b3BXUUlWaWMwS0h2dmcvK01SS0lLU0c0TXR1Nkd3TmN4Rm5ld0xI?=
 =?utf-8?B?bEN2Z3hCVkluenhjTHBjaHlmN0U2b1MyaGpmNnlKY01RWUkwVHVFejZQVVZn?=
 =?utf-8?B?SU5vRzJScnVENnZrdm5ZR2tISFFLdlEycVZoeXl5QmlTR1FLcFhLZ3hoeGpt?=
 =?utf-8?B?N1pVajd0QXAzb1orL3RKUXNZbkFBNmtCWkI1VUt0d2gza3FpMzl6eWdsbGtX?=
 =?utf-8?B?REM4T2k1Z1QrOHc3N3pWM2pPdXUxektyZms3cmExVzhaeXNsYVNKeUVwajJm?=
 =?utf-8?B?NTQvRzl6dTA4VGRBSnRMMWtOWDAwUGlrVUF3UUwwdmRxM1A0dlgxN1VFL0x6?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8801ad41-d2e4-43f9-afbc-08dc5ecc511f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 10:51:20.9259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Espmzm32iVn2wmUVDEHZMgtFOxyusDNyneO/o7USCOAWF5qsOftquwlxz4JALuQaIXZxtLRyDLVey0IDqQQG0j00tiL4l1rnBZEVA0EVS7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_035128_857195_4F043C24 
X-CRM114-Status: UNSURE (   7.98  )
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

From: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 12 Apr 2024 19:16:26 -0700

> On Thu, 11 Apr 2024 06:59:27 -0700 Breno Leitao wrote:
>> +/**
>> + * alloc_netdev_dummy - Allocate and initialize a dummy net device.
>> + * @sizeof_priv: size of private data to allocate space for
>> + */
>> +struct net_device *alloc_netdev_dummy(int sizeof_priv)
> 
> Sorry, one more round :)
> 
> We started using -Wall for kdoc (./scripts/kernel-doc -Wall $files)
> recently and it now complains about missing return values...

Just FYI: kdoc accepts only this pattern:

 * @last_param: blah
 *
 * Return: blah

NOT

 * Returns: blah

neither

 * Returns blah

Only "Return: blah" with a blank newline between it and the last
argument (or extended description).

Thanks,
Olek

