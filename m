Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B789FC433EF
	for <ath11k@archiver.kernel.org>; Tue, 22 Mar 2022 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnagkK3QQKeWEGf2NQ37srWYeHqxtACDYh7iy3xBHDU=; b=ubFcSkqiZNVjL6
	75V1Bp52OEhZwD4WtuJIiEwPYY6tyhKsRzFQG3F7VFZV7LPXGgxcoLlBVm0N+05Py1k9Epz+8wGBn
	QFJeDUPBZQR2l4xxNycBLi23OT8iFS/2ITRepNP3S5iNNTEs2PlGDOXzXgd83Quu3r3NhMUVJb6UD
	Rn+skkReddaO6CNSTGewwNfEvN+W6970wj6QL8dZb+WMV40WO6BgL0muluRDh7dnIddCGyT6q9lzL
	JCH5Nm3QVux2sMHhF65kangvA3Cw0Mwx5AKgHw1OBH9KRlaLD/Y4amBhdPBQoxYuk0IAntmOwy1Hm
	x1XDhtDNDr1uE8KchJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWeuR-00B77G-6f; Tue, 22 Mar 2022 13:50:51 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWeuM-00B76l-0x
 for ath11k@lists.infradead.org; Tue, 22 Mar 2022 13:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1647957046; x=1648561846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uOs0Ix8xHLgozkBtnVsqGAxcGTavdoh3zZvideMhdeQ=;
 b=Reok7x3gsmnuasXRPRvLxb8YqK3dgSR4mNrPNJUxxYus6NcpxhXtEZ9w
 EEoj4Yuayxi677CDaPt22IJB5uA+LG0cRZQTRVBkcRjMn7diuvkUtOLnx
 oPv07/So4+XVqjszs/uCMBkgdZu60gmqXoa4f41uDPfJjJHfYy81ln+su E=;
