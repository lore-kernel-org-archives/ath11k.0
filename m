Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD32C433F5
	for <ath11k@archiver.kernel.org>; Thu, 10 Feb 2022 02:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHDETF5K5furxSLn5V/fC4nC7jTJbo4nUm33lB3ydjE=; b=db1fMBSIN1sMT7
	moc9fYsgLA0/6TZZQkQeChHhqzlicF1h42SM86I93jf9oojW+tWuoIpJyeREpeEIpswtsFVjuqzHr
	I1TtoeEjKFIUh8rAoWeutE58SF3dDgRwsuNg6yqTorFEsDFbYqvEHPzmaMlF/BiCCfK5+p5fQFSyq
	uckVKQ9GkqkG6GAPk7nQdapyp8IfhnSAm5r2B2h3TRtptw/gwIT1ssggBedxU1hCdvnZlC7HibOAd
	UHJN9JYE7n2UdQzkpZOmsScp3MKuQhy/Eleu9WgLa+vncZB39tFyqar2SSe9kk4PQ9xL+vZhtto2Y
	fQgjj6oTMvUurI7DsD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzT6-002K2C-0c; Thu, 10 Feb 2022 02:46:00 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzT2-002K1e-PJ
 for ath11k@lists.infradead.org; Thu, 10 Feb 2022 02:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644461157; x=1645065957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OcjHwpEDGgN390xJiFmaPz+P6SLPK444HCnvDl8eDRA=;
 b=Jx0W9SX8FVyEkrzlZ1iYgHXctOcHlEyN+hoaS8uOnFF2/O8Xe7frgJia
 SRsRFXSd/+aulezb2l9shRKoZDDnD5CgPqWZaiqG42h8nrt3ndJv/jO6s
 fBuRb0oD372HwzQn9gysrreM2EXKIawRd8DvLlkm+FZKkAVk3QCOeFGKd g=;
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9AExNWSAB4OPUnxzziEbN0WZGvUJRAv5Ppt+fg+prTZTnRV4G46rXrTfAkzf2v6PLlLI70V1lGebW2X2o59jmjtfDAqt1f8tfl1E+D/dWYdd5tqG33svC9bE0KLAQ+y24/0K5xtAoeRaUds/+yHflOA3u7Eu4GJu3OI3Sc575SZUrvIIb4P2GzBjqY5wZQe7Ywoecn7D947oogUl2j4WhbcQwEfmFQDCqTAjn293YMH9rKPxAuhgB91r7A7GyKLZKi0hPvr7flQ11WsFKkfhE0knph7TZmXw6aVaSA0g1ZIwkC1NH3vnGyAMYCikuMAlYC4M1MTEfJV1H8IaiEEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcjHwpEDGgN390xJiFmaPz+P6SLPK444HCnvDl8eDRA=;
 b=l/QFJf4dFi7uULM6EWE7NLxgW6SbIXvKIkxdbPmRaYJN02Rs309zdal5aOm61J5pK4/GGWaXN49m9u1901263JHWjIgXD3trKzQrMBfq1E+SOceS3gdoI4Vx2NbgZLaWualD8So2ikdy0aqCJa9eF4A2xbfiHGkkPMDCz+R/jVivG5parf6AvpsRwitqIKe0nb+mMr84DccU3EpFWnTW/lUaJIJ/2+4fI73KeCVF8Syq4sucZc26zNBQAtlisPVqqxD16MmYCNE/PogqUfeFX7syiJhsKCxHuEWcMBRgZuDQs0rFJboDitUvZoKNAPsRFk8iZ0PnzrMxJqUb5mpmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR02MB5430.namprd02.prod.outlook.com (2603:10b6:a03:a4::25)
 by SN6PR02MB4414.namprd02.prod.outlook.com (2603:10b6:805:b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Thu, 10 Feb
 2022 02:45:48 +0000
Received: from BYAPR02MB5430.namprd02.prod.outlook.com
 ([fe80::8dd4:65b2:2135:1ee4]) by BYAPR02MB5430.namprd02.prod.outlook.com
 ([fe80::8dd4:65b2:2135:1ee4%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 02:45:47 +0000
From: "Baochen Qiang (QUIC)" <quic_bqiang@quicinc.com>
To: Abhishek Kumar <kuabhs@chromium.org>, "Baochen Qiang (QUIC)"
 <quic_bqiang@quicinc.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] ath11k: Reset PCIE_GPIO_CFG_REG register when power on
Thread-Topic: [PATCH] ath11k: Reset PCIE_GPIO_CFG_REG register when power on
Thread-Index: AQHYHhpj0UFeh4PMskyNPKMBRWX31KyMFGew
Date: Thu, 10 Feb 2022 02:45:47 +0000
Message-ID: <BYAPR02MB54302CD5FF7C8C38710A4B83E02F9@BYAPR02MB5430.namprd02.prod.outlook.com>
References: <20220207093023.10605-1-quic_bqiang@quicinc.com>
 <CACTWRwugAHA87-AuEkC7tXEEuOhef_FrWBjjk4pQXZvpmHQ65A@mail.gmail.com>
In-Reply-To: <CACTWRwugAHA87-AuEkC7tXEEuOhef_FrWBjjk4pQXZvpmHQ65A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d8484c2-d5e9-4c12-01f9-08d9ec3f716f
x-ms-traffictypediagnostic: SN6PR02MB4414:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB4414EB263DA36C7DA5F7417A9C2F9@SN6PR02MB4414.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YNu7QZb12QHIik8eyWmMg/lajE2iIKtQ3Z8KPD8aWE4//YfqDeofCNZfDo/0cjUIAajsmHjB2tCDWDtLBBnZ6MSWQBR7Y6kxeNnC+55WaHAY0bUAQwgEtIbx4FrhBhc5aom6v0zPA8+Y9wmrQmzeY8yLmg2aw6dEWsHIBldhmivRvhVNwjoGqjbvYJRrjVfqRSs4Zxn0BfmyaVJupT5rMjGbHSAXTEXFxQ3GpAXhzmhGUb0YFEtmIg1m4dOLJfJDQuL4EtJRZK2wvi7HQPzrLppzGb0KF9l1p0E90OelWjeAQE0vHvG5M7s2O108XzIEHYOg+9V25qTgwlmSdvf43HWA7wI3zjnz/XY9X3id6PC02tI7pm0jSeOPwOjqekfD6pONjcq49O8iISILNAYDHpAi1iKw4iY1gHasZuhVzc9qAUr6rpGqGk9dB+52KmnONXVmjtN1ozL9QkQDicLknxk1tHn1znP/HXolNGsvUqbJ9XZfpO7cl2u+4dN1CeD9PrO7ux+amx1Kb2bpWlnEq2b7zEMX06rD2+qeuEwg4Bao3MtBbqx6xoY+6rpzzleCFoOQ+i1ro8IJvbJcSWhmoKwxMzWRIp/qurI6/K7RuXJIViMhg1NPaxFJKrJGOrPFo0Nq6wBMZG4VJ3Kb8k7ewQApRHy1/vuAlLtrzdWMJsJkXaskKoMb9GFIZBKU/z2hDDAJTZPSql31gGQ7/qNluQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5430.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(8936002)(508600001)(71200400001)(110136005)(316002)(54906003)(38100700002)(83380400001)(5660300002)(2906002)(52536014)(9686003)(8676002)(66556008)(66476007)(186003)(26005)(55016003)(64756008)(76116006)(66446008)(33656002)(86362001)(6506007)(122000001)(7696005)(66946007)(4326008)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WCtWQU0vTzN3TnpCK21vZUpsZkZEN2tBNEt0U0x2ek9ESnpNNzN0K2F4OTI0?=
 =?utf-8?B?V3ozd2h6bGJ1MmRTZUhFclBRSXp1d2x6SHhpay9ndVNkRmk5ZnRFTitORGxv?=
 =?utf-8?B?b3psQ1dlZWNHNm4yZzJBY2orQVBQQ29oVlRsUnZjU3RVNUZRUlZnYUxmVkRi?=
 =?utf-8?B?b1V0VkMxUFdBelpXM2VjMjMzRFl1R2dLdFVsNW5FWHB2ODcwN0NUWk1OQWlt?=
 =?utf-8?B?aTQzZ04rWTdwN1NrSzlKeFl4V0dJZTJJcVlQYnBOUWJOdW9hSDUvajlRQ2VN?=
 =?utf-8?B?WmJ4NnBpOCtWSUpiTWRxaUZqRWtORHU4OWlYcVdvSzFobUZzamhnSWZkOHpp?=
 =?utf-8?B?WlVnS3pFZ0xybHN2Q2pieVdHZDNHazRQdlJidDNkUHlobHVwSm5iUWxoTG1H?=
 =?utf-8?B?Z01WUVMwbXZTOGV5T3hsUW9HZHJQcno4NFB3VGJLdUpsM0dSV2xTZEFqNHEr?=
 =?utf-8?B?ZHQ1cDRkRXljU05ORkx4TmR2ZjQrV2hmUGlnVG4vTktqVTNORG5wR2ZxZ2NV?=
 =?utf-8?B?S1VMQm1IdHFGdDl2dlNkTjlLODJVbXRjVWcvRHE1VXBzZFBZNmR4Y3F2R3Iz?=
 =?utf-8?B?SFV1ZU1ESi8rY3NmU0tCVkk2Z3ZWVUF3NHZxWktnS09FUXVzVDJKc0xQM3N5?=
 =?utf-8?B?T0tVQ0JPb2ZIZDJIVElTY3hOa1JLOERabXlnNUpHb1p4VmlOdFVvNkpwK1BO?=
 =?utf-8?B?djhGdVIyc3ZnQ2lYZXdpS1FmbDMzdzNZL3ZWWS9VY3BwUGpHOXJHejRIVVpB?=
 =?utf-8?B?bXRMNkJObXNhcVhQaUlzR0JTUnIzRTVZdEIyWkp4bVlpWEtIa1ZYQTBqaFRZ?=
 =?utf-8?B?RC9ZalRNOVhtS3lZaWZSK1grT2hJbklLM0tWU0hOTFljOWFEczE0UlloQmhI?=
 =?utf-8?B?U2g0UW5YYXdWeHk2KzRZZEhsZGNCck1EYWdQeXJhRW1zZy8rL3BqTm9NcEI4?=
 =?utf-8?B?ZlZhRDE1UVBmU0lLUVViZ05pckhUbzVBaWRsTzMxSnVHK0k5ak1mRmdZRkov?=
 =?utf-8?B?Q1RvOGQ1Qzg5ZUJQR211M1JKVzRiUGpvWm5laGt0b2piaDRMRTM0elpMNkVY?=
 =?utf-8?B?VThBSkxhOUVVZ1gvVk9GMzhIaWZRaWpObWhZSGM3OHoyVXhQQ3Vzd2VoZ0Jp?=
 =?utf-8?B?ZHk0OFNOeWpHUC9KZ3BCbDdYOXhrVVpGdWVIeUtTall6UkhCT25YandleEZ3?=
 =?utf-8?B?OVFwVEk4ZXVmWGdHb2Y4WEhFWjl1eExPMUxGb0dweXdnSHh3czQrNUM0UUR3?=
 =?utf-8?B?SU5jY0JmK1NVQzYzUnZXUXFvZjlaM1dGNTJEUTFMdnVHUnF3bkc4aHRWekdU?=
 =?utf-8?B?RXVUVVJEYmpzK1NDMlVkQnp4dHpOR0NsbmdZRUlFVUVJZjFiZnVaQ1d0Tm1h?=
 =?utf-8?B?d1NaMER5czJnK1FRdEZxdXJScVAxRGNtWjR0cnQwMjBPOFNwTUN5U1lJNllQ?=
 =?utf-8?B?dHNmYjRqN1d4dFN6eWZuRm1JekYwbEZiNVhuVEZ4MFBwZDVRVVRNNXBrVmtn?=
 =?utf-8?B?WjU2N04rbnFtcjdueFlOa2F0NEhxaWJGbVhyekw4K1JlU3M4dHlCc3NLZGFF?=
 =?utf-8?B?dkc1K0VmRk5TNGJpSTBmUTM1VDQ2dVhxeGhJajROTEpFNFNuSERKN1E1cktq?=
 =?utf-8?B?bEswVEdYb1NETW5mdHo0RVk1NGlmZ3BCQURLd0lxS2ZnYnp6SzN4c29ZZ1B3?=
 =?utf-8?B?cEorMURxSTB4RlJKMWFiRUtGbk9Fd0h2aU1LR3JBOGt5ZStzL2xINmY1cWdP?=
 =?utf-8?B?TFNwZ2g0VFp0S2YydVd1bXlpa0ljZkQwbUo1Q2grc1cxZkYwaVlmQmFLTG84?=
 =?utf-8?B?Q3RDRERLdEU1bkNpK1p5QjBOYXRsODN1allIYUJxMXFrc2M0d21MSUhrN3c2?=
 =?utf-8?B?YW9OZVk4ZzF3QWltRWJpV0NzM2ZXSjF4QVJNU1lpTkVNVXZNZWJkQTRjN0Fp?=
 =?utf-8?B?ZUh1cUVrcmhpUUdWUSthSFUrMVlrM2sxUmlneWVSdFhKbEJLdWVuK1BLTWZH?=
 =?utf-8?B?NHlHUC9zTjZBQkNrbG1nOUdHUlhQOVdRUEhTZ2VYR0E4TEtqRmpGMHVjQ1lI?=
 =?utf-8?B?bmhuN0Y0RjhoTktzRFBsVk4vOXR4T0lDQmViL2VWd3ZXeUVwUzhWdUMwUVFk?=
 =?utf-8?B?eDE0SlllNDI3UDk4RjF0MUcwaVRxQmlVZG1Kc3hGaVc4SGpxaEpwMU1RRXc1?=
 =?utf-8?B?UXc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5430.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8484c2-d5e9-4c12-01f9-08d9ec3f716f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 02:45:47.8581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F0cTwVuFNQRZGWrZaO4rQmqkR5z0ZT0T1wF8JFk99+7vouCKbwnKuKiIIdNphD9J8GSsnJfVr+tJ09G/2hLXQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_184556_933457_9473DF66 
X-CRM114-Status: GOOD (  25.04  )
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
> From: Abhishek Kumar <kuabhs@chromium.org>
> Sent: Thursday, February 10, 2022 9:05 AM
> To: Baochen Qiang (QUIC) <quic_bqiang@quicinc.com>
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org; Abhishek
> Kumar <kuabhs@chromium.org>
> Subject: Re: [PATCH] ath11k: Reset PCIE_GPIO_CFG_REG register when power
> on
> 
> On Mon, Feb 7, 2022 at 1:41 AM Baochen Qiang <quic_bqiang@quicinc.com>
> wrote:
> >
> > On some modules, PCIE_GPIO_CFG_REG is not initialized to right value,
> > this will cause WCN6855 hardware fails to be enumerated.
> >
> > Fix it by force writing the correct value to this register when power
> > on.
> >
> > Tested-on: WCN6855 hw2.0 PCI
> > WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Can you elaborate how you tested this ? I can see due to this patch shows
> resource temporarily unavailable after running simulated wifi crash in a loop.
> >

Could you please share build info?  kernel logs? Your test steps etc.?

> > Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/pci.c | 11 +++++++++++
> > drivers/net/wireless/ath/ath11k/pci.h |  3 +++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/pci.c
> > b/drivers/net/wireless/ath/ath11k/pci.c
> > index d73b522a0081..06968ad488b0 100644
> > --- a/drivers/net/wireless/ath/ath11k/pci.c
> > +++ b/drivers/net/wireless/ath/ath11k/pci.c
> > @@ -445,6 +445,16 @@ static void ath11k_pci_force_wake(struct
> ath11k_base *ab)
> >         mdelay(5);
> >  }
> >
> > +static void ath11k_pci_gpio_reset(struct ath11k_base *ab) {
> > +       int val;
> > +
> > +       ath11k_pci_write32(ab, PCIE_GPIO_CFG_REG, PCIE_GPIO_RESET_VAL);
> > +       mdelay(10);
> > +       val = ath11k_pci_read32(ab, PCIE_GPIO_CFG_REG);
> > +       ath11k_dbg(ab, ATH11K_DBG_PCI, "gpio cfg: 0x%x\n", val); }
> Looks like you have added delay before reading which gets printed as a debug
> log. In this case, I don't think you should add the unconditional delay and read
> the register unconditionally but rather should do only if debug is enabled.
> Thought ?
> > +
> >  static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool
> > power_on)  {
> >         mdelay(100);
> > @@ -461,6 +471,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base
> *ab, bool power_on)
> >         ath11k_pci_clear_dbg_registers(ab);
> >         ath11k_pci_soc_global_reset(ab);
> >         ath11k_mhi_set_mhictrl_reset(ab);
> > +       ath11k_pci_gpio_reset(ab);
> >  }
> >
> >  int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector)
> > diff --git a/drivers/net/wireless/ath/ath11k/pci.h
> > b/drivers/net/wireless/ath/ath11k/pci.h
> > index 61d67b20a0eb..2716fc7745d6 100644
> > --- a/drivers/net/wireless/ath/ath11k/pci.h
> > +++ b/drivers/net/wireless/ath/ath11k/pci.h
> > @@ -52,6 +52,9 @@
> >  #define WLAON_QFPROM_PWR_CTRL_REG              0x01f8031c
> >  #define QFPROM_PWR_CTRL_VDD4BLOW_MASK          0x4
> >
> > +#define PCIE_GPIO_CFG_REG                      0x0180e000
> > +#define PCIE_GPIO_RESET_VAL                    0xc5
> > +
> >  struct ath11k_msi_user {
> >         char *name;
> >         int num_vectors;
> > --
> > 2.25.1
> >
> 
> Thanks
> Abhishek
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
