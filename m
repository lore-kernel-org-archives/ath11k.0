Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A596EC77B71
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFT7cU3jr/0fc6xyQS5DpRi3x3XoXmxz4J0aqYdj7q0=; b=QjVK47DG4302A3
	n0lo76Bk86f/kftTLRSh1j2hGpVrIwJ5RBSVpyvGwbdE7UdPQIZQkXjkyFS6Q5HNExZiS+s86gfn+
	cNqpsBq+/3++f6hhEt12I6eq8cELWJns39N+/hZVcffQYAq4r/Hiripfx8vSfuJHjmyaBc54bfmyw
	j4iCduo4CuRx1ox58CSdzffm+ZYaCeRuIl4++56/ejxEyv9x9JRb5sXYDKiUIJMhsuw/TxW2IGRRo
	hd7MhGoXhWjH2/KXaOYaYMzCeJHPNxcYdM3tBcXQ/J8qOI3FfIgG7ZYzLlwBl9rIAbaEH223jReUl
	6okwzhEXZ2vfRMkgKjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohEe-001OvJ-1k;
	Tue, 18 Apr 2023 09:02:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohEb-001Out-3A
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:02:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33I6rXVt001531;
	Tue, 18 Apr 2023 09:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=l/0BZGTzjvZ6dX24FI/6K0xb+b3mKb3sBi5RawShN7c=;
 b=H1b+DFg5tdpQybiNh5YlsdlVecBr8uZ0M1WUp+/GZCIiWa3SgYYhSqEsu7grGM/IZAxj
 q19F3jDxlvhCCv/qsUlRcNpFpXcuCHnXmSopFQEm6okAYuL0VhysILCUlEHpGJk2Y6aT
 pquzZwp18Mp1n+gCDcW88LDADOxpwsR0ONTZmUSWdRB4ATG0/mkVceT6R7HwwTzwc4yG
 xnPDsxUrxqH9AC2ZuRL0sTKb/DonXEuKEXp6VPa0H9bgY3Z4tn/Wngwc04BKJEjH3hQ3
 d+lpXzpFw1queS4TjFwyzgByo4mgLtXMDy1ma9A6Cwn/MJCAn+k2oZTbmVCX2hMSCNXU Eg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q1nf8gc5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:02:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33I92iJx020523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:02:44 GMT
