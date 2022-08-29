Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D971ECAAA2
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 05:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=300M2L/AEf/XD7ca5YpdVedxziingWzOfmg7x2I5iCs=; b=GW0ZvEl++YrHYD
	09sWUEAwx2DPLvNRXa8tVXrNDZEo7h1iNQJY+qDFpGWjgOiMr4aHyEK+ifSByEKcTMBde5ib6MVvT
	vbAhJSfbMGA+uUTzfTL9Ww0r+e51roUdMqgHKnR6u7lpI/FR4v+l6LQlSPyUVkbrCOiEo1GdE49Ax
	P52ZxquQ8kf3EvJl1CwLZHLmjSqDNJgfZ0ZDSUYjJau9N3rIYKBXmoblESuw29/rSxrSzNoeEhLie
	sOZ1Tbf6qUcElLrXbBTIFtqEHfNyiUlIOFIFt357kfq9FCbJeGm2dm+GyXW4RZcY3QO+gN5qFjUKp
	LwDSqtVacuVPAwxYqS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSXKe-004sin-Qc; Mon, 29 Aug 2022 05:29:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSXKU-004sa3-62
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 05:29:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T57Pk7016038;
	Mon, 29 Aug 2022 05:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EW2F4L/XpbEDsLWMOgSNEbNhIrAfG156wun3eMDlbD0=;
 b=pguAod/ASw3tr6lY/69sSBHkFf+QUCnkSwebgwonql3ADKLYEuHtD/y95P2uZeet+cR3
 D4WLG/ork+UTmOsgS9uMqA/qRHKlU+NV6nU95WiKJgVxqQVUHcJjPPwcoBD6J07g3eZQ
 BRKB2TqWPdqc0dgWVpZABVYPrOJ83DKzKY7I0WubnnJLcNqzxOfHhN8dz9hM0Xo/Hlmt
 eaM3d12AmxMYzBusYeOcdW+tZPQggQCq57WSHWCAtin781nn81OxruYtl1i+xs38Nf5/
 RPzrbbqMWHBths6b7QOGk9ESVc0LrJcULh1JIInOlNV7ZPN1BdACjfEG36iVltoGD37R wQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j78muvamn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:28:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27T5SmWp031282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:28:48 GMT
Received: from [10.204.117.202] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 28 Aug
 2022 22:28:46 -0700
Message-ID: <4f95f560-7f09-48d2-9121-5bee5c4201ab@quicinc.com>
Date: Mon, 29 Aug 2022 10:58:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/4] ath11k: Enable low power mode when WLAN is not active
Content-Language: en-US
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
 <ad99d238-dc1a-3233-fc6b-0cd49e428903@amd.com>
 <6daefd60-dcbc-06e1-8091-ea225690edf8@amd.com>
 <ecce8764-1760-4617-49aa-c111305ebd55@quicinc.com>
 <7e00cc36-3a07-92e2-c60e-a3c8939b407e@amd.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <7e00cc36-3a07-92e2-c60e-a3c8939b407e@amd.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vTDbRqgS6NK0ZjXmW3pAQHoyV8NMdVr8
X-Proofpoint-ORIG-GUID: vTDbRqgS6NK0ZjXmW3pAQHoyV8NMdVr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_222900_260346_0AD0D72A 
X-CRM114-Status: GOOD (  33.33  )
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

