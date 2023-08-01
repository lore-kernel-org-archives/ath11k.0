Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABD5EB64DD
	for <ath11k@archiver.kernel.org>; Tue,  1 Aug 2023 05:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4/k/ygCjo29JSPAmFHICkZfPZgOKcx+gpclDkNZrr8=; b=ItBp5I3s0caQbs
	yZLbJrb9UUea59vOM554lyhUy8ytfpsvgYp84IT+5BIocgo/E7SR+zVJKZIqTvqnN65FQPBrkFYyI
	1knNfPyHSbsHs3ZaeFyHXwQvBvZBOzG81Tc1dVjSSFDXt+YIppesvY73iYjI9mtEF0DK0fstxJFJ4
	E/U+NZXFVV8roFOJkdMg7f4iJY8gO1dVQ7wM7Txqszk5enmOPt/5dqn48lC1Ab7eI7CCJcKQjnIzR
	uqecOT6ZLZq37fM/rth/AqYux/n8D2T996br2Nr14huSucNbErgZhYLJxEQjMwr08AImEk3la6N0f
	m0xNYTnUUUopS5PHtLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQhzm-000OOn-1L;
	Tue, 01 Aug 2023 05:32:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQhzj-000ONf-1I
	for ath11k@lists.infradead.org;
	Tue, 01 Aug 2023 05:32:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37157XQJ015987;
	Tue, 1 Aug 2023 05:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bWzmmG7N6knUsuMwcVF1xrZO6xxcVxQ/41A9QqZTQlA=;
 b=dh9g0Y6a/M1O1vyAfDhbf4boHooRCxe81q6rxo9EiCHScB28Sr59+r5DanXrgnr+p5BE
 P2MtsW+VwQwpYdC5vfg3ODk6/vE+R5b8Dj2ZdSpAxrKInA6S/T8U4dvnYUJxuxWhUzI6
 W78Ct4PLzmi4qZAMZSlHvZC3O1ph6cTdlkfxwOWBEUvvb5IzbnOkXj/h06wL+Slygq0w
 8LYlBasCZpy3r1bF1mONUVvyDC956x9zhn7wKa6EvOMPgj+Emu0SZhUpIiqlIXTJnmAj
 MCzWWf/vFjncovMcIBHXLsZVCwynPeF7fTBnC7SY0k/iGRWnK4kOwIqvUxKrcqDItimI vg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s6d61j8v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 05:32:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3715WPlp016538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Aug 2023 05:32:25 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 22:32:24 -0700
Message-ID: <14c745ff-c5c2-0c88-7280-70598b0f3eb0@quicinc.com>
Date: Tue, 1 Aug 2023 13:32:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] wifi: ath11k: fix data out of sync for channel list
 for reg update
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230329091235.19500-1-quic_wgong@quicinc.com>
 <2579553c-2e7f-787c-ad6b-9d21f8a08b39@quicinc.com>
In-Reply-To: <2579553c-2e7f-787c-ad6b-9d21f8a08b39@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pNnSqAlOHtrP4PalAsWrz-3whaLeR0Yc
X-Proofpoint-ORIG-GUID: pNnSqAlOHtrP4PalAsWrz-3whaLeR0Yc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_03,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308010051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_223231_446149_B87A2AD9 
X-CRM114-Status: GOOD (  17.61  )
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

SGkgS2FsbGUsCgpXaWxsIHlvdSBwbGFuIHRvIG1lcmdlIGl0IG9yIHdpbGwgeW91IGdpdmUgY29t
bWVudHMgc2luY2UgaXQgaGFzIApkZWZlcnJlZC9wZW5kaW5nIGhlcmUgZm9yIDQgbW9udGggPyDw
n5iBCgpJdCBpcyB0byBmaXggZmlybXdhcmUgY3Jhc2ggYW5kIHJlZyBkb21haW4gdXNlZCB3cm9u
ZyBpbiBmaXJtd2FyZS9oYXJkd2FyZS4KCk9uIDcvMTAvMjAyMyAxMTowMyBBTSwgV2VuIEdvbmcg
d3JvdGU6Cj4gT24gMy8yOS8yMDIzIDU6MTIgUE0sIFdlbiBHb25nIHdyb3RlOgo+PiBDdXJyZW50
bHkgdGhlcmUgYXJlIHR3byB0aHJlYWRzIHRvIHVwZGF0aW5nL2ZldGNoIGRhdGEgb2YgY2hhbm5l
bAo+PiBsaXN0LCBhbmQgdGhlcmUgYXJlIG5vIHN5bmNocm9uaXphdGlvbiBmb3IgdGhlIGRhdGEs
IGl0IGxlYWRzIGRhdGEgb3V0Cj4+IG9mIHN5bmMgZm9yIGNoYW5uZWwgbGlzdCBmb3IgcmVnIHVw
ZGF0ZS4KPj4KPj4gU28gY2hhbmdlIHRoZSBjYWxsIGZsb3cgdG8gbWFrZSBzdXJlIHRoZSBmZXRj
aCBkYXRhIHJ1bm5pbmcgYWZ0ZXIgdGhlCj4+IHVwZGF0ZSBkYXRhIGZpbmlzaGVkLCB0aGVuIGRh
dGEgb2YgY2hhbm5lbCBsaXN0IGJlY29tZSBzeW5jaHJvbml6YXRpb24uCj4+Cj4+IEZpeGVzOiBm
NDVjYjZiMjljZDMgKCJ3aWZpOiBhdGgxMWs6IGF2b2lkIGRlYWRsb2NrIGR1cmluZyByZWd1bGF0
b3J5IAo+PiB1cGRhdGUgaW4gYXRoMTFrX3JlZ2RfdXBkYXRlKCkiKQo+Pgo+PiBXZW4gR29uZyAo
Mik6Cj4+IMKgwqAgd2lmaTogYXRoMTFrOiBtb3ZlIHVwZGF0ZSBjaGFubmVsIGxpc3QgZnJvbSB1
cGRhdGUgcmVnIHdvcmtlciB0byByZWcKPj4gwqDCoMKgwqAgbm90aWZpZXIKPj4gwqDCoCB3aWZp
OiBhdGgxMWs6IG1vdmUgdWRwYXRlIGNoYW5uZWwgbGlzdCB0byB3b3JrZXIgZm9yIHdhaXQgZmxh
Zwo+Pgo+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2NvcmUuYyB8wqDCoCAx
ICsKPj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9jb3JlLmggfMKgwqAgNCAr
Cj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmPCoCB8wqAgMTMgKysr
Kwo+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3JlZy5jwqAgfCAxMDAgKysr
KysrKysrKysrKysrKy0tLS0tLS0tLQo+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTFrL3JlZy5owqAgfMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MWsvd21pLmjCoCB8wqDCoCAxICsKPj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25z
KCspLCAzNCBkZWxldGlvbnMoLSkKPj4KPj4KPj4gYmFzZS1jb21taXQ6IDVhYTlmZjA4YzBiNzFi
ZTE1YTYwNzM0MWZhNTM0NDU0NmUxOWNlYjIKPgo+IEhpIEthbGxlLAo+Cj4gV2lsbCB5b3UgcGxh
biB0byBtZXJnZSBpdCBvciB3aWxsIHlvdSBnaXZlIGNvbW1lbnRzPwo+CgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
