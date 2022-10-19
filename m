Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C376C433FE
	for <ath11k@archiver.kernel.org>; Wed, 19 Oct 2022 10:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmdKVsWHhJeKjuuQZdOWI/c8Y3lSqMP+/2vAuI+I6Ug=; b=yOJOtNcgqXqTfT
	SZ9BL/Q47n3c5PooRGFhEiCwRFfc630r7yB5CezKMOjrCfOXwbLA9gt0atvM2Xu5r3WNuFrGou1YO
	DQczJyPKFpo71xrQI//WxpwL7AlnVjDpujoIkdBa30gULFE+dsQp8/5o1YpCFRxaLUJIp/R8GCkSX
	EYn7EmCe5irF4BcnEyza6j5SBSDTqdEcGvj8kyMk2tFq+KmHafMXCFWDX/PC/8eCW3ihPKf4TTC0e
	bnWGrJFWmzxqV34sMKDZOxh971sR2mKIYm9WO7yND/V1/xqeuFZPzPUwyfQWe5w4xePy8OTTmVPIE
	8ByMXRu9nowBHCy3XmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5wZ-000326-Jh; Wed, 19 Oct 2022 10:04:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5wX-0002zz-CV
	for ath11k@lists.infradead.org; Wed, 19 Oct 2022 10:04:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29J9W97N027977;
	Wed, 19 Oct 2022 10:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IzyciU5Q8WUy5W2mpOACpQv7Au32S3s5cLbd5S+lbkw=;
 b=l42mvld7gbpqFti/7Ip5N359FHFzdAXT1NyYSAfdn6riam9qFfSNLVZAWcvhl9ECqNTp
 EpGPjujmINBKKVZeKn4kN6J0EoTsg1DKyVJKTN0D4kRFOTR6Pfhjzt1mLKI1i5Ad2Bob
 jn73dpAK8dSU27zkjfi6cPgaterT6w64zAu2JgW49pjYp7aI+takeizQ0WUgvE2xgQHr
 TZsKD5zk7CsBc76WDOR/F+Rn3pGURlwUjNv+zD1zSCJYwaruO10Hu/haSsLuzC3ZO1QX
 cK54efNFMd1dfsU/jUsGrKzzGknhEi7vbUdvzJUfeFT+e0jz+4kJT8vmmPWLgT/hBTM6 UA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9qwp36sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 10:04:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29JA4jLv007051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 10:04:45 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 19 Oct
 2022 03:04:43 -0700
Message-ID: <de54f4e0-810b-70a0-7629-39a2957ecd3d@quicinc.com>
Date: Wed, 19 Oct 2022 18:04:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: wifi: hostapd:/wpa_supplicant MLO Re: [PATCH 00/27] another set of
 MLO patches
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>,
        "Peer, Ilan" <ilan.peer@intel.com>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <6175bc95-201c-cfab-2ae6-9ba77e830394@quicinc.com>
 <09556b33ad998ad243cf75dbc230f3b07349a87e.camel@sipsolutions.net>
 <935ef9e9-2092-e3f0-0edd-4aa29f4fa775@quicinc.com>
 <e01e75013f71ede7b29f2751238935e7147796f2.camel@sipsolutions.net>
 <f3afceb8-8120-12c7-74b9-caa3abce5cb8@quicinc.com>
 <DM6PR11MB3897D1A4E13419D9F938F559F5449@DM6PR11MB3897.namprd11.prod.outlook.com>
 <96bcc467-c530-46de-8f91-c5eb0af7a368@quicinc.com>
 <776991f3-384e-f487-83b7-e1fbfd40cc4f@quicinc.com>
In-Reply-To: <776991f3-384e-f487-83b7-e1fbfd40cc4f@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hmIvF4Sm6AnoYiJEyxXFsqY_92wzy8em
X-Proofpoint-ORIG-GUID: hmIvF4Sm6AnoYiJEyxXFsqY_92wzy8em
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_06,2022-10-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 mlxlogscore=968 malwarescore=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_030457_561955_82FACEF4 
X-CRM114-Status: GOOD (  14.72  )
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

