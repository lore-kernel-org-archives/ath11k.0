Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337D7C433EF
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 04:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27uSmrkPmn5uMweW3Urysuoe6LNrCpc9Opl7MG500s8=; b=ArbKglUR4nKdbx
	x5wcA9tKJjjcT7D+WmgBKrM5Gn67VmpWh1t/3aSfynRczawKSJPIkp/ZqPUjX1VlmtUIMnWXvz5p8
	0S+8ipD0UkOLDG24haOmBq0ZuzSOAOCeleCiPUw5BzPO/tSGiZJ5FG4P8b3Q3uYScACm1ZOahPOeY
	jSQN4tbZ8oDu0gwLTG/itvxKY/xZR/4LDi4NKBruehXhPaFgWvZR6oQxQJ9r/vGp9Z6o4HzUbMDMy
	sdXmfXQyPJMIgGYejfq4ZDh/FrcK5cRzJkGIgPB0Y6qxe8V5ZRqie72wrRzXHl+fa2DxVpaOt2gwF
	o96PKnuL/9Ktg/ctI75g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyqA-005mBz-L2; Fri, 03 Jun 2022 04:23:14 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyq6-005mB3-Nc
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 04:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1654230190; x=1654834990;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dStWJwcehBp6j73duiTjy7YXEG+PPXSIpMVQvCoTpyk=;
  b=CR50ao0cTq0WwQ6euuS8EgkF5xLStoimVJkXa77ydASCU01rl9EXxBrj
   H59LkdxEwehZiYpby3ThTwxhN8hubJZ8gCAKar/Bd81YKckHdUGPL5hvI
   gTe5AOgZ2Px4g+yg7QPXPLHUq3pte0v3oeFGkRCDkTuUCkmcIcK6QzvvA
   E=;
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 04:23:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncw4Qv+UINrUoLHffwXbFvQ6kYjFHQHBbi1JOMxsIYn9MYX4/uhU66T1xAX7TU4anh9mGJfqzM6yUEee7Tov71pyh0ke9EwpWnGfQIS6JWEEvZa9dBOmJebhWtA3Tsr+N++YF7+S7GZAmMjSO9n6Mdv9/zQjAd5Cjnr6aHzl1Zskw1hLdIPEOJhTdIkyhV6pXB2Epjk3rJ0znLeymi8q7iK52jCrVagVtgn16tfEC27d4AQjlsfrjArXO3IRkJ8fEIVESf5CpSfpkGOAwomTrCr09pVEZGyseI4RV9q4JwBUdMnvdICppFoTGYyo4t+EvYnGtr8PwgdOPsZ2XobnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dStWJwcehBp6j73duiTjy7YXEG+PPXSIpMVQvCoTpyk=;
 b=cgTxkGbJEJJG/RrqihkvbaBm3M/By0s+uqjlWYTZM3koiib/SGeZ262eZs8cXefOek8IlD9+eOZAQqcfu/6k+rSVOUjQoI28teJYsmto5OIAYyIC7EqWUHZ7JMmT1z+UieQHHDs6IBRozSP8XRxeJWIsfKCn3MOSe2gIuzqmFUr6CNFUrfYdUdHTbBPVE+w4Ywi2aZEjfSsM/83JDwIhV4GbnGLbWr+kcE1SSX0kuLQehcr7la4DwRVs5rH+T4jwV0J5iiRL7fdvs4DjbOmPVafzwAz/EjHOt+A3zm0ZHrBh3FDhbj/T+ANWM397ExU3wNzPTk1+FdfFT/SoVKJOTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM5PR0201MB3589.namprd02.prod.outlook.com (2603:10b6:4:80::19)
 by BY5PR02MB6033.namprd02.prod.outlook.com (2603:10b6:a03:1ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 04:23:04 +0000
Received: from DM5PR0201MB3589.namprd02.prod.outlook.com
 ([fe80::f5b9:2296:c8d4:764e]) by DM5PR0201MB3589.namprd02.prod.outlook.com
 ([fe80::f5b9:2296:c8d4:764e%7]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 04:23:04 +0000
From: "Aditya Kumar Singh (QUIC)" <quic_adisi@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Aditya
 Kumar Singh (QUIC)" <quic_adisi@quicinc.com>, "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
Subject: RE: [PATCH 1/2] ath11k: move firmware stats out of debugfs
Thread-Topic: [PATCH 1/2] ath11k: move firmware stats out of debugfs
Thread-Index: AQHYdj+uvGfmOr/9ekaKJGdgXcX7F608LtqAgADn4MA=
Date: Fri, 3 Jun 2022 04:23:04 +0000
Message-ID:  <DM5PR0201MB3589A92F02DBAA0A26B8BF8684A19@DM5PR0201MB3589.namprd02.prod.outlook.com>
References: <20220602051425.9265-1-quic_adisi@quicinc.com>
 <20220602051425.9265-2-quic_adisi@quicinc.com>
 <07248432-bf0f-e2d5-6ada-61c66337f295@quicinc.com>
In-Reply-To: <07248432-bf0f-e2d5-6ada-61c66337f295@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 880bc43f-516f-4d40-b859-08da4518c0c3
x-ms-traffictypediagnostic: BY5PR02MB6033:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs:  <BY5PR02MB603355A77FA2CE4D0B44B4EDF8A19@BY5PR02MB6033.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WujfyL9gnmVChocXoziD02H33N6ZvZFYYpZtLTA+8dzz/+s9GE24SwXp5Trl5uAitHEGKTJF/yKZh9K1MgLiobaSHPxXb+8qk2P84dBEAViXMb0gyq5Sx0uqhPef3hcA/UtZEcCeWYdmoK8FgOcoApal1vqqhjHj8JefUMX8l7gtJycmUNlZB+3fji7R7B92AaXn0E05Be/vljZ1p/0rUSSqjauDcDT53vhbDNjER45CjmjASuzghjBKNrK2yglUPKQpnmhrok8ABnlHBlVtNTIZvjq35yISI3W1ETtUli79wYaRc6kwzxYqlH5cz/cE1P4ev33d37ySsRT4es+9ffzQ34sxjSzp1CINRXU4lnz1va2DftkibnGPeWOTvaVbO0xiLmaB14TYy+QkJmoo2OwEWOh36hSHSJVueNlNkx8WeSXSnqb/naNy7f4MJtk/ko0xLphc9yKVtoZy+tMNizVa39qqnx848BabkASiucensBHgA0hVQ4hVvJV9hP7SVbmnsWP2wamCCgHjsnbQ5AtmaeJzzdEaUiTMMm3V3DCm0zwlUgOGZBU01qGm5UXrW83mWnWBGL/t8Xy7B/ZqAiv25YYYTsQlC+S0u9xXw4R/tjJ9g2dFdWE6XVUXT9+0krNNLZhVS4l8JSVyzHohrxHfO8ZcZtxfOOfCDLjZ8lh0pX/p7Ye6LuMVikbAfYWd3Im1nCssL0tCTTsYXNh51g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0201MB3589.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(26005)(30864003)(38070700005)(8936002)(71200400001)(122000001)(6862004)(33656002)(5660300002)(508600001)(9686003)(186003)(83380400001)(2906002)(53546011)(52536014)(7696005)(6506007)(86362001)(8676002)(4326008)(38100700002)(66476007)(6636002)(316002)(66446008)(66556008)(66946007)(64756008)(54906003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aUdULzlocmdRTmdPa0JxRnBjVFMwUkhvbytCa0U3OTIzQVpuR3FRajVad2lN?=
 =?utf-8?B?K0srcmJzV3NQNDlYakpmK3RCMEpqb3hZcmJKdE4zbGxvNkgyZ1NUcURvcXJM?=
 =?utf-8?B?dWN3SmxTdUxOTXlZVENpNmxuOVBGYURVdkNKdnFpVk5GdTAyeXk3WkhMM1pQ?=
 =?utf-8?B?ZFc0bEZRYTB1ck1ZR2tXVi8yMWw0OXhlVmdZTjNOMVIyTU1CMjFxUVVBT0t0?=
 =?utf-8?B?RSt4MXlqOFdNNHlodTNpYlV6ZHE5Rno5Y0FaMVZnKzZjTXVobHhWc1NxaTZU?=
 =?utf-8?B?VG5tMzc1NUdmTFNWQUFKRDRTTnFQSFVGR1NRMEh3Q2g0OVdyMjFvYU5VUS9K?=
 =?utf-8?B?UXdsdFQxMUg3K21obUt1c0FGbTg3ZDRoQUdnZkVBVnYzOGxrYzN3Wm5kL29E?=
 =?utf-8?B?a3RZT1RjSFdGWWNNTWM4NDc4QWtkRTE0YnFUSUFVd2h6NjQ3ZFJwNHVCeUF2?=
 =?utf-8?B?L2xNaVR3bWpNdDFnRXhHSE9lRlhkd052WXpZQVJIMWhGZG5LMG1HWjhZelho?=
 =?utf-8?B?WW1zT1ZaYjBTWE9PZUk3clNTYUo4THdPc3pPUkN2M0VyNkFTazBCdW95U0Z6?=
 =?utf-8?B?QmdsVzE3R3J1Rk9aVFNzYTlrc1hCRWEydFBiTzJOSzk0LzJwNlpJQnFEUXd6?=
 =?utf-8?B?SFVrVk90SmJxNVZZU2tQQ3FTQnBXcjM1SVEzMmp1YjVCUkY0ZDNRa3RsUlRD?=
 =?utf-8?B?SWN1a3V6TkZMUEpEb1BSLzhlT0dDcXZWL3hqNlRZRTRueW1FQXY3WUZqeFJQ?=
 =?utf-8?B?OFU3ejZwcmhiVVRiZDY1LzNqQk8xZkxlSTlxQ20wZEVHdVpEN0tHSmZTR256?=
 =?utf-8?B?dmtTL0E0RFQyOEduUlJRc1VsYWR0Tk85OFQ5UE9GWTZhRlBHaVdtSkxqS1ZJ?=
 =?utf-8?B?YkcwcW9lY0NPVlI1d2Jha2JTWC84Z3ZKSUdMNlY5bVp6cDg3ZVEvaDVsVXhY?=
 =?utf-8?B?QWp5RWhPcWYxMTJpMnFRRWJyVFNvSXZNcmtHSUJjVlBZVllOdHl2SHFsN3V4?=
 =?utf-8?B?UjkwYkg2dGpRd2lHY3ZxcVV6YjlrT2FpNFZKZTV5blJlUWhFSldMM3RHVG1W?=
 =?utf-8?B?Y2trbkdZUTkvSUp3Uk16R3YrdFRvVE1pTkIvTWpvY2orOHJLN0dZWXk2bmdG?=
 =?utf-8?B?ajV1NDQ0bnJnTmJ4TUNaS3hienB1dTJFNTYyeDYrSGlKZk5YRmFzSGZ0RFJk?=
 =?utf-8?B?bzJ2TWVsVWRoWDdyR0pDZEx0dTEzemFHNDdtZk1talFpdEgvMGhBd2l1NW1C?=
 =?utf-8?B?OVFEUjloR2N0QnpjMjZDR1l2aUFUVko0a1lzb1Rsd0puc0dQREJLM2I5dTNU?=
 =?utf-8?B?cHRqQmdwNzlFaVZNS1FTTDNJaTRIQXhwZW1YVFhiaDR4ZWlYU0FnbC85Z0li?=
 =?utf-8?B?a1NXNE9zMHdKTHk0MzdjN3pZeGkwQWtXUmpDUmI5ellvYVdlMnVUVEdGUDRK?=
 =?utf-8?B?blFVRkZwMWxrSDY2Q3JSQzVFVXZYdXRROGNwd0ZBdlBhVlovTkR1aEVQTTNw?=
 =?utf-8?B?Z0F4NzZ4Nml6bVh6b0k1RmtveXg1SWQ5Sy9TRFRvejNoajAzMEtiRDd1WThw?=
 =?utf-8?B?ZklxcWNWT0IrVTZTdGdERi9obHRLdEt2MFc1ekZqODQ1YXZRcVE2cTFnbXFv?=
 =?utf-8?B?aUNtNDNwd1ZZYzRaWUJ5QzFzU0dWSFhtVVJyUFhvUFl2SVJWUkd1S21vQWJ2?=
 =?utf-8?B?cWNlbFdKbmV6VUpoekRmak1PWWhsV212UFBtSkJiRXVYRG10eUlmanI4ek5Y?=
 =?utf-8?B?Rm9lWlcxbDRuUlhkSEo0Tk1LVkZzc2FFRDJZWGVBaEhTdHdla0pKUnptbWtu?=
 =?utf-8?B?STFDTzByeGJFOW0vak4weEE4cnErOTNuZ1ZpYjhqVnpnbG5Ib1NhdHlwN1J6?=
 =?utf-8?B?eEE3bkdhR0J2ZHA0cjUzSTVUeFNuTTZVQzNocEJUWmgyZGxHbnQrTnRLQ3gy?=
 =?utf-8?B?b1lpQTVUamQyZTlFUC9Pa3djcm42YUY1MTEyV0hqb3BSdkxxdm9EOFRxL0h0?=
 =?utf-8?B?Yk00UVJONFVvdmpEcmRBRVJGUDRocDZyTExuaXZ2ZHJkbTZzYWprblZVNlhH?=
 =?utf-8?B?OE1rMnZJRWFhZFVzUnV6SjloWmIrdm9JWml6Skd6MjY4UTl5ZGMzclhNN0hu?=
 =?utf-8?B?REo3T2oxTWNXZitxWnhwZGVZeGJ6NGdycnRTdUlqODRrWmpucXh4S3cvT0gx?=
 =?utf-8?B?SFlDUm9KdVNTa29hYXpnQ3hXcVM5d2lYMFdFcjJSM2F5QldJTUNoak1aR040?=
 =?utf-8?B?bFBFMXNKMjAvQkl3ekRwV3AxTVZvbTU0WkZtdXdKTVZ0RUFtajB2RWEva3VZ?=
 =?utf-8?B?bHlWS0xNUm9GcUpuQ0JsQWswOFBmeEdxcWdTV0VPV2J5OW9KSFIxUT09?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0201MB3589.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880bc43f-516f-4d40-b859-08da4518c0c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 04:23:04.1461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BNcbSFcsEAItedTH1Rin29iYlXpgnbMH39hzfkWHY/GZLIZsZJd/68a40c95rsQ6gZLKSRwluC0X63SxJrXN5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_212310_926131_65178E02 
X-CRM114-Status: GOOD (  19.55  )
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
> From: Jeff Johnson (QUIC) <quic_jjohnson@quicinc.com>
> Sent: Thursday, June 2, 2022 20:03
> To: Aditya Kumar Singh (QUIC) <quic_adisi@quicinc.com>;
> ath11k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: Re: [PATCH 1/2] ath11k: move firmware stats out of debugfs
> 
> On 6/1/2022 10:14 PM, Aditya Kumar Singh wrote:
> > Currently, firmware stats, comprising pdev, vdev and beacon stats are
> > part of debugfs. In firmware pdev stats, firmware reports the final Tx
> > power used to transmit each packet. If driver wants to know the final
> > Tx power being used at firmware level, it can leverage from firmware
> > pdev stats.
> >
> > Move firmware stats out of debugfs context in order to leverage the
> > final Tx power reported in it even when debugfs is disabled.
> >
> > Tested-on: IPQ8074 hw2.0 AHB
> > WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> > Tested-on: QCN9074 hw1.0 PCI
> > WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> > Tested-on: WCN6855 hw2.0 PCI
> > WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> >
> > Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> > ---
> >   drivers/net/wireless/ath/ath11k/core.c    |  46 ++++++++
> >   drivers/net/wireless/ath/ath11k/core.h    |  12 +-
> >   drivers/net/wireless/ath/ath11k/debugfs.c | 131 +++++-----------------
> >   drivers/net/wireless/ath/ath11k/debugfs.h |   6 +-
> >   drivers/net/wireless/ath/ath11k/wmi.c     |  48 +++++++-
> >   5 files changed, 136 insertions(+), 107 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c
> > b/drivers/net/wireless/ath/ath11k/core.c
> > index ca6fadd64b43..07a299a2e213 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -570,6 +570,52 @@ static inline struct ath11k_pdev
> *ath11k_core_get_single_pdev(struct ath11k_base
> >   	return &ab->pdevs[0];
> >   }
> >
> > +void ath11k_fw_stats_pdevs_free(struct list_head *head) {
> > +	struct ath11k_fw_stats_pdev *i, *tmp;
> > +
> > +	list_for_each_entry_safe(i, tmp, head, list) {
> > +		list_del(&i->list);
> > +		kfree(i);
> > +	}
> > +}
> > +
> > +void ath11k_fw_stats_vdevs_free(struct list_head *head) {
> > +	struct ath11k_fw_stats_vdev *i, *tmp;
> > +
> > +	list_for_each_entry_safe(i, tmp, head, list) {
> > +		list_del(&i->list);
> > +		kfree(i);
> > +	}
> > +}
> > +
> > +void ath11k_fw_stats_bcn_free(struct list_head *head) {
> > +	struct ath11k_fw_stats_bcn *i, *tmp;
> > +
> > +	list_for_each_entry_safe(i, tmp, head, list) {
> > +		list_del(&i->list);
> > +		kfree(i);
> > +	}
> > +}
> > +
> > +void ath11k_fw_stats_init(struct ath11k *ar) {
> > +	INIT_LIST_HEAD(&ar->fw_stats.pdevs);
> > +	INIT_LIST_HEAD(&ar->fw_stats.vdevs);
> > +	INIT_LIST_HEAD(&ar->fw_stats.bcn);
> > +
> > +	init_completion(&ar->fw_stats_complete);
> > +}
> > +
> > +void ath11k_fw_stats_free(struct ath11k_fw_stats *stats) {
> > +	ath11k_fw_stats_pdevs_free(&stats->pdevs);
> > +	ath11k_fw_stats_vdevs_free(&stats->vdevs);
> > +	ath11k_fw_stats_bcn_free(&stats->bcn);
> > +}
> > +
> >   int ath11k_core_suspend(struct ath11k_base *ab)
> >   {
> >   	int ret;
> > diff --git a/drivers/net/wireless/ath/ath11k/core.h
> > b/drivers/net/wireless/ath/ath11k/core.h
> > index 65d54e9c15d9..672701f40a6b 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.h
> > +++ b/drivers/net/wireless/ath/ath11k/core.h
> > @@ -545,9 +545,6 @@ struct ath11k_debug {
> >   	struct dentry *debugfs_pdev;
> >   	struct ath11k_dbg_htt_stats htt_stats;
> >   	u32 extd_tx_stats;
> > -	struct ath11k_fw_stats fw_stats;
> > -	struct completion fw_stats_complete;
> > -	bool fw_stats_done;
> >   	u32 extd_rx_stats;
> >   	u32 pktlog_filter;
> >   	u32 pktlog_mode;
> > @@ -712,6 +709,9 @@ struct ath11k {
> >   	u8 twt_enabled;
> >   	bool nlo_enabled;
> >   	u8 alpha2[REG_ALPHA2_LEN + 1];
> > +	struct ath11k_fw_stats fw_stats;
> > +	struct completion fw_stats_complete;
> > +	bool fw_stats_done;
> >   };
> >
> >   struct ath11k_band_cap {
> > @@ -1117,6 +1117,12 @@ struct ath11k_fw_stats_bcn {
> >   	u32 tx_bcn_outage_cnt;
> >   };
> >
> > +void ath11k_fw_stats_init(struct ath11k *ar); void
> > +ath11k_fw_stats_pdevs_free(struct list_head *head); void
> > +ath11k_fw_stats_vdevs_free(struct list_head *head); void
> > +ath11k_fw_stats_bcn_free(struct list_head *head); void
> > +ath11k_fw_stats_free(struct ath11k_fw_stats *stats);
> > +
> >   extern const struct ce_pipe_config
> ath11k_target_ce_config_wlan_ipq8074[];
> >   extern const struct service_to_pipe
> ath11k_target_service_to_ce_map_wlan_ipq8074[];
> >   extern const struct service_to_pipe
> > ath11k_target_service_to_ce_map_wlan_ipq6018[];
> > diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c
> > b/drivers/net/wireless/ath/ath11k/debugfs.c
> > index 0d4843ef9dd1..e4a2fd3da481 100644
> > --- a/drivers/net/wireless/ath/ath11k/debugfs.c
> > +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
> > @@ -93,91 +93,36 @@ void ath11k_debugfs_add_dbring_entry(struct
> ath11k *ar,
> >   	spin_unlock_bh(&dbr_data->lock);
> >   }
> >
> > -static void ath11k_fw_stats_pdevs_free(struct list_head *head) -{
> > -	struct ath11k_fw_stats_pdev *i, *tmp;
> > -
> > -	list_for_each_entry_safe(i, tmp, head, list) {
> > -		list_del(&i->list);
> > -		kfree(i);
> > -	}
> > -}
> > -
> > -static void ath11k_fw_stats_vdevs_free(struct list_head *head) -{
> > -	struct ath11k_fw_stats_vdev *i, *tmp;
> > -
> > -	list_for_each_entry_safe(i, tmp, head, list) {
> > -		list_del(&i->list);
> > -		kfree(i);
> > -	}
> > -}
> > -
> > -static void ath11k_fw_stats_bcn_free(struct list_head *head) -{
> > -	struct ath11k_fw_stats_bcn *i, *tmp;
> > -
> > -	list_for_each_entry_safe(i, tmp, head, list) {
> > -		list_del(&i->list);
> > -		kfree(i);
> > -	}
> > -}
> >
> >   static void ath11k_debugfs_fw_stats_reset(struct ath11k *ar)
> >   {
> >   	spin_lock_bh(&ar->data_lock);
> > -	ar->debug.fw_stats_done = false;
> > -	ath11k_fw_stats_pdevs_free(&ar->debug.fw_stats.pdevs);
> > -	ath11k_fw_stats_vdevs_free(&ar->debug.fw_stats.vdevs);
> > +	ar->fw_stats_done = false;
> > +	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
> > +	ath11k_fw_stats_vdevs_free(&ar->fw_stats.vdevs);
> >   	spin_unlock_bh(&ar->data_lock);
> >   }
> >
> > -void ath11k_debugfs_fw_stats_process(struct ath11k_base *ab, struct
> > sk_buff *skb)
> > +void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct
> > +ath11k_fw_stats *stats)
> >   {
> > -	struct ath11k_fw_stats stats = {};
> > -	struct ath11k *ar;
> > +	struct ath11k_base *ab = ar->ab;
> >   	struct ath11k_pdev *pdev;
> >   	bool is_end;
> >   	static unsigned int num_vdev, num_bcn;
> >   	size_t total_vdevs_started = 0;
> > -	int i, ret;
> > -
> > -	INIT_LIST_HEAD(&stats.pdevs);
> > -	INIT_LIST_HEAD(&stats.vdevs);
> > -	INIT_LIST_HEAD(&stats.bcn);
> > -
> > -	ret = ath11k_wmi_pull_fw_stats(ab, skb, &stats);
> > -	if (ret) {
> > -		ath11k_warn(ab, "failed to pull fw stats: %d\n", ret);
> > -		goto free;
> > -	}
> > -
> > -	rcu_read_lock();
> > -	ar = ath11k_mac_get_ar_by_pdev_id(ab, stats.pdev_id);
> > -	if (!ar) {
> > -		rcu_read_unlock();
> > -		ath11k_warn(ab, "failed to get ar for pdev_id %d: %d\n",
> > -			    stats.pdev_id, ret);
> > -		goto free;
> > -	}
> > -
> > -	spin_lock_bh(&ar->data_lock);
> > +	int i;
> >
> > -	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
> > -		list_splice_tail_init(&stats.pdevs, &ar-
> >debug.fw_stats.pdevs);
> > -		ar->debug.fw_stats_done = true;
> > -		goto complete;
> > -	}
> > +	/* WMI_REQUEST_PDEV_STAT request has been already processed
> */
> >
> > -	if (stats.stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
> > -		ar->debug.fw_stats_done = true;
> > -		goto complete;
> > +	if (stats->stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
> > +		ar->fw_stats_done = true;
> > +		return;
> >   	}
> >
> > -	if (stats.stats_id == WMI_REQUEST_VDEV_STAT) {
> > -		if (list_empty(&stats.vdevs)) {
> > +	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> > +		if (list_empty(&stats->vdevs)) {
> >   			ath11k_warn(ab, "empty vdev stats");
> > -			goto complete;
> > +			return;
> >   		}
> >   		/* FW sends all the active VDEV stats irrespective of PDEV,
> >   		 * hence limit until the count of all VDEVs started @@ -190,43
> > +135,34 @@ void ath11k_debugfs_fw_stats_process(struct ath11k_base
> > *ab, struct sk_buff *skb
> >
> >   		is_end = ((++num_vdev) == total_vdevs_started);
> >
> > -		list_splice_tail_init(&stats.vdevs,
> > -				      &ar->debug.fw_stats.vdevs);
> > +		list_splice_tail_init(&stats->vdevs,
> > +				      &ar->fw_stats.vdevs);
> >
> >   		if (is_end) {
> > -			ar->debug.fw_stats_done = true;
> > +			ar->fw_stats_done = true;
> >   			num_vdev = 0;
> >   		}
> > -		goto complete;
> > +		return;
> >   	}
> >
> > -	if (stats.stats_id == WMI_REQUEST_BCN_STAT) {
> > -		if (list_empty(&stats.bcn)) {
> > +	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> > +		if (list_empty(&stats->bcn)) {
> >   			ath11k_warn(ab, "empty bcn stats");
> > -			goto complete;
> > +			return;
> >   		}
> >   		/* Mark end until we reached the count of all started VDEVs
> >   		 * within the PDEV
> >   		 */
> >   		is_end = ((++num_bcn) == ar->num_started_vdevs);
> >
> > -		list_splice_tail_init(&stats.bcn,
> > -				      &ar->debug.fw_stats.bcn);
> > +		list_splice_tail_init(&stats->bcn,
> > +				      &ar->fw_stats.bcn);
> >
> >   		if (is_end) {
> > -			ar->debug.fw_stats_done = true;
> > +			ar->fw_stats_done = true;
> >   			num_bcn = 0;
> >   		}
> >   	}
> > -complete:
> > -	complete(&ar->debug.fw_stats_complete);
> > -	rcu_read_unlock();
> > -	spin_unlock_bh(&ar->data_lock);
> > -
> > -free:
> > -	ath11k_fw_stats_pdevs_free(&stats.pdevs);
> > -	ath11k_fw_stats_vdevs_free(&stats.vdevs);
> > -	ath11k_fw_stats_bcn_free(&stats.bcn);
> >   }
> >
> >   static int ath11k_debugfs_fw_stats_request(struct ath11k *ar, @@
> > -247,7 +183,7 @@ static int ath11k_debugfs_fw_stats_request(struct
> > ath11k *ar,
> >
> >   	ath11k_debugfs_fw_stats_reset(ar);
> >
> > -	reinit_completion(&ar->debug.fw_stats_complete);
> > +	reinit_completion(&ar->fw_stats_complete);
> >
> >   	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
> >
> > @@ -258,7 +194,7 @@ static int ath11k_debugfs_fw_stats_request(struct
> ath11k *ar,
> >   	}
> >
> >   	time_left =
> > -	wait_for_completion_timeout(&ar->debug.fw_stats_complete,
> > +	wait_for_completion_timeout(&ar->fw_stats_complete,
> 
> this is a case where imo the existing code was not compliant with the coding
> standard (descendant was not indented from the parent) so I'd definitely
> want to either indent this or combine it with the prior line
> 
Sure, will address in v2. Thanks for pointing out.

> >   				    1 * HZ);
> >   	if (!time_left)
> >   		return -ETIMEDOUT;
> > @@ -268,7 +204,7 @@ static int ath11k_debugfs_fw_stats_request(struct
> ath11k *ar,
> >   			break;
> >
> >   		spin_lock_bh(&ar->data_lock);
> > -		if (ar->debug.fw_stats_done) {
> > +		if (ar->fw_stats_done) {
> >   			spin_unlock_bh(&ar->data_lock);
> >   			break;
> >   		}
> > @@ -340,7 +276,7 @@ static int ath11k_open_pdev_stats(struct inode
> *inode, struct file *file)
> >   		goto err_free;
> >   	}
> >
> > -	ath11k_wmi_fw_stats_fill(ar, &ar->debug.fw_stats,
> req_param.stats_id,
> > +	ath11k_wmi_fw_stats_fill(ar, &ar->fw_stats, req_param.stats_id,
> >   				 buf);
> 
> there are multiple places in this patch where, due to the fact you are
> removing 6 characters from an existing line, a descendant may now fit on the
> prior line without exceeding 80 columns. consider removing the line break in
> those cases.
> 
> i wasn't going to mention these bikeshed comments but I see something in
> the 2nd patch that imo should be addressed, so you'll probably want to
> upload a v2 and this would be a good cleanup to apply as well
> 
Yes correct. Will address these v2. Thanks.

> >
> >   	file->private_data = buf;
> > @@ -412,7 +348,7 @@ static int ath11k_open_vdev_stats(struct inode
> *inode, struct file *file)
> >   		goto err_free;
> >   	}
> >
> > -	ath11k_wmi_fw_stats_fill(ar, &ar->debug.fw_stats,
> req_param.stats_id,
> > +	ath11k_wmi_fw_stats_fill(ar, &ar->fw_stats, req_param.stats_id,
> >   				 buf);
> >
> >   	file->private_data = buf;
> > @@ -490,14 +426,14 @@ static int ath11k_open_bcn_stats(struct inode
> *inode, struct file *file)
> >   		}
> >   	}
> >
> > -	ath11k_wmi_fw_stats_fill(ar, &ar->debug.fw_stats,
> req_param.stats_id,
> > +	ath11k_wmi_fw_stats_fill(ar, &ar->fw_stats, req_param.stats_id,
> >   				 buf);
> >
> >   	/* since beacon stats request is looped for all active VDEVs, saved fw
> >   	 * stats is not freed for each request until done for all active VDEVs
> >   	 */
> >   	spin_lock_bh(&ar->data_lock);
> > -	ath11k_fw_stats_bcn_free(&ar->debug.fw_stats.bcn);
> > +	ath11k_fw_stats_bcn_free(&ar->fw_stats.bcn);
> >   	spin_unlock_bh(&ar->data_lock);
> >
> >   	file->private_data = buf;
> > @@ -1055,7 +991,7 @@ void ath11k_debugfs_fw_stats_init(struct ath11k
> *ar)
> >   	struct dentry *fwstats_dir = debugfs_create_dir("fw_stats",
> >   							ar-
> >debug.debugfs_pdev);
> >
> > -	ar->debug.fw_stats.debugfs_fwstats = fwstats_dir;
> > +	ar->fw_stats.debugfs_fwstats = fwstats_dir;
> >
> >   	/* all stats debugfs files created are under "fw_stats" directory
> >   	 * created per PDEV
> > @@ -1067,11 +1003,6 @@ void ath11k_debugfs_fw_stats_init(struct
> ath11k *ar)
> >   	debugfs_create_file("beacon_stats", 0600, fwstats_dir, ar,
> >   			    &fops_bcn_stats);
> >
> > -	INIT_LIST_HEAD(&ar->debug.fw_stats.pdevs);
> > -	INIT_LIST_HEAD(&ar->debug.fw_stats.vdevs);
> > -	INIT_LIST_HEAD(&ar->debug.fw_stats.bcn);
> > -
> > -	init_completion(&ar->debug.fw_stats_complete);
> >   }
> >
> >   static ssize_t ath11k_write_pktlog_filter(struct file *file, diff
> > --git a/drivers/net/wireless/ath/ath11k/debugfs.h
> > b/drivers/net/wireless/ath/ath11k/debugfs.h
> > index 8fc125a71943..e45dc874ff23 100644
> > --- a/drivers/net/wireless/ath/ath11k/debugfs.h
> > +++ b/drivers/net/wireless/ath/ath11k/debugfs.h
> > @@ -271,7 +271,7 @@ int ath11k_debugfs_pdev_create(struct
> ath11k_base *ab);
> >   void ath11k_debugfs_pdev_destroy(struct ath11k_base *ab);
> >   int ath11k_debugfs_register(struct ath11k *ar);
> >   void ath11k_debugfs_unregister(struct ath11k *ar); -void
> > ath11k_debugfs_fw_stats_process(struct ath11k_base *ab, struct sk_buff
> > *skb);
> > +void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct
> > +ath11k_fw_stats *stats);
> >
> >   void ath11k_debugfs_fw_stats_init(struct ath11k *ar);
> >   int ath11k_debugfs_get_fw_stats(struct ath11k *ar, u32 pdev_id, @@
> > -352,8 +352,8 @@ static inline void ath11k_debugfs_unregister(struct
> ath11k *ar)
> >   {
> >   }
> >
> > -static inline void ath11k_debugfs_fw_stats_process(struct ath11k_base
> *ab,
> > -						   struct sk_buff *skb)
> > +static inline void ath11k_debugfs_fw_stats_process(struct ath11k *ar,
> > +						   struct ath11k_fw_stats
> *stats)
> >   {
> >   }
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/wmi.c
> > b/drivers/net/wireless/ath/ath11k/wmi.c
> > index 84d1c7054013..9c7a0a438b12 100644
> > --- a/drivers/net/wireless/ath/ath11k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> > @@ -7412,7 +7412,53 @@ static void
> ath11k_peer_assoc_conf_event(struct
> > ath11k_base *ab, struct sk_buff
> >
> >   static void ath11k_update_stats_event(struct ath11k_base *ab, struct
> sk_buff *skb)
> >   {
> > -	ath11k_debugfs_fw_stats_process(ab, skb);
> > +	struct ath11k_fw_stats stats = {};
> > +	struct ath11k *ar;
> > +	int ret;
> > +
> > +	INIT_LIST_HEAD(&stats.pdevs);
> > +	INIT_LIST_HEAD(&stats.vdevs);
> > +	INIT_LIST_HEAD(&stats.bcn);
> > +
> > +	ret = ath11k_wmi_pull_fw_stats(ab, skb, &stats);
> > +	if (ret) {
> > +		ath11k_warn(ab, "failed to pull fw stats: %d\n", ret);
> > +		goto free;
> > +	}
> > +
> > +	rcu_read_lock();
> > +	ar = ath11k_mac_get_ar_by_pdev_id(ab, stats.pdev_id);
> > +	if (!ar) {
> > +		rcu_read_unlock();
> > +		ath11k_warn(ab, "failed to get ar for pdev_id %d: %d\n",
> > +			    stats.pdev_id, ret);
> > +		goto free;
> > +	}
> > +
> > +	spin_lock_bh(&ar->data_lock);
> > +
> > +	/* WMI_REQUEST_PDEV_STAT can be requested via .get_txpower
> mac ops or via
> > +	 * debugfs fw stats. Therefore, processing it separately.
> > +	 */
> > +	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
> > +		list_splice_tail_init(&stats.pdevs, &ar->fw_stats.pdevs);
> > +		ar->fw_stats_done = true;
> > +		goto complete;
> > +	}
> > +
> > +	/* WMI_REQUEST_VDEV_STAT, WMI_REQUEST_BCN_STAT and
> WMI_REQUEST_RSSI_PER_CHAIN_STAT
> > +	 * are currently requested only via debugfs fw stats. Hence,
> processing these
> > +	 * in debugfs context
> > +	 */
> > +	ath11k_debugfs_fw_stats_process(ar, &stats);
> > +
> > +complete:
> > +	complete(&ar->fw_stats_complete);
> > +	rcu_read_unlock();
> > +	spin_unlock_bh(&ar->data_lock);
> > +
> > +free:
> > +	ath11k_fw_stats_free(&stats);
> >   }
> >
> >   /* PDEV_CTL_FAILSAFE_CHECK_EVENT is received from FW when the
> > frequency scanned

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