Received: from [10.253.75.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 02:02:43 -0700
Message-ID: <2842f57c-e383-fb9e-d994-95336cb65e0d@quicinc.com>
Date: Tue, 18 Apr 2023 17:02:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
 <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
 <571d8ecf-2ca6-8b7b-6e15-be12c56e9f88@quicinc.com>
 <e40ee96ab2a8d9d079d3a06b7b1c615ab25a2403.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <e40ee96ab2a8d9d079d3a06b7b1c615ab25a2403.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hT7ueim_ejWawQJLZ-42Dgb8gZuC8mMQ
X-Proofpoint-ORIG-GUID: hT7ueim_ejWawQJLZ-42Dgb8gZuC8mMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_05,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_020246_048686_2B1AABAB 
X-CRM114-Status: GOOD (  18.43  )
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

T24gNC8xOC8yMDIzIDQ6NDggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gSGksCj4KPj4gTXkg
Y2FzZSBpczoKPj4gV2hlbiBjb25uZWN0IHdpdGggMiBsaW5rcyBBUCwgdGhlIGNmZzgwMjExX2hv
bGRfYnNzKCkgaXMgY2FsbGVkIGJ5Cj4+IGNmZzgwMjExX21sbWVfYXNzb2MoKQo+PiBmb3IgZWFj
aCBCU1Mgb2YgdGhlIDIgbGlua3MsCj4+Cj4+IFdoZW4gYXNzc29jUmVzcCBmcm9tIEFQIGlzIG5v
dCBzdWNjZXNzKHN1Y2ggYXMgc3RhdHVzX2NvZGU9PTEpLCB0aGUKPj4gaWVlZTgwMjExX2xpbmtf
ZGF0YSBvZiAybmQgbGluayhzZGF0YS0+bGlua1tsaW5rX2lkXSkKPj4gaXMgTlVMTCBiZWNhdXNl
IGllZWU4MDIxMV9hc3NvY19zdWNjZXNzKCktPmllZWU4MDIxMV92aWZfdXBkYXRlX2xpbmtzKCkK
Pj4gaXMgbm90IGNhbGxlZC4KPj4KPj4gVGhlbiBzdHJ1Y3QgY2ZnODAyMTFfcnhfYXNzb2NfcmVz
cCByZXNwIGluIGNmZzgwMjExX3J4X2Fzc29jX3Jlc3AoKSBhbmQKPj4gc3RydWN0IGNmZzgwMjEx
X2Nvbm5lY3RfcmVzcF9wYXJhbXMgY3IgaW4gX19jZmc4MDIxMV9jb25uZWN0X3Jlc3VsdCgpCj4+
IHdpbGwgb25seSBoYXZlIHRoZSBkYXRhIG9mCj4+IHRoZSAxc3QgbGluaywgYW5kIGZpbmFsbHkg
Y2ZnODAyMTFfY29ubmVjdF9yZXN1bHRfcmVsZWFzZV9ic3NlcygpIG9ubHkKPj4gY2FsbCBjZmc4
MDIxMV91bmhvbGRfYnNzKCkKPj4gZm9yIHRoZSAxc3QgbGluaywgdGhlbiBCU1Mgb2YgdGhlIDJu
ZCBsaW5rIHdpbGwgbmV2ZXIgZnJlZSBiZWNhdXNlIGl0cwo+PiBob2xkIGlzIGF3bGF5cyA+IDAg
bm93Lgo+IEhhaCwgeWVzLCBvdWNoLgo+Cj4+IEkgZm91bmQgaXQgaXMgbm90IGVhc3kgdG8gcmVm
aW5lIGl0LCBzbyBkbyB5b3UgaGF2ZSBhbnkgYWR2aXNlL2lkZWE/Cj4+Cj4+IGZvciAobGlua19p
ZCA9IDA7IGxpbmtfaWQgPCBJRUVFODAyMTFfTUxEX01BWF9OVU1fTElOS1M7IGxpbmtfaWQrKykg
ewo+PiAgIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpZWVlODAyMTFfbGlua19kYXRhICpsaW5rOwo+
Pgo+PiAgIMKgwqDCoMKgwqDCoMKgIGxpbmsgPSBzZGF0YV9kZXJlZmVyZW5jZShzZGF0YS0+bGlu
a1tsaW5rX2lkXSwgc2RhdGEpOwo+PiAgIMKgwqDCoMKgwqDCoMKgIGlmICghbGluaykKPj4gICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pgo+PiAgIMKgwqDCoMKgwqDCoMKgIGlm
ICghYXNzb2NfZGF0YS0+bGlua1tsaW5rX2lkXS5ic3MpCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb250aW51ZTsKPj4KPj4gICDCoMKgwqDCoMKgwqDCoCByZXNwLmxpbmtzW2xpbmtfaWRd
LmJzcyA9IGFzc29jX2RhdGEtPmxpbmtbbGlua19pZF0uYnNzOwo+PiAgIMKgwqDCoMKgwqDCoMKg
IHJlc3AubGlua3NbbGlua19pZF0uYWRkciA9IGxpbmstPmNvbmYtPmFkZHI7Cj4+ICAgwqDCoMKg
wqDCoMKgwqAgcmVzcC5saW5rc1tsaW5rX2lkXS5zdGF0dXMgPSBhc3NvY19kYXRhLT5saW5rW2xp
bmtfaWRdLnN0YXR1czsKPj4KPiBCdXQgaXMgaXQgcmVhbGx5IHNvIGhhcmQ/IFdlIG9ubHkgbmVl
ZCBsaW5rIGZvciBsaW5rLT5jb25mLT5hZGRyLCBhbmQgd2UKPiBjYW4gdXNlIGFzc29jX2RhdGEt
PmxpbmtbbGlua19pZF0uYWRkciBmb3IgdGhhdCBpbnN0ZWFkLCBubz8gV2UgbmVlZCB0bwo+IHN0
b3JlIHRob3NlIGxvY2FsbHkgdG8gYXZvaWQgYSB1c2UtYWZ0ZXItZnJlZSwgYnV0IHRoYXQncyBh
dCBtb3N0IDE1Cj4gYWRkcmVzc2VzIG9uIHRoZSBzdGFjaywgd2hpY2ggc2VlbXMgYWNjZXB0YWJs
ZT8KPgo+IE9oIGFuZCB0aGVyZSdzIHRoZSB1YXBzZCBzdHVmZiBidXQgdGhhdCBvbmx5IG1hdHRl
cnMgaW4gdGhlIHN1Y2Nlc3MgY2FzZQo+IGFueXdheS4gSW4gZmFjdCBJJ20gbm90IGV2ZW4gc3Vy
ZSB0aGUgYWRkcmVzcyBtYXR0ZXJzIGluIHRoZQo+IHVuc3VjY2Vzc2Z1bCBjYXNlIGJ1dCB3ZSBo
YXZlIGl0IHByZXR0eSBlYXNpbHkuCj4KPiBqb2hhbm5lcwpPSy4gU28gSSBndWVzcyB5b3UgYWxy
ZWFkeSBoYXZlIGdvb2Qgd2F5IHRvIHJlZmluZSBpdD8KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
