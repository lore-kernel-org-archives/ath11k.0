Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F98C433F5
	for <ath11k@archiver.kernel.org>; Sun, 17 Apr 2022 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEIGPRZRHtjcOPpaDvlWvTo4e5d8obWvQElptP1fkog=; b=Lnvyq9STGIBGVy
	wZv+k1zfbryoYvN86SUWdNhjJIIKi2XW7fKQvkjSwgjTZhv3ZW7mA6m5Fi+6NP8gkW59ewCdZRlHq
	LxAxP6GdI+iqlE/5CRruQeaqt0UPOE+w/0bjiW8hssEt4G/sOlbsnzVwYuskxmYBILS3+uMD+Sayi
	yFBDhk3BFAy4T/CkbY88AFpOLBUoNvo1SxahksSg9EHiQXFAxdspx+pNJEoeQn8Syu2kD+tBPz5mF
	2rz5SLMlrIsCX1RoSPiBPF86XqdpWk5UBOrqiwClQYpV2Ow1hPJU3jyNmpg7bqp7A3DhRQXWDaUvI
	obo2GgkDdA/2u2P4SD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ng5v7-00ERTp-BV; Sun, 17 Apr 2022 14:30:33 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ng5v4-00ERRZ-7Y
 for ath11k@lists.infradead.org; Sun, 17 Apr 2022 14:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1650205830; x=1650810630;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0WDjaVo4sbkG8cSMWG4hRyCPkcD1MWwwGot509deogE=;
 b=zYJaCg0SmomL+NFZ22QF+aSlwExO6TAZrHgomBqXousPbwInBXFTK1Na
 NKKXH0sD3zAkVGOgAh0ka+L+OYYge8rLZJqMRivS8OTCQcRJ0fgotbB8S
 NIkn3Bt3PzwCMUxa+nQDZBK6jN+V44YksxW1skyvIX3o4p9vhet6pEDh4 M=;
