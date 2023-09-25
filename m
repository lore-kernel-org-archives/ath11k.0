Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC32CE7A94
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gicAIBIzwCEx2a9z2aq1au2voxBAneMegdgPfLSls30=; b=Rcv5yeuDKz0cxO
	Kx90nuSXAw3jFxJbX+f6kUQpYbnweKYdASMnyN8uk1ScZQh1gqGX5FTg22KQO5DTcMOavGD8ow3L0
	fOU1gh1LBVayVUfuRituDarqOrbF5yjPrT5Csf+gFnqr0a1r0fYGbEGaYOd/NB70uGN+Fsl3xYx4D
	kpoHpV1DqQpn1m0w4ptYKToQJWTH2jLx8TKZ/lbsKyEztmt5OpO+7OSoO7pfq23P9qttM4xvhl322
	lT9waOdaFXo/T+UDmrvRIXWRDFeDudKGEhGpNKRNBm7n/WUpmxPDp0XZm1yRetBtyDGHFUfSGIu9z
	MEv1u7qPiDrtCEno1F7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjD9-00E38K-0M;
	Mon, 25 Sep 2023 10:53:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjD6-00E36G-16
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 10:53:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P8eBWi007206;
	Mon, 25 Sep 2023 10:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kH2BXfAPrm7TQ7VktIozGJE73v9t0Nm9tLO71EuhCSQ=;
 b=gKX0chG9aLEB/tBAsm7qK4VB1Kp4mSMBk/rXfqNjWF1N1BGtpusEK4nMpgfyfdM9vEuF
 gfFU7OB/7Wa72X+x4ECqUgyqn50DWNNxj43A+OCKDEkuefb8xzdnTMQ3QsjWDFmf1XwQ
 wEZhtSoA9TuPTcwfikqaYWv6xPT+HWXb+ouzMatBWrUSAhf2Kxy1u/I1PlMqt026TU3+
 NRkfL4Fk9drN/kaGE4caDW1dQyJXa8rhH7JeZKQ52Ruj4wBTjHC9RkdX4n9MeNxOd+/E
 892NEVm2sdtKs6mibUcTr8zrkzWtB3VjbUaffY8vr0mlTl6GWbukkWSUv/hQipg+vH7B DQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tb5n88e95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:53:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38PAr11o013459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:53:01 GMT
Received: from [10.201.207.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 25 Sep
 2023 03:52:59 -0700
Message-ID: <5f95f931-e75f-459b-a7c7-b175ba12f981@quicinc.com>
Date: Mon, 25 Sep 2023 16:22:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] wifi: ath11k: update regulatory rules when
 connect to AP on 6 GHz band for station
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-6-quic_wgong@quicinc.com>
 <5e9439c5-fc02-4a18-8cc8-c76998bfcbc6@quicinc.com>
 <1f739d62-d5c0-a64b-ef9b-d5fd7b79755e@quicinc.com>
 <47e2ce79-2885-489c-b567-fdbcb120d056@quicinc.com>
 <2aae986b-1d16-3b75-d2c9-a740f6817650@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <2aae986b-1d16-3b75-d2c9-a740f6817650@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h0IsI7vet3y_yPwrmRPwC7Vd4RR9hiSg
X-Proofpoint-GUID: h0IsI7vet3y_yPwrmRPwC7Vd4RR9hiSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_08,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_035304_386453_E7D20D2C 
X-CRM114-Status: GOOD (  18.08  )
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

