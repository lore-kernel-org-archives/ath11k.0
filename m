Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52D1EE4996
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itDS6zTQyM0ZR2KrGm0m79FLZ4falX3jlNPw6GJHr8A=; b=UR+gZcDZd4stjr
	YQe0uyx6b6u6B+aeOgIzaMHa3jNFs194t9MI5HTXxqQJWmbJor6ThUKaFV+GWvfqZAqvEkvcj+m1N
	pTASJBLywx0F+j3WPcRb2ErpcrjOJvIzbqGjHoVmoWsI61Ysln2hf7rmk4R9e3rxIJYqq+9Ha9jOT
	26lk4CKZ02pQRVU6yQHDCnTpUz1hIL2u3kqhs95FfLOkewB4bf28NNJGNCRDC9aQ/U0A0A8pkmr2p
	nmRN2w10dyliPSWQ3YUJd9Rsoa5GWrNhLA70CaVqWht/evpMm1vXVLOhC5ipvcddSM93VK4dFj3KJ
	Xz6UcfwA/FGbH+emL7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLFF-00FGU8-2Z;
	Tue, 22 Aug 2023 06:52:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLFD-00FGTj-18
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 06:52:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37M6ksk2023423;
	Tue, 22 Aug 2023 06:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=isBPiWFb20PcYVG0Qhq2pDaldwVdKf3VhjUI2JB1nYo=;
 b=iTy1mtO37wnS1448/q2iqB4bCZLHUX1m04IXtZZgMqoBdqxmRIVtRQKZ00H19bj1vzAP
 s5A++L4DGXkFIWdF9Ml8qe/B/94Jukrj8nMI8fLw3q5rIdPxHVJRj2uSwkB3OeSZ850a
 n5d7i4HbGPgMcUUxlJpIq+AgW4uqz2mPvudjZrz1UN0FK0XbPwl69IZg/4ZbBjUAuJC2
 4yI82iqcgdLV5bmc/n4we1fVNxFvuA90LJoXiw3tsFlg/6g122pWys6fJCBp0RmmpjVM
 Mg/Qz0kr23UR4/Zp1ki8iwjbG9vrnUZzSuv5KGNxQzqXZDSiJMg3gHHwtE+mHbHJoOUO IQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smfjs8skn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 06:51:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37M6pvOi027533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 06:51:58 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 21 Aug
 2023 23:51:56 -0700
Message-ID: <b6a0dc7e-0ac8-60d3-44aa-dad4f0f17acd@quicinc.com>
Date: Tue, 22 Aug 2023 14:51:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 0/2] wifi: ath11k: fix data out of sync for channel list
 for reg update
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230329091235.19500-1-quic_wgong@quicinc.com>
 <2579553c-2e7f-787c-ad6b-9d21f8a08b39@quicinc.com>
 <14c745ff-c5c2-0c88-7280-70598b0f3eb0@quicinc.com>
In-Reply-To: <14c745ff-c5c2-0c88-7280-70598b0f3eb0@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BUFnMl3wT1uM2vvIoZvRu9hSh5CI3WsL
X-Proofpoint-GUID: BUFnMl3wT1uM2vvIoZvRu9hSh5CI3WsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_05,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_235203_524043_7526C016 
X-CRM114-Status: GOOD (  17.70  )
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

