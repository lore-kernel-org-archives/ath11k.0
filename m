Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F076C433FE
	for <ath11k@archiver.kernel.org>; Mon, 28 Nov 2022 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKPm4rH5WUKRd6CcUND+qdKi50LrgKatKHfsDnYxzfQ=; b=s4MaXJ7E1nEEJM
	AfhX1X089zm+rpiiRZf/Et1xcDYUzp8bwU82/QbP14NPwLm0ZwMZOJ+z9I2IfynZY3g/mTFWo8UHq
	RJlKvXDdF7SOJKkru8OSdsNdqwSQC68RlklZwE+DX06/SF75VolPmaJYPqo6DUhUAOi9jtTobqfce
	D6fh0LYbg2NpgEd8kOBpI+2nTL/JEHuGB2gZxn2OJHrLaot02RePZ+NLq9DYUhMjl5b3gFmiCoIkh
	ACTsiyuerdey6TGOULiD3HcowwMtaBv+yWd+ZeAIZvsSAsVsZUWkJdQ9nF1aXMaoNlQgK/db3vMN3
	SzhFy9fkGH56cJVS1GHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeoz-0025dX-N0; Mon, 28 Nov 2022 14:09:21 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozemS-0024VT-6g
	for ath11k@lists.infradead.org; Mon, 28 Nov 2022 14:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669644404; x=1701180404;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/1WCFhPajmqnoJf77wAV90n/werd1G/acKN4q9qpP5M=;
  b=Z/KAiuYNL07XB+9buGJdtab39Us1jPDj/yTqjwiu0ElQge4aeE3klAaf
   XwTfO+zvOKhtB2/0jiKvFlBfQUuBQ2WlAOl2i6QL7NpBNTGbwxnvgi0da
   R6B1r8HGYbFDh+8hiuaUEoMvQ9PsWnmm3n8qvtTFdoFAZ6T8MBUUMdQgE
   fK0mq+AKqL97dgwMb7VBj6dlMW5YCfZCq2cFVBEOc2QqCThOHLkljsfZ8
   Hk6Fr6aNTnoP37RFpibbYZ9l/76/VOcTPoHWcJkMJ5Icm08BbhIrW+NCG
   3+e6qP87h+dX4SkCRmcjFI3isPzjhEoTsw1Gog9dydz+1QSI9ehg8OWdH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="302417317"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="302417317"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 06:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10545"; a="817833593"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="817833593"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP; 28 Nov 2022 06:05:48 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 06:05:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 06:05:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 06:05:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 06:05:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CADwRG9Q3UWQ30HrbC3wXvG5B60+o8eppVVrVgncKH+1eEBPxdrujjLV1aVHDjPB3s7JyO09j5Co/ti8S82nJmR+klrMWk5u2cfHqjNxc1m7nsu3KVexdWfNMgJbCwUh2M7zarPXF61Vp46n+rhmvVJYmaooYR4uofF7Gn5vfusZje4BH7Aca4eD5Zsb1VaOxyVipC2+Koa+pSA5Hw1NPNJnaZuzwFmTNJMpV72WSFTpRaUBZ4ExlAOFQwBLt22Tk688+TUZUrU5DL2UfhSw7OZX4IfQpq1xn6YcnbxGXuu25ehFnx47twRQbH6FOcrmm0i9F2ocLDa7WMFxKY5pnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1WCFhPajmqnoJf77wAV90n/werd1G/acKN4q9qpP5M=;
 b=Giq/ebXotRnn/y6DOBlv5NjcbXVH0QNbbZqZsz8dAc1OOMZSQeP0XYDn43RoFKQIfpP+/f/wkfwT+tOXKEam5S2P4IaPEEEaLS8Ola1B4i//Bmbj8JNopkqd4eTlnZ2g7lvPuZ/CytsbYZrexluVhDOQCEp4BwzVC2kQZF//XFAofiK431xfJrx7Zegk07KTonIK2oAyJUqjkgV2f07pc02MBPPlLox3rbyT92KAipB1pj61CpE5U/j/E5+6YYBUK9pL7b/BVEv1+uVyHRIAt77X1zt61kKvAxSj+DHJ48D6Vw/f6JUgUpceokYsnGdYpa9rRUx5gBX6RroUhV1sbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3897.namprd11.prod.outlook.com (2603:10b6:5:4::26) by
 MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Mon, 28 Nov 2022 14:05:45 +0000