Received: from mail-mw2nam08lp2169.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2022 14:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bC2Q+6VBkkk+LIfQJxedLdvMMsjmYqdOz45v8D+/8lPAvk0dV/Fi76qRkX1aLQcTH4VfrmngAFdiWYbJTcea9FOA0dMmAmIsLF4wDzPNG2R67pQap6xROJXaiJ9gM3ZzgtiDTz9Ra2MrWBxmQXttD3pHqIQANHUchFkYxp1sFanzkQYc03WV1pKw/KiSCs11SR9Q5QWGBUeW5sDz4MOCBbGmwVhehY66ZVZHCl2PVOtjASOKDx4Hyg/0Ym7xg/htsakGlZzy7iyQq9wbZmobWaaA6eLqtBZ1er1SnkNxG/2pEuQcdjawl/+nat+uMw6OytSohzflVMOev3Z7McnkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WDjaVo4sbkG8cSMWG4hRyCPkcD1MWwwGot509deogE=;
 b=NOI8trpPRYho3xklFD6/EImrW1k9LczzGc9hd+X+ofd0XnmKUX6ON0Y+ooUBdzWw2ZtTBHupoOwMmAVBEFFAZDRYDKuJvNwX/otTfzVC5Md1myfh9tdROn0qhRAVHWT4rLSS7HLoP/pD0riLM+PnSmGZWlcgkLmYzJzXFtmWP21PoLL2nIRcz8FCyjggE3JbPI1NzgQGz9QTe+imL4y/2zWxiqWJ+bVaAkytJlzlF5LbLPyUA0YhkISJKHCcO0XUSpVcgANp7znAomNtFQF8n3DB2IAZfnym6u1G7fTtGCogrcgWpJUEZMrdBntnOb8B4EAj26o/IkeIFd0oIo3+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM6PR02MB4937.namprd02.prod.outlook.com (2603:10b6:5:1a::16) by
 DM6PR02MB6283.namprd02.prod.outlook.com (2603:10b6:5:1d3::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Sun, 17 Apr 2022 14:30:17 +0000
Received: from DM6PR02MB4937.namprd02.prod.outlook.com
 ([fe80::955a:aab3:e6b:456]) by DM6PR02MB4937.namprd02.prod.outlook.com
 ([fe80::955a:aab3:e6b:456%7]) with mapi id 15.20.5164.025; Sun, 17 Apr 2022
 14:30:17 +0000
From: "Rameshkumar Sundaram (QUIC)" <quic_ramess@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>, "Rameshkumar Sundaram (QUIC)"
 <quic_ramess@quicinc.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: RE: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
Thread-Topic: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
Thread-Index: AQHYIkgqfAgpLdnS+EWoRYfPSRKpZ6y6KrAAgA9VNCCAAD8mAIAB5AFwgAAUnICAHtl0oA==
Date: Sun, 17 Apr 2022 14:30:17 +0000
Message-ID: <DM6PR02MB49379E377E3E7940540DF587E9F09@DM6PR02MB4937.namprd02.prod.outlook.com>
References: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
 <1644914581-21682-2-git-send-email-quic_ramess@quicinc.com>
 <a517835c51a5eaf00e87fdaaef47546f70ff0d42.camel@sipsolutions.net>
 <DM6PR02MB4937C53041172E9A52846A0BE9169@DM6PR02MB4937.namprd02.prod.outlook.com>
 <a537c6e02afbfa26eec2a54dbd8bc649f77ae3a3.camel@sipsolutions.net>
 <DM6PR02MB493734ADBBC6C996845B9EF3E9179@DM6PR02MB4937.namprd02.prod.outlook.com>
 <babc75d310031f9f92736d5da65679ca50542849.camel@sipsolutions.net>
In-Reply-To: <babc75d310031f9f92736d5da65679ca50542849.camel@sipsolutions.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec39a8a6-4743-4058-d9cd-08da207ecb7e
x-ms-traffictypediagnostic: DM6PR02MB6283:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR02MB62830BB440087AEADDCAD05395F09@DM6PR02MB6283.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 264nAKTAlQ0Nrnap6aqUo5oyzPHwFZvkoIlBbCC2/qnhVzZ57uoNdbycy2tPpEh98Eb2qJcTy8uxnrd/bWrKF+iCObGkubfIANEVKNvq1DckOo7Y1Syqa1MU/kOq9P0JBcTHkmwgdrzzql6JcFPY+9K1PbaII4nPnsYyh/bAQeImqK8s6c8AwwUnzaaj1NON0RhJlzLxwCpFQy/ktGKjoIxXgWVd/Tm1vF5px8hTaN/WYQHryCiXVIwWpaP71sC4cCreU4jIQPpdZv8+6ZS72L3kiyGpSIeFKcApP/anrEnPs/L68RppzzQQublxCE2qGPnF/CuHt6SCkPxExMl6tV3LfmuszRJGL8i2opiYt1GaRd4Dez4nGfEM1ltMQs8+JHf1p1vg1uIrWRjXkWeDBoLA/9tGMQNDkPMMPxrNF+4rPLuLapwqugpgBvixvK+z5dfM45yOOmR4AvwGBs3J+155S0KEU3hr5ffTJCXXxBM0tJ7sUfaw9GbfijBzZv+ITLTV63kBYzna9wzJZfrygEJeIC6L9F6d8DoWkkPzwDLs0bIGBOdDUUDnigGbO7D+/f48vTvcJtmEa3hmxXU6l1QjPg2MOE5uh4U10ZNvcwtlyjEEg9Brs3DpP3ibZjulfhRE7+eg914VeYOfTpdgdLfMaqccZbijxXla8bpbIlGLPSod1PiGV67IbWe25T2duvm8n9JjfGjMaftxXsi9+jTTucFifA3wn1b2uCco89A7gZVJ9zNn4ElxVnNWu3l4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB4937.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(38100700002)(38070700005)(316002)(66476007)(66556008)(66446008)(4326008)(64756008)(8676002)(110136005)(66946007)(76116006)(54906003)(55016003)(26005)(9686003)(2906002)(53546011)(71200400001)(33656002)(83380400001)(52536014)(508600001)(8936002)(5660300002)(6506007)(186003)(86362001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDJVWW0rVTZOMVFGR1RqZ1E1VEw4cUEzOHNoM0hiL0xmY01VLzhVU1RteFZr?=
 =?utf-8?B?aVlJWWIvVnY5TmlRTmlNSUtuU2lqV1lHY05ZSkhiaC9kODBpei8wblVOQ0Y1?=
 =?utf-8?B?S3c5dHovTTQ4Rm92WmRWenFMdU5VWnpjdDk3eVdWWTVPd2FQcHVlUEtBS05u?=
 =?utf-8?B?aHVKWEdLK3AzT09QRDl6L3dRVVE1Z0FUaGZUbExRTFBHYVdIdmFkSlBEd3Vi?=
 =?utf-8?B?bjU2VExJS2V2M0loVXk5ckJUbUlGUmxhelVzdytjWHZLQ3hPcFhnN2lLdC8z?=
 =?utf-8?B?cTNwRk1LOG11ME5nSjltN2U3Rm5JSUYwRUZzTWtYZzI0TVM1bGxicDRjRXpE?=
 =?utf-8?B?YjROR3Y5RERsMFoxdmlsTnJCdkpmc2VlWE5PNHhCbnIxZ1NtK0NRSTNJNmFV?=
 =?utf-8?B?VEszcjk1b0RVM1h1S3FyUFc5bGFtZmc5T3hXd05ZTlNOMWprN0pCSW9TU2N6?=
 =?utf-8?B?WW10cnFCUmoxY1pCaXJkckpteXVRc2RseVd3c1U4TEc1YlJSd2swVXB1NUJz?=
 =?utf-8?B?bHNrcElqdVJTeThaeWZNbHg5MVRUZmdad3dJSUI4c1F3KzRiaGV1YnU4b3g2?=
 =?utf-8?B?Z0JjdTgwYnNieUIxUlZrbzA0QjFqV1AwL3BCdFZUNmlaNzZJUHFNWStmOWV6?=
 =?utf-8?B?NEtnV2g1dzhtMzdBTzNacy9FQm1LcUhJQ3RTL2xYbDdQdTh3clRSeStqeXB5?=
 =?utf-8?B?ZEluRUNicWxHcEtzaGpndzdFWmdyMTlGMmliRkdjTUNVRm1LVVJwcUtEMURK?=
 =?utf-8?B?cCt5anhMRG1FaC94RHZGQ0g5K2tXWUcybHVNS2JzakMyRGZpUWJLTWhxdkVw?=
 =?utf-8?B?d3ZaaUZ6RFdmNlhKZVE1MnZTUUxEenU5Tyt5SFVuT0RsK0pBZkxJQU11SWxU?=
 =?utf-8?B?SnJHS3E0Zm5TZHB6NThSeWcvQWZiU0ZSZ2Rmb042QzlicmJkS3JzZ3BVS1dM?=
 =?utf-8?B?S3BqMnpuejdSRkZrT3dsckoyeW5BSjJta0V3MHhSVmExTDFwT25BbWR4bm1R?=
 =?utf-8?B?YWp6MTF2dkdVVnloNHBWRFdhN25GTFo3RVNsUnp1MnprbWRxSFRqYTNqYVk1?=
 =?utf-8?B?WXJDOUdEeVlYRnFEdW5UcDRTMmdmV2dTOUNwamt3KzVYdUQrREZBMDhDd2tT?=
 =?utf-8?B?aUl3N29vL2FVdGdDcE9qNitqQjhLbXlqMlRZZXkxa0wzaHlEZjlydTYxeVhu?=
 =?utf-8?B?bkpaa1h4STRESk54RnBZbVA5UUViM1VvbDB5REFPM3h1aldSZmxzL3dRcm5n?=
 =?utf-8?B?OUhXSWtIUXNVUk1qZWlKOXlqaU1pSUoybnBmdUltZEQrTUxQdkIwZFRESDFZ?=
 =?utf-8?B?c1h5cDQrQ0REdTY2M0ovMTk1Q3BPWDR3VHhHUHVpcnRLUldZWUdpNFVkZUR3?=
 =?utf-8?B?bmkzZmUzRUZUVGtqSDluTXBQU3hWM21OakFHVmtYZ0FlamFHMGRlNzZlN2M1?=
 =?utf-8?B?L2FCY1JFNGtVR1Qyd1dkOWVtTnVCSWlCSDRPVXUxVUJGOWRkb3lrZVNwTXJx?=
 =?utf-8?B?U0JISFFoK293b3ZYSjUrZFBoZXpuTE0vZVNya0RadGFpZHNtR2NqOHdTMGND?=
 =?utf-8?B?MUV4NWN1UHpyZFJxK0Y0YlFEUjRvT0M4WjYzR2xzc3ZKQkJ2cmFMUWIwd201?=
 =?utf-8?B?L25ieDRwTkRaTEk4OWRRbjZxa2FhZ1lTNFM0eThkc0tLME1PdHU2emNiLzRz?=
 =?utf-8?B?TkZoR0s1MnpuUmpqQzVxSW1mRFFQVWZnTHQ1d2d2ZS9wcVB1b3pFTkcyQzV6?=
 =?utf-8?B?L0w4REhsYTQvQmcyQldhVGVUc3V6MmlIUkZ0TWxQVVBsQTU0aEMyKzRZU3VC?=
 =?utf-8?B?VVJxTlBPNVlyQ3J6cG5JZUp0TTVWeStlNGZtcllFTDBoY3ZVTUpZTG1WNmxw?=
 =?utf-8?B?SU5BdVkxalAya3dMdUFTSXFzVEhJSkRoUWdFRWdhYWxwNy9tc21OakV0c1Nk?=
 =?utf-8?B?UkUrVjB2SFFINkNKYjVVSUk0WC9vOWdVRTNlUDMrVVg1VUhleEhpazk5dXdD?=
 =?utf-8?B?TlVuK21lMmt6d0FFQ0x6d2dKRzZncVV3MUNlLzVYUmpHNTMwTGhuQ05HbURm?=
 =?utf-8?B?RFpKYjRzQjNWb0VHSkU3c0t3cmpaUDFwd0drUVZaaUZwRG5vQ2orUld0bTRF?=
 =?utf-8?B?K3dYM2FCYkpRdFJDMlREZXd3eHpXTnA0dEVPR21RK01nTFRMM0VvNzFXZUpU?=
 =?utf-8?B?UFpKTHZ0U0p1ejV5dW9YWHdYMklhV1VOb0JSelVvUXI4OFp3bWlmd0NBWElJ?=
 =?utf-8?B?VWgwSExJQ1REYzByZlRsKytzeTBhZ2g5QXdlbmhFYnJjQzdrZEtlcGtRaGdj?=
 =?utf-8?B?TkFqTk15a3krbHMzcWJVWW1uMHg0U1lXL3BYZnE0YUJjQjlaWkFsQT09?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4937.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec39a8a6-4743-4058-d9cd-08da207ecb7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2022 14:30:17.6059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/6RVoOa9Mzz8XnWpy6Phw2vpyWmZddRSxtQ+TkCu5KG0gcZdpwInRh5VwLLKtpYEvEorgbFmnCkxdBdAJv1Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_073030_379861_0C716143 
X-CRM114-Status: GOOD (  15.32  )
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


> -----Original Message-----
> From: Johannes Berg <johannes@sipsolutions.net>
> Sent: Tuesday, March 22, 2022 8:34 PM
> To: Rameshkumar Sundaram (QUIC) <quic_ramess@quicinc.com>
> Cc: linux-wireless@vger.kernel.org; ath11k@lists.infradead.org
> Subject: Re: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
> duplicate transmission
> 
> WARNING: This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
> 
> On Tue, 2022-03-22 at 13:50 +0000, Rameshkumar Sundaram (QUIC) wrote:
> > >
> > So, Suggestion here is to add a new NL attribute to carry the
> > information from user space for START_AP and SET_BEACON NL commands
> > and use it here, is that understanding correct ?
> >
> 
> Well, I was thinking it would reasonably come with the beacon rate, i.e.
> as a new attribute like NL80211_TXRATE_DUP?
Sorry not getting this, you mean hostapd would need to send new set of rates for this configuration ?
The expectation is that user-space will set this bit in HE oper IE only if legacy rates are present in beacon or basic rates.
> 
> johannes
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
