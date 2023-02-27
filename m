Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FCAC64ED8
	for <ath11k@archiver.kernel.org>; Mon, 27 Feb 2023 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOZAcyi9n4apeW75lJ0mEKrKcM1KvVJySHl5bXB+mTw=; b=NOHwTUMzPYE4wf
	gFG2u5i/xEIzifs5c0IDWJxfJKYhVnKefdUT9GTW1lEKqi6DAbTMUwZAMYFCZs5nZNeH/8f9v5mF0
	s6IGlnCSamQ1Q494uCvxgrG/cUQWMBKnC5JI9NSQNzSYOgd4U51aS8bfsVhqiDv6IYzHe6hNeyGyb
	Tc5hIc10Hq6IaWRdK+VLmUNkcztcIMnu7lgIK3FY+2Umu9moxBVKV2W71xwGfkyRHOikpWTqXMsqL
	mn6Z60ROsBuTuucTzatje3HTUO1QV/jT7P4CMvZGF4+A3hn7Xk1wG7yT1X5K8Q14kAJ/iNuYZxO9E
	cpBE8CJxzk3E1SarP/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYpY-008pKd-8B; Mon, 27 Feb 2023 08:25:56 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWYpT-008pIL-V3
	for ath11k@lists.infradead.org; Mon, 27 Feb 2023 08:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677486351; x=1709022351;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QgNkCCAMo3mlsHRkbU8j1J+2DBJVr/1yPAFEXk00Du8=;
  b=AWHL6ptywF47ExUgbZzJdUoWkO8C5ZasjouyiVMq4i+rRxS3Z6U9Duwi
   JQhn423c9/ioS+UsS2YqXfXE6FyuivZjv61kjEefNNUyOR1Q478oDX3w/
   Jli/tgMk6hMtmGzr6BqAy155yLYOtgR9HHVMYO0mMwxqBvzgqUSxNgdBG
   /jKRw67kNum4FPo5WLGC6l3bFARJIOKMvK8yYmYP7dMbhALbmWkr48DyT
   ld53jWZKZP8zxKl/wBTyTRwOE83aJjSqdE7FiByo07aHCS1AAVs1wmNpz
   Y42eYVWl7FBTZF8rPHcnc6J2e4WyJChaUULyiPxbMhEC/Tun05mZE7ryR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="313480490"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="313480490"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 00:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="919210120"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="919210120"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2023 00:25:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 00:25:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 00:25:46 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 00:25:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 00:25:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFyMm8GVLjFBprbYtd+q072hs7PmmYPuvFIapmtU5dGawmhXgen57K9le8mo7dt+MsQH24Y69c0Hi+ccXEDi9773ZysQEGXtb1gUlYCetj1sumHJ9T7XavVs4QX/JFQGoALrv5o3KNEXISLP7wKjt2IH9z2CqMziwU4+KsjNrdUT5Ra/9H78htxTNksnemlNCNidTCMT4JjV2ukbXbYGrHgAyHgwp0CWWavqRQxdstQzj4I9ZcUykJrWv+cuqPKSdplgVW0Zi8Aa8I8Y8wZ928rRYdVWESJQzK/mhxTYu51dS0NOYgU5HEG5a8I6aHyIsTV8GYQ3T/2/uVNTrloKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgNkCCAMo3mlsHRkbU8j1J+2DBJVr/1yPAFEXk00Du8=;
 b=F4j8YtMlwYk00PBDRJE3Rq/FiQgxKTYkcIC531I7P0/XG9sP7hIorfgtmdWO+/JuFv4KrJwoq1GRccoygPdJ/TNShlD+FjVTLj/C1MHX1OcTJMIRML+qxZNaNRmGH1SNt6R1F5uhEKZ5aY3cb/naOZilD52YvoPIRdJc6pnxVIrlRqO3pQH8fC3TTXrJl6urDExgO8zruD1VKFfRirrxDQ5EYPcKgC77wtdTpKqq7hL6g5bnQHR/cQrFDocH8uWkQ7j4TG35Ih+Bp40g11lOJS8zuChQE9q5cJShZZRFnLTa/C4NXsohHHdV6V3VIHbPCfpu6gL9Tty6W/YX3EFOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) by
 DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.29; Mon, 27 Feb 2023 08:25:44 +0000