SGkgSWxhbi9BbmRyZWksCgpXaWxsIHlvdSBzZW5kIHlvdXIgcGF0Y2hlcyBvZiB3cGFfc3VwcGxp
Y2FudCBmb3IgTUxPIHRvIHVwc3RyZWFtP/CfmIEKCk9uIDEwLzExLzIwMjIgMTA6MjggQU0sIFdl
biBHb25nIHdyb3RlOgo+IEhpIElsYW4vQW5kcmVpLAo+Cj4gV2lsbCB5b3Ugc2VuZCB5b3VyIHBh
dGNoZXMgb2Ygd3BhX3N1cHBsaWNhbnQgdG8gdXBzdHJlYW0/8J+YgQo+Cj4gT24gOS8yOC8yMDIy
IDExOjEyIFBNLCBXZW4gR29uZyB3cm90ZToKPj4gT24gOS8xMi8yMDIyIDk6MTcgUE0sIE90Y2hl
cmV0aWFuc2tpLCBBbmRyZWkgd3JvdGU6Cj4+Pj4+IFdlbGwsIE9LLCB5b3Ugb2J2aW91c2x5IGFy
ZSBhZGp1c3RpbmcgdGhlIHN1cHBsaWNhbnQgdG8gd29yayB3aXRoIE1MTwo+Pj4+PiAob3RoZXJ3
aXNlIHlvdSB3b3VsZG4ndCBnZXQgYW4gTUxPIGNvbm5lY3Rpb24gaW4gdGhlIGZpcnN0IHBsYWNl
KSwgc28KPj4+Pj4geWVhaCwgdGhpcyBpcyBwYXJ0IG9mIHRoZSBhZGp1c3RtZW50cyBuZWVkZWQu
Cj4+Pj4+Cj4+Pj4+IElsYW4vQW5kcmVpIGhhdmUgYWxsIG9mIHRoaXMgd29ya2luZywgbWF5YmUg
d2UgY2FuIHNoYXJlIHRoZSBwYXRjaGVzCj4+Pj4+IGV2ZW4gYmVmb3JlIHJlYmFzZSBldGMuCj4+
PiBIaSwKPj4+IE91ciBpbXBsZW1lbnRhdGlvbiBpcyBiYXNlZCBvbiBvdXIgaW50ZXJuYWwgdHJl
ZSwgc28gaXQgd2lsbCB0YWtlIAo+Pj4gc29tZSB0aW1lIHRvIGNsZWFudXAgYW5kIHBvcnQgaXQg
Zm9yIHVwc3RyZWFtLgo+Pj4gSG9wZWZ1bGx5IEkgd2lsbCBoYXZlIHNvbWUgdGltZSB0byB3b3Jr
IG9uIGl0IHRoaXMgYW5kIG5leHQgd2VlayBhbmQgCj4+PiBtYXliZSB3ZSB3aWxsIGJlIGFibGUg
dG8gc2hhcmUgc29tZXRoaW5nIGluaXRpYWwuCj4+IE1heSBJIGdldCB5b3VyIHBhdGNoZXM/Cj4+
Pgo+Pj4gQW5kcmVpCj4+Pj4+IGpvaGFubmVzCj4+Pj4gVGhhbmtzLgo+Pj4+Cj4+Pj4gSXQgaXMg
Z29vZCB0byBzaGFyZSBtZSB0aGUgd3BhX3N1cHBsaWNhbnQgcGF0Y2hlcyBBU0FQLgo+Pj4+Cj4+
Pj4gQW5kIEkgaGF2ZSBhbm90aGVyIHF1ZXN0aW9uOgo+Pj4+Cj4+Pj4gV2hlbiBtYWM4MDIxMSB1
c2UgdGhlIE1MRCBhZGRyIGluIGF1dGhlbnRpY2F0aW9uL2Fzc29jIHJlcXVlc3QsCj4+Pj4KPj4+
PiBmaW5hbGx5LCBpdCBzaG91bGQgYmUgcmVwbGFjZWQgd2l0aCBvbmUgbGluaydzIGFkZHJlc3Mg
aW4gYWlyIHBvcnQsIAo+Pj4+IHJpZ2h0Pwo+Pj4+Cj4+Pj4gSXQgbWVhbnMgdGhlIE1MRCBhZGRy
IHdpbGwgbmV2ZXIgZXhpc3QgaW4gbWFjODAyMTEgaGVhZGVyIG9mIHBhY2tldCAKPj4+PiBpbiB0
aGUKPj4+PiBhaXIgcG9ydCwgcmlnaHQ/CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
