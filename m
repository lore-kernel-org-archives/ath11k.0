Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A3C433EF
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 04:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=068ycqeZdlGOY3W6zg8DAL9NW3LRSju9afN15ZHcTdc=; b=SyIhVfnrb85H8F
	etRKqfh4nOHrLeS3b+d2AstlX5owIE2bR0RJHC+obDEgKoFnDbgiLbt5euIO2KHcBopFrzW1dWb1d
	6Ad1RFcBa8sMxC3dktic2S6H4S1YLLahLquNnZALMVRboKbrCAwQFeFfVZ28rtfYp42qknk4DZVxJ
	sSljOXFe+hQuyUzYWJX4mJeDsZMaQlZlIoUhYyhXNFldLKUqqacA/NlFw/Xu+a+HkuHOTftSxLEbB
	DEh/+PqJsUhxwEq91w6eXJ7+m56OMsDRRyd9FzoTsGGE4Lz5DAxkDGsRXkfg3xcvX1CawNNGZUUB5
	kQfSWQUZdtUnCHTJUWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwz8Q-005pEx-R2; Fri, 03 Jun 2022 04:42:06 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwz8N-005pDy-1Z
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 04:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1654231322; x=1654836122;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M4zux9ZvFaAZpWMGMMoMHhZpL1h728T+/JRGajhFfKc=;
  b=uBGxXsGVMD3LzthqQmNMj9N3eEnLzxg+yXWnk7/Wnpb3pLrql06no4LT
   LJJDTccFeGYyt5AN7FIrSXEU2ItbhaJRHO92YDTDYjY4pN3TDUrOj/aIp
   G2Q6uSjBfnYf0ka6pZDcJn5CXMwdeZiCK5m+wA/qMd6ZUQUGmx3pd5y11
   U=;
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 04:42:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHF/7ga/XVGWRpshu64qdVQcsiUhdQk1TZGJuCLfvpxI9LuNRyCNdTAN3zP7buwesOdB6GQgU8FpTexbaI2jTk/geRjLuvnij3JQtb2bQ9LISypoqn1KHtEfEFWGXZo0lNyFDgaZOkx6yWrec0TdTR4FY7SC9FJUTJvZhvJk1U7xk727oEwBMDLNCG/9ZEfqQZPXN70vBEGwxx14K4pH1RuXSPG6/6SfKYaQ8Woysy9Ykc8CsXsLA8kgd938aZTSya2DAleCVUeFvbYHXYYQlmrU34+er6qpPsHtYHHgFkZ6sITvLoPUXwglrSEOtfTTaOR3zGgnq0SghPaD75L7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4zux9ZvFaAZpWMGMMoMHhZpL1h728T+/JRGajhFfKc=;
 b=exbIBCH+JLV3+mU/mgzqRJH0nYylg0z8vA0ArwD+wTo29nS9ZlhzwyzXRWHmS4bqDVgwhh0DFaK4ygwXL4TJzHqhbK85aKJsKi9urpuK2JNWypnWIoDEtnLoq2lR5lC3EVjg3pvXpW+XD3+0bYURy/sQ6Ak6EzvPqB7KNyC032PZHPi7fmL/TWB1bS9aQoSAM2x4dCMGs8jTOquWLz2tc3E6jLhmBhDh5bwuZe/8fylT6oVLJwKG/heIJEdrAR1rj3RQ8uDE4oXxq6HHnq0IpH811ycxT3mMWemPa3w8s7hOExcMmtR6+COOKiysneCtOD2W//ZBNULghmCx+/uvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM5PR0201MB3589.namprd02.prod.outlook.com (2603:10b6:4:80::19)
 by BL3PR02MB8298.namprd02.prod.outlook.com (2603:10b6:208:345::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 04:41:59 +0000
Received: from DM5PR0201MB3589.namprd02.prod.outlook.com
 ([fe80::f5b9:2296:c8d4:764e]) by DM5PR0201MB3589.namprd02.prod.outlook.com
 ([fe80::f5b9:2296:c8d4:764e%7]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 04:41:58 +0000
From: "Aditya Kumar Singh (QUIC)" <quic_adisi@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Aditya
 Kumar Singh (QUIC)" <quic_adisi@quicinc.com>, "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
Subject: RE: [PATCH 2/2] ath11k: add get_txpower mac ops
Thread-Topic: [PATCH 2/2] ath11k: add get_txpower mac ops
Thread-Index: AQHYdj+vfCpLU/o/7UGp6gldxUlyUa08M+oAgADoGUA=
Date: Fri, 3 Jun 2022 04:41:58 +0000
Message-ID:  <DM5PR0201MB3589D62629069D1FA3FB11BE84A19@DM5PR0201MB3589.namprd02.prod.outlook.com>
References: <20220602051425.9265-1-quic_adisi@quicinc.com>
 <20220602051425.9265-3-quic_adisi@quicinc.com>
 <f6414575-6a9c-2e8a-dbb9-68680aca8822@quicinc.com>
In-Reply-To: <f6414575-6a9c-2e8a-dbb9-68680aca8822@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aff5079d-22a7-4baf-5b69-08da451b6513
x-ms-traffictypediagnostic: BL3PR02MB8298:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs:  <BL3PR02MB82989E47D580C935AAC824B3F8A19@BL3PR02MB8298.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3mqNnWQOi5eOaB2mM+5H68ZpHkwdndLIqE8Y5NQ1ByCNLCOKIsGiYF0cOP+UO224FYvkfO8eig4kMCsmiFTFKdjY3AgQzzOfLlgh2bpgiwdXA9UTpZxpTQ/w/2EVHI5RMPuqyGPurX5MYUdjxt5FEjNz23n6QLZglq2/EObMLsid3sI/XcrGRqWSXj2vnn8MkuqJ12FGlJwWzA21AJkdTE9FRoEJ7psHae6qTlDWRK21KYRVsuH6zgzJ4OXaIiYp9pK12f7KCuVWBy4KC7PLI6vf6RmsL6yyLE/to6z8nWI+lgqnL3hbQIeRJHtJEEX25kDjliqvy2edhW3Oz2Mx1omo/bRzcDMSHvFvQggi+8jF/LOTA9MeqXq6E2s8LaQLrxW7cnELBwhU2af58zYmcyUl8jJTskqYa5JxpJc4yBnnu3wmQqG+dpEwxk7GTzteQFjwAMVhepGh0vofKxRVwn5EtwdGMCj2G4xBDcRJFdfDs/uogRra3oz7XM38Uyybz/ttjAPGUubj932HHEVa2iO7lMNjTZan9PxkwDIeajpEzpt7rZFrt+7D/eeiA7mkS/bHl7dfIoE20ZVDAxlCoY+iV71IKpv+20z3GlasiEq2+CZh8Ei9lI74n/bBMA4fW5pK6u6qVBMzvit7G10gZNj/gh6EUAo8mf0fIn6fiahqExXDT3ivdWzNRLay6KY0ARF1yCmaIMWxAEoo3vruyA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0201MB3589.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(38100700002)(6862004)(186003)(2906002)(64756008)(66476007)(66446008)(6636002)(66556008)(66946007)(54906003)(76116006)(4326008)(8676002)(83380400001)(316002)(52536014)(6506007)(53546011)(7696005)(33656002)(71200400001)(5660300002)(508600001)(55016003)(122000001)(9686003)(26005)(86362001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ekJSSDVkZm5ncDZjMjZralR1T2dLdGsyWFVpcGgzOXZ0dGJweUVGMmRUTDFD?=
 =?utf-8?B?c3l5Y1RhcWpYN2FSNnV1Y05LN1BXL2N6SW1DZ0lGV21SVWNDVFpYZjVXSGNI?=
 =?utf-8?B?RUF1VDFydS9lNEJGZm9PZXRrb2dyQ2NjOFVBdFBiaklRUzN1dnVma1BrR3Br?=
 =?utf-8?B?WFhIT1VtK0JLRzd2VG91dXdwRHpJVUJuSngzRXZVZmdjV0VscTBGajFuaW1l?=
 =?utf-8?B?eGFmYUFYSkZBSndheXZ2N3lnUkJVWEVodmZUVmNiV3M2MkViYXdmU3NRY0Zy?=
 =?utf-8?B?UDh0ZFVud1EyNnlTSFIzWG9OUHBnSGg3RXBJdnFGOWR4Sy9YRzVQZGl3eHRI?=
 =?utf-8?B?V3laUzBFUVh1V2kzSWM0U0s3cFc4bEtNb2RQTkUyMnNBNWxXczZBSTdKR290?=
 =?utf-8?B?SFY2WTZHdU1OcDJmZkRFbXZtQjcwc24rVTE1aGJMcUJzVTNBSEorSnBrMlNR?=
 =?utf-8?B?VWtkWEVydUs0aVZ6SUR0ZktyRUlud2ZqdHhsSDBnMXJYU242REFWaks1eUl5?=
 =?utf-8?B?dDJGU2l0VDF5SmtjTnBpcy9BYUx0KzdWU1V1RHovWVREWFBlNTh6ME96WWJ4?=
 =?utf-8?B?aVVYRzNQMTRzbVBWTmdSc1J3MGxMTlVzdHJjKzRCdTdkV29kNWxPMlpWNjcr?=
 =?utf-8?B?TkJPbnQ4RlZPeUkxTjQ3Q3BYb05zTU85YU1kaGZ2ZU5TWkZ1bDNiTjhSU1NN?=
 =?utf-8?B?bDhlRWNIQUNmcmRmNzlEaHBUV2c5c09ZZDlFTVlWWUtZU3dHVHJSUzRWUFkx?=
 =?utf-8?B?RnlNQnpYMHJqYUEwSzhVRmFtb2xnNkRvYTRlNzZPTUttcmNUdzkzM2RJTmhj?=
 =?utf-8?B?S2FaS0hKNzNSdlhlOGlVeVV6bG5EWU5tZ09wbkZUUVBYK3Z5NVZySzRVRVkv?=
 =?utf-8?B?WEl5ajN2N242VlVBcjhMMFBySDJYcTVHWUROQlRWSEpKRTUzUnd0ZmkrbFNC?=
 =?utf-8?B?SGt3VzBPWlNKSDY5Q3NDNEtEQ3FlNXRQTTd1RG5IZjZuQ3M0U0Z5QlpMaGJH?=
 =?utf-8?B?TlJaM2tGRkI5WEs1a0orUlZaYUt4bkh4UnNSWVNzeFNaN2N2Z2xXa1FEekJE?=
 =?utf-8?B?MlIwZDNpQkYzdWRPamFIOHpVa0Q3cWRkaXFrUGNMN2czajUvdUovSStqcG1S?=
 =?utf-8?B?b1RHT3ZsRVQ5aERwZi93eVltSFlKNE81QnFCYlBLdGpLTjU4Y3JUMmFHOGNk?=
 =?utf-8?B?eFcvQWpWdDR3UzNkR0o4bmdGZU1Mam45RDFBVXdrQ2xyMktVS0lQUGZGaktJ?=
 =?utf-8?B?RUhscmFPUGhyMVZrS0FKUFhSdzNpZzRMQzJCZHRYZmNZSkwzbW1kalozMW9C?=
 =?utf-8?B?dzkzUUZqK2lvWi9WNUlSd3FzcHRvaFplTDBjV21INmd1aTYxWVV4OWFxeGdN?=
 =?utf-8?B?U2NXd2pMRHZtb3NHNWpPL2owajc2MzJKSk5ZV3lUYUZGZWpCcEFhdkRnR2lS?=
 =?utf-8?B?Y2pwNG9YN0xVUWlRSE1qN2JGYmw4WXlVS0tKZjhndC9uVmMwRkxGQ0JycmVZ?=
 =?utf-8?B?NkQ0ZnlrUlpvc2JpNWdyQXl1QWk2STFUY1ZKYWpKL04wNytjZUVuNE5LOGJU?=
 =?utf-8?B?bVJ0UE5rQU5abThEa1B2dmsyTVlPUXdPREFnRlYrVXd4RkVwc3lKWVl5Q0gx?=
 =?utf-8?B?RjIwMUNYcnJPbm8vL1Z6TUNJcEU2dXY5TG1od05VcHVWL0VuM24vOWJRYU54?=
 =?utf-8?B?enFqTWx4UkJITWtUQ1p6ZnhNYzd5SEJZMkduN0swaTQxZFJmQ0xEc05GdlJy?=
 =?utf-8?B?clJOUFJlNWxmSVd0d1AvdWtIYlB4eHJCMzJFWk80SUw2WVJoNGhiV3JCZ0oz?=
 =?utf-8?B?WFBXeFROY2ZuSWxkaVdPVDRvNkcxdlU5OGtwOG8zQVdVYnlSazlvbGNiMHgv?=
 =?utf-8?B?YXkxS0ZGVmo0b0dkSFRXbXRTb2pERUJEOGpVMDhiQVhscUNSN0dROFU5dVo2?=
 =?utf-8?B?OVE1YzZkVjltL3B4THZueEJQeXI4VmZFa2phSjdacFRxNDZLeFhmeENRb0x1?=
 =?utf-8?B?aFowS05venh0OUxUK3NOSHdYcVJKbVVBczZ3Zk1BSzhIK2dQMXFSN3JSYWZu?=
 =?utf-8?B?SzdVR012emtMYWNrVE5TdWFDQkpwaytmMFBZYytwaHhJb1Q5NWYwNDdlMHly?=
 =?utf-8?B?NGQvRzhORHQzMzE1VFphQ09jNnJCNlh6dm9yZ2dwWGVHYmUwSmpESkFSK2JM?=
 =?utf-8?B?Y2puYzM5SFhmVUQvMUpGTENkWWpBYXh2UktmRnRCdTlnTEZOemh0ZGxoQnZo?=
 =?utf-8?B?dWR1eFhkdHViQ2M4S2dSYXBleCtSZmhrUzZZQ2E2OWdYeTZMTHBqNUQzZ3ZJ?=
 =?utf-8?B?bGF1Zmo3NnhINGdZNmpuR3VvMDYxRGpYSyt6L2NBakNYS2l3RXdnUT09?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0201MB3589.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff5079d-22a7-4baf-5b69-08da451b6513
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 04:41:58.8234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8ibVRm9PxOA35BN69BxW6WQpr3BohaYIPMUb/uUnkm5bCH/pa366YwcH8DGIXSEOhkiNZS2W4SvMDSnkP8dvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_214203_220975_547F138D 
X-CRM114-Status: GOOD (  31.70  )
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
> Sent: Thursday, June 2, 2022 20:21
> To: Aditya Kumar Singh (QUIC) <quic_adisi@quicinc.com>;
> ath11k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: Re: [PATCH 2/2] ath11k: add get_txpower mac ops
> 
> On 6/1/2022 10:14 PM, Aditya Kumar Singh wrote:
> > Driver does not support get_txpower mac ops because of which
> > cfg80211 returns vif->bss_conf.txpower to user space. bss_conf.txpower
> > gets its value from ieee80211_channel->max_reg_power. However, the
> > final txpower is dependent on few other parameters apart from max
> > regulatory supported power. It is the firmware which knows about all
> > these parameters and considers the minimum for each packet
> transmission.
> >
> > All ath11k firmware reports the final tx power in firmware pdev stats
> > which falls under fw_stats.
> >
> > Add get_txpower mac ops to get the tx power from firmware leveraging
> > fw_stats and return it accordingly.
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
> >   drivers/net/wireless/ath/ath11k/mac.c | 91
> +++++++++++++++++++++++++++
> >   1 file changed, 91 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> > b/drivers/net/wireless/ath/ath11k/mac.c
> > index f11956163822..f2502ce7deac 100644
> > --- a/drivers/net/wireless/ath/ath11k/mac.c
> > +++ b/drivers/net/wireless/ath/ath11k/mac.c
> > @@ -8471,6 +8471,94 @@ static int
> ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
> >   	return ret;
> >   }
> >
> > +static int ath11k_fw_stats_request(struct ath11k *ar,
> > +				   struct stats_request_params *req_param) {
> > +	struct ath11k_base *ab = ar->ab;
> > +	unsigned long time_left;
> > +	int ret;
> > +
> > +	lockdep_assert_held(&ar->conf_mutex);
> > +
> > +	spin_lock_bh(&ar->data_lock);
> > +	ar->fw_stats_done = false;
> > +	ath11k_fw_stats_pdevs_free(&ar->fw_stats.pdevs);
> > +	spin_unlock_bh(&ar->data_lock);
> > +
> > +	reinit_completion(&ar->fw_stats_complete);
> > +
> > +	ret = ath11k_wmi_send_stats_request_cmd(ar, req_param);
> > +	if (ret) {
> > +		ath11k_warn(ab, "could not request fw stats (%d)\n",
> > +			    ret);
> > +		return ret;
> > +	}
> > +
> > +	time_left = wait_for_completion_timeout(&ar->fw_stats_complete,
> > +						1 * HZ);
> > +
> > +	if (!time_left)
> > +		return -ETIMEDOUT;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
> > +				     struct ieee80211_vif *vif,
> > +				     int *dbm)
> > +{
> > +	struct ath11k *ar = hw->priv;
> > +	struct ath11k_base *ab = ar->ab;
> > +	struct stats_request_params req_param;
> 
> suggest you use an = {} initializer here.
Okay. 

> 
> > +	struct ath11k_fw_stats_pdev *pdev;
> > +	int ret;
> > +
> > +	/* Final Tx power is minimum of Target Power, CTL power,
> Regulatory
> > +	 * Power, PSD EIRP Power. We just know the Regulatory power from
> the
> > +	 * regulatory rules obtained. FW knows all these power and sets the
> min
> > +	 * of these. Hence, we request the FW pdev stats in which FW
> reports
> > +	 * the minimum of all vdev's channel Tx power.
> > +	 */
> > +	mutex_lock(&ar->conf_mutex);
> > +
> > +	if (ar->state != ATH11K_STATE_ON)
> > +		goto err_fallback;
> > +
> > +	req_param.pdev_id = ar->pdev->pdev_id;
> > +	req_param.vdev_id = 0;
> 
> and remove this explicit setting of an unused param to 0 since it will not be
> needed if the entire struct is zeroed. the reason for this approach is that if, in
> the future, any additional fields are added to the struct, you don't want to
> have a situation where you forget to add code to clear the new fields, and as
> a result you potentially leak stack memory contents to firmware, which is a
> security hole.
> 
Sure, will address in v2. Thanks for pointing out.


> > +	req_param.stats_id = WMI_REQUEST_PDEV_STAT;
> > +
> > +	ret = ath11k_fw_stats_request(ar, &req_param);
> > +	if (ret) {
> > +		ath11k_warn(ab, "failed to request fw pdev stats: %d\n",
> ret);
> > +		goto err_fallback;
> > +	}
> > +
> > +	spin_lock_bh(&ar->data_lock);
> > +	pdev = list_first_entry_or_null(&ar->fw_stats.pdevs,
> > +					struct ath11k_fw_stats_pdev, list);
> > +	if (!pdev) {
> > +		spin_unlock_bh(&ar->data_lock);
> > +		goto err_fallback;
> > +	}
> > +
> > +	/* tx power is set as 2 units per dBm in FW. */
> > +	*dbm = pdev->chan_tx_power / 2;
> > +
> > +	spin_unlock_bh(&ar->data_lock);
> > +	mutex_unlock(&ar->conf_mutex);
> > +
> > +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "%s: txpower: %d from
> fw\n",
> > +__func__, *dbm);
> 
> IMO this is misleading. technically pdev->chan_tx_power is the txpower
> from firmware, *dbm is the derived power after converting units. maybe
> that is splitting hairs, but when debugging issues you usually want to be very
> clear about what is the raw data and what is the calculated data
> 
Yes, I see your point. Will rectify this and be clear in debug prints as
you have suggested below.

> Also follow ath11k coding style for debug messages (which follows
> ath10k) which does not allow colons
> 
> so I'd suggest "txpower from firmware %d reported %d"
> 
Sure, will address.

> > +	return 0;
> > +
> > +err_fallback:
> > +	mutex_unlock(&ar->conf_mutex);
> > +	/* We didn't get txpower from FW. Hence, relying on vif-
> >bss_conf.txpower */
> > +	*dbm = vif->bss_conf.txpower;
> > +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "%s: txpower from
> bss_conf\n",
> > +__func__);
> 
> I'd log *dbm here as well
> 
Much better. Will rectify in v2.

> > +	return 0;
> > +}
> > +
> >   static const struct ieee80211_ops ath11k_ops = {
> >   	.tx				= ath11k_mac_op_tx,
> >   	.start                          = ath11k_mac_op_start,
> > @@ -8521,6 +8609,7 @@ static const struct ieee80211_ops ath11k_ops = {
> >   #if IS_ENABLED(CONFIG_IPV6)
> >   	.ipv6_addr_change = ath11k_mac_op_ipv6_changed,
> >   #endif
> > +	.get_txpower                    = ath11k_mac_op_get_txpower,
> >
> >   	.set_sar_specs			=
> ath11k_mac_op_set_bios_sar_specs,
> >   	.remain_on_channel		=
> ath11k_mac_op_remain_on_channel,
> > @@ -9129,6 +9218,8 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
> >   		clear_bit(ATH11K_FLAG_MONITOR_VDEV_CREATED, &ar-
> >monitor_flags);
> >   		ar->vdev_id_11d_scan = ATH11K_11D_INVALID_VDEV_ID;
> >   		init_completion(&ar->completed_11d_scan);
> > +
> > +		ath11k_fw_stats_init(ar);
> >   	}
> >
> >   	return 0;

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
