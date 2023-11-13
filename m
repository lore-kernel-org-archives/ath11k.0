Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F6C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 00:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQsy8dYdDK9cHCFiQtYBSvn+GXvs6rzvDMrHH4JFvcU=; b=dXp+nbrSULE+AT
	sY+oPjpq6pHX5qydKkxNc9rHKGUcwA0uY1VTTqFvC0cTjGJ1sU2mXnCj7mZdqOqPjxw2+kdsifzxt
	7hOgT+UT2l5jwzvb7Ki3YDLjkguYOvVLpGWz638NsYTR6h7mQZUSiWwLlzAqiDqRVNyERLezyxFBP
	tF1+c+qyPtgE8WvioKyFQC+qf1R6WEf7T19dEB2YkkjwGCk8O8Ve9qxV+GraLfdvrLkrVZYzVgTER
	pu6LGbpi2u7spSIPKwcFfOXaHCX9lzLPaqdkkkLHhNIuDC/M5Qqc9VGnfxVwR1cUf7n06wc/m/DFM
	NaFMjWuXbeZ8xiuh+8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KsD-00CvVD-32;
	Mon, 13 Nov 2023 00:32:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KsA-00CvUK-0i
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 00:32:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AD0MgQ5012327;
	Mon, 13 Nov 2023 00:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DDJAuqU6dNI49U0AqHcyTXIU3f3WNSMCiLfZf/s9yAY=;
 b=M8JwBZdS9kjGbrXOtjl8bbW7kA8VL5OS4i3Y/NbD8ODHKsL1/ooxtN3NwHzs4H6DIaJK
 Ot30nhV81U+2trRQqGbZw5R915G13NHwhXYm7YZ2MjVfxPxDdK61RmaNWRq6CB8GfLeh
 O3klLhQl/iCGwhkQUItJNLaOZNZyp/rfUyrgtBicLEXpIzz5hIvrNi3ZWKDldFl4ZcL1
 Rnaq5981txZMTBjjYqi/T5Vu+vc0dVAujYjCtbSDoj9f70OQVTtH+T1Q3mnjNcb5vgDR
 /pblHkJKAaAV0AjOfnYcZUcpXMdc7lfxrscnxomPGJTJlPYOeQgndmwnn6ldExRsrpMo XQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua1q1jhhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 00:32:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AD0W3IG029472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 00:32:03 GMT
Received: from [10.253.78.207] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sun, 12 Nov
 2023 16:32:01 -0800
Message-ID: <6c21c0ae-ddaf-4c62-9017-1cbbf2eaa429@quicinc.com>
Date: Mon, 13 Nov 2023 08:32:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/8] bus: mhi: host: add new interfaces to handle MHI
 channels directly
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
 <20231110102202.3168243-3-kvalo@kernel.org>
 <2cb885fa-ab21-dd54-22ff-d23abfc7ea03@quicinc.com>
 <a822b44b-68ac-4383-b837-623dc86c8882@quicinc.com>
 <5d77e9da-4a83-547a-08d9-5d7626e2a600@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <5d77e9da-4a83-547a-08d9-5d7626e2a600@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SJJzqyg095O3feHanflnttqzCFE8Qzx6
X-Proofpoint-ORIG-GUID: SJJzqyg095O3feHanflnttqzCFE8Qzx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_163214_379577_D2146E71 
X-CRM114-Status: GOOD (  22.13  )
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

