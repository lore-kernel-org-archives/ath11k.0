Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF679CE7A95
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 15:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ukw74agCqoKynPmmpjUf9rSr8GJlfvEvmGEdk/Ok6AY=; b=Qvlm8wywcmdjMX
	ed9sKAayGwyJ/naDxtbjYeJvxXT+Dj/oynz4/jVV9A6CBmHgUVjD+uLwAS5JnT9N8+g5CJLSavSyU
	00FUlvG2BAGil2o++fNyUtZQduNvKZ0A7qjDqIAxh6yLG3Q9WvKV5hEJfyIKvQbEIT2tI8BU6xlKB
	lE74XyjDGxB/tMfijNiOpFsfR74akjuClO9P8dpfXfYouK/K+S161/46/AOjpapqC4ZFoMPgjxz9P
	gUtpzuF5iOm52eFyp2RALACSKnupGJOCFO5pnImLxdktysyDHzAWNFCuyJDSeAIvveZ4m+0o2OIwk
	jhtkBAl6qczdmJMzZbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkn9k-00EVHB-1Q;
	Mon, 25 Sep 2023 15:05:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkn9g-00EVG9-2n
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 15:05:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38PENWkR008140;
	Mon, 25 Sep 2023 15:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+cqfdTIiPv8R5ERGjFj0EWFXtCpyYL+Dj52qrdHozsQ=;
 b=HeSxho6Q0dQ8gkOuYt9uXumGMusNiIsLKHRLsfH5bsDTY7B/ktUQYw7O/EVtpP2gwmx9
 JxQFamHrnHUS/RXyYVsyjpqmzjL474/zGFKQ9q431t5wFnlUpgVGstfD5lOxrRL2FP2e
 JxpVMNCz94aXY53LT+Q86Eov0F/ljrezn9Aq55uLjp8v/1oW22YeR2XHfstrPX0CgJ3D
 ncDZmh1TR130Bd9GTX/bpCYpDPgpdlSndA5xryk7HiNoWtWgnEta0YYtL79ULRapZsla
 LJQSF2TePYoKTHvBxczQrpNwY07a2QqugpqT8rqxkN5BfXynC/0t+MXn3MLrWZ1jlZDv qQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tb72sgs9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 15:05:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38PF5jhQ009444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 15:05:45 GMT
Received: from [10.48.244.213] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 25 Sep
 2023 08:05:45 -0700
Message-ID: <7cb8dae5-81b6-4a01-84d3-cb60484a8bb5@quicinc.com>
Date: Mon, 25 Sep 2023 08:05:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: add trace log support
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>,
        Venkateswara Naralasetty
	<quic_vnaralas@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <1636439755-30419-1-git-send-email-quic_vnaralas@quicinc.com>
 <e1594171-6859-6b93-e865-3216975e6135@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <e1594171-6859-6b93-e865-3216975e6135@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4qn05n8YQLhSvApi63dphis2xJN_2l2b
X-Proofpoint-ORIG-GUID: 4qn05n8YQLhSvApi63dphis2xJN_2l2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_12,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=844 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_080549_073986_5A1DB592 
X-CRM114-Status: GOOD (  15.31  )
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

T24gOS8yNS8yMDIzIDI6MjQgQU0sIFdlbiBHb25nIHdyb3RlOgo+IE9uIDExLzkvMjAyMSAyOjM1
IFBNLCBWZW5rYXRlc3dhcmEgTmFyYWxhc2V0dHkgd3JvdGU6Cj4gWy4uLl0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvd21pLmMgCj4+IGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay93bWkuYwo+PiBpbmRleCA1YWUyZWY0Li44MGY3NzYwIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3dtaS5jCj4+ICsr
KyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvd21pLmMKPj4gQEAgLTI0OSw2ICsy
NDksOCBAQCBzdGF0aWMgaW50IGF0aDExa193bWlfY21kX3NlbmRfbm93YWl0KHN0cnVjdCAKPj4g
YXRoMTFrX3BkZXZfd21pICp3bWksIHN0cnVjdCBza19idWYKPj4gwqDCoMKgwqDCoCBjbWRfaGRy
ID0gKHN0cnVjdCB3bWlfY21kX2hkciAqKXNrYi0+ZGF0YTsKPj4gwqDCoMKgwqDCoCBjbWRfaGRy
LT5jbWRfaWQgPSBjbWQ7Cj4+ICvCoMKgwqAgdHJhY2VfYXRoMTFrX3dtaV9jbWQoYWIsIGNtZF9p
ZCwgc2tiLT5kYXRhLCBza2ItPmxlbik7Cj4+ICsKPj4gwqDCoMKgwqDCoCBtZW1zZXQoc2tiX2Ni
LCAwLCBzaXplb2YoKnNrYl9jYikpOwo+PiDCoMKgwqDCoMKgIHJldCA9IGF0aDExa19odGNfc2Vu
ZCgmYWItPmh0Yywgd21pLT5laWQsIHNrYik7Cj4gCj4gVGhpcyB3aWxsIHRyYWNlIDMgdGltZXMg
YmVjYXVzZSBhdGgxMWtfd21pX2NtZF9zZW5kKCkKPiAKPiBjYWxscyBhdGgxMWtfd21pX2NtZF9z
ZW5kX25vd2FpdCgpIDMgdGltZXMgd2hlbiB0aGUgY3JlZGl0IGlzIG5vdCAKPiBhdmFpbGFibGUu
Cj4gCj4gQW55IG9uZSBrbm93IGhvdyB0byBjaGFuZ2UgaXQgd2l0aCBhIGdvb2Qgd2F5PwoKbXkg
Zmlyc3QgdGhvdWdodCBpcyB0byBoYXZlIGFuIGl0ZXIgPSAwIHZhcmlhYmxlIGluIAphdGgxMWtf
d21pX2NtZF9zZW5kKCkgYW5kIHRvIGFkZCB0aGF0IGFzIGFuIGFkZGl0aW9uYWwgcGFyYW0gdG8g
CmF0aDExa193bWlfY21kX3NlbmRfbm93YWl0KCk6CnJldCA9IGF0aDExa193bWlfY21kX3NlbmRf
bm93YWl0KHdtaSwgc2tiLCBjbWRfaWQsIGl0ZXIrKyk7Cgp0aGVuIHRoZSB0cmFjZSBsb2dpYyB3
b3VsZCBjaGFuZ2UgdG8gb25seSB0cmFjZSBvbiB0aGUgZmlyc3QgaXRlcmF0aW9uOgppZiAoIWl0
ZXIpCgl0cmFjZV9hdGgxMWtfd21pX2NtZChhYiwgY21kX2lkLCBza2ItPmRhdGEsIHNrYi0+bGVu
KTsKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