SGkgS2FsbGUsCgpNYXkgSSBjaGFuZ2UgdGhlIHN1YmplY3QgdG8gIndpZmk6IGF0aDExazogZml4
IGZpcm13YXJlIGNyYXNoIGFuZCB3cm9uZyAKcmVnIGRvbWFpbiB1c2VkIGluIGZpcm13YXJlIGFu
ZCBoYXJkd2FyZSIgYW5kIHNlbnQgbmV3IHZlcnNpb24gYWdhaW4/CgpPciB3aWxsIHlvdSBtZXJn
ZSB0aGlzIHZlcnNpb24/CgpPbiA4LzEvMjAyMyAxOjMyIFBNLCBXZW4gR29uZyB3cm90ZToKPiBI
aSBLYWxsZSwKPgo+IFdpbGwgeW91IHBsYW4gdG8gbWVyZ2UgaXQgb3Igd2lsbCB5b3UgZ2l2ZSBj
b21tZW50cyBzaW5jZSBpdCBoYXMgCj4gZGVmZXJyZWQvcGVuZGluZyBoZXJlIGZvciA0IG1vbnRo
ID8g8J+YgQo+Cj4gSXQgaXMgdG8gZml4IGZpcm13YXJlIGNyYXNoIGFuZCByZWcgZG9tYWluIHVz
ZWQgd3JvbmcgaW4gCj4gZmlybXdhcmUvaGFyZHdhcmUuCj4KPiBPbiA3LzEwLzIwMjMgMTE6MDMg
QU0sIFdlbiBHb25nIHdyb3RlOgo+PiBPbiAzLzI5LzIwMjMgNToxMiBQTSwgV2VuIEdvbmcgd3Jv
dGU6Cj4+PiBDdXJyZW50bHkgdGhlcmUgYXJlIHR3byB0aHJlYWRzIHRvIHVwZGF0aW5nL2ZldGNo
IGRhdGEgb2YgY2hhbm5lbAo+Pj4gbGlzdCwgYW5kIHRoZXJlIGFyZSBubyBzeW5jaHJvbml6YXRp
b24gZm9yIHRoZSBkYXRhLCBpdCBsZWFkcyBkYXRhIG91dAo+Pj4gb2Ygc3luYyBmb3IgY2hhbm5l
bCBsaXN0IGZvciByZWcgdXBkYXRlLgo+Pj4KPj4+IFNvIGNoYW5nZSB0aGUgY2FsbCBmbG93IHRv
IG1ha2Ugc3VyZSB0aGUgZmV0Y2ggZGF0YSBydW5uaW5nIGFmdGVyIHRoZQo+Pj4gdXBkYXRlIGRh
dGEgZmluaXNoZWQsIHRoZW4gZGF0YSBvZiBjaGFubmVsIGxpc3QgYmVjb21lIHN5bmNocm9uaXph
dGlvbi4KPj4+Cj4+PiBGaXhlczogZjQ1Y2I2YjI5Y2QzICgid2lmaTogYXRoMTFrOiBhdm9pZCBk
ZWFkbG9jayBkdXJpbmcgcmVndWxhdG9yeSAKPj4+IHVwZGF0ZSBpbiBhdGgxMWtfcmVnZF91cGRh
dGUoKSIpCj4+Pgo+Pj4gV2VuIEdvbmcgKDIpOgo+Pj4gwqDCoCB3aWZpOiBhdGgxMWs6IG1vdmUg
dXBkYXRlIGNoYW5uZWwgbGlzdCBmcm9tIHVwZGF0ZSByZWcgd29ya2VyIHRvIHJlZwo+Pj4gwqDC
oMKgwqAgbm90aWZpZXIKPj4+IMKgwqAgd2lmaTogYXRoMTFrOiBtb3ZlIHVkcGF0ZSBjaGFubmVs
IGxpc3QgdG8gd29ya2VyIGZvciB3YWl0IGZsYWcKPj4+Cj4+PiDCoCBkcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTFrL2NvcmUuYyB8wqDCoCAxICsKPj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMWsvY29yZS5oIHzCoMKgIDQgKwo+Pj4gwqAgZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDExay9tYWMuY8KgIHzCoCAxMyArKysrCj4+PiDCoCBkcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTFrL3JlZy5jwqAgfCAxMDAgCj4+PiArKysrKysrKysrKysrKysrLS0tLS0t
LS0tCj4+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3JlZy5owqAgfMKgwqAg
MSArCj4+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3dtaS5owqAgfMKgwqAg
MSArCj4+PiDCoCA2IGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9u
cygtKQo+Pj4KPj4+Cj4+PiBiYXNlLWNvbW1pdDogNWFhOWZmMDhjMGI3MWJlMTVhNjA3MzQxZmE1
MzQ0NTQ2ZTE5Y2ViMgo+Pgo+PiBIaSBLYWxsZSwKPj4KPj4gV2lsbCB5b3UgcGxhbiB0byBtZXJn
ZSBpdCBvciB3aWxsIHlvdSBnaXZlIGNvbW1lbnRzPwo+PgoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
