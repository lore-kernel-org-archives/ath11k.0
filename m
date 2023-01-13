Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25942C54EBE
	for <ath11k@archiver.kernel.org>; Fri, 13 Jan 2023 06:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++z+N0SMlw16+Hmt5Rn2tPSvs2ZNek38nRocyEwL13w=; b=gUIPYBIr+h8HyZ
	gyDTCNdR27FDp/17qcNzwh3UEYmswgWWsLI2vDxRJorgiynyAQoATFlInJtsq/tEQn4bXKJTR6WMa
	K2nGhoA0OWMoQMDuVI+C3AdRsnBg1Up0yDE96ehKYySRwpDXOupFwg72jYL0FxQ1UaFrRidnP2cpI
	rDt1DF8iJKDc7H5Vyf13gaEj8J20eeYMKy0cqdadeDBGsMWuPRXnD1RokOk6qM6ntaeQLiADwJlrR
	p/97CHOB1c4pwAYp++ELch9fAF21L3O3MiHH92sYeRkEPsJZqv7gEY2WVgoiyycDJHeg4HwbwQ7hJ
	4TilrhGlKKbh58v4Hxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDxv-000u5l-GE; Fri, 13 Jan 2023 06:55:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDxr-000u4t-H4
	for ath11k@lists.infradead.org; Fri, 13 Jan 2023 06:55:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30D6hqZk011487;
	Fri, 13 Jan 2023 06:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JtVpsKj4nc9eRg9XgHtoHlSj3I39NaFSNzx6h7rrpYY=;
 b=pO4xxIXcuDn1vvSD6qh4BX6r8KHPt7pIg9gQ6AqtFm2Yql3erOEDgd6BuFcXEkcu4HHS
 9iIqElq9Yl4qzRoSnm4VUwrttA5fDjBqcvSKkCxPI8DsYzbJPuHPhUhvvZPUVjwQzkx9
 hUhwUIDsD7vOld5cnUQZrH79HeWAGAviq8KMl3LuMEdeyLYgcc/W6C1kKkW81ddHs0CZ
 JGBquBfLMtG5ghrxf2ZUVYvNnsNKKaifQtxWe5bPNbbsdmTygT0d0UHpdBSxUD+sKDCT
 jSrPEijUtmhvRmsax51rnLedqow4ebuCD+CVlikk04spqnIVhgehvZOax9IJdNW4+v0P Ug== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2jghsvkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 06:54:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30D6srgc017912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 06:54:53 GMT
Received: from [10.253.13.0] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 22:54:52 -0800
Message-ID: <73908049-4a69-e65c-665b-97d068f1fef7@quicinc.com>
Date: Fri, 13 Jan 2023 14:54:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3 2/2] wifi: ath11k: reduce the timeout value back for hw
 scan from 10 seconds to 1 second
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
 <20221011072408.23731-3-quic_wgong@quicinc.com> <8735atg335.fsf@kernel.org>
 <cd96eea8-dce0-bcb9-e8ce-05fa0e0f22fb@quicinc.com>
 <e7e34c3d-8b73-f7d5-9ce8-5ed346ca9d28@quicinc.com>
 <7bcd1a12-fb60-98cd-1a29-f55efa8d1499@quicinc.com>
In-Reply-To: <7bcd1a12-fb60-98cd-1a29-f55efa8d1499@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3qy1KTm5ZvedPstTWpC14X6mKceKTiw3
X-Proofpoint-ORIG-GUID: 3qy1KTm5ZvedPstTWpC14X6mKceKTiw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-13_02,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_225459_724860_63F1F020 
X-CRM114-Status: GOOD (  16.54  )
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

