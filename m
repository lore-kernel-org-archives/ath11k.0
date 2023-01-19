Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5187C678D4
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 03:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCmLwh5kg7I45pIPVEEZgf9MN62GkafIRat0gQBWgew=; b=1I7plgpOy82jhY
	+lDiux6sYs9VZ1x5LZcmfY/7B+PQtjWXwThGsyG0rEUKBWJEdGewEBbGDMdb5gXCvK9l4Fi9d8nIt
	5im+4HjTwU3l3qbAK+Cl8KWjH94heutsyMA4DQzOfo2LNkFLV3dBX3Gq3s89cH2loC3AfRpDnLzfC
	+GZIbl5hCZR4laURJG/hsmq5nkgmhixiidHPQo15o+bkpgu9oFhK5TjYEqUWM5N/f010p0/9qGM2s
	a95tfiVhZM2ni5zn91D1yNEHRhoesNXA6lFKLEoRfkyFLjyxyiGThdct7zLjMbXuSx1C6u7fw0s3R
	jK2aPp1louup79WS69Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pILyw-003OsN-Js; Thu, 19 Jan 2023 03:52:54 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pILte-003Mn4-89; Thu, 19 Jan 2023 03:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674100046; x=1705636046;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DN9kl9nqDA8ngQe1mVj5twRO/qn8yckmar+F8LondK4=;
  b=k+j56R4z3PJTOBcLjUcTxPF6YbIxTld29S65CwXB9dNzrRRYE+1fncUw
   cO/TCTqVTBkw1f74cWY8iEjMJcP7E+jmC1N6Q7BKvTupXFdijSJ6358DD
   aHYVv3EVXz76mv7MbxXh3mQ4Gl9YieiIVMPQaoQWtXGS9AuqBU4yRYOdT
   fI60k5hp2OjZ3qNSi/QAMwIE7RC3JjlZVrOMeAAzN14sYnVAu1JdInGrZ
   SOPJWdkdRPEBh6cttT5N22GvElNPCrs6vxhGGSPufE/iNEoZ/RSZ79iuD
   6Ry0u6hwV8/8cE9WRAL2zT83oPH8ZqTIDSh8Vp5amQAE/6B5FvXQLvI+f
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352436468"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="352436468"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 19:47:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783912734"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="783912734"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 18 Jan 2023 19:47:22 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:47:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:47:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:47:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B23v+HEAwwv+uv/mbPh9xKqMlue16qJ7diNE1oxk8xaQAYCWAtaZxpMOiR0yHFKLFzVTpDEaR2841eT3FW+jlPa+1D64YhFR02g4hhcYoVhVJFb4iIgF5YO6hV9wutVFF5PO1JR0sb3SAVIMov8ZL+dL8mNAp+Q1e9WEtIu86D4404wVGItIso+TZoZxLJlaqDnZWMmZatmr0nUPOoWd7H7uGn03K+N+B7/rZfedgR+/m65CMgsp56OMaB+62g2l+bH/h5FaE+t4vECFagu706NxvGqpjXq8bmd1nJzXuXJhBeFMDNZSQWt3AN/JpvYh6SYiEmuaSizsxjhou4rh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DN9kl9nqDA8ngQe1mVj5twRO/qn8yckmar+F8LondK4=;
 b=GuK2Gf0FXeIFZn3nv+k4xTZ2oy/W+e+/efDbwGNQ9flfl2WUM9y+8x9hw47lQrVCI9bmGViJtiKCgeLr6TdaExpoGnu11E9Mg8f194auLKW0mYFoVPL/3xf5zOnoqy9dJEP9HAQ1SBFb0c29ZCH5VxMkpCcFRbySlhb7Vskj6F2C30oYIOK2FxKXvxKVVAT1rjHTKdQJ2DirWQ3ywFKshheXEVGY7luJ/+CGQsIPEXVroukMOJfY4GdX0qAkYUoSWSNgWlTjeKwE/8LRoEF299x8ehhWV09ASFVTQFEUUGY0DOj3pG5h/QvJ4qL62Ul+dzs79htJHJeDKmzhCzUVug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 03:47:20 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 03:47:19 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>
