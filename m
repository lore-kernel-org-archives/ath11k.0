Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E5DC77B6C
	for <ath11k@archiver.kernel.org>; Wed,  5 Apr 2023 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbujsujvJfBgYu++ldenOmZfRAXRkH/p/L0WoaupBnM=; b=ejjk6xWaY/Lmai
	a8nXviPiiUrTHBuJ86l//8sp48tWVwHiX+CZ1YEbXcd2FMrxjnQFmUKwFmLXqeM2MAnS8uU3HR1E2
	eIirve1OG2SI1DkfbBZHgAQdUuvQzVck7jsCh5O1jzQBJOBAip1Wcy3IozTzqRH0shB82GLvsGO7s
	UBJ8pYskdCrCMd8YI0aJqIYYfaImhz2ULRUNZjkSgI1390VvgJfXp/b5TA9bamskHZWqe1EiRxnJC
	XdDdcUUAqaaUI69/vMN8uw4gR7Wb38oGhqffTqfKMNhb0bW9+NXTjJ1Z5WtRDlxu6SnhCIz8MELcM
	wRJqobiXIHQgiIhToiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkA2f-005fzy-0j;
	Wed, 05 Apr 2023 20:47:41 +0000
Received: from mail-dm6nam11on2062c.outbound.protection.outlook.com ([2a01:111:f400:7eaa::62c] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkA2c-005fzJ-0E
	for ath11k@lists.infradead.org;
	Wed, 05 Apr 2023 20:47:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1jsMfzBv7FrC771D5HawEgqFKgpnKtzO4ho+vANObgqyWpbcTlww9ZSVCgYsNnunrozJ8EjVJSXeMNEpag9S+byTrGNyFauaK95rXsXy/weisZt7PeQyinv2phwznyI0gCPFkKFMqnWZgDFUUM0tzOBebiXH6gi0L2Yz2G92toY5PfLFrJXdTALQcL/XvOITiCxrEnXEK1YCtEGMC7BJEz4CzBvdQiVDPfG+7yFtJNRScuxsGCUGMfdimoDZxZg2aichFLQscjBPMMfz+hZw/eBh5ylnq0umKnIuhSQHrjDBOfGeXitg2ppLRko0sbUGO2s8Xdr9mWbtUbp6EcQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVm69r/ZLcJuOwjQxANksU2NBot7plm0KCCt5W3gxFM=;
 b=UwBLoJIHNriO4mUH88UoRFw5R4u5QFpOw1BdmI+nQQ6grr0lwAARiSnoAesL6cq8/XKc8wjCq5MRCPVVWw3yC41eITTfu7uTudPtgLYg4mMBreFnQBBV+I6MaSMG2+1hEc0fagmpmGVWGpmJpCTC1tS2rEqVeF2KKLw6jpIY1YY2PW7akzm8zHckGEtqp0r7py0jAsostcmKtH1Hv2W/t+sBtPrd90JFKnZjoMHklyU6ohgHMg1zdzbomYnYWdO9xsk2esD6/STw+KXpwtXmozEZIyKsX+KA3HN7ymeVGA6RBYEb2hFe2HmmHwsAmM278K3CYYtK6FtB2tlCH4ihoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVm69r/ZLcJuOwjQxANksU2NBot7plm0KCCt5W3gxFM=;
 b=qc7/I0hc5kGbprsUgPeGesIx0spg5eTHmlgyyAQokYaUAwoZDpiIL4ZaAjI+JHnxHnd5/nZ3kwzz34QDCMECvI9Hl7RdZHapu4U5zhw/bEKEXt5QA4aQMnh/j6VvxCT68fvcD16S2KayrM6rA5eLwe5tZQsm/wxhN+pYF57emhY=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37; Wed, 5 Apr
 2023 20:47:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6254.028; Wed, 5 Apr 2023
 20:47:34 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Kalle Valo <kvalo@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] wifi: ath11k: Add a warning for wcn6855 spurious wakeup
 events