Received: from DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::e6b:d633:b9aa:eaf4]) by DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::e6b:d633:b9aa:eaf4%9]) with mapi id 15.20.6134.021; Mon, 27 Feb 2023
 08:25:44 +0000
From: "Peer, Ilan" <ilan.peer@intel.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, Johannes Berg
	<johannes@sipsolutions.net>, James Prestwood <prestwoj@gmail.com>, "Marcel
 Holtmann" <marcel@holtmann.org>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] wifi: ath11k: Optimize 6 GHz scan time
Thread-Topic: [PATCH] wifi: ath11k: Optimize 6 GHz scan time
Thread-Index: AQHZFCz8RgAxBeF3z0ygfw3Z4uAoOa52v2EAgAD6kACADCKdAIATYWYAgADFLgCARkRfgIAAAgeAgARUq4CAAD8t4A==
Date: Mon, 27 Feb 2023 08:25:44 +0000
Message-ID: <DM4PR11MB6043976576E564D19D122B66E9AF9@DM4PR11MB6043.namprd11.prod.outlook.com>
References: <20221220043823.20382-1-quic_mpubbise@quicinc.com>
 <5DAEA8B2-2B44-4A91-9E57-12B6C6B6C1FC@holtmann.org>
 <2861463e-a097-7efe-bc75-f13c8faf9547@quicinc.com>
 <378a1d63b3752ace7384c44d6f5184753fa7795d.camel@gmail.com>
 <0b06dea9-d5be-1edc-62ca-576398d1bcd8@quicinc.com>
 <0e7644cbfa9e4ba0d534681166ca467ea1684719.camel@gmail.com>
 <10e4b6bf-f375-e50f-063a-b44471359d25@quicinc.com>
 <56a3651e48ae621afa4c50f1ba0d9fedeefb2c31.camel@sipsolutions.net>
 <7ddf99b1-4aef-c950-f61b-ba79ed086095@quicinc.com>