CC: Alex Williamson <alex.williamson@redhat.com>, "ath10k@lists.infradead.org"
	<ath10k@lists.infradead.org>, "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-rdma@vger.kernel.org"
	<linux-rdma@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Niklas Schnelle <schnelle@linux.ibm.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
Subject: RE: [PATCH v2 04/10] iommu/dma: Use the gfp parameter in
 __iommu_dma_alloc_noncontiguous()
Thread-Topic: [PATCH v2 04/10] iommu/dma: Use the gfp parameter in
 __iommu_dma_alloc_noncontiguous()
Thread-Index: AQHZK2bius/8GLHPH0Wq7FV2W22SAa6lGolA
Date: Thu, 19 Jan 2023 03:47:19 +0000
Message-ID: <BN9PR11MB52766C5C3A4F6A5A3CD7374E8CC49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
 <4-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <4-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB6948:EE_
x-ms-office365-filtering-correlation-id: 673cb8de-254f-422e-7e0b-08daf9cfdda3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B6bnKcwoszx9W0T0vt9S1+tKdq0eP+oUskuaYtW5ySheWEcI7UWXgL5EgmIwQLn5g2GORH4YVMucKjBB/2e53hCc8E2lQ4WWAkrMcNPxW3SnKuc7CERHyfvcdgyoLMH1zNFpR9l3eYrbShAGP0XcYWZgUl7PbEu8ovNKKvooBSAeYwSIqckFyv9D5B1/mXE00WTn9sCmAmOJ8xuGx//uqaSUfpijkIYuaSdkJp+zNaDyYvKgzQoBd2xmG/8Pqyp/bq+1l7fz4jrXb3vSjuTqf4DfFXr/ArWFGxgv8HdqpnxuY19sTWWt8YmwlwmCxxI7Wd2rPvbbiLTE5X6w22b81oOrrg+oS587Fy3pga+AfdTW77ZOsqrwr6/UNP3qQg2JdEoybmYGL4WGp3ny4wjVYjvofW4CypPzj19sjS0SM+Tb0noaBNf9T/Oe/CJusAEIAFUaYkkuGJRU40DyjHgWBDD5GaZo7Pe3J5AZ2Tbpv4KicSV7y26Us66p34Npr1aBKXNCVzvBdX0d+F+sOPJh9ZeGmFfJiqXzC00PLwpcIvxBpjyEiEoFv7eLMW95/tLCO1MOuHzrWNQ9SUYavYSYvPqxsauK2TOg05+79IKMCr9HKP8/tnrXEI2jOofSf67lSL1FpgHkkvpVOUG1aKKszBLMDjpwtQb2vNc5B00huyceFFCzeSHakqUUac/xgpAybkSSuHzRSSPZd5q93jLVdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(6506007)(26005)(186003)(9686003)(7696005)(122000001)(71200400001)(33656002)(478600001)(54906003)(316002)(110136005)(76116006)(66946007)(66556008)(64756008)(66446008)(8676002)(4326008)(66476007)(41300700001)(8936002)(52536014)(55016003)(7416002)(2906002)(4744005)(5660300002)(38070700005)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZuHmyAlyV2tx/krIo2Oh31cQZckpSOTJe84y0kx5rO8ryHOpHRBVbyRg3C42?=
 =?us-ascii?Q?jxpL0g1APDWDAICAqSkXow2PiKJNJ2dPgjUQkNQyPq+vlUzx8mRczqGeKMgY?=
 =?us-ascii?Q?BdOsh60GVy7ZUA0zDS+er/KUz6W4/enEGROmZNNWbvwhKvkufXqxovrDpVCN?=
 =?us-ascii?Q?gQ31Nh6VZ9KXzqqNVjnJ3IZkCD6Jh+v0clSpvjQv7uLAnpphG+S8x79ZTf7N?=
 =?us-ascii?Q?CFzcxIABPz9GMn6Z5OYGeHAwySWWfe7j7nkV7tAXAuIJblDWdCR9G+wV06oj?=
 =?us-ascii?Q?Y/aVXo4FGQoM0n88DF7ZzFrxQ2GE9emBubMBtEhNmqe12mro/byRGW5SRjjw?=
 =?us-ascii?Q?0c/T08lgNGCw7y/6Z5B+pRrzGdhplKblTOJLAAaqZOyYTsAO/FG0UWCFApF2?=
 =?us-ascii?Q?8BpPGMIuMhtOkVBB5j8iNL6xPOtTQFbnycPKW3I85hVWNr5MUif9BDHUscrj?=
 =?us-ascii?Q?YLwZ/vTRxNvNKhRUDWJDDP928KH47RZwE60KCHdftR0DLiwb7m+f4IA/5kBC?=
 =?us-ascii?Q?WL/N90got0MmdrVTkCyCE9o0dOoB0bQ0wP+HDnyeDLeMhcslNO834lkJESYZ?=
 =?us-ascii?Q?W7BlI7yOQpsX5ZoP2Hi4VpGB+LuNFMGnf1XAIsjtIs6bKZRrh7jdFIr0ZTsz?=
 =?us-ascii?Q?6Zzvfq4I8ci/mgu4kbTHmQpu7ENiAo1OB89SSJ05IkwsaRe0uALYB4vnhiIr?=
 =?us-ascii?Q?yUSnqKxGL/spjqef2Ve23Un7DXgDbUHlonD2pb40WNMG03LciKsVQpoRWDnc?=
 =?us-ascii?Q?QXms8jesMatVVCiyXh2YsUXh+lU/GwkBRk57zJuup0wMKzb97W8dB2JAMFBt?=
 =?us-ascii?Q?aGK0gi2sjJVn62Qp+Aqd7CQszDC/j0G0I2URuOXx0zVF3Wiss5YnO4/TW6v9?=
 =?us-ascii?Q?hNkU5N6FgjlRjoeJpjXhADyhbZgKK15T0PgXUM6lHQ+YZBoIxno8EmOy7RZV?=
 =?us-ascii?Q?vEixHddreU49E9OCW0dH9z99+jrcPm2AXO3nS/4TT+uk5iKRxUwkSW00RDve?=
 =?us-ascii?Q?+nQJ5En6O1z7jJ4R4agppS+OfJQIGOjvDozoDJ5YcoIDVoAWy8TBl8BGxBKL?=
 =?us-ascii?Q?jQL1t40Jm34utSmCzbCPQubO2rW13wSXuO7D/de4Kdp1M6IAN0p/x+fYDyK8?=
 =?us-ascii?Q?Pz6SS8cfcJURQ5KR7gDgqoI5X+KiMk+gGGbi2NDRWxGVq8i5og+7qWgB+ic7?=
 =?us-ascii?Q?hUrxX+g4H1thYCR0Y5lp1aj7v4zdM+NHR/YW75jLS4zLelLUMjbIjwFPKgYG?=
 =?us-ascii?Q?q6gxfMXF1QoJLOXFmGMM+5CWOdYPZyozbQ2SuTnNgeAttc9j3qZCkWPtO++z?=
 =?us-ascii?Q?4iaJy0sn1LLDQzfYDO1DjlOtLFdpVCkh1LYqYGt9CsKlTPACsSs0xQDB04Ha?=
 =?us-ascii?Q?2PfSmRgYp4eXBmOIoTcFNwU1pDteXFeJwiOi5+3HyQ63rncjV1MUJfnAA5j6?=
 =?us-ascii?Q?2qyzuGnNJOTaw81HrLezu5owFZyxO1sH0K6iMoRRQ8MBLzQflE7iyoC8sB6e?=
 =?us-ascii?Q?+Ld/v/WcDzyVuLoxKJD1bxwzkGWMM51hsrEMVqMyqoge0A39PNHWBgnBFJA2?=
 =?us-ascii?Q?mYt1mepXkIlZkwQZW4wnaHts1Ai3KNIkkZtr24Na?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673cb8de-254f-422e-7e0b-08daf9cfdda3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:47:19.7747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jDv5ghg0b/37XlBqCWHyFfJMAFO83UqFy5UTJ0xJT9tx2dGuntua2eJmihjTL31QALmcgcybcUOD8MuQ7zCDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_194726_425166_8746C444 
X-CRM114-Status: GOOD (  12.99  )
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, January 19, 2023 2:01 AM
> 
> Change the sg_alloc_table_from_pages() allocation that was hardwired to
> GFP_KERNEL to use the gfp parameter like the other allocations in this
> function.
> 
> Auditing says this is never called from an atomic context, so it is safe
> as is, but reads wrong.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
