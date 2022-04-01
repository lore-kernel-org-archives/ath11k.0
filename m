Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38C9C433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 12:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sq2DHGn3wzzYFjPwV/vVusg6Cm4r1HSENXbqLRO0c4U=; b=so1sibvBBMTa7D
	mvesI1qxT8+JsrccB2AJyxuD/AwLBkHXv8zCGqpAbv0PqPIQzBJO9yze0CLkq3wCp+iUZL6c7DlqQ
	VhG0hKeZfzwWs4+K7bPHz9l2Kr6i3Qx0RfRF9xr/t0BVIhLdthYikTlVJmxRer0Stv5vvJt5ipehK
	ApBUXQEN2Lwlo8GNg+OZ7Qj0lf7u6UTTftO7iZ9MLazWVpGBoBBHGIs3AwLYmWfWKXhft+GK4kou9
	bEFl3Ys2exXz2Osrvwda6Ax1Ra0j+0iBlqj9f58wX0rBKdqHCSmtnOQNXXs0iMMmOaKme8TWSbFOM
	m05/MH/dRemWdx25dAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naGPS-005dAh-7H; Fri, 01 Apr 2022 12:29:46 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naGPP-005d9F-8X
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 12:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1648816183; x=1649420983;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TLHks4AR+tRSX/basEpSAP6jk7+l6COsSVqW9eXFgGs=;
 b=Lg4EdwgvYMyrdbEfoXOpfZIMvLjvSS8DQ75WEUJfrhkCs7Z3uoAqBywZ
 x8Bk9lD8Z7Zmf7T1eoToeih7xN4cbi8PLXhTRla4jJcvbkrhBbhQqwLle
 u/YDR6topEQH8m9BxkPwsb4ymq849tHm/6IdLGUC0M8rcHxhkLKQb8//7 Q=;
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 12:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYGP3AWQhrrdbcFwz2tzghhdjYHO6g8kuKNhScIo5qCgVpMOe3R8PLU1r43Imhezq7YiP1b42oFd9Yc08DgoLhSi8CvpGlInPH8x8gN3NFNCp0nEFcT0VfWKmv2pkS1dA4uqs84p25AvXpkYAkrB5NFOnpKFMsSyq6sFVGKmrqbrLz0BtWB3oZovVXk00Ee9R/jVEvkZNW9uLH9AQxsh+4SnzVgzCD1iYpX0vQmZduGALBRuJJPU5EdRgUagl0uH7vXgk00X5pRhNpLmLeIoZa5AzQu4DagTU/NG+LDQU2p0Npa9JnEiU9YFXejttjNf17fez3Nm4axVzMtdDiDvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLHks4AR+tRSX/basEpSAP6jk7+l6COsSVqW9eXFgGs=;
 b=lKpDWrVt4KaO/w2Dn99SxUm+2Lwz3eA6s31+rmYD7gfv265XTlwqAl2lAexrZDPaujXVuwoQLxSHNzI0x8Es/V80K/Cktpb1naIHltgSQ+7uV35fvCsWHYAR0ywvfxzu7eISCtXmK2yIhskvdJ+qfRLXxvANRBPQLHRK4pVaSkKf+Qq9q58koBIpJ/b4epzxgHdiI7epyiMGUKPp0oYFWRiKDXzlDh+xNwaxU2wzGlkzwzp4DKGK7UR5chq4qbnpiY2rRVH+Sk6QC5LzuZ1VA/SrQL3CZUDdwYJxMxzIc2wN+vlCCytZDT/Dflmzbtt9mVEgocXIHvGc6BlqSM5OaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5430.namprd02.prod.outlook.com (2603:10b6:a03:a4::25)
 by BN7PR02MB5121.namprd02.prod.outlook.com (2603:10b6:408:31::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 12:29:40 +0000
Received: from BYAPR02MB5430.namprd02.prod.outlook.com
 ([fe80::1d1d:ddaa:4a23:3055]) by BYAPR02MB5430.namprd02.prod.outlook.com
 ([fe80::1d1d:ddaa:4a23:3055%5]) with mapi id 15.20.5123.028; Fri, 1 Apr 2022
 12:29:39 +0000
From: "Baochen Qiang (QUIC)" <quic_bqiang@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, "Baochen Qiang (QUIC)"
 <quic_bqiang@quicinc.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v4 0/2] ath11k: Add support for SAR
Thread-Topic: [PATCH v4 0/2] ath11k: Add support for SAR
Thread-Index: AQHYRcPfrPGew3lr/U6qagczxEnQtKza/MSQ
Date: Fri, 1 Apr 2022 12:29:38 +0000
Message-ID: <BYAPR02MB543092306754485CA2266568E0E09@BYAPR02MB5430.namprd02.prod.outlook.com>
References: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
 <87sfqxt2e1.fsf@kernel.org>