Received: from mail-dm6nam08lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 13:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig6YNESzp/fhIhY4ZG2zgFDTBXfVaxDmLnQke/X8fN2PuoYA+cgW31bPsUugzgToGNjoWKe+gHHrJ0fqKWxIVVz852d0aHdBsN9HhdsMvTx/Hljv7ZLSz5o3dlrckVno60uNwozIdfJrIe+egrLRGXSknGQgCfrONBQ/ngZ+sY3FR9fDh7cQKNtf17svUGoniVyvq+E8IlPtFRHtIeA3tP+sZSgdRbL4Vqb5F5ceHE381iANV2AzBIL4Al93Lk77a9lN/HGBIsVKljhEVhPj110hd+wMfE3t6w1IhS3Mu4HnLMaE1nt8v4Xx3k2iPO2ICHQnQKCJhITVhbR7Rxhs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOs0Ix8xHLgozkBtnVsqGAxcGTavdoh3zZvideMhdeQ=;
 b=mIQ7IeA8ThlDWlC8XS8kyIHyny6kYDGdNFBT66Tqq+jUZN2SpXcHAKqBHWFqYMM4QlsKngnv7wVj8umQdsygsNAKObiXU6AAFEdFQMUidljD1cROaS/4pBCCdfcUN4Fw/bYD9O/lL74ji4f/kKU6Fn8+SAEbpb3BhCkXanKt0hR+OZ7NAZHUr1s+zZQ9AhnuNOsKhvF6C3iEbPPkF4yMlHyYTedDl8CxAspdsHcMEzKz3i9I1j6PCr1yZH1gTufvZipzbsQdQQ7tZ+x/v1bDYUPotKo/ENZ6/vBPKBvVMZifLx2//5TMJYC7Vn3Xx9php2UNmyPOO4XUEGjPtLn14A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM6PR02MB4937.namprd02.prod.outlook.com (2603:10b6:5:1a::16) by
 SJ0PR02MB8643.namprd02.prod.outlook.com (2603:10b6:a03:3fd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 13:50:39 +0000
Received: from DM6PR02MB4937.namprd02.prod.outlook.com
 ([fe80::68c2:f8b4:f787:211e]) by DM6PR02MB4937.namprd02.prod.outlook.com
 ([fe80::68c2:f8b4:f787:211e%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 13:50:39 +0000
From: "Rameshkumar Sundaram (QUIC)" <quic_ramess@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>, "Rameshkumar Sundaram (QUIC)"
 <quic_ramess@quicinc.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: RE: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
Thread-Topic: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
Thread-Index: AQHYIkgqfAgpLdnS+EWoRYfPSRKpZ6y6KrAAgA9VNCCAAD8mAIAB5AFw
Date: Tue, 22 Mar 2022 13:50:39 +0000
Message-ID: <DM6PR02MB493734ADBBC6C996845B9EF3E9179@DM6PR02MB4937.namprd02.prod.outlook.com>
References: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
 <1644914581-21682-2-git-send-email-quic_ramess@quicinc.com>
 <a517835c51a5eaf00e87fdaaef47546f70ff0d42.camel@sipsolutions.net>
 <DM6PR02MB4937C53041172E9A52846A0BE9169@DM6PR02MB4937.namprd02.prod.outlook.com>
 <a537c6e02afbfa26eec2a54dbd8bc649f77ae3a3.camel@sipsolutions.net>
In-Reply-To: <a537c6e02afbfa26eec2a54dbd8bc649f77ae3a3.camel@sipsolutions.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9666fb9b-ea18-40c1-2759-08da0c0af31c
x-ms-traffictypediagnostic: SJ0PR02MB8643:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR02MB8643679E13F825695F97363795179@SJ0PR02MB8643.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GfgQISZN6XKnCXaC5usA9N7/dnuffu6xyTcLymPk0dlzqnFDGYJEoxraYU0/pWpLLQ3UTZaxFOX2z3Z8R6Bj40YcxUHdUmYRvKlm1K6hk/TGgadHvQchYmcgWB5ny34p9OYhva091TdyIT/d0O7f1RQfgQZWHnuJpDV7HPuz26LSsKHRd08bbn5dLEFdhH9rtm0zAlX4k+gi7Ck9HgRvaw+4SL5Z340qzglWIq6aMwb3M2M/g0vHAiYaCyAhfSRbkYl8Lijqb3tEhL05RR+ny6zq2Ur3CO0rgYYZPYBS83zLEmDtsEyUAMzfpPxJL5lZmlxlx7CGqtLV6xiBu7ijDzlk5q8YTBbwEgSHPNnXHdcZQep8QST9NoYU1Gy+CP9gJZ73DZhz0+pFLyVxjYdWgBMoDisPQdWKmYNHsIV0QUXKsCz4hvj2k2WHjle9Buy8RuGl25od4de8aAOOK4SBJOQWDfUTtK6roBh7D8JpWYLvaTfwR6DVm6kQ02+7PGDSv14lOy54PSYFhxahhsm6ljH1ibPmudXr0Sr2vBNDA0q3WiUT4sqqh+Gqpn8fIBh1sIlCPiuIV2OF1eBtzkQ337iXDrf3lI/nAuT9lyrV2L6lOqXz9DyjRMJMz2ZRtYK4qi3IOd5O82skqpaAgVmqmyPxJUYTIpkV+p9M1YPhWgcTR9mxDhVB6FkEVWeNQoY32APAgWpkTxhLEV4wrdziDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB4937.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(4326008)(2906002)(52536014)(66476007)(66946007)(8676002)(66556008)(64756008)(66446008)(76116006)(55016003)(186003)(26005)(508600001)(6506007)(9686003)(8936002)(7696005)(53546011)(71200400001)(38070700005)(316002)(122000001)(86362001)(5660300002)(110136005)(54906003)(38100700002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTRNdFhIdTlLL1plSnJldVRXbStETVlxTGYvL2VvNnRzMVBZdFpSNzRHTng3?=
 =?utf-8?B?eTlqaHpKNjZuM1N2d3VnZGxzOEdYV3pGdStESzd5RSthU09NUTNJSlk5S3ZX?=
 =?utf-8?B?dnRDY3BkbE95SFJiQTF2VVpkdHZoVFJ3T1FCL2V0TFh2SGhRRnBsdWt1ZUQ0?=
 =?utf-8?B?WTVyVDRiVTZMS2RGa0FWOEFpOTBjWlRNQk5LZlpya1BZOVduQldmcUtxK3cy?=
 =?utf-8?B?VGF4amllUGN5YzdtQnV4NEYydXRFK1I3cnRmODRNL1lEY29DczR6R1l5N1BR?=
 =?utf-8?B?SkExSXZrQjZWWTRsMnNZbWpmQi9KZ1QvbUV0eGlnTDZDUjBzd2dCS0ZnYUY4?=
 =?utf-8?B?azV1bU0vekdYRWMxQ1pDTVRpMjZDK0hEN2dSSzQ1bFI1Q3hXMVVhT2p0dFFL?=
 =?utf-8?B?Yy9UcFNLdEF6anNSOEtVWUhiZXdKRm5EYzRGcFBrRG9sd094aFZZdzd4UkEz?=
 =?utf-8?B?STMxOUY1YkJEYnE3dlVTUTErWnQxM3Z2SmQ2dUVLS1dDWjVRUGhGQU5RSkVv?=
 =?utf-8?B?aWZVOHVJbkorSVRHbmkrR3NsVmdTd1hRZ0w3VEdDZFM2ajBOendiTVMvQ2Jh?=
 =?utf-8?B?M3AzMy9tN3FNZi8rY1hwYjFzK2FHcnlDNGdZYXE0Yjl4Lzc5U0R5eGpkalov?=
 =?utf-8?B?SjRYRFk5ZGJaaW15cTNEYXUwdkN6ZHZSVnk4ditCaUJkbE1JLytXVUJKTUJm?=
 =?utf-8?B?TG5rd3Z5WFRrbUF2L2M3YXkraXorYzhlRjRyaUFYOHl4WG0yQ283dkZOY3ZT?=
 =?utf-8?B?NndSeHFIWDBWNzhnbEFtOU9tY0lraFRoM2RDR0NxQUE2Q25OOWpuTlFLbXh4?=
 =?utf-8?B?T3locUZhNWZ4WTR0ZkcrWXBNdVhPT2ExOFRDcWJmcGh3ZXdwWXNsWk9QeVdw?=
 =?utf-8?B?MTRZd1RoV3dIazYzRXFzbit2NndxQ3hkVTBUajFnNElMZVBtVXp1M0JNbEFS?=
 =?utf-8?B?dER6Y0grY2pkS2xRZm5jOXVSdEw2Nkx5ZHFUbFJLNWxhanhremFkQjBxcUlv?=
 =?utf-8?B?eGQ5Wi8zQzBwS1grUUJHdjlqS1VKY3Ava3ZvQytxd0E1ODAxcEFzREpzUEh2?=
 =?utf-8?B?NjRNaWxjQ1RhMUppbkRxODF4aENwRnhxOCtTUEFHRGZWdExLK0orenNoR3BM?=
 =?utf-8?B?S0RJdnB5WUNjYjVMNzJqSEZlbmdHY2h5TlZoM0RNQzZsQ3l0elZ5U2dNYUgv?=
 =?utf-8?B?Tjd0dXRZc0NyLzVrNDFlNTBMcytHQlN2eWEyTFlpdVk4SUUxUTk4bEZUaTE2?=
 =?utf-8?B?TDB0Q0lubmJqMThFNDBRZWZKdHF6Nzk5emNUR1RVaTBzUGozNiszYUc4d3Zi?=
 =?utf-8?B?dExXTDRCK1YvRTF0ano1QnVZV3ViOWtEVUJiWXNTelVkN3ZzTzBDV1JoREpx?=
 =?utf-8?B?T3pFOXY1OVd2NnVKeHg5SW8xbFFUOUp0Uks3eHc4bGRobkY3cjdSVHhLNHpy?=
 =?utf-8?B?bmltYXAvQThSdURiVzJqQ3F0Z2ZiRjJIeGl4dTJURzl2d1hWT01xMFhQTk1I?=
 =?utf-8?B?ZE1YSDdRaXdjWWtiaXl6a2ZxZ2F2czlyVEJWa2xBQXpPK3VMeElJSUEreFMx?=
 =?utf-8?B?U1o3azEyMmF2Nkh3cEhmUmZWSDdCT09oZ3lJaGNGSG5WRE5JR08yU01pYnpq?=
 =?utf-8?B?QzdHdjhRcXNsQm9JdlprNmtVbzUyKzNIR0hhUGFoSXpTL1lLdFdRNlBWRXNu?=
 =?utf-8?B?TUVGVXNVSWs3WkVpSUtNOHBiVzVTQVVUa1dKU3JvN2xPZ3BMUHNEdjg5aVFC?=
 =?utf-8?B?UVRvRlpWTWtuZkN4Q1dkS1FjeGJzMDF2WXJQVXE2Zm1QZ0xZbUo4MS9jQ2Q2?=
 =?utf-8?B?aGNaRjNEbXVLOHBBRm81QkVoaVVYd3pLNE1YYjJXMDg5bEJVVWtaaXpKM1d1?=
 =?utf-8?B?M2ZsRkJHdjJPOXRkTGJHcUI2TC9qT0ZHSnVFbkx3cDJGeldFalEvaEpJS1hs?=
 =?utf-8?Q?eu5c6FPkP7uP85x8akZWO7Dx/Eq4nwrw?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4937.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9666fb9b-ea18-40c1-2759-08da0c0af31c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 13:50:39.3167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rjpS0dc1rHEGh7rj7WRHzVcKT91fzpXDVRt5ATzP68BP1uqfMPIPqOYg7NM0u2kKCZR1fX4yQPataGGT1fZwDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_065046_178217_FA954CCA 
X-CRM114-Status: GOOD (  17.18  )
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
> Sent: Monday, March 21, 2022 2:28 PM
> To: Rameshkumar Sundaram (QUIC) <quic_ramess@quicinc.com>
> Cc: linux-wireless@vger.kernel.org; ath11k@lists.infradead.org
> Subject: Re: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
> duplicate transmission
> 
> On Mon, 2022-03-21 at 05:12 +0000, Rameshkumar Sundaram (QUIC) wrote:
> >
> > >
> > > I am wondering though if this should even be detected from the HE
> > > operation element itself, rather than from the beacon rate settings
> > > that are separate in nl80211?
> > This is a BW dependent bit in HE Oper IE and user space can switch BW
> > (CSA/chan switch scenarios).
> > Which can call assign_beacon directly, Hence adding the logic here to
> > cover all Beacon change cases.
> >
> 
> Yeah but still ... why do we take it from the content rather than adding a
> control for it?
So, Suggestion here is to add a new NL attribute to carry the information from user space for
START_AP and SET_BEACON NL commands and use it here, is that understanding correct ?
> 
> johannes
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
