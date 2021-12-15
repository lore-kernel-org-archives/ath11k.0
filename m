Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB46C433F5
	for <ath11k@archiver.kernel.org>; Wed, 15 Dec 2021 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uj9Mvxzzv+8F3RoD2R7EAlcUekbs/Nc5c4V+DVMjyMc=; b=vXDlDQ0ZPD3WxR
	7nD8PxMYUcRVFwzgOITBHUEdrwa2zRv4ydSzGiOnMsyTvFJi6jFmZ6qEh0emLqbfLTWr1NZRa0P+a
	Pmt1Fufkoe/G8yMvXGGcjqN9CHhOlWbBUU9Equ2E+W8NGZ6OqJGTELTPANkzhEEmOr2jHJssyKVSN
	hYzggvlBpu2xQRzQo3S+hpo6wL6fRczBaJMTcf3YqznQSyhezeZovig12OPtKlxXyp2gdGWTXfaiu
	b6i6xZbTu5L1q+eIu+f1h70aM55pDHeqzjN87cp2LjSJqExwdrMeAzrhIuuxf6fUnWikTmCx7k0MA
	tfP8Y3p4hrvkwqoUOImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxYIG-0028Bl-T4; Wed, 15 Dec 2021 17:42:20 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxYIE-0028Ay-3I
 for ath11k@lists.infradead.org; Wed, 15 Dec 2021 17:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1639590138; x=1640194938;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=P8sZr6sd5e5D2FPG6O1AWv822Nn8knXRvskBZImmZ3U=;
 b=nBVzBL3sgFtZdyrqHk3xlahj5eGLJ3hORvaN349m62zuohz4gkhRp/xO
 tek2dhREzfnFXbKLj+5phdhy+se2e4JO1cMlU3pXzbDE686RYMWkDoUdI
 xBtJpeG1PK5I7Wzu+6q/YHxwzILk6PSbzr1Pr0W6FYprEleL1BfiqCn4m 4=;
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 17:42:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOJvw0gVGNLghmiqg2qrIk+91HGtocNVYuzfirhKlNJ97lcKGHXnxy+XFalXThEdHpB8/uq3BfRhOiWIXq4wQRveK0pd7Hr41R6t9EfFgbpPYjsv1i1F+CMD6VSV+sbBwmFXGkOoCgVPeBoUjfUb3ozsEDrPvmDFO8v1OIjF/+Y1Rb3u7IInAADZWz7/L2xdC4YyFiavO0ySOYrdf6hCawfWLQYVefmt01PqQMIGUauMd8YbAmr3zpARuKxb3akpOKGH7aRMAQVGeSN7ifgZG4Gr0ypGymFhvRHftdLJU29tNdvPpNqAfEbEStSf1nJ4pPg9+O0Cs4alwMCbslTLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8sZr6sd5e5D2FPG6O1AWv822Nn8knXRvskBZImmZ3U=;
 b=AkQGgY4Fq/j6zI5f6D6/LjZkT+juvfhgoD9TGWw8ZdJKzibSxMBlwejv7kH/z4JaG7AH7GUQPeUB1De5EhlCoexMCXaC7pT43NSjR5N06ymp+1TN5aj2FTjzprLkw16LvvMBa8FtmHFmVWmLMpx9eVl+dwfryCJivIJzHFWQsebulDDhAiv651m/+85Ngw8fGUXvVL9MgicpfpCztJRNp8VCREbz7klcl5lHxanr4HGltOyz8592uszR+HSlPy4+5FLFu0dicWJ02xfEbUE7oQP5DwEGWdqf6sOJDb7H/PUsmtB7zyj73k6k1mkrA8sJzY1ejCgIkQnQ5QyN7bP/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8199.namprd02.prod.outlook.com (2603:10b6:8:3::7) by
 DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Wed, 15 Dec 2021 17:42:14 +0000