T24gOS8yNS8yMyAxNjoxMywgV2VuIEdvbmcgd3JvdGU6Cj4gT24gOS8yMi8yMDIzIDk6MTggUE0s
IEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPj4gT24gOS8yMi8yMyAxNTozMiwgV2VuIEdvbmcg
d3JvdGU6Cj4+PiBPbiA5LzIyLzIwMjMgNTozOSBQTSwgQWRpdHlhIEt1bWFyIFNpbmdoIHdyb3Rl
Ogo+Pj4+IE9uIDkvMjAvMjMgMTM6NTMsIFdlbiBHb25nIHdyb3RlOgo+Pj4+Cj4+Pj4+ICvCoMKg
wqAgaWYgKGF0aDExa19tYWNfc3VwcG9ydHNfNmdoel9jY19leHQoYXIpICYmCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBjdHgtPmRlZi5jaGFuLT5iYW5kID09IE5MODAyMTFfQkFORF82R0haICYmCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBhcnZpZi0+dmRldl90eXBlID09IFdNSV9WREVWX1RZUEVfU1RB
KSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZWdfaW5mbyA9ICZhYi0+cmVnX2luZm9fc3RvcmVb
YXItPnBkZXZfaWR4XTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHBvd2VyX3R5cGUgPSB2aWYtPmJz
c19jb25mLnBvd2VyX3R5cGU7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhdGgxMWtfZGJnKGFiLCBB
VEgxMUtfREJHX01BQywgIm1hYyBjaGFuY3R4IHBvd2VyIHR5cGUgJWRcbiIsCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvd2VyX3R5cGUpOwo+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKHBvd2VyX3R5cGUgPT0gSUVFRTgwMjExX1JFR19VTlNFVF9BUCkKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcG93ZXJfdHlwZSA9IElFRUU4MDIxMV9SRUdfTFBJX0FQOwo+Pj4+
IFdoeSBoYXZpbmcgX1VOU0VUXyBwb3dlciB0eXBlIGluIHZpZi0+YnNzX2NvbmYucG93ZXJfdHlw
ZSBpcyBmaW5lPyAKPj4+PiBUeXBpY2FsbHksIGR1cmluZyBhc3NvY2lhdGlvbiwgd2Ugd291bGQg
YmUgc2V0dGluZyB0aGlzIGZyb20gdGhlIAo+Pj4+IGJlYWNvbi9hc3NvY2lhdGlvbiByZXNwb25z
ZSBmcmFtZSdzIEhFIDYgR0h6IE9wZXJhdGlvbiBJbmZvIEZpZWxkLiAKPj4+PiBTbyBpcyBpdCBm
aW5lIGlmIHRoZSBmaWVsZCBpcyBjYXJyeWluZyBzb21lIGluZm8gd2hpY2ggd2UgZG9uJ3Qga25v
dyAKPj4+PiAob3IgbWF5IGJlIGRvbid0IHN1cHBvcnQgaXQgeWV0KT8gV2h5IGFyZSB3ZSBtYXNr
aW5nIGl0IHdpdGggX0xQSV8gCj4+Pj4gbW9kZT8KPj4+Pgo+Pj4+IEFsc28sIEkgc2VlIHRoYXQg
Y3VycmVudGx5IG1hYzgwMjExIG9ubHkgc2V0cyBMUEkgb3IgU1AuIFNvIGxldCdzIAo+Pj4+IHNh
eSBTVEEgaXMgdHJ5aW5nIHRvIGNvbm5lY3QgdG8gVkxQIEFQLCBtYWM4MDIxMSB3aWxsIHNldCBp
dCBhcyAKPj4+PiBfVU5TRVRfLiBBbmQgdGhlbiBoZXJlLCB3ZSB3aWxsIGJlIHRyZWF0aW5nIGl0
IGFzIExQSSBBUC4gSXMgdGhhdCBmaW5lPwo+Pj4KPj4+IEN1cnJlbnRseSBvbmx5IFNQL0xQSSBh
cmUgZGVmaW5lZCBpbiAiVGFibGUgRS0xMuKAlFJlZ3VsYXRvcnkgSW5mbyAKPj4+IHN1YmZpZWxk
IGVuY29kaW5nIGluIHRoZSBVbml0ZWQgU3RhdGVzIiBvZiBJRUVFIFN0ZCA4MDIuMTFheOKEouKA
kDIwMjEuCj4+Pgo+Pj4gU28gbWF5YmUgSSBuZWVkIHRvIHNldCBwb3dlcl90eXBlIHRvIFZMUCB3
aGVuIGl0IGlzIFVOU0VUIGhlcmUuCj4+IFllYWgsIG9yIG1heSBiZSBkZW55IGFzc29jaWF0aW9u
IGlmIHdlIGRvbid0IHN1cHBvcnQgdGhhdCBtb2RlPyBJIAo+PiB3b3VsZCBsZXQgb3RoZXJzIGNv
bW1lbnQgb24gdGhpcy4KPiBEbyB5b3Uga25vdyBob3cgdG8gY2hlY2sgd2hpY2ggbW9kZSBzdXBw
b3J0IGJ5IGF0aDExaz8KSU1ITyB3ZSBzaG91bGQgbm90IG1haW50YWluIHR3byBkaWZmZXJlbnQg
c3VwcG9ydGVkIG1vZGVzLCBvbmUgaW4gZHJpdmVyIAphbmQgYW5vdGhlciBpbiBtYWM4MDIxMS4g
SSBtZWFuIHcuci50IG1hYzgwMjExIHdlIHNob3VsZCB0cnkgdG8gbWF0Y2ggaXQgCmFzIGZhciBh
cyBwb3NzaWJsZS4gSW4gdGhpcyBjYXNlLCB3ZSBjYW4gcmV0dXJuIGVycm9yIGZyb20gbWFjODAy
MTEgCml0c2VsZiB3aGVuIGEgbm9uLXN1cHBvcnRlZCBtb2RlIChhcyBpbiBWTFApIGlzIHRyeWlu
ZyB0byBhc3NvY2lhdGU/IApTaW5jZSBhcyB5b3UgaGF2ZSBxdW90ZWQsIFZMUCBpcyBub3QgeWV0
IGRlZmluZWQgaW4gc3BlYyBJRUVFIFN0ZCAKODAyLjExYXjigJAyMDIxIHNvIHdoeSB0byBtYXNr
IHRoZSBtb2RlIGFuZCBjb250aW51ZSBpbiBtYWM4MDIxMSBpdHNlbGY/CgpJZiB3ZSBkbyBsaWtl
IHRoaXMsIHRoZW4gbWFjODAyMTEgd2lsbCBub3Qgc2ltcGx5IHNldCBfVU5TRVRfIGZvciA2IEdI
eiAKY2xpZW50IGludGVyZmFjZSBhbmQgaW4gZHJpdmVyIGlmIHdlIHNlZSBpdHMgc3RpbGwgX1VO
U0VUXyB0aGVuIHdlIGNhbiAKYmUgc3VyZSB0aGF0IHNvbWV0aGluZyBoYXMgZ29uZSB3cm9uZyBh
bmQgd2UgY2FuIHRha2Ugc3RlcHMgYWNjb3JkaW5nbHkuCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
