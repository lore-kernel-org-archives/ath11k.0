Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A71EC43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gP+EF3QjOeM/sZlvMysbD47obZZQ0b7Np+tE31/OE20=; b=rYiOkDFjUtDuzu
	5ee04+V2N53r1sFGNRxk66xZ1VKT+C/gnwJ5yIuPKcJ0puSLBWVwlS1C5gipBurvkOU7ci91SK/Y1
	Oo9/R1DUMgn6KyRnLgKoNFPHac+8TZmFZG3At2/QRnw3PPJcI9il4JLEdXquFqh78DOQtt/fhiWdh
	mZ+M9VdEBKIGuRXwEHk/+dqCCu7PRSYLERnXV3AlRi14P4e+kjGs+9puwval85Lrsc3NHx8YIUF9i
	20QiazyRtqJ+GZVc9oKwsVnKJcqSTeJrM6GdkUYSWBE+FDOR7ELWGz15Uo6V45/+LQQWpAqpZ+q+h
	EhXRI7TksxnHyaEb/x1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2hW-006fMO-VN; Fri, 03 Jun 2022 08:30:34 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2hT-006fKZ-Ep
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 08:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1654245031; x=1654849831;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E/e3qcRvi4QKELu+Tt+2/p9KlQIocU8xzTvFQXHNPiI=;
  b=XA5CPRy6HUwJ94C2LXW3n0id4SEtOoX4y/26rSHqxz2LYc/Ncycs3BHc
   ZY3M/RmH3ClwneY4s3JYaol6P8ZFlwBHNvhrDkFnexPhuqM8pZWoUyVDE
   ydvJaScHATCjwpOLDm7vWql7jjOkQR92bBqEvAkDJ8MwWg+btdHlLggh5
   E=;
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 08:30:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isavwDt6ykL5MgBgZaA/2EKNGxTZm1pCK8Hrrj6Kj6Fm7ExSakUP10OPHNsfDc5pz85m9tedzDMWYgtvAnGBkCqxXuLzO7nwahBLI+fyvX6JtQB60kCkAoZ9G8a+PDn4qQweXSJyLgYfj2owMP/fAtFw8S5vJggw4ZiTiA57nS2HxaopMsLrGIF0XYslTRVS64LqPHjFPflyIeaKRatp5oRGEf1/NqaD35SCzxf0LZDCoQYjgx6sU5PV65CzokKVnX9tUN6t4TG8jPH3MbaSmVA4UxNeAhq7fyM9c7LSuQIU3n0LYrHKyrVzZZyE0fJewhE268ssJSjUsJiXqr16Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/e3qcRvi4QKELu+Tt+2/p9KlQIocU8xzTvFQXHNPiI=;
 b=PxnHbEz8z2jX+Dy6Y8ZS+BfF8ddVobfITukV/14YAUErqns3AHR72Q25gDHGpeZorn2lBNeafalouNz7KJjgmdgZSK0lSX2TNSDAB5z3nvspaV1kZCztiWEzMmG0yUcK/GMGjwMv5EUSu8fi3XNnszd4ckI/Sb3LYIgEq2dKa6bvUPczHK6mWJ+uMOLFRUNMD63cFtrjcunqaglvL5RhKlafqh85B3t/XZcgHQ4BFSfJnJB+ttq0Nz8Hcd5HTxnSGRqPAiFNVf4tKoQZnokDPWuJd+x08Y0W5Vg/TWGjF/APEF1QtRM582bTrrT10HtlqTtczEPjn1DJVaa7jVb0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM5PR0201MB3589.namprd02.prod.outlook.com (2603:10b6:4:80::19)
 by CY4PR02MB2839.namprd02.prod.outlook.com (2603:10b6:903:121::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 08:30:23 +0000
Received: from DM5PR0201MB3589.namprd02.prod.outlook.com
 ([fe80::f5b9:2296:c8d4:764e]) by DM5PR0201MB3589.namprd02.prod.outlook.com
 ([fe80::f5b9:2296:c8d4:764e%7]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 08:30:23 +0000
From: "Aditya Kumar Singh (QUIC)" <quic_adisi@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Aditya
 Kumar Singh (QUIC)" <quic_adisi@quicinc.com>
Subject: RE: [PATCH 1/2] ath11k: move firmware stats out of debugfs
Thread-Topic: [PATCH 1/2] ath11k: move firmware stats out of debugfs
Thread-Index: AQHYdj+uvGfmOr/9ekaKJGdgXcX7F609P/MAgAAb4TA=
Date: Fri, 3 Jun 2022 08:30:23 +0000
Message-ID:  <DM5PR0201MB35890931A39B89FB8E1A94FC84A19@DM5PR0201MB3589.namprd02.prod.outlook.com>
References: <20220602051425.9265-2-quic_adisi@quicinc.com>
 <165423896462.24941.15580147276579618500.kvalo@kernel.org>
In-Reply-To: <165423896462.24941.15580147276579618500.kvalo@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84e2cbec-ae72-46a7-3969-08da453b4dea
x-ms-traffictypediagnostic: CY4PR02MB2839:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs:  <CY4PR02MB2839BE20A5EFC362D4E902D2F8A19@CY4PR02MB2839.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7niAc/hRIltspjLNF2bCxl/Hc/uvaz939MBeLxk2DiUex/6spysVjK3NZwRYQJhAOE7uPQgiuhlviC9ijexUNHZjTrg3CX1rHN58nMzAH+ECEKVtHKYiiu4jlXx1RkcErYSkSrzvCYsuTXRIiTZSWIJ8k+iqLolNoE38xfZYUk/jGF3wLsDa/jw8d4ZgybwnMSqml+IknDxSYnEdD38nhTRk4Gc43X5BMbLaYoMEr3hMDUdi/M+sf5Kcsv+ehUQO1VZUOS1T4URi+rByPAfF5UQcSFWXJI5ZybYXeGp4n+JedL9cE87wLFvS7hDapSWY7vGAqY/XH4jUXxWd54rE8lmeAtDxV7gCJHme2sIcX/HQEEOsc86QgZLOcnl9BRr6PT00jZkY5+AVUIXq//9KPWzIde+nWfTGm/81HcNdK4RI192gV9MLZaq7fKe+bAJjTdxVxPGTIp3zKQGUGeKCDw1liyTFFXWMbZI2EUgo1A+bieI40CuJxpcsu6QwSg5Cw9vZYTd9eRq4EqLpUaC6ndRx4WEXT0CdeexgU6QL2AOkey9l/+T6t82axsluV2fMza9HhWI/dBqODbQxw1c+SlZgmdXRPD7qlfrWYLGoFOmbqH/yjNp6rw00dVX6mPzqxDCUBeIdoBzXe4qC/PXYu+2v5VzWKbyoGPGIMxq3MoaoPZY9EAD/q0poep+bbnvLzdthRp3L1nZVAn0yhEM3r1CIolx/JcSr/g2ZGLnXk1QgG7ZjONtkuhs/U583rCk1fIGfAYjq0IexdY6Rh4PFWbol4Lyigs+W2wtjFuhZgJU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0201MB3589.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(2906002)(66556008)(76116006)(66946007)(66476007)(4326008)(8676002)(186003)(55016003)(5660300002)(66446008)(64756008)(107886003)(38100700002)(52536014)(83380400001)(8936002)(26005)(122000001)(9686003)(6506007)(38070700005)(86362001)(966005)(71200400001)(508600001)(6916009)(54906003)(53546011)(7696005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WUZvQmh1cjJNSit0ckRFeHFOemdCcGExZWRiT0pVTC9xTzlyNzlJQU1YdWJI?=
 =?utf-8?B?RTg3WitmVHQ4TDBJRnJNWkRWYndyVStCdGlVZGxvWmRRQ0NLb3d4OFQxT0Y1?=
 =?utf-8?B?a0duRlUyd1VsaVV3WXdNU1djbjV4bjh1MEd1d1EzdjlNQTJ4eEFMZHExTkpU?=
 =?utf-8?B?eFJ0Q2RPUW9HaE9RWitBMENNN25GT2RzUHJvRHg4UDNnUzFtcVVDdFg4WG1i?=
 =?utf-8?B?VHh6c0UyYXRBOVdwa1JldXd6TFlKNEJGa2UwZGoySVBxYmxScWpPRkdvbHJC?=
 =?utf-8?B?dHBkTi9LeXhUT3Y4eDdXUjlpbk82STgvQTl6MHR1Q0JpbkRQYnljSk9ETWVS?=
 =?utf-8?B?ck1HeklVY2RyVEk3di92RlcrdVBuSTVwNkhmOE83eTRMZXFndGxVNGxDSTEz?=
 =?utf-8?B?eG5CZC82NXdPK0VjMFgwTnFFb3BOSEhDYUlpdGZ1ekhwakV6QzdXdDlYMnpL?=
 =?utf-8?B?Y0dWMEFaYVR5a3FsMG9DREFHSXFmMitWNlR3MjYvRksxaFd6dWtwRG1HU21W?=
 =?utf-8?B?TXlpR2hpNjhHRUViMlR2L3NRQ0xGRzJXdUlzZkNtNkJwandSV1JTbnB2RzFK?=
 =?utf-8?B?NkRONlFZQzJ4VzYyaldySFlaLzF6TURwMFVSQURMUG44OEx0ckFQRTNoNDJl?=
 =?utf-8?B?cnJXZlZQNHZSV3RkMVVoL25zSFluQ3k4cFN2N3huZ0RnRFZ0S3hjVkloOTFV?=
 =?utf-8?B?UXk3Sm1XODU3SGU3empFdlByTzV5allCcVQvUG9zRW1DYnp0UHRDYS84TExt?=
 =?utf-8?B?bDY5UFhmdVBtZ1pLS1J6NFIwVWEvRnlRblFYbXgrZkVzR3NkU25ld29ZZ2c3?=
 =?utf-8?B?d29VYW5GcG8ySEQ5b2xlMXU2Mi9ieTF3elpSYVRERHFBVVgvWHN0aFdxRW53?=
 =?utf-8?B?YjFwMzU3ck5IZUNhUEdZdzhhZVR2MWFDL1pjdHFBbXlWTWNlUGRpdGJUa2JZ?=
 =?utf-8?B?TU9uRVBOa1FYTUd4MTVrN0NtVnp0cU1PUjlVRHdjajVGSS80dk9lQWw2cFNs?=
 =?utf-8?B?TDQyRnJKVTFxQ2g3YWVoZDludFMydlJBRFFPaHRWUWg4WTdPcXBUTEhxcW9T?=
 =?utf-8?B?V0ppcGVwSFY5Y0RGMGtsK1E3OGlKbm5ydGs4b1Q3Q2oyZHNZUHhMSXZ2K3pP?=
 =?utf-8?B?T3BmYkhmTDVVU2NBTkVFMTZ3R01WQ05FZWVLN2E0L3Y3L1plUzRJYUpmalZh?=
 =?utf-8?B?UVRkVVFWcGJTd0hRRUNrSUQxbnZFMWRoWnpraDM5WkpEMjlhNGM3QkhkUlNr?=
 =?utf-8?B?WGV6dUtEOTU4b0dDK0p1MUJKaWgvam5yNEZ5OU43V3d3d2xMMHJ2NlNUVmpN?=
 =?utf-8?B?aGZyajBTYmxTVzllaFFUZmd3ZXhZRVpGSzdzaXRQSEkyaWwrNUlBcFcxSTVl?=
 =?utf-8?B?OGppSGtKbTRCbnBwaCt0MWl5VVZOTXptcmNoYnV6KzdQbjRVdjExem1JM3Uw?=
 =?utf-8?B?Y09DNDJKYUJKZFF3dEJyWHB3bVdYQjdSdkRBd0Y3N2s1b0xyaDc5cEpFMkd3?=
 =?utf-8?B?ZkV4bTIzMktqdHZudzhJbms0U3crc2c2YzhjeUdISU81LzhOYW0rWTRINXhN?=
 =?utf-8?B?b3JxaGdNc3A0blk5MnFKZG52ekZvaC83TjBaS1VoT01kUWpwMExqRjJvUjRo?=
 =?utf-8?B?c2ZqQ0pKcnVIRUs5alFCZTRTZGRpVUd4eURTRXVWUVd4UjlITkRZa05GRGhx?=
 =?utf-8?B?STdlbEdBVkRjZlMzT1RDdkl4MVhLSmM3NUQxcDBGSmlrdHNULzM4NzBacWNL?=
 =?utf-8?B?TThFR2Zla1N5SzRod3lKczJPTzVSMXRzdVFudW1xbUcwcTZhZlhReWRsbGRh?=
 =?utf-8?B?OGRiUmtyT1hsS0xCNVBPQW9XdHY1MnpNZXVMVnFTR1BJK09IRjRabVMweTAr?=
 =?utf-8?B?WlNtT3Jhd1g3dWJpa0VlRXNDWDE5aEZLL3JXaGFYQnc2Z2lRWWYyZDNQS3pL?=
 =?utf-8?B?NjhjREpIU2RkT2tEbksyeGZZb0pDN2ErUGxkTG51aDNlZ3R3Z2VWcEdvYXFa?=
 =?utf-8?B?QklBU3lrUHRaZTBkZmF3S0w1RWphOHRTOWdoMXFlWDNIcmd0dEVxL1BvQUZE?=
 =?utf-8?B?K0szaEVVWHIvWHE5YkE2RDhIcjhxcmNQMUNjbWFWMlA0b3dGbE96MktVZjEw?=
 =?utf-8?B?dSt4TFg1b2JwZGFQMTd6eW9RdFVHdzdjU3BEdU1xdUpJRE9ZSGpvQnVwYS9x?=
 =?utf-8?B?TXVGTFlMTms3NENQQXlEQzNCcEZMVmFJdFVoYkRBY09PSFUxUkpwamxXMHM2?=
 =?utf-8?B?WlN3QUsxTzFWUFpuMG5lSnRRdnVWNWY3dTBkRHJzTjFJejAzeDkvcko1RmEx?=
 =?utf-8?B?M2ZucEIvNmtyTXpjd0xDQllVSFdwNUREOHY3ODhWdmNZeWdkNXN5dz09?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0201MB3589.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e2cbec-ae72-46a7-3969-08da453b4dea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 08:30:23.8304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VisTKdXdFVp2HoyeG7BJ2ZUdRqfqzt5VH+AwRo8FuJRRcDKDW1PVuGxc7Nt+t3RokhApmG9J5QWDQISVKPb8/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_013031_614402_81CABCAE 
X-CRM114-Status: GOOD (  14.54  )
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
> From: Kalle Valo <kvalo@kernel.org>
> Sent: Friday, June 3, 2022 12:21
> To: Aditya Kumar Singh (QUIC) <quic_adisi@quicinc.com>
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org; Aditya
> Kumar Singh (QUIC) <quic_adisi@quicinc.com>
> Subject: Re: [PATCH 1/2] ath11k: move firmware stats out of debugfs
> 
> Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:
> 
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
> > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> This added new warnings:
> 
> drivers/net/wireless/ath/ath11k/debugfs.c:94: Please don't use multiple
> blank lines
> drivers/net/wireless/ath/ath11k/debugfs.c:976: Blank lines aren't necessary
> before a close brace '}'
> 
I have sent [v2] before your mail. But that too will lead to these warnings hence
I have rectified and sent [v3]. 


> I fixed them in the pending branch.
Sure thanks.

> 
> --
> https://patchwork.kernel.org/project/linux-
> wireless/patch/20220602051425.9265-2-quic_adisi@quicinc.com/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingp
> atches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
