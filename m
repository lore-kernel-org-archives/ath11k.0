Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D0C7EE23
	for <ath11k@archiver.kernel.org>; Wed, 10 May 2023 11:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItUE9b2icOcQkqRhFS6NyCb6uzEIf/nV5WEJJ5MP+Xo=; b=xMUWLkAkBUThf5
	CIRDUYuxxhFzGd684iRy7WYsyFlB5NYi5pp/Bvr9KCT5GiZZPwlnN1Nmsv13R8FrvSDXsX1Ts0tII
	qyINad7osd88BYQs/ZD65D1aY2yNWxTddD1lMmlkrflLgj4cTVQBvygT170HG/9BbsR+x5yyD7AbK
	SjcLqPqD5vdKf1e5sTHquu8JSGpE8q4+zr5rOXPlEcrznJtAQsqOYHPJKec7UC827hGyfCQz/JI1+
	rqTQtGPuTj2J4V7ENeiCXhDpspMtstnpdREKjsngoTwxZpJaYvqvJPZLuWVvY9nCxvDSOuFKELLKN
	v8DQSgYIoLjdh3aTXGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwheS-005yFQ-2v;
	Wed, 10 May 2023 11:06:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwheP-005yAu-1s
	for ath11k@lists.infradead.org;
	Wed, 10 May 2023 11:06:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34AAsbWx008015;
	Wed, 10 May 2023 11:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JErtuWGSqc9V/q5r1R29GLPFC1WZUCfCZdCNnlP7EIM=;
 b=Ml5IXZC88tHbnHct7Ld6elsVog9bIq/GQiZJWpuvfWlLPvrJP0+a0QhOrc3VF9T6mNoY
 l90AQg+PiJBl6cek77IOQ3eVKfwKOR20TtJF/ELjvMjwC12WjlCVv4zlPsMepWPqidOz
 YNtId1EQ/yenJvno+CY3w0WLXfOHPO/nMdKw2ZzJqf81tEnJDpkFoIb5dtrezAS1ll/y
 03DorwFVvlOfx3h2EmjIW8vh7LddoYN3u45c7Y0x79ZB3oNRSTHKJKVLU6DhFMXA8G0b
 PivZC4a2sLISMae2e3GFoDbYw421ab5/vLW2qrOLTQh5NXZLLah1qugaQ9TXHgx9P7u8 Sw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfr50a3cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 11:06:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AB6OMK026829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 11:06:24 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 04:06:23 -0700
Message-ID: <5e3ec5f8-1462-5de6-2b5a-4cf62f23deb7@quicinc.com>
Date: Wed, 10 May 2023 19:06:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iTg8xEAHFCIE9xGewc8cQWQDWxFhX5GP
X-Proofpoint-ORIG-GUID: iTg8xEAHFCIE9xGewc8cQWQDWxFhX5GP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=878 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305100088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_040629_633359_844B4E52 
X-CRM114-Status: GOOD (  16.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gNC8xMS8yMDIzIDM6MzggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVHVlLCAyMDIz
LTA0LTA0IGF0IDExOjI4ICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gTWF5IEkgYWxzbyBhZGQg
YSBmaWVsZCBzdWNoIGFzICJ1MTYgYWN0aXZlX2xpbmtzX2NvdW50IiBpbiBzdHJ1Y3QKPj4gd2lw
aHlfaWZ0eXBlX2V4dF9jYXBhYiwKPj4gYW5kIGFkZCBsb2dpYyBpbiBmdW5jdGlvbiBpZWVlODAy
MTFfc2V0X3ZpZl9saW5rc19iaXRtYXBzKCkgZm9yIHN0YXRpb24KPj4gbGlrZSB0aGlzID86Cj4+
IGlmIChhY3RpdmVfbGlua3NfY291bnQgJiYgaHdlaWdodDE2KGxpbmtzKSA8PSBhY3RpdmVfbGlu
a3NfY291bnQpCj4+ICAgwqDCoMKgIHRoZW4gc2RhdGEtPnZpZi5hY3RpdmVfbGlua3MgPSBsaW5r
czsKPj4KPiBBbHNvIGhlcmUsIG5vdCBzdXJlIGl0IG1ha2VzIHNlbnNlIGluIGNmZzgwMjExIGxl
dmVsPwo+Cj4gVGhvdWdoIEknbSBub3Qgc3VyZSB3aGF0IHRoZSBpZGVhIGhlcmUgaXMgYXQgYWxs
IC0geW91IGNhbiByZWZ1c2UgdG8KPiBsaW5rIHN3aXRjaCBldGMsIHdoYXQgd291bGQgeW91IHVz
ZSB0aGlzIGZvcj8KPgo+IFRoZW4gYWdhaW4sIHdlIGhhdmVuJ3QgcmVhbGx5IGRlc2lnbmVkIG91
dCBhbGwgdGhlIGxpbmsgc2VsZWN0aW9uIHN0dWZmLAo+IGRvIHdlIHdhbnQgd3BhX3MgdG8gZG8g
aXQsIGRyaXZlciB0byBkbyBpdCwgZXRjLj8gSGVuY2UgZGVidWdmcy4gU28KPiBkZXBlbmRpbmcg
b24gd2hhdCBlbmQgdXAgZG9pbmcgdGhlcmUsIHdlIHdpbGwgb2J2aW91c2x5IG5lZWQgdG8KPiBh
ZHZlcnRpc2Ugc29tZSBsZXZlbCBvZiBsaW5rLWNvbmN1cnJlbmN5IHRvIHVzZXJzcGFjZS4KClNv
IHdpbGwgeW91IHBsYW4gdG8gZG8gc29tZXRoaW5nIHRvIGxldCB3cGFfcy91c2Vyc3BhY2UgYXBw
IAphY3RpdmUvZGVhY3RpdmUgbGlua3M/CgpPciB5b3UgYWxyZWFkeSBoYXZlIGltcGxlbWVudGVk
IHRoYXQ/Cgo+Cj4gam9oYW5uZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