SGkgS2FsbGUsCgpTaG91bGQgSSBjaGFuZ2UgY29tbWl0IGxvZyB3aXRoIGJlbG93IGV4cGxhbmF0
aW9uIGFuZCBzZW5kIHY0PwoKT24gMTIvMTYvMjAyMiAxMTowOCBBTSwgV2VuIEdvbmcgd3JvdGU6
Cj4gSGkgS2FsbGUsCj4KPiBTaG91bGQgSSBjaGFuZ2UgY29tbWl0IGxvZyB3aXRoIGJlbG93IGV4
cGxhbmF0aW9uIGFuZCBzZW5kIHY0Pwo+Cj4gT24gMTEvMjMvMjAyMiAxMTo0MSBBTSwgV2VuIEdv
bmcgd3JvdGU6Cj4+IE9uIDExLzE4LzIwMjIgNjoyOSBQTSwgV2VuIEdvbmcgd3JvdGU6Cj4+PiBP
biAxMS84LzIwMjIgNjoyMCBQTSwgS2FsbGUgVmFsbyB3cm90ZToKPj4+PiBXZW4gR29uZyA8cXVp
Y193Z29uZ0BxdWljaW5jLmNvbT4gd3JpdGVzOgo+Pj4+Cj4+PiAuLi4KPj4+PiBbLi4uXQo+Pj4+
Cj4+Pj4+IEBAIC0zNjgyLDcgKzM2NzcsMTIgQEAgc3RhdGljIGludCBhdGgxMWtfbWFjX29wX2h3
X3NjYW4oc3RydWN0IAo+Pj4+PiBpZWVlODAyMTFfaHcgKmh3LAo+Pj4+PiDCoCDCoMKgwqDCoMKg
IHJldCA9IGF0aDExa19zdGFydF9zY2FuKGFyLCAmYXJnKTsKPj4+Pj4gwqDCoMKgwqDCoCBpZiAo
cmV0KSB7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBhdGgxMWtfd2Fybihhci0+YWIsICJmYWlsZWQg
dG8gc3RhcnQgaHcgc2NhbjogJWRcbiIsIHJldCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
cmV0ID09IC1FQlVTWSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRoMTFrX2RiZyhh
ci0+YWIsIEFUSDExS19EQkdfTUFDLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICJzY2FuIGVuZ2luZSBpcyBidXN5IDExZCBzdGF0ZSAlZFxuIiwgCj4+Pj4+IGFy
LT5zdGF0ZV8xMWQpOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBhdGgxMWtfd2Fybihhci0+YWIsICJmYWlsZWQgdG8gc3RhcnQgaHcgc2Nh
bjogJWRcbiIsIAo+Pj4+PiByZXQpOwo+Pj4+PiArCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBz
cGluX2xvY2tfYmgoJmFyLT5kYXRhX2xvY2spOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYXIt
PnNjYW4uc3RhdGUgPSBBVEgxMUtfU0NBTl9JRExFOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
c3Bpbl91bmxvY2tfYmgoJmFyLT5kYXRhX2xvY2spOwo+Pj4+IFRoaXMgZmVlbHMgbGlrZSBhIGhh
Y2sgdG8gbWUsIGZvciBleGFtcGxlIHdpbGwgdGhlc2UgZmFpbGVkIHNjYW5zIG5vdwo+Pj4+IGNh
dXNlIGRlbGF5cyBpcyBjb25uZWN0aW9uIGVzdGFibGlzaG1lbnQ/IElNSE8gaXQncyBjcnVjaWFs
IGZyb20gCj4+Pj4gdXNlcidzCj4+Pj4gcG9pbnQgb2YgdmlldyB0aGF0IHdlIGRvbid0IGRlbGF5
IHRoYXQgaW4gYW55IHdheS4KPj4+IEl0IHdpbGwgbm90IGRlbGF5IGNvbm5lY3Rpb24uCj4+PiBB
ZnRlciB3bGFuIGxvYWQsIHRoZSAxc3QgaHcgc2NhbiB3aWxsIGFycml2ZWQgdG8gYXRoMTFrLCBh
bmQgdGhlbiAxMWQKPj4+IHNjYW4gd2lsbCBiZSBzZW50IHRvIGZpcm13YXJlIGFmdGVyIHRoZSAx
c3QgaHcgc2Nhbi4gSXQgbWVhbnMgdGhlIGh3Cj4+PiBzY2FuIGZvciBjb25uZWN0aW9uIGlzIHJ1
biBiZWZvcmUgMTFkIHNjYW4sIGFuZCB0aGVuIGNvbm5lY3Rpb24gY291bGQKPj4+IGJlIHN0YXJ0
ZWQgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIDFzdCBodyBzY2FuIGZpbmlzaGVkLiBJdCBtZWFucyBu
bwo+Pj4gZGVsYXkgZm9yIGNvbm5lY3Rpb24uCj4+Pj4gSSB3b3VsZCByYXRoZXIgZml4IHRoZSBy
b290IGNhdXNlLCBkbyB3ZSBrbm93IHdoYXQncyBjYXVzaW5nIHRoaXM/Cj4+PiBJbiBmaXJtd2Fy
ZSwgaHcgc2NhbiBhbmQgMTFkIHNjYW4gYXJlIGFsbCBydW5uaW5nIGluIHRoZSBzYW1lIHF1ZXVl
LAo+Pj4gdGhleSBjYW4gbm90IGJlIHJ1biBwYXJhbGxlbC4KPj4+Cj4+PiBXaGVuIDYgR0h6IGVu
YWJsZWQsIHRoZSAxc3QgaHcgc2NhbiBjb3N0IGFib3V0IDdzIGFuZCBmaW5pc2hlZCwgYW5kCj4+
PiB0aGVuIDExZCBzY2FuIGNvc3QgdGhlIG5leHQgN3MuIEFmdGVyIHRoZSAxNHMsIHRoZSBlYWNo
IGh3IHNjYW4gYXJyaXZlZAo+Pj4gdG8gYXRoMTFrIHdpbGwgYmUgcnVuIGltbWVkaWF0ZWx5LiBJ
ZiB0aGUgMm5kIGh3IHNjYW4gYXJyaXZlZCBiZWZvcmUKPj4+IHRoZSAxMWQgc2NhbiBmaW5pc2hl
ZCwgZm9yIGV4YW1wbGUsIGl0IGFycml2ZWQgNy4xIHNlY29uZHMgYWZ0ZXIgdGhlCj4+PiAxc3Qg
aHcgc2NhbiwgYXQgdGhpcyBtb21lbnQsIHRoZSAxMWQgc2NhbiBpcyBzdGlsbCBydW5uaW5nIGlu
IGZpcm13YXJlLAo+Pj4gdGhlbiB0aGUgMm5kIGh3IHNjYW4gd2lsbCBub3QgcmVjZWl2ZSBzY2Fu
IHN0YXJ0ZWQgZXZlbnQgdW50aWxsIHRoZSAxMWQKPj4+IHNjYW4gZmluaXNoZWQsIGFuZCBtZWFu
d2hpbGUsIHRoZSAybmQgaHcgc2NhbiBpcyBob2xkaW5nIHRoZSAKPj4+IGFyLT5jb25mX211dGV4
Cj4+PiBpbiBhdGgxMWtfbWFjX29wX2h3X3NjYW4oKSwgaXQgaXMgbm90IGdvb2QgdG8gaG9sZCBh
IGxvY2sgZm9yIHNvbWUKPj4+IHNlY29uZHMgYmVjYXVzZSBhci0+Y29uZl9tdXRleCBpcyB3aWRl
bHkgdXNlZC4gU28gcmVkdWNlIHRoZSAxMHMgdG8gMXMKPj4+IHRvIGF2b2lkIGhvbGRpbmcgYXIt
PmNvbmZfbXV0ZXggZm9yIGxvbmcgdGltZS4KPj4KPj4gSGkgS2FsbGUsCj4+Cj4+IFNob3VsZCBJ
IGNoYW5nZSBjb21taXQgbG9nIHdpdGggYWJvdmUgZXhwbGFuYXRpb24gYW5kIHNlbmQgdjQ/Cj4+
CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