Thread-Topic: [PATCH] wifi: ath11k: Add a warning for wcn6855 spurious wakeup
 events
Thread-Index:  AQHZRXOqXg7kg0s2bUm/zBYW2vp/U67ixXn5gAAIeYCAAAIvs4AAAR8AgDn2UjeAAKzFUA==
Date: Wed, 5 Apr 2023 20:47:34 +0000
Message-ID:  <MN0PR12MB6101F8C3E851055F03FA37B7E2909@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230220213807.28523-1-mario.limonciello@amd.com>
	<87r0ubqo81.fsf@kernel.org>	<980959ea-b72f-4cc0-7662-4dd64932d005@amd.com>
	<87mt4zqmgh.fsf@kernel.org>	<805fe9f0-7dbf-4483-9281-072db3765ff6@amd.com>
 <87lej6aak5.fsf@kernel.org>
In-Reply-To: <87lej6aak5.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-05T20:47:32Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=0cb5637b-2ed8-436b-879f-f1faad0d1f1e;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-05T20:47:32Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid:  3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid:  845a419b-542a-4096-bca1-7381b0941ef5
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SN7PR12MB6839:EE_
x-ms-office365-filtering-correlation-id: eb052a14-1982-4d4f-d1f1-08db3616fba8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  LxiEkgRo6oxuPjmHxha3hrn81B/H4zL5by2iq8wRMxw25uWjPNnnu0BfeybaXmGIMh7DnQyckdTFfGVGTPIlUgO+OBDNnQNhpDsD4UBdYPa47u2OoZUxMIFP0YMCiamnjLfeW/770xngFIp1MZ0eYz7IDgXIscx3hR3uZcRWFwawD9rmwg2jja090uuwl3abLknkiWi9yhSl0JnFBx7y+NY8WD16+LqLkvINzmo06YJvSRtlBCiwQ7JYYIG6kmQcKRlg1U2qyoVtoznD7nqNnfS4KtRNGFaQ3iUc2oMnd4nzmngrRH/6vicnj+6U/VwIxcECIEsKvRzVCbrL0ltZIbRvgczv1rKYXh6JLuwyPe24Vx3SI2aAMxjrLofoP4izGiWvcZ0AT6SgbhvqGGohV5ENk3nH05+EZqtXDqi+/4ZFn0TaN+AbqOHDiQc75xaeF8+OTORAhh/5fh7QWUO58a5clO/JXbYMcPwrS7AWMXfeHDGSiCcAl6OOkpqUY0SKifDQ5F4U5brSgnj1xEcbOJluookMA0mTnKw4S0YdXjjM5XdNRNjtN722mvrHJceD3spCgnlQC/DZMTPAm+QD1GIKf0Ai/lTCMeHVGtaBOXw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(86362001)(38070700005)(33656002)(2906002)(55016003)(7696005)(71200400001)(53546011)(83380400001)(186003)(6506007)(26005)(966005)(9686003)(4326008)(8676002)(76116006)(66946007)(66476007)(66446008)(66556008)(64756008)(478600001)(54906003)(52536014)(5660300002)(122000001)(6916009)(38100700002)(316002)(41300700001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Xp8zlMgootCA/eGas1nYiw4Wo429dOEqgphIqwwMy9v4gJJoWfKopK2A8eUP?=
 =?us-ascii?Q?0ZhiNJrDqGahNJLV0+kVnrKUCTYSlePVghYTZc7gB85P/6WflqX+6nMurK8W?=
 =?us-ascii?Q?TiU7FHw9QsGRgBltbKrr56OTnb2ViQHvFBLbtFmIHe4WHqvjV6+TAMCQDXjM?=
 =?us-ascii?Q?5wJFPJ2vqkpOwSf9teU81MsiO4ERpxrywlxmpxdldZouy/Vkxkz3qQYA4i6Y?=
 =?us-ascii?Q?ZZJiCQmiIvPaHLWaf/fgpOpv1yYkcA2xr1B283T0p/TxnPwqEZNm1XW3cy4M?=
 =?us-ascii?Q?MENHYtLhxlc7ex1mAb0uiDiveWpWCyfPf50ZuB6bsPgY7jubCxXymn4osBAI?=
 =?us-ascii?Q?NHNtqbLXzp2IZbJQCspOtfOd/aTmOlIDKwp6v7OZWMOcxw2c/kkQ33A2K+Hw?=
 =?us-ascii?Q?Ip4HeYNiv/4KjOh8aALcmYP1nLcDlUozxYMpC+9x0M3PCrZMDXe22oN5dL85?=
 =?us-ascii?Q?bXUnkkh+DrgYOMcWS0MEnYMBJ5haCLMtxrTHq5aW7jro4gZsQwSBPt5qUYN9?=
 =?us-ascii?Q?98HFd4DNW6AsUi6NeR8pURonlzGlV5jv+evoSqaRFkliGWeMfdE4NZtCiuQa?=
 =?us-ascii?Q?OVw+ae/v3mEbX49Q/s2rcXI9XYRKLh45WvF5cd5mEe8PvtVoSNjcscVyKcl0?=
 =?us-ascii?Q?I54vYhHG06eGGDK2mjSeF7j3biyw4v7cuINqqBkUG8tXsNrYtIvPkw4u7NTO?=
 =?us-ascii?Q?UM83/aQMsgTq/fX13zUr2v6hO6zNaf+mD/XQRvKAxe1Dn92GEhFMqtF1+UZV?=
 =?us-ascii?Q?7yBpd9tHb6EX/HW2R2u7XhNFw/w4g6PSKy8A+XMV7SIwrYEJCdESDbHA9hN4?=
 =?us-ascii?Q?V6spwF2knJH4gNDy6+dwNH6W6bGGq3ql5TPFh0yxjwaCjF14xZCv7Z331ldr?=
 =?us-ascii?Q?evleItFTmmDvFarpQNaOboA5uSWFNPQH0Llupp2EREeZdyF+ET4o5FW+vQAL?=
 =?us-ascii?Q?ImaWSwy7TQIinNza2/OO8iW7DUGUkAXhaK6eeHyP2N9QZ/Wg8XPrCz4xNsMe?=
 =?us-ascii?Q?0eDjpL6dK4Ou2oC3aDTTcCpVUqoz/v/JZEbnd2zAqI6C3rPkD+eNtxV1upCe?=
 =?us-ascii?Q?Igids4lVzL/c0xWBdVEhV7Q08UBw37AcfVOhwSDsFkjvBruqLZyz/mEwgXO0?=
 =?us-ascii?Q?8aT8uoZUbxNK2zv0sbqAPiE7GlWIwFWoLeGDCu0LwzV6DyBhYlDLmG9Z1+R3?=
 =?us-ascii?Q?rS54262I/kJ0UtnU8CyWGxzV358WMKjm8Po7Cn/Tyg2rxRfGxKKjUBQNSId6?=
 =?us-ascii?Q?CKDY9fXk7nCHYnDjWokdu4WKzkTccXShdZM9QN+gXLE9yGuMburXgcntDCh7?=
 =?us-ascii?Q?OEGFBLgoLzY6mRcJjvutx86iqa5STO1L9y2Ai/OPk7WMIMHAxDjUfsQ2hfSk?=
 =?us-ascii?Q?OU6nlBog4j8G/FMU+Zk8l1khEqYK50EzdlFaNhpptXKVl4rqk2P6f1FElbLE?=
 =?us-ascii?Q?8Jpm046I4XqJjtPRPOnyV96c4R7pX2UFPOB8mKyqCgyghUSihhWPZvL2h+Ly?=
 =?us-ascii?Q?xL7x6K3we0+HBu2q5VtY38hiqcz2Ajc4i1yep0LoqDV0d370uOxwETSjQrrL?=
 =?us-ascii?Q?a2IJY9+c64xItAq/D7s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb052a14-1982-4d4f-d1f1-08db3616fba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 20:47:34.1984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZNXbZZlynEaDg7tbBK7p3hGNnWaCwqbLMjoK41PYbBPusWbHAvEQwFpkHIb0jO4PewZV5MoZUsVXPwwyDEnKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_134738_138494_750B80C0 
X-CRM114-Status: GOOD (  31.86  )
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

[Public]

> > On 2/27/23 07:14, Kalle Valo wrote:
> >
> >> Mario Limonciello <mario.limonciello@amd.com> writes:
> >>
> >>> On 2/27/23 06:36, Kalle Valo wrote:
> >>>
> >>>> Mario Limonciello <mario.limonciello@amd.com> writes:
> >>>>
> >>>>> +static void ath11k_check_s2idle_bug(struct ath11k_base *ab)
> >>>>> +{
> >>>>> +	struct pci_dev *rdev;
> >>>>> +
> >>>>> +	if (pm_suspend_target_state != PM_SUSPEND_TO_IDLE)
> >>>>> +		return;
> >>>>> +
> >>>>> +	if (ab->id.device != WCN6855_DEVICE_ID)
> >>>>> +		return;
> >>>>> +
> >>>>> +	if (ab->qmi.target.fw_version >= WCN6855_S2IDLE_VER)
> >>>>> +		return;
> >>>>> +
> >>>>> +	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0,
> 0));
> >>>>> +	if (rdev->vendor == PCI_VENDOR_ID_AMD)
> >>>>> + ath11k_warn(ab, "fw_version 0x%x may cause spurious wakeups.
> >>>>> Upgrade to 0x%x or later.",
> >>>>> +			    ab->qmi.target.fw_version,
> WCN6855_S2IDLE_VER);
> >>>>
> >>>> I understand the reasons for this warning but I don't really trust the
> >>>> check 'ab->qmi.target.fw_version >= WCN6855_S2IDLE_VER'. I don't
> know
> >>>> how the firmware team populates the fw_version so I'm worried that if
> we
> >>>> ever switch to a different firmware branch (or similar) this warning
> >>>> might all of sudden start triggering for the users.
> >>>>
> >>>
> >>> In that case, maybe would it be better to just have a list of the
> >>> public firmware with issue and ensure it doesn't match one of those?
> >>
> >> You mean ath11k checking for known broken versions and reporting that?
> >> We have so many different firmwares to support in ath11k, I'm not really
> >> keen on adding tests for a specific version.
> >
> > I checked and only found a total of 7 firmware versions published for
> > WCN6855 at your ath11k-firmware repo.  I'm not sure how many went to
> > linux-firmware.  But it seems like a relatively small list to have.
> 
> ath11k supports also other hardware families than just WCN6855, so there
> are a lot of different firmware versions and branches.

Right, but this change was explicitly checking the device ID matched WCN6855.

So it could be a single check for that device and any of the 5 bad firmware binaries.

> 
> >> We have a list of known important bugs in the wiki:
> >>
> >>
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k#known_bugslimita
> tions
> >>
> >> What about adding the issue there, would that get more exposure to the
> >> bug and hopefully the users would upgrade the firmware?
> >>
> >
> > The problem is when this happens users have no way to know it's even
> > caused by wireless.  So why would they go looking at the wireless
> > wiki?
> >
> > The GPIO used for WLAN is different from design to design so we can't
> > put it in the GPIO driver.  There are plenty of designs that have
> > valid reasons to wakeup from other GPIOs as well so it can't just be
> > the GPIO driver IRQ.
> 
> I understand your problem but my problem is that I have three Qualcomm
> drivers to support and that's a major challenge itself. So I try to keep
> the drivers as simple as possible and avoid any hacks.

OK.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