In-Reply-To: <87sfqxt2e1.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53674249-f7d4-4e88-5597-08da13db4a38
x-ms-traffictypediagnostic: BN7PR02MB5121:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR02MB512189D1D0282A920E7740979CE09@BN7PR02MB5121.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +S+FmXgSUL3nLO3dYm4QPYMtgvYHee1VnoArGueeZDJdnS9tWE2xGF87T1XJ4vhDhN1XsXReweEpIDYX3nRo9FfgWNbDCwxcmRpVdzkbLDqf8a9h5FVaU397pjdygL7GniwKcl+ZmiuDD4VV+gQn6IC/i2QcpKVbk9kxQhs6vyM3jlMqIv8Bm9nafd/rOTdliiB7v1e0GT9SP2DGBiTq32o7RLDZVU3qgQe4HneV2oQqZTnpZrXtqtgPTVfvt9HGCo3XeqdYKj24V/sP19aQAJanNEhd2ASxHTISCMA6qLFJ4Uo1H5C81dOnaZIU41qwN9/jpSPpKrBA8lX/hYY9dNohhUmnhBbgPbyXo/IF28BFbDyE87zF+ma0NL9PLjw4+izfQZbLwxhAegjemnmMl3pirSBUxf1VrQ4v9iwiTgtTRHxDYjsUZGT9V3W5vJz2Rxk3I4bFwGGWLr9wbUofuFfHExfwcokh2pNrRw/pbn8nmrlD/3TWiLGiowPh+N7w5Vgp/DDtFAITr69G8J/79OCV0bSSop0DsdkuqJHdiIGgG7nQ5i3lQJiCJIDHWPKodSZY4VmDj4MuhnkBQ1PF/ZKcAmKosLu79TGipLMZF97NlNO07hEjLDUrrHf3WdBSKY+F3g34XBBKZ6a+OE/xCkNPw4p3PZlEZKP+X8H89XvEwt70HaKiSM3bCMEek/GlUfwxps4dQ0JPN2G0ev7zwkIGIt8wIEYyEWg/rwEboXNPMMPKzQ51judr0oDkxe1ROXrdrLlY15X0BbLTnKgBwPQ/STubJ3dpJ4eM5BZhlD6o638hUoLphWkrEUPrjV/oW6TbgUV6TYW1NNJpUrKFzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5430.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(55016003)(2906002)(52536014)(8936002)(86362001)(508600001)(966005)(33656002)(7696005)(6506007)(53546011)(316002)(9686003)(76116006)(54906003)(110136005)(66946007)(38070700005)(4326008)(122000001)(66556008)(66476007)(64756008)(8676002)(66446008)(5660300002)(38100700002)(83380400001)(71200400001)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kk5phujNj/jo9sYinT3fSUqEjLRGt8cjQUR8IBcjfUtnyi0qwmE+z7xXhBB8?=
 =?us-ascii?Q?OBIAfCKqRUL7r6Z1kR9FoydIv+bGApoiVocSatnlu2+vYUVSJ30OlTLmXniz?=
 =?us-ascii?Q?VPPt89Sa6JEwo57jsoNJeFsemRNvq5Pb/Ew6nbT9LawtLObXrMHfRV95nNk0?=
 =?us-ascii?Q?knwxT0h/TYvDt4gMQBdOfOkE72sXYZOYlsjDLM29d42HkaPObdXk2rRxreTr?=
 =?us-ascii?Q?04RyIyhqKzWs8eh6FlEgaSNZ/TbqjCOpQ9S+iL2RbiKUwXStK/IzyQGHxcKy?=
 =?us-ascii?Q?8IC2Z34APiCNKb+h/NWP9iLLwUojdQrYVwzzDAuUr0cSCIIyrXaDFPP+5PSB?=
 =?us-ascii?Q?bm7p9E8PGLy6dw5+K+gmuqhNAATYwA86BeROkwHozxdWAen3y1YZLJ3Lr9OW?=
 =?us-ascii?Q?apy0nZ1BWFmvyho0Gx2jXKagJcJT7mE4tNFliUMncIzRI4RMCQ/7zw/kX3yo?=
 =?us-ascii?Q?vMj6BlHe3/TBhBy5ixSX9qXCl/CV0vSg3+4m2l+nSd5FJpo6vpI9t0iU/jSD?=
 =?us-ascii?Q?KiHzyvtHFQqlV6tmHsvjIjFU38sTXoQNOS1FARlajwgCDo+Uh6llhNePQLJE?=
 =?us-ascii?Q?LI46drvzWne9+kHzgQeRJwMAGYGTd77bW0SoaBFNgwC2rdj8RUPWUB5aX+IJ?=
 =?us-ascii?Q?wWdd3/QI031aqhfJ4OLtPvOYnBMsKOW3algXL5wXB9Lf59mSFI4vjMjU6axh?=
 =?us-ascii?Q?tbEElAnVyjbNwC7nW907am5iVxdJcv2Rj2GhLZTLG53kba/ZdwjsKzkehepe?=
 =?us-ascii?Q?se9seW8u2Jk2jm3kkW9wyvw0WEcBvk3MaPwrTEDV132NXRn3NCHbvKW7yOvv?=
 =?us-ascii?Q?wpiLRBPw5HeIqMrQNWSI3BK6mFHZ+dd7k9RjNNvyzJ1/bh216wD/oCD+YheT?=
 =?us-ascii?Q?v2NCyG55KjC7YqhRFinmgh2K+uUv73ZFDD81lVHxWDEwzONsrZ2J1tQaXyFX?=
 =?us-ascii?Q?wozy1yk2Yz2twlWqNk83zD9FTljl5S8vLeq9aNW0BPB9fDMz5a15vLVwiYvr?=
 =?us-ascii?Q?T1boHeQgwffty39zcxSHtiTGpdgQ+twiZTxKDN1gYBfrC5LUzxnmrphovRCj?=
 =?us-ascii?Q?GNELwxSQGqogUuWAK9c455yNQi/mN8WExOoutefOlSUYLt1boyAqcagdWBA5?=
 =?us-ascii?Q?PiyMkMkJbIgActhsXV0Ov0kxhazSKDcUg5g2DiPTy5aRKHCrTYUbDormT+Bj?=
 =?us-ascii?Q?RSqP9vyojgyTSbPOralMuavgui+zWHSAkd5gMkfigO8zT9wIv2vLKEUtFGHV?=
 =?us-ascii?Q?IRxMsW2L94AEBOhehVT/ag5sdRZBOk7ysjd6tA/sOXYCLzANESun2CJJ2/Gg?=
 =?us-ascii?Q?EJfVkjbO35AHG22IfPm/r7YvZoi0YcpGax7I2940IHjL0BUcuN3FunYvU2oo?=
 =?us-ascii?Q?hGFy3J9/xVWtCUvMm2ni9jAwC5FnOy6iNaxwFu6DewKwIfhrmwam8dUdL83t?=
 =?us-ascii?Q?zCPTP9pUb6iiZyyIkSfxF5mG53fpwCCf5K8orQ0+bAAJgh3vs3Xlx7hn+AK5?=
 =?us-ascii?Q?nWEmUWKhBVePzUa+s2CEzVHdOU1i0J8KdMFn4//lCnxN909zL2InnUgioeqk?=
 =?us-ascii?Q?Q7Vv64jlscbvxhaCHmZoPL6N5z1OXrKNNtdeCquDlUOi2otcp1COckaLzHA7?=
 =?us-ascii?Q?30G2Mp5JgjXuMI2jL9MHFgdgxWACRsD2qC6UKZCcTJgaxQiwRdw5o0RtSjpA?=
 =?us-ascii?Q?kUQ8s69+3Fr7TGsKssRqUt1vtt9JpKoMj4qCnCV5b+6Moaw6TZw5qTHpUM87?=
 =?us-ascii?Q?rJ/ajMaVzg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5430.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53674249-f7d4-4e88-5597-08da13db4a38
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 12:29:38.9849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mu7B6ssRONkdszzmTvwlX+AsnmEZiqGhz9i6rLUpgYeNjHijEDMwTSNbxrjsxbj+vEj5ufl1Fq/jdlyusR4eSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_052943_351289_092E05AE 
X-CRM114-Status: GOOD (  13.55  )
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
> Sent: Friday, April 1, 2022 8:27 PM
> To: Baochen Qiang (QUIC) <quic_bqiang@quicinc.com>
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
> Subject: Re: [PATCH v4 0/2] ath11k: Add support for SAR
> 
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
> > This is to add support for SAR, currently it is only enabled for
> > WCN6855.
> >
> > v4:
> >  1. rebased on latest ath.git
> >  2. add my own s-o-b in Wen'spatch
> >
> > v3:
> >  1. rebased on latest ath.git
> >  2. add Wen's patch to this patch set so that
> >     there is no dependency.
> 
> Thanks, threading now is correct so I assume you run git send-email only once.

Yes, I do it per your guidance. 
> 
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatch
> es

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