Ck9uIDExLzEzLzIwMjMgMTI6MTggQU0sIEplZmZyZXkgSHVnbyB3cm90ZToKPiBPbiAxMS8xMS8y
MDIzIDg6NTkgUE0sIEJhb2NoZW4gUWlhbmcgd3JvdGU6Cj4+Cj4+IE9uIDExLzExLzIwMjMgMTox
NCBBTSwgSmVmZnJleSBIdWdvIHdyb3RlOgo+Pj4gT24gMTEvMTAvMjAyMyAzOjIxIEFNLCBLYWxs
ZSBWYWxvIHdyb3RlOgo+Pj4+IEZyb206IEJhb2NoZW4gUWlhbmcgPHF1aWNfYnFpYW5nQHF1aWNp
bmMuY29tPgo+Pj4+Cj4+Pj4gV2hlbiB1c2luZyBtaGlfcG93ZXJfZG93bl9ub19kZXN0cm95KCkg
TUhJIGhvc3RzIG5lZWQgdG8gdW5wcmVwYXJlIAo+Pj4+IE1ISSBjaGFubmVscwo+Pj4+IGJ5IHRo
ZW1zZWx2ZXMuwqAgU2ltaWxhcmx5LCBNSEkgc3RhY2sgd2lsbCBhbHNvIG5vdCBjcmVhdGUgbmV3
IE1ISSAKPj4+PiBkZXZpY2Ugc2luY2UKPj4+PiBvbGQgZGV2aWNlcyB3ZXJlIG5vdCBkZXN0cm95
ZWQsIHNvIE1ISSBob3N0cyBuZWVkIHRvIHByZXBhcmUgCj4+Pj4gY2hhbm5lbHMgYXMgd2VsbC4K
Pj4+PiBIZW5jZSBhZGQgdGhlc2UgdHdvIGludGVyZmFjZXMgdG8gbWFrZSB0aGF0IHBvc3NpYmxl
Lgo+Pj4+Cj4+Pj4gVGVzdGVkLW9uOiBXQ042ODU1IGh3Mi4wIFBDSSAKPj4+PiBXTEFOLkhTUC4x
LjEtMDMxMjUtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9MSVRFLTMuNjUxMC4zMAo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogQmFvY2hlbiBRaWFuZyA8cXVpY19icWlhbmdAcXVpY2luYy5jb20+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogS2FsbGUgVmFsbyA8cXVpY19rdmFsb0BxdWljaW5jLmNvbT4K
Pj4+PiAtLS0KPj4+PiDCoCBkcml2ZXJzL2J1cy9taGkvaG9zdC9tYWluLmMgfCA5MSAKPj4+PiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gwqAgaW5jbHVkZS9saW51
eC9taGkuaMKgwqDCoMKgwqDCoMKgwqAgfCAxOCArKysrKysrKwo+Pj4+IMKgIDIgZmlsZXMgY2hh
bmdlZCwgMTA5IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1
cy9taGkvaG9zdC9tYWluLmMgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9tYWluLmMKPj4+PiBpbmRl
eCBkY2Y2MjdiMzZlODIuLjliY2Y4YTQ5YzAwMCAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2J1
cy9taGkvaG9zdC9tYWluLmMKPj4+PiArKysgYi9kcml2ZXJzL2J1cy9taGkvaG9zdC9tYWluLmMK
Pj4+PiBAQCAtMTY2Nyw2ICsxNjY3LDQ5IEBAIGludCAKPj4+PiBtaGlfcHJlcGFyZV9mb3JfdHJh
bnNmZXJfYXV0b3F1ZXVlKHN0cnVjdCBtaGlfZGV2aWNlICptaGlfZGV2KQo+Pj4+IMKgIH0KPj4+
PiDCoCBFWFBPUlRfU1lNQk9MX0dQTChtaGlfcHJlcGFyZV9mb3JfdHJhbnNmZXJfYXV0b3F1ZXVl
KTsKPj4+PiDCoCArc3RhdGljIGludCBfX21oaV9wcmVwYXJlX2Zvcl90cmFuc2Zlcl9hdXRvcXVl
dWUoc3RydWN0IGRldmljZSAKPj4+PiAqZGV2LCB2b2lkICpkYXRhKQo+Pj4+ICt7Cj4+Pj4gK8Kg
wqDCoCBzdHJ1Y3QgbWhpX2RldmljZSAqbWhpX2RldjsKPj4+PiArwqDCoMKgIHN0cnVjdCBtaGlf
Y2hhbiAqdWxfY2hhbiwgKmRsX2NoYW47Cj4+Pj4gK8KgwqDCoCBlbnVtIG1oaV9lZV90eXBlIGVl
ID0gTUhJX0VFX01BWDsKPj4+PiArCj4+Pj4gK8KgwqDCoCBpZiAoZGV2LT5idXMgIT0gJm1oaV9i
dXNfdHlwZSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gKwo+Pj4+ICvCoMKg
wqAgbWhpX2RldiA9IHRvX21oaV9kZXZpY2UoZGV2KTsKPj4+PiArCj4+Pj4gK8KgwqDCoCAvKiBP
bmx5IHByZXBhcmUgdmlydHVhbCBkZXZpY2VzIHRoYXRzIGF0dGFjaGVkIHRvIGJ1cyAqLwo+Pj4K
Pj4+ICJ0aGF0IGFyZSI/Cj4+Pgo+PiBJdCBtZWFucyBNSEkgZGV2aWNlcyB3aXRoIGEgdHlwZSBv
ZiBNSElfREVWSUNFX1hGRVIuIFNlZSBhbHNvIAo+PiBtaGlfZGVzdHJveV9kZXZpY2UoKTsKPgo+
IEkgdGhpbmsgeW91IGFyZSBjb25mdXNlZCBhYm91dCBteSBjb21tZW50LsKgICJ0aGF0cyIgaXMg
bm90IGNvcnJlY3QgCj4gRW5nbGlzaC7CoCBJIHdhcyBzdWdnZXN0aW5nIHlvdSByZXBsYWNlIGl0
IHdpdGggInRoYXQgYXJlIiwgYnV0IHRoZXJlIAo+IGFyZSBtYW55IHdheXMgdG8gcmV3b3JkIHRo
ZSBjb21tZW50LgoKU29ycnkgZm9yIG1pc3VuZGVyc3Rvb2QgeW91ciBjb21tZW50LiBXaWxsIHJl
ZmluZSBpdCBpbiBuZXh0IHZlcnNpb24uCgoKPgo+Pgo+Pgo+Pj4+ICvCoMKgwqAgaWYgKG1oaV9k
ZXYtPmRldl90eXBlID09IE1ISV9ERVZJQ0VfQ09OVFJPTExFUikKPj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIDA7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgdWxfY2hhbiA9IG1oaV9kZXYtPnVsX2No
YW47Cj4+Pj4gK8KgwqDCoCBkbF9jaGFuID0gbWhpX2Rldi0+ZGxfY2hhbjsKPj4+PiArCj4+Pj4g
K8KgwqDCoCAvKgo+Pj4+ICvCoMKgwqDCoCAqIElmIGV4ZWN1dGlvbiBlbnZpcm9ubWVudCBpcyBz
cGVjaWZpZWQsIHJlbW92ZSBvbmx5IHRob3NlIAo+Pj4+IGRldmljZXMgdGhhdAo+Pj4+ICvCoMKg
wqDCoCAqIHN0YXJ0ZWQgaW4gdGhlbSBiYXNlZCBvbiBlZV9tYXNrIGZvciB0aGUgY2hhbm5lbHMg
YXMgd2UgCj4+Pj4gbW92ZSBvbiB0byBhCj4+Pj4gK8KgwqDCoMKgICogZGlmZmVyZW50IGV4ZWN1
dGlvbiBlbnZpcm9ubWVudAo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+ICvCoMKgwqAgaWYgKGRhdGEp
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVlID0gKihlbnVtIG1oaV9lZV90eXBlICopZGF0YTsKPj4+
PiArCj4+Pj4gK8KgwqDCoCBpZiAodWxfY2hhbiAmJiBlZSAhPSBNSElfRUVfTUFYICYmICEodWxf
Y2hhbi0+ZWVfbWFzayAmIEJJVChlZSkpKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsK
Pj4+PiArCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYgKGRsX2NoYW4gJiYgZWUgIT0gTUhJX0VFX01B
WCAmJiAhKGRsX2NoYW4tPmVlX21hc2sgJiBCSVQoZWUpKSkKPj4+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIDA7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcmV0dXJuIG1oaV9wcmVwYXJlX2Zvcl90cmFu
c2Zlcl9hdXRvcXVldWUobWhpX2Rldik7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gK2ludCBtaGlfcHJl
cGFyZV9hbGxfZm9yX3RyYW5zZmVyX2F1dG9xdWV1ZShzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgCj4+
Pj4gKm1oaV9jbnRybCkKPj4+PiArewo+Pj4+ICvCoMKgwqAgcmV0dXJuIGRldmljZV9mb3JfZWFj
aF9jaGlsZCgmbWhpX2NudHJsLT5taGlfZGV2LT5kZXYsIE5VTEwsCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19taGlfcHJlcGFyZV9mb3JfdHJhbnNmZXJf
YXV0b3F1ZXVlKTsKPj4+PiArfQo+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChtaGlfcHJlcGFyZV9h
bGxfZm9yX3RyYW5zZmVyX2F1dG9xdWV1ZSk7Cj4+Pgo+Pj4gVGhpcyBzZWVtcyBicm9rZW4uwqAg
SXQgYXBwZWFycyB0byBjb25maWd1cmUgYWxsIGNoYW5uZWxzIGFzIAo+Pj4gYXV0b3F1ZXVlLCBy
ZWdhcmRsZXNzIG9mIGhvdyB0aGUgY29udHJvbGxlciBpbml0aWFsbHkgY29uZmlndXJlZCAKPj4+
IHRoZW0uwqAgVGhpcyB3b3VsZCBvbmx5IGJlIHNhZmUgdG8gdXNlIGlmIGFsbCBjaGFubmVscyB3
ZXJlIAo+Pj4gY29uZmlndXJlZCBmb3IgYXV0b3F1ZXVlLCBidXQgd291bGQgc2lsZW50bHkgY2F1
c2UgaXNzdWVzIG90aGVyd2lzZS4KPj4KPj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGF0LiBZZXMs
IGl0IGlzIG5vdCBjb3JyZWN0IHRvIHRyZWF0IGFsbCAKPj4gY2hhbm5lbHMgYXMgYXV0b3F1ZXVl
IHJlZ2FyZGxlc3Mgb2YgaXRzIGluaXRpYWwgY29uZmlndXJhdGlvbi4gU28gaG93IAo+PiBhYm91
dCBjaGFuZ2UgYXMgYmVsb3c6Cj4KPiBTZWVtcyBvay4KPgo+Pgo+PiAvKiBUaGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIG1oaV9wcmVwYXJlX2Zvcl90cmFuc2Zlcl9hdXRvcXVldWUoKSBhbmQgCj4+IG1o
aV9wcmVwYXJlX2Zvcl90cmFuc2ZlcigpIGNvbWVzIGZyb20gaG93IHRvIHRyZWF0IGRvd25saW5r
IGNoYW5uZWwgKi8KPj4KPj4gbWhpX3ByZXBhcmVfZm9yX3RyYW5zZmVyX2RldihzdHJ1Y3QgZGV2
aWNlICpkZXYsIC4uLikKPj4KPj4gewo+Pgo+PiAuLi4KPj4KPj4gZGxfY2hhbiA9IG1oaV9kZXYt
PmRsX2NoYW47Cj4+Cj4+IC4uLgo+Pgo+PiBpZiAoZGxfY2hhbi0+cHJlX2FsbG9jKQo+Pgo+PiDC
oMKgwqAgwqDCoMKgIG1oaV9wcmVwYXJlX2Zvcl90cmFuc2Zlcl9hdXRvcXVldWUoZGV2KTsKPj4K
Pj4gZWxzZQo+Pgo+PiDCoMKgwqAgwqDCoMKgIG1oaV9wcmVwYXJlX2Zvcl90cmFuc2ZlcihkZXYp
Owo+Pgo+PiB9Cj4+Cj4+IC8qIEFuZCB0aGVuIGl0ZXJhdGUgYWxsIGRldmljZXMgYW5kIGNhbGwg
Cj4+IG1oaV9wcmVwYXJlX2Zvcl90cmFuc2Zlcl9kZXYoKSBmb3IgZWFjaC4gKi8KPj4KPj4gaW50
IG1oaV9wcmVwYXJlX2FsbF9mb3JfdHJhbnNmZXIoc3RydWN0IG1oaV9jb250cm9sbGVyICptaGlf
Y250cmwpCj4+IHsKPj4gwqDCoMKgwqAgcmV0dXJuIGRldmljZV9mb3JfZWFjaF9jaGlsZCgmbWhp
X2NudHJsLT5taGlfZGV2LT5kZXYsIE5VTEwsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtaGlfcHJlcGFyZV9mb3JfdHJhbnNmZXJfZGV2KTsKPj4gfQo+PiBF
WFBPUlRfU1lNQk9MX0dQTChtaGlfcHJlcGFyZV9hbGxfZm9yX3RyYW5zZmVyKTsKPj4KPgoKLS0g
CmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