Received: from DM8PR02MB8199.namprd02.prod.outlook.com
 ([fe80::d811:5c50:bf4c:65d]) by DM8PR02MB8199.namprd02.prod.outlook.com
 ([fe80::d811:5c50:bf4c:65d%7]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 17:42:14 +0000
From: "Seevalamuthu M (QUIC)" <quic_seevalam@quicinc.com>
To: Sven Eckelmann <sven@narfation.org>, "ath11k@lists.infradead.org"
 <ath11k@lists.infradead.org>
Subject: RE: ath11k: incorrect board_id retrieval
Thread-Topic: ath11k: incorrect board_id retrieval
Thread-Index: AQHX4tSyforIOk33QUO//pF8NGMRcqwz8ILA
Date: Wed, 15 Dec 2021 17:42:13 +0000
Message-ID: <DM8PR02MB81992A2920F672C9200B083DF6769@DM8PR02MB8199.namprd02.prod.outlook.com>
References: <1734146.k9CKHTOI9D@ripper>
In-Reply-To: <1734146.k9CKHTOI9D@ripper>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3218adb-908d-48c3-fae8-08d9bff23ae5
x-ms-traffictypediagnostic: DM8PR02MB8198:EE_
x-microsoft-antispam-prvs: <DM8PR02MB8198AD6F360636AB3BC143C88A769@DM8PR02MB8198.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RZQaEExoD3Z8HeQ474i1BB316Pb14uUEsWugxYNmR46BVf5eTUFcCKVJlhXGdO0u2rYzf4/F6ZFl6qhXMJHaF8m4ix8GeKZNTSEBT7e61ejeB1vXdIXpSVU92dCalfHpyzDiG/dhh5xEH+cp1eA1Yo8StTyMuPI73fym7571PhAEKVKBohom9JRnadZpIL+vLSnYDEXgwPpu/5jsXbwKUiqAijmgZXQ00EdNx+nPMMSCErgnYj2do9lkDaoy2KyeqfvGoAmcyByaLcDceZZknNtBaZAQ5Uc8+g1DO1vG/pvGZPUI3O0lrrmA8l5l32Izw8PXTGurOm7i8xmuRTEw4TAqMjvikU5pymk8JIBZYZdYqawiB64eAKZJoISAR0goeNudvhQGDTH+zoDUxtSJquoXoMIw+BcEZP2NKsl+QHTdee5AMqrg6LY0dcteXrMuSVimA7dC9nVdXNVSMnn9VMntsPLSk9BxouspVe32wRDx9RBak+WOwkYpZW7CxWzxQ6g311DA4g2E8PPtC7HxvSsx0uffOUDvz54/ALurIHHp8UkLmDsv6pnxS5s6u6mIoC9ZWac88a7ABUauGh8R/nJc/K8vc8/k7lfoU4pWCrq0GVYqmYMw7hchmNz1OdG0SDxvlOiC6pHTHoUI0gB35nhsGchodAcRaseCmdSsknhVuOr+hsApjJ2o6ZSMC+FpVHA5mlYoiNGeZmhd/oXV38tZXwIRNT/RdBExPOTOqvhZCY4BAymk7l3x4myhqcrEftFq/Y/xi8stbecomuZSw3Ue5BbdJQDPxV5MfnNi2w4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8199.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(66476007)(26005)(316002)(6506007)(53546011)(5660300002)(66446008)(33656002)(38070700005)(186003)(66556008)(66946007)(55016003)(9686003)(76116006)(52536014)(110136005)(64756008)(7696005)(71200400001)(38100700002)(8676002)(2906002)(122000001)(508600001)(8936002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UJaGCBi8stoHbEYA7Q5SIVVBOhYfmhWY4U6uJAdfjKbBjWUgc1+GXxhXXpJe?=
 =?us-ascii?Q?uM64qoouAuHshycs3j/wkZ5ERtalHAPVfQxOiZP4FiI/CLpjQEKAGLCMZVkE?=
 =?us-ascii?Q?1ADuV6p1aReXf6mFy19uVuyRQirstuToeDPeI0KkuRP5OnGQXSxZ1pCJbI9I?=
 =?us-ascii?Q?vWoz1EjP1wgKscgThMa7AJ1S9f7YA0T7XzqIlRo52MLQJx3d9RRa6hDQitfH?=
 =?us-ascii?Q?NGRjlWnfMYSjOquOEfdzm8OxqHZPwAxnxhR6H/krBY+p+KLdlSuXtJ+X4SPv?=
 =?us-ascii?Q?7JqKRIrt7OPuQJL9/cqpDDoTkpj6ysd4jrNcxbNEu93uV0BKgbzx/O4Tqph3?=
 =?us-ascii?Q?H/L1zLgzTmGQBBtPgeiKgsGfSn+jSHnuHxdN7hY9/T6a/S8Pv175Jpgj0Nwv?=
 =?us-ascii?Q?PCcyvyxy9Yfjmq9UWjK/FHpPABqJtLLiDm6SZeWafRiU4m3nEjfUhTof0HNG?=
 =?us-ascii?Q?UBwgeygSU7UBLZSkpNcJPjWiauid2Eakuv8wIvmEy3SkbzTuHHd02/ib6Qye?=
 =?us-ascii?Q?zsQVKE2lSwIta36a5cM1NUVeTgKih0xJkF5BTCOJVsSCQDfkgQjwvqFrLjxg?=
 =?us-ascii?Q?vJtQw2nrsAiwYOsGyIrHm1ixT0vFt9D26k2emfxXDLatMHy2McsZZiwNSOB4?=
 =?us-ascii?Q?Uqiq+681tGaSeVXtqCbAvZt7qMeZK2YcNUjgx/o+aT1BerlFN9SUc/wpVq9R?=
 =?us-ascii?Q?167f4LtmhugOOl4RcGCkNeOUUDaV1xGuI/x3CWF8YD+cMvv6ZT1SEaN0A1fJ?=
 =?us-ascii?Q?xaqwrPUqXPImaCUDLwyC3BnRgKxvYH0DWfpOexWXjeRvz+ku1aq/Tf6dDqPp?=
 =?us-ascii?Q?FFW3gbql6EeiRZmv1T/yeEY78csxeljnrW8bsClMhbimHKSDGIpLcslWN1OK?=
 =?us-ascii?Q?LiysXoRKHNFziMyyZcKwwlm/6AlZkUEY3X1HfYkU570xqWAhOeKgic5AZ6Rx?=
 =?us-ascii?Q?SeZZR6SvYd6YEnlvF6B8dK9+Ul3Qu76G4bzvnImyETtaotH0Fd2EU27rfFbt?=
 =?us-ascii?Q?ywwIirExxXxHwgWFbfsVa/1yXjzVvmNBj2aIm9U3NlPgBuN9+4u3z4/Hfw2s?=
 =?us-ascii?Q?yHB3JZgtSYPAMLmj3GZc2km4qBBIIj00fMMNwm1poe5AP3TtusqsJYryN27U?=
 =?us-ascii?Q?QLpnHKvYzv0cL5U9OEJOVlT5xT3fGNTDiFblKN0skR4nlsEYsuTchIS4g+wG?=
 =?us-ascii?Q?wdJlz0ehCzg1m2qc+m2lEkGlDPSujoCHh0LNXVNbAVYhK8BVzuN+p+GXzfWQ?=
 =?us-ascii?Q?cPu5RvRxDg2Kx+ZkBfAuvGBi8qhGC1Vz+GHwiI096UUZpWr1Ja8Lg2DvE2Z1?=
 =?us-ascii?Q?bX+HmsIQ68lTJTe8cpEtM8LNNK26kUmmvEOBjMJqbLT6Fjf7+1KBo/C+in5w?=
 =?us-ascii?Q?hDCtvOQIQedv3GvLQhhx/P67YGEhz3C7JQEcgCf6XvhnK4NnnONZdQfIF6G1?=
 =?us-ascii?Q?+xHdfY381DIzjqfUocdu+JiGPVF70xepHdypGujb22ouuJyoRexA5FeVGCc1?=
 =?us-ascii?Q?k8RcMxpNCKGkGK0nHebwnNwji1YbsE4h/0J8DLBlr7WJQcaLi43XpTINNzoS?=
 =?us-ascii?Q?JwHUsM5nbWZgldK3fQTEsF6po9j4LtvpY0E8tAz9Fy8vVeAgOo0sQGdyn3St?=
 =?us-ascii?Q?sphmeldJud8xyDXM0iNslDfl8NfDOsrsWvy+AHyHsop5HYNiVYR8PEzN7Trz?=
 =?us-ascii?Q?+RevBA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8199.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3218adb-908d-48c3-fae8-08d9bff23ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 17:42:13.9194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fUClb2P653/DrBWkAXu1R/Sq/CTXczHrNpTCw7VpqpaQh64Wne7uCKty9eSRQC4KXRUyJVN5TD2wjyStHsHN+yNn9wO1uBC2Qo1GRBB0KHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_094218_191142_326E07F3 
X-CRM114-Status: GOOD (  28.07  )
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


Hi Sven,

> -----Original Message-----
> From: ath11k <ath11k-bounces@lists.infradead.org> On Behalf Of Sven
> Eckelmann
> Sent: Friday, November 26, 2021 8:18 PM
> To: ath11k@lists.infradead.org
> Subject: ath11k: incorrect board_id retrieval
> 
> WARNING: This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
> 
> Hi,
> 
> I've noticed that manufacturers of cards gave me various information what
> board_id they expected a device (QCN9074) is detected as. But ath11k only
> retrieves the board id as 0xff - thus the ath11k driver is always loading the
> wrong BDF. Commercially available boards with a problem like this are:
> 
> * 8devices Pineapple
>   - 2GHz: 160 (0xa0)
>   - 5GHz: 161 (0xa1)
>   - 6GHz: 162 (0xa2)
> * Compex WLE3000H5
> * (maybe there is not a single one which works?)
> 
> If I would use these boards in one with a devicetree then I could just
> overwrite it using qcom,board_id (and/or qcom,ath11k-calibration-variant).
> But this isn't the case when I want to use a couple of these cards in a simple
> x86 system. All off them (even when they are significantly different) are
> reported as
> 
>     ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff soc_id
> 0xffffffff
> 
> So I would have to hack the driver to implement my own (pci id? based)
> board.bin retrieval code.
> 
> 
> So my question would be: Is the ath11k based board_id retrieval just
> broken?
> Or are these cards broken?


[seevalam] : Incase of QCN9074 in x86 setup, need to program OTP with board_id. Please fuse board id in OTP and try.

> 
> 
> The way the firmware is initialized definitely changed between ath10k and
> ath11k. Previously, the otp.bin took care of retrieving the (pre-cal) data from
> the EEPROM/OTP on the card or retrieved it via driver from the host systems
> flash/filesystem. And then the otp.bin was reporting the board_id to the
> driver. Based on that, the driver was able to select the correct BDF.
> 
> But now, the firmware is started and immediately afterwards, it is already
> asked to report the target capabilities. And the target capabilities are
> including the board_id - the part which doesn't seem to work correctly. Only
> after that, the driver sends the BDF + (pre)caldata. So the firmware (if the
> precaldata comes from the flash/filesystem) doesn't have the chance to get
> the board_id [1] from the (pre)caldata. Which sounds wrong to me. But I
> have no access to anything which would allow me to check how it should
> actually work.
> 
> Kind regards,
>         Sven
> 
> [1] i think it was the refDesignId, projectId or something like this in ath10k
> 
> 
> 
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k[seevalam] 

Regards,
Seevalamuthu M

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