T24gOC8yNS8yMDIyIDEwOjQ2IFBNLCBMaW1vbmNpZWxsbywgTWFyaW8gd3JvdGU6Cj4gT24gOC8y
NS8yMDIyIDA2OjI0LCBNYW5pa2FudGEgUHViYmlzZXR0eSB3cm90ZToKPj4gT24gNy8yMy8yMDIy
IDU6MzkgUE0sIExpbW9uY2llbGxvLCBNYXJpbyB3cm90ZToKPj4+IE9uIDcvMjIvMjAyMiAxNzow
MCwgTGltb25jaWVsbG8sIE1hcmlvIHdyb3RlOgo+Pj4+IE9uIDcvMjAvMjAyMiAwODo0OSwgTWFu
aWthbnRhIFB1YmJpc2V0dHkgd3JvdGU6Cj4+Pj4+IEN1cnJlbnRseSwgV0xBTiBjaGlwIGlzIHBv
d2VyZWQgb25jZSBkdXJpbmcgZHJpdmVyIHByb2JlIGFuZCBpcyBrZXB0Cj4+Pj4+IE9OIChwb3dl
cmVkKSBhbHdheXMgZXZlbiB3aGVuIFdMQU4gaXMgbm90IGFjdGl2ZTsga2VlcGluZyB0aGUgY2hp
cAo+Pj4+PiBwb3dlcmVkIE9OIGFsbCB0aGUgdGltZSB3aWxsIGNvbnN1bWUgZXh0cmEgcG93ZXIg
d2hpY2ggaXMgbm90Cj4+Pj4+IGRlc2lyYWJsZSBvbiBhIGJhdHRlcnkgb3BlcmF0ZWQgZGV2aWNl
LiBTYW1lIGlzIHRoZSBjYXNlIHdpdGggbm9uLVdvVwo+Pj4+PiBzdXNwZW5kLCBjaGlwIHdpbGwg
bm90IGJlIHB1dCBpbnRvIGxvdyBwb3dlciBtb2RlIHdoZW4gdGhlIHN5c3RlbSBpcwo+Pj4+PiBz
dXNwZW5kZWQgcmVzdWx0aW5nIGluIGhpZ2hlciBiYXR0ZXJ5IGRyYWluLgo+Pj4+Pgo+Pj4+PiBT
ZW5kIFFNSSBNT0RFIE9GRiBjb21tYW5kIHRvIGZpcm13YXJlIGR1cmluZyBXaUZpIE9GRiB0byBw
dXQgZGV2aWNlCj4+Pj4+IGludG8gbG93IHBvd2VyIG1vZGUuCj4+Pj4+Cj4+Pj4+IFRlc3RlZC1v
bjogV0NONjc1MCBodzEuMCBBSEIgV0xBTi5NU0wuMS4wLjEtMDA4ODctUUNBTVNMU1dQTFotMQo+
Pj4+Pgo+Pj4+PiBNYW5pa2FudGEgUHViYmlzZXR0eSAoNCk6Cj4+Pj4+IMKgwqAgYXRoMTFrOiBG
aXggZG91YmxlIGZyZWUgaXNzdWUgZHVyaW5nIFNSTkcgZGVpbml0Cj4+Pj4+IMKgwqAgYXRoMTFr
OiBNb3ZlIGhhcmR3YXJlIGluaXRpYWxpemF0aW9uIGxvZ2ljIHRvIHN0YXJ0KCkKPj4+Pj4gwqDC
oCBhdGgxMWs6IEVuYWJsZSBsb3cgcG93ZXIgbW9kZSB3aGVuIFdMQU4gaXMgbm90IGFjdGl2ZQo+
Pj4+PiDCoMKgIGF0aDExazogRml4IGZhaWxlZCB0byBwYXJzZSByZWd1bGF0b3J5IGV2ZW50IHBy
aW50Cj4+Pj4+Cj4+Pj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvY29yZS5j
IHwgMjM3IAo+Pj4+PiArKysrKysrKysrKysrKysrKystLS0tLS0tCj4+Pj4+IMKgIGRyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvY29yZS5oIHzCoMKgIDggKy0KPj4+Pj4gwqAgZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9oYWwuY8KgIHzCoMKgIDEgKwo+Pj4+PiDCoCBkcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jwqAgfMKgIDMzICsrLS0KPj4+Pj4gwqAg
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9yZWcuY8KgIHzCoMKgIDIgKwo+Pj4+PiDC
oCA1IGZpbGVzIGNoYW5nZWQsIDE4OSBpbnNlcnRpb25zKCspLCA5MiBkZWxldGlvbnMoLSkKPj4+
Pj4KPj4+Pgo+Pj4+IFRoaXMgc2VyaWVzIGxvb2tlZCBwb3RlbnRpYWxseSBwcm9taXNpbmcgdG8g
bWUgZm9yIGEgcHJvYmxlbSB0aGF0IAo+Pj4+IEknbSBzZWVpbmcgb24gYSBub3RlYm9vayBmYWls
aW5nIHRvIHNsZWVwIHdoZXJlIFdMQU5fV0FLRSBpcyAKPj4+PiBhc3NlcnRlZCBvbiB0aGUgV0NO
Njg1NSBvbiByZXN1bWUgZXZlbiB0aG91Z2ggV29XIHdhc24ndCBzZXQgYXQgCj4+Pj4gYWxsLsKg
IFRoaXMgaXMgcHJvYmxlbWF0aWMgYXMgaXQgY2F1c2VzIGEgc3B1cmlvdXMgd2FrZSB3aGlsZSBT
VVQgaXMgCj4+Pj4gcmVhZGluZyBmcm9tIHRoZSBFQyBzaW5jZSB0d28gSVJRcyBhcmUgbm93IGFj
dGl2ZSBhbmQgdGhlIGtlcm5lbCAKPj4+PiB3YWtlcyBmcm9tIHRoYXQuCj4+Pj4gUmVtb3Zpbmcg
dGhlIFdDTjY4NTUgZnJvbSB0aGUgc3lzdGVtIGl0IGRvZXNuJ3QgaGFwcGVuLgo+Pj4+Cj4+Pj4g
SSBmaWd1cmVkIEknZCBnaXZlIGl0IGEgc3BpbiB0byBzZWUgaWYgaXQgaW1wcm92ZWQgdGhpbmdz
Lgo+Pj4+IEkgYXBwbGllZCB0aGUgc2VyaWVzIG9uIHRvcCBvZiA1LjE5LXJjNyBhbmQgaXQgYXBw
bGllZCBjbGVhbmx5IGJ1dCBJIAo+Pj4+IGdldCB0aW1lb3V0cyBvbiB3bGFuIGNhcmQgaW5pdCAo
YW5kIG9mIGNvdXJzZSBzdXNwZW5kIGZhaWxzIG5vdyB0b28pLgo+Pj4+Cj4+Pj4gSGVyZSdzIHRo
ZSBtaGkvYXRoMTFrX3BjaSBzbmlwcGV0czoKPj4+Pgo+Pj4+IFvCoMKgwqAgMi44NjQxMTBdIGF0
aDExa19wY2kgMDAwMDowMTowMC4wOiBCQVIgMDogYXNzaWduZWQgW21lbSAKPj4+PiAweGI0MDAw
MDAwLTB4YjQxZmZmZmYgNjRiaXRdCj4+Pj4gW8KgwqDCoCAyLjg2NDkwMV0gYXRoMTFrX3BjaSAw
MDAwOjAxOjAwLjA6IE1TSSB2ZWN0b3JzOiAzMgo+Pj4+IFvCoMKgwqAgMi44NjQ5MTJdIGF0aDEx
a19wY2kgMDAwMDowMTowMC4wOiB3Y242ODU1IGh3Mi4xCj4+Pj4gW8KgwqDCoCAzLjEwNjg5Ml0g
bWhpIG1oaTA6IFJlcXVlc3RlZCB0byBwb3dlciBPTgo+Pj4+IFvCoMKgwqAgMy4xMDcwNTRdIG1o
aSBtaGkwOiBQb3dlciBvbiBzZXR1cCBzdWNjZXNzCj4+Pj4gW8KgwqDCoCAzLjE5ODE3OF0gbWhp
IG1oaTA6IFdhaXQgZm9yIGRldmljZSB0byBlbnRlciBTQkwgb3IgTWlzc2lvbiBtb2RlCj4+Pj4g
W8KgwqDCoCAzLjk3MTAxOV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGNoaXBfaWQgMHgyIGNo
aXBfZmFtaWx5IDB4YiAKPj4+PiBib2FyZF9pZCAweGZmIHNvY19pZCAweDQwMGMwMjEwCj4+Pj4g
W8KgwqDCoCAzLjk3MTAyNV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZ3X3ZlcnNpb24gMHgx
MTA4MGJiYiAKPj4+PiBmd19idWlsZF90aW1lc3RhbXAgMjAyMS0xMi0xNiAwMzo0MiBmd19idWls
ZF9pZCAKPj4+PiBXTEFOLkhTUC4xLjEtMDMwMDMtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9M
SVRFLTIKPj4+PiBbwqDCoMKgIDQuMjkwMzI4XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMCB3bHAx
czA6IHJlbmFtZWQgZnJvbSB3bGFuMAo+Pj4+IFvCoMKgwqAgNC4zMDg3NjBdIGF0aDExa19wY2kg
MDAwMDowMTowMC4wOiBGYWlsZWQgdG8gc2V0IHRoZSByZXF1ZXN0ZWQgCj4+Pj4gQ291bnRyeSBy
ZWd1bGF0b3J5IHNldHRpbmcKPj4+PiBbwqDCoMKgIDQuMzA5MDI4XSBhdGgxMWtfcGNpIDAwMDA6
MDE6MDAuMDogRmFpbGVkIHRvIHNldCB0aGUgcmVxdWVzdGVkIAo+Pj4+IENvdW50cnkgcmVndWxh
dG9yeSBzZXR0aW5nCj4+Pj4gW8KgwqAgMTQuMzg2MjAxXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAu
MDogcW1pIGZhaWxlZCB3bGFuIGluaSByZXF1ZXN0LCAKPj4+PiBlcnIgPSAtMTEwCj4+Pj4gW8Kg
wqAgMTQuMzg2MjEwXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogcW1pIGZhaWxlZCB0byBzZW5k
IHdsYW4gZncgCj4+Pj4gaW5pOi0xMTAKPj4+PiBbwqDCoCAxNC4zODYyMTRdIGF0aDExa19wY2kg
MDAwMDowMTowMC4wOiBmYWlsZWQgdG8gc2VuZCBmaXJtd2FyZSAKPj4+PiBzdGFydDogLTExMAo+
Pj4+IFvCoMKgIDE0LjM4NjI0M10gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGZhaWxlZCB0byBz
dGFydCBmaXJtd2FyZTogLTExMAo+Pj4+IFvCoMKgIDE0LjM4NjI2Nl0gYXRoMTFrX3BjaSAwMDAw
OjAxOjAwLjA6IGZhaWxlZCB0byBzZXR1cCBkZXZpY2U6IC0xMTAKPj4+PiBbwqDCoCAxNC4zODYz
MDBdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gc3RhcnQgZGV2aWNlIDogLTEx
MAo+Pj4+Cj4+Pj4gQW5kIHNvIC0gb24uCj4+Pj4gSXMgaXQgZnVuY3Rpb25hbGx5IGRlcGVuZGVu
dCBvbiBvdGhlciBwYXRjaGVzIGluIGxpbnV4LW5leHQgb3IgCj4+Pj4gYW5vdGhlciB0cmVlIEkg
d29uJ3Qgc2VlIGluIDUuMTk/Cj4+Pgo+Pj4gSSBoYWQgYSB0cnkgd2l0aCBsaW51eC1uZXh0IGFu
ZCB5b3VyIHNlcmllcyBidXQgSSByZXByb2R1Y2UgdGhlIHNhbWUgCj4+PiBmYWlsdXJlIEkgZGVz
Y3JpYmVkIGFib3ZlLgo+Pj4KPj4+IGVlM2EwNjZlNGY0ZSAoSEVBRCkgYXRoMTFrOiBGaXggZmFp
bGVkIHRvIHBhcnNlIHJlZ3VsYXRvcnkgZXZlbnQgcHJpbnQKPj4+IDRmODUwZjFlMjZkYyBhdGgx
MWs6IEVuYWJsZSBsb3cgcG93ZXIgbW9kZSB3aGVuIFdMQU4gaXMgbm90IGFjdGl2ZQo+Pj4gZTMy
MGM4ZWY5ODQxIGF0aDExazogTW92ZSBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiBsb2dpYyB0byBz
dGFydCgpCj4+PiBkYmMyNjAzNmMxZWYgYXRoMTFrOiBGaXggZG91YmxlIGZyZWUgaXNzdWUgZHVy
aW5nIFNSTkcgZGVpbml0Cj4+PiAxOGMxMDdhMWYxMjAgKHRhZzogbmV4dC0yMDIyMDcyMiwgbGlu
dXgtbmV4dC9tYXN0ZXIpIEFkZCBsaW51eC1uZXh0IAo+Pj4gc3BlY2lmaWMgZmlsZXMgZm9yIDIw
MjIwNzIyCj4+Pgo+Pj4KPj4KPj4gU29ycnkgZm9yIGxhdGUgcmVwbHkgYW5kIHRoYW5rcyBmb3Ig
cmVwb3J0aW5nIHRoZSBidWcuCj4+IEFmdGVyIHNldmVyYWwgcm91bmRzIG9mIGRpc2N1c3Npb25z
IHdpdGggdGhlIGNvbmNlcm5lZCB0ZWFtcyBvbiB0aGUgCj4+IGZhaWx1cmUgdGhhdCB5b3UgaGF2
ZSByZXBvcnRlZCwgd2UgaGF2ZSByb290IGNhdXNlZCB0aGUgaXNzdWUuCj4+Cj4gCj4gVGhhbmtz
IGZvciBnZXR0aW5nIGJhY2sgdG8gbWUgYW5kIGNvbmZpcm1pbmcgdGhhdC4KPiAKPj4gVGhlIGNo
YW5nZXMgdGhhdCBJIGhhdmUgcG9zdGVkIHdpbGwgbm90IHdvcmsgb24gb3RoZXIgdGFyZ2V0cyBs
aWtlIAo+PiBXQ042ODU1IGFzIGlzLiBJdCByZXF1aXJlcyBhZGRpdGlvbmFsIGNoYW5nZXMgYW5k
IHRoZXJlZm9yZSBsb3RzIG9mIAo+PiB0ZXN0aW5nLgo+IAo+IFdlbGwgZ2xhZCBJIHJlcG9ydGVk
IGl0IGFuZCBzYXZlZCB5b3UgYSByZWdyZXNzaW9uIQo+IAo+Pgo+PiBGb3Igbm93LCBJIGhhdmUg
cG9zdGVkIGEgVjIgZW5hYmxpbmcgdGhlICJsb3cgcG93ZXIgbW9kZSIgZGVzaWduIG9ubHkgb24K
Pj4gV0NONjc1MC4gSSBoYXZlIHN0YXJ0ZWQgd29ya2luZyBvbiBlbmFibGluZyB0aGUgbG9naWMg
Zm9yIG90aGVyIAo+PiBjaGlwc2V0cyBhbHNvLiBPbmNlIHRoZSBjaGFuZ2VzIGFyZSB3ZWxsIHRl
c3RlZCwgSSdsbCBwb3N0IGEgc2VwYXJhdGUgCj4+IHBhdGNoIHRvIGVuYWJsZSBpdCBvbiBXQ042
ODU1LiBJdCBtaWdodCB0YWtlIGEgbGl0dGxlIG1vcmUgdGltZS4KPj4KPiAKPiBXaWxsIGxvdyBw
b3dlciBtb2RlIG9uIFdDTjY4NTUgYWxzbyByZXF1aXJlIEYvVyBjaGFuZ2VzLCBvciB5b3UgZXhw
ZWN0IAo+IHRoYXQgaXQgd2lsbCBiZSBhYmxlIHRvIGJlIGRvbmUgZW50aXJlbHkgaW4gdGhlIGtl
cm5lbCBkcml2ZXI/CgpJdCBzaG91bGQgbW9zdCBsaWtlbHkgYmUgYSBkcml2ZXIgY2hhbmdlLgoK
PiAKPiBJIGFtIGVhZ2VyIHRvIHNlZSBpZiBsb3cgcG93ZXIgbW9kZSBjYW4gZml4IG15IGV4aXN0
aW5nIG1lbnRpb25lZCBpc3N1ZS4gCj4gIMKgSWYgaXQgY2FuIHlvdSBtYXkgQ0MgbWUgd2hlbiB0
aGV5IGdvIG91dCBhbmQgSSdtIGhhcHB5IHRvIHRlc3QgdGhlc2UgCj4gcGF0Y2hlcyB0b28gd2hl
biB5b3UgaGF2ZSB0aGVtIHJlYWR5Lgo+IAoKU3VyZSwgdGhhbmtzISEKCi0tIAphdGgxMWsgbWFp
bGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