In-Reply-To: <7ddf99b1-4aef-c950-f61b-ba79ed086095@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6043:EE_|DM4PR11MB6019:EE_
x-ms-office365-filtering-correlation-id: ae68fdd9-1c6c-407b-933a-08db189c38af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mO1yRXvCkw40Pv06KzyqlvhAOGydXyD3FpgGyrxXtNSn2bzq3hzjYAaB/Bgu7BZsbFjrXl2sDQK7TovxwAVRJGQev/1dZqY3HkoPJnRKF47Wwhc6gEOgrKUWpGvahoug3yujSv5mpxHv4mqzdPm7wbmJfQ+R1trRBSSPcphhtl6lNrnuaKY0/Nz0vgl+PsNmS/VaTBUHh7e7HTDDYdtoUJ9gix1bQOraWXaNIYgcNJCFdT7Sh8B1sOnodGDGJA0SAigUDeFimMh4Y9+EKUrq6pRp4CiP2AJwiB86nMkLgoUOlFxLYfkuHwLEJqZEAyB9XmkHJ/xLAaGSJ4ztxSSVsKHRPjCaDZjg3sXbd1ErYftyBBlmcGshOJi1m5bdNcmp0uCnpw9wcqCXyor6Pd01XFPsnyKaa6BP7QoGDzc4sQJKO6RK0BpdNM4PiLOrUbe9Cr8ajc67M1ZmjzHiX0b+YkfIaoPaHOaOcHruhUZuShOXDzxaOc9wSY2StSG2y3HKdOp4b564TLXuNay57VQGexp4vaAziLAV+LmIpumSZhmCADp0YkFHK1E7bcJyRl7ZuTj+kBqrO0JCxL+7CXMFCkOiWHz7arWuEI5s7BbShvJQX3/bnttGq7Vb2/C8RjVLbmDosqP1GaVWg/DTuJm3Y5FOyv+6LdlrEpt5mXhNVy8nYu69DoP88xLpUxAWh8+6rRF9SUev48+PN/q4hRRnyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6043.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199018)(478600001)(7696005)(71200400001)(54906003)(6506007)(186003)(53546011)(26005)(9686003)(316002)(110136005)(66476007)(66946007)(66556008)(64756008)(66446008)(83380400001)(76116006)(8676002)(4326008)(41300700001)(52536014)(5660300002)(8936002)(55016003)(122000001)(38100700002)(82960400001)(86362001)(33656002)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qkk2d25uTmUzZmVEQ1FkbnpwVnRScnRJdXNHa1lhRzR1aDdDOENTVXdXOHlE?=
 =?utf-8?B?RWhUV3Q5alpwTlU1RFNJZm1zVE9ycyt4SHY4Y0FwTGcrMEM4Rnp6c0Y1WWhT?=
 =?utf-8?B?WVNPSllTeUVBTjZmTzkwSjEzV1ZKbXgyRjVzaVhVYWlUcGtYSkQzdDhEV3ZZ?=
 =?utf-8?B?bkZjT2FTb1pGZVRuaGpiUEJmK1BlclpjOStvZnlDWnNSbUpuMVFPeXFpb2Ny?=
 =?utf-8?B?M0dTeFUzVzlIRDc0bnMzZVVCbVIrQ2RHS3EydlIxQVJIeThXT3hDM1c1R2dm?=
 =?utf-8?B?bnFDZTQrQUZkWktsOC80a095YVlXWGtmNGNMU1FKTVBXcmhZTzhwR2E4NUhQ?=
 =?utf-8?B?WWJNTVkxZWh5MVF3b1VIVllod0NmcnYwRThmMVN6WE50S3czRHJoeWc4eElU?=
 =?utf-8?B?aHZhcWxXREJjang0T3RuYldnSDhwSEVabko1TXNEbS9GMXdlZUVsU3dtZnlN?=
 =?utf-8?B?dGoybE4yWWFtU3BPOWFGV0NTcUtrMjlaRmUzQUpKbEphSHAzeVV4QnpuZXlj?=
 =?utf-8?B?K2xsOTZjQXBxS3VNVis2c0VQYUY0Nk9DUmxRK3J5b2R1aVNPdlNCNVFOWnZP?=
 =?utf-8?B?NDhoaTBlYkdjMDIrZkFDOUxrWmhJdkoxMG1WcG5VMTcycE1qZk45VEErZ0ty?=
 =?utf-8?B?bWFmMTJucmdjSnRqWEh6Lzd3UTdXUm9UNVE4cmlscERSdzMzNWZjWFZqZzBK?=
 =?utf-8?B?WkxIdWMrMEpRM000SUV6NnBxeEFScENHa1RpSlBaTkM4dGhuM3dkRnF3Lzht?=
 =?utf-8?B?MTI5THltZCtJemJWWms0UGVpUUxuMy9vNzc5akxxQkZCK05ENnZ6RkNZRmVX?=
 =?utf-8?B?dFhNV3J6R3pEeSszRGp3TUZhR1VwR1dSUG0razQ4SnM4bmhlR0F2bFZBQXVS?=
 =?utf-8?B?ZlVVaXN0Q1Z0QVIwaEJuMFMzaUZvVEdCYVVqQno0OXo4Mms2VFlNQXF1dWlk?=
 =?utf-8?B?Yk41ZnpTMEdzcWdKc01rKys0QkhPMVhSTVNIUzdvcUV3VXhRWkE0MjFoRTdN?=
 =?utf-8?B?YWptYVJRalR3LzJ6RU5qa0RJeEhRSTgyMjYrZ2Z5TEFGa3pJSjBNYlBFa2ow?=
 =?utf-8?B?clpxUXZlcXdpVWljZjNKdzRxU0lWWktzZ0tCQWppaVQwWCtWRVZyRFRmQXVP?=
 =?utf-8?B?Z0F5ekN6aEFWcCsxTWVvTE5WL2x6UnRheVF1cnpwYXJNVzlranFMUUlEUnRD?=
 =?utf-8?B?THBCbEQrSjBBR3NWQmZHbFJ6TXZUa1pmMk1PQ1JJVk9vdE5qTlpBdzYxWGp6?=
 =?utf-8?B?cWgvdWNmWnFoaDZmK1BqdE9qcS9vRUx2aVNDblRFL0d3d0QrenA3UDhhMkJF?=
 =?utf-8?B?UHZybGk0U0dRQVp5RG5mYWY1anF5WnpWdStrU1k2Smx1Tm1jSFN4bkZsRTdM?=
 =?utf-8?B?ckNwSHlEcG9QWnNsY1llanIya0F4ek1pNjU4NVF6bUhvVTE0VUJySnhCZmJY?=
 =?utf-8?B?UlFWcG5zS3VYSjE1VGtNZHR4OVd5dmFqZHYrdW9IcVNteEFTeGZVbUJ0NU9V?=
 =?utf-8?B?bkNHeDRaYzVFdHVvY2hXT1ZQLzVNYjhZN0xzald3SEZxV3RrdXEwL204SEZI?=
 =?utf-8?B?MUZlQXJRTGllUUlKeUZTc0lZSE8wSnVIbURqbVNkY2lLRmRHMzZ6amFHcHEz?=
 =?utf-8?B?Q1pnZ3FicXBRMnlUbUluOGFOekdSSmE4cGgvbXFENkVJWk1FenVVbmlkQ016?=
 =?utf-8?B?cnBnR0VHSG9xdlBIY1I5SGJ4QTAwN003bFpKbWZyU3hLS2h3WFdHYVl0eldM?=
 =?utf-8?B?Z2l5VHhVLzUvT3J1OEtwalNOVWQxWTYva1FHbmdPSGFVOTBaWGZvM05YNlNT?=
 =?utf-8?B?NnFRTzQ0YWhsQWRRcFZBZW1JQ2dQTmtJSEpZeC9lTnNiV0xjak1ueUcwNE1s?=
 =?utf-8?B?SytZQUdmTE1pSXE2Ynk0NzlSeTI3eWZWTVZaWTUwajhQaTlEREFZM2xvVTlU?=
 =?utf-8?B?TE44cGtkUXExZ05CNjBBejNKLzhwNzNyQW1CZ1FZbDl3M1hmdDVseEdCRWZR?=
 =?utf-8?B?ZVA1TXk0UzFoYmxpTnE5R2hHQ25FMXdQLzNGcWFDeGduV3g0OW93azZLaHVt?=
 =?utf-8?B?TERBdFA4RVpNdFJoWFlOSGR5Q2FndW9TdXRxbyt1Y0ltWHZBNjIwM2ZOcGpj?=
 =?utf-8?Q?RancGp4Kbad20iwN1ZKCsF1el?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6043.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae68fdd9-1c6c-407b-933a-08db189c38af
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 08:25:44.7427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qC3Iu3KoIvsDu2UkxzvBivQ0fJ9gScLUwY9KsueB5sZhgbYYPzrVaa+qJHHQxNvie6L2ctmeH+SShdIa436vdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_002552_085541_FCB24B66 
X-CRM114-Status: GOOD (  35.91  )
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