Received: from DM6PR11MB3897.namprd11.prod.outlook.com
 ([fe80::f4a9:cfb1:932a:438f]) by DM6PR11MB3897.namprd11.prod.outlook.com
 ([fe80::f4a9:cfb1:932a:438f%5]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 14:05:45 +0000
From: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>
To: Wen Gong <quic_wgong@quicinc.com>, Johannes Berg
	<johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "Peer, Ilan" <ilan.peer@intel.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: RE: wifi: hostapd:/wpa_supplicant MLO Re: [PATCH 00/27] another set
 of MLO patches
Thread-Topic: wifi: hostapd:/wpa_supplicant MLO Re: [PATCH 00/27] another set
 of MLO patches
Thread-Index: AQHYwcdECXMEe3QNQ0ujvgfkz4HwEK3SFYGAgAm29vCALOJTMYANEhCAgD7HAYCAAABK4A==
Date: Mon, 28 Nov 2022 14:05:44 +0000
Message-ID: <DM6PR11MB3897D1DE6EB7A89F4F6A6A16F5139@DM6PR11MB3897.namprd11.prod.outlook.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <6175bc95-201c-cfab-2ae6-9ba77e830394@quicinc.com>
 <09556b33ad998ad243cf75dbc230f3b07349a87e.camel@sipsolutions.net>
 <935ef9e9-2092-e3f0-0edd-4aa29f4fa775@quicinc.com>
 <e01e75013f71ede7b29f2751238935e7147796f2.camel@sipsolutions.net>
 <f3afceb8-8120-12c7-74b9-caa3abce5cb8@quicinc.com>
 <DM6PR11MB3897D1A4E13419D9F938F559F5449@DM6PR11MB3897.namprd11.prod.outlook.com>
 <96bcc467-c530-46de-8f91-c5eb0af7a368@quicinc.com>
 <776991f3-384e-f487-83b7-e1fbfd40cc4f@quicinc.com>
 <de54f4e0-810b-70a0-7629-39a2957ecd3d@quicinc.com>
 <a3edddb2-82e4-2c79-564f-1918b59aead9@quicinc.com>
In-Reply-To: <a3edddb2-82e4-2c79-564f-1918b59aead9@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3897:EE_|MW5PR11MB5787:EE_
x-ms-office365-filtering-correlation-id: 26a552f2-48d1-4fd1-2997-08dad149a48a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QMtiqHzf07JXmPFtusyBl9fZ8uf44tGEwKl3+8iLZB3u5ERSfvLpcuA312JTW6E0pDgJ9JhQWTpOMw8F08pnRsDoLJVDODArPvfZ68htwjWISQNyfkbD7yqlsHdy80ujhI6C9tHqc0gZ/bjFjPpOIP5SpMZOHseNUwmVzSQYkuiPO0SOud4Gn6Zu1uNznYqa5QN2GiR/FV17vfYhhvYaRzIDwFnetsAXs9umXoPYY+ymKJEd8PM1VbY4vci/GsuhlrYSOlFQZWWlfCmFoO2c/+jWVdA3Rc4u0Y45wFhQd/S4q1Eeaam/12I/4KWCEj5+4cQjKh8GDNrCS1Ze0oaGkSIS75vpTpigYi4pkwx4ax8mCxQistZydQBK7UuC6tesaHsWFgdeJZgLx5rF/6iz2l0chwiSGuZJ8I6TINdCqp22UgKSgSVvGWentSh2fzMlUwMRjkH89Eu0zUf/gMSAZMrEuzjxhruoL0TOkmjg79HsJwPmohpWkTQ6UQhov1ltPJkXBIS8VIWtJju6S1rYUrGFVBVPrIsVLNaYaqwNHKGfHppiIu3xlgguvoHyZwLL/LmJBgVfWImJU5dsO7tFjkiqaFPHdfrlGRx4xjGJm1tacFYWsofJCH1LASGk+/n2BgYEjhFyRDpoiBjzVC967KJ5cr/ZquTm/HWOpaAGMVmmrfSpZcilp7suUnhAb5NDO5zKZCUwxB8ChLQ/NgW25w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3897.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199015)(33656002)(122000001)(38070700005)(2906002)(82960400001)(41300700001)(4744005)(38100700002)(86362001)(76116006)(66946007)(66556008)(66446008)(66476007)(6636002)(64756008)(110136005)(8676002)(316002)(9686003)(71200400001)(478600001)(55016003)(4326008)(8936002)(5660300002)(52536014)(26005)(186003)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzhaNDIwZFFvbitaWjJXVEFwZjJXcE5jSys1YkV5SnZ6UkJ3V0lQMGI3aFVC?=
 =?utf-8?B?T0JPUFQ4R0tqZk5ldi90eDNNR0xmZGY3d0pObHFDTTB2Y1hxVGlaa0tSLzhR?=
 =?utf-8?B?a1YwTmhUM2VCeVp5VFBCaEVVbDhLTkhuSTNsYWxlVkEzZjdoWk9HMmViSUw3?=
 =?utf-8?B?aFBITnFSZzZ0QU1wSnJxakJSa1ExRmFvdlYrQWhpaEhpcitKM2hIMW8rU1VM?=
 =?utf-8?B?bXNZV09IcWpkRUkvM2RmNWJDbXBkekJLZEt1ZXhTays1cWJuZjZHVGx3czVG?=
 =?utf-8?B?WTNRVXY1VGRkTUE1d3VPak0rTDNDaXlpRVk4VHVNSm5MeU9uQTJkWFM3N2h3?=
 =?utf-8?B?NFB4UlpxY3kyQU51VTAwZGJYQnBIVTUrTW5kWWZuUDFiV1NmbEtCNXZ2QzJK?=
 =?utf-8?B?ZkpRdkNrbVl5YUdPRTVXNkppMnJPTDNidDgrWFJPQzJ0NWlxSGZZS0srRDlW?=
 =?utf-8?B?UG1ySVR6UGhFTUJHaXpaNjhqR1MyemZoRGFTeTlSamhKVDdjekNOYmhYYit1?=
 =?utf-8?B?WEJFVkhDYkhiV1BqMnFibkw4dkRIRG1wYnZSSXZLU2ZjdGI5eXZQQjFYOG9U?=
 =?utf-8?B?RU5LREVSQjN6dGo2QlZ4NUtyMm96Mm5rVGdMTURlU01PSjN6LzR3SnpHZEY4?=
 =?utf-8?B?U0dzd0hUYmdOWUVtaFY1RzhNVksxU1NLdDg4OFowVW5hbENnMEhRM2QwYVli?=
 =?utf-8?B?TnJjVFdteUVLUUN0QmxmVkptbFpaNWpiQWRtbng2WXVhY3lkb2xTR3pFcS9p?=
 =?utf-8?B?cWJpQmg2OVl1cFExQzJaVVltV25MYnZGbEd5Mjd6TE85R2dCOWc1cWZ4WDdZ?=
 =?utf-8?B?TXBqR1k2YUcvMUZ6UWYwUWdlNmVZckk1cDM2TjlUcHpqSno5OVZyUXJJeW05?=
 =?utf-8?B?Z1E0cVRneWxqNHprK3JkMlhGNW4rSW1XMi8rWVVVNU1nUUI1Z0Q0djR2dlV2?=
 =?utf-8?B?RlY1TDJRMnpiaEJoZzhQSGRrOUdXZmZCYXJaai80a25rWkc3THJUSmRrSGtr?=
 =?utf-8?B?cVJUNmVSbTEwdkk4aEhoS212U0ZEa0NYdHFFUmxMOUtyYnc0TDVIWE5YYy9X?=
 =?utf-8?B?ekIxS0hJUUMvb25ZWkh2U0owbk5EM2V0WUhVWFArZS9CY1k3cmlhM3AvZWJx?=
 =?utf-8?B?OHZPa0EwTmJPaFk1TWo1ZXlzakZyV2VwM0xMOUNaRkRMbEdtc2VsVXNEejVW?=
 =?utf-8?B?UStuU1JJVnZoZHRSUE5USnExM0JJdENJb250QlVNZU5aY1pzaGQ5VklBYkpt?=
 =?utf-8?B?ZFp6QzcyUW4vTUFwcVBLZ0R6Qys1eTBUS3ZTY3JXd2huazlGWnZaUHBXL3dy?=
 =?utf-8?B?STJwcTZCVlZGRWNlcUE5T2doY0xCTzFuYVlOdEhDb2gvS3hoWkQ1a1lBNjFU?=
 =?utf-8?B?V0xiMVVJSWk5alNUVFF5WFNFTGlMYXFydlY4TjdsQ3RnNTc2bEd3ZW92OW9C?=
 =?utf-8?B?OGNMbC9YWm4wcTFWOUt6UzJMRDFFNGppNXdoajZsTjJOS0wvSWN2YnRmWDJB?=
 =?utf-8?B?S1FUUkh6d2dKRWpBQXlobHJ1WUNJc2hhbm1qSlMxQTZoQ0JKNVdPTGJpdCt2?=
 =?utf-8?B?bDFyQmNWNk9vSzNHZWRhWVdmZG1rdFVsamlrQTJINXhBNVlMTnRweGUzMUxn?=
 =?utf-8?B?WnJWK3h0LzZIWXJwbm1mRTVRNEFtOGF0b0lPWlVUZ3lBL1pGbzJLYkZwOGoz?=
 =?utf-8?B?SGFoa0lOZHp6TnZ0SlpvYzBvT3ZCVUh1dGNrSktPakdBK3BCbXZTcVJQSjNU?=
 =?utf-8?B?UjVnL0V6TG03MmFpakswb2hWdThYUW5uRkd1T2FxbWExZ2hVazdkbEQ5S0kv?=
 =?utf-8?B?ZFJnaUQydWhaR0tjL0lmV2ZKeU1MM0xxZ3E2MFM5R1FJOUc2Z3lFVWJSdmpi?=
 =?utf-8?B?a08wQVF6ZVU5Y2JYeVprTFV1VDc5R3k5cXlFdGFiZlJOWUlPM1hwZ09ybU5a?=
 =?utf-8?B?OVNEYndCZG00YWhZNm5XWER2eEZ2cytzQWJpZHZmbkY0eklTdklFN1ZVeXlV?=
 =?utf-8?B?RDN5b3NYYkJsWjZBMGk3dldjWlVnbmt0a3VHMUVTY0ZudVN5SmxlWi9NRFNj?=
 =?utf-8?B?RVB0Y2tqNHIwU0pwRUx3bmN4OE5hY2NXMVhsaUFzZWV3UWI0ZHBqSytSRFow?=
 =?utf-8?B?dWJYNHM4WWpyYjR2SDFkb2xaaE1ZeFZ0RUo0SDRDSHhja0MzaVNUM0FJVU9q?=
 =?utf-8?B?WFE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a552f2-48d1-4fd1-2997-08dad149a48a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 14:05:44.9526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uU9/ChzazCVaHR0r+IRgTNhBw2lBYEZz9D6bl2ak5KAjQabqlZOlYV16XZgW+uhoY16iGyUfPxXm7DGvXU/fEMv2pr1jyLEKPg8N5lWEQDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_060644_353930_B36BF3B2 
X-CRM114-Status: UNSURE (   8.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


> Hi Andrei,
> 
> Is below all your patches for MLO in wpa_suppplicant for station mode?

Hi Wen,
We have few more for station side, like SAE/PMKSA support and some additional configs - but this is mostly what I have.
SAE support patch is somewhat similar to patches sent by Veerendranath.
We have more stuff for AP side (mostly for testing purposes), hwsim tests etc.. I'm starting to clean this up and will send it as well.

Andrei
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