Hi,

> -----Original Message-----
> From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Sent: Monday, February 27, 2023 06:24
> To: Johannes Berg <johannes@sipsolutions.net>; James Prestwood
> <prestwoj@gmail.com>; Marcel Holtmann <marcel@holtmann.org>
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org; Peer, Ilan
> <ilan.peer@intel.com>
> Subject: Re: [PATCH] wifi: ath11k: Optimize 6 GHz scan time
> 
> On 2/24/2023 3:45 PM, Johannes Berg wrote:
> > On Fri, 2023-02-24 at 15:38 +0530, Manikanta Pubbisetty wrote:
> >> On 1/10/2023 10:35 PM, James Prestwood wrote:
> >>> On Tue, 2023-01-10 at 10:49 +0530, Manikanta Pubbisetty wrote:
> >>>> On 12/29/2022 2:52 AM, James Prestwood wrote:
> >>>>> Hi Manikanta,
> >>>>>> By the way, userspace itself selects the frequencies to scan, not
> >>>>>> the driver.
> >>>>>>
> >>>>>> If we see the split scan implementation in cfg80211, this is the
> >>>>>> how it is implemented. If NL80211_SCAN_FLAG_COLOCATED_6GHZ
> is
> >>>>>> set, it selects all PSC channels and those non-PSC channels where
> >>>>>> RNR IE information is found in the legacy scan results. If this
> >>>>>> flag is not set, all channels in 6 GHz are included in the scan
> >>>>>> freq list. It is upto userspace to decide what it wants.
> >>>>>
> >>>>>
> >>>>> This isn't your problem, but it needs to be said:
> >>>>>
> >>>>> The nl80211 docs need and update to reflect this behavior (or
> >>>>> remove the PSC logic). IMO this is really weird that the kernel
> >>>>> selects PSC's based on the co-located flag. The docs don't
> >>>>> describe this behavior and the flag's name is misleading (its not
> >>>>> SCAN_FLAG_COLOCATED_AND_PSC_6GHZ) :)
> >>>>>
> >>>>
> >>>> Sorry for the late reply, I was on vacation.
> >>>>
> >>>> What you said make sense. The existing flag should not add PSC
> >>>> channels according to the flag description.
> >>>>
> >>>> We can add another flag something like you pointed out
> >>>> SCAN_FLAG_COLOCATED_AND_PSC_6GHZ and include PSC channels if
> this
> >>>> flag is set. What do you say?
> >>>
> >>> I'm no authority here, just wanted to point this out. This is
> >>> something that would need to be in mac80211 though, not just a specific
> driver.
> >>> It would be up to the maintainers and would require changing the
> >>> behavior of the existing flag, which then changes behavior in
> >>> wpa_supplicant/hostapd. So its somewhat intrusive.
> >>>
> >>> But personally I'd be for it. And just require userspace include
> >>> PSC's like any other channels if they need those.
> >>>
> >>
> >> Hi Johannes,
> >>
> >> What is your opinion on the changes being proposed to the 6 GHz scan
> >> in
> >> cfg80211 that is being discussed in this thread?
> >>
> >
> > I don't think we can/should change the semantics of an existing flag
> > now, but we can certainly update the documentation to match the
> > implementation, and add more flags to make it more flexible.
> >
> > johannes
> 
> Sure, makes sense. I'll make the changes and send them out for review.
> 

Sorry for joining this thread late. I agree that the documentation of the NL80211_SCAN_FLAG_COLOCATED_6GHZ
flag can be updated, but FWIW, I want to clarify the intention behind this flag:

First, the logic would always scan only the channels requested by user space, so if the PSC channels are
not included they would not be scanned.

Second, the intention of the NL80211_SCAN_FLAG_COLOCATED_6GHZ flag was to indicate to the kernel that
before going to scan the 6GHz channels it should first scan the 2GHz/5GHz bands such that it would retrieve information
about the collocated APs, so eventually it would only scan the given PSC channels and the channels on which collocated APs
are found (in which case direct probing of these APs is expected).

While the PSC channels could have been scanned together with the 2GHz/5GHz channels, since collocated APs might also reside
on PSC channels, we wanted to avoid scanning PSC channels twice, so this is why they are scanned only after the scan on legacy
bands.

Hope this helps,

Ilan.






-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
