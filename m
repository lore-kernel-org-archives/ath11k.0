Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7771C4332F
	for <ath11k@archiver.kernel.org>; Sun, 12 Nov 2023 04:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9iPzT9zsPaPxawnl2S4mk+q8tdp6q5jKX/HiUjpTq8=; b=ugXCbR1AIbz4eD
	cc8Z07+QGOKf0V2Pn+8j1/xz8hNT7b+yOBIKjwpXegpt55QkEw7iP8+aHBQLxPMjnr0co/NNScYzE
	GGQJGtzB7btCHeie/G+dRUwOY0FGEIhlFeBc5oFk53rxB+OGBqOYwlV0rS7aZSPajBj+dXR2ZyBxh
	D4FooWl4iE9k4s437Zv/9ta//hLLk7XanXNyIOxpEixPCeOKe48eMgs46YEhOJGnQXYYYuz1islpk
	hJ4vX7g7aYyS/QHz8Quf6IIu/RZaoQyznpXP0ky8M7AocUgRI7JEGNRpOZPk10Yuc4V6ayYMkHvTX
	P5nlELVrryXzpSyKbA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r21e5-00BdTP-1u;
	Sun, 12 Nov 2023 04:00:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r21e2-00BdSv-29
	for ath11k@lists.infradead.org;
	Sun, 12 Nov 2023 04:00:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AC406ZD001214;
	Sun, 12 Nov 2023 04:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aCuIZgL5EG6kolftN0ohAVfP2R8AwZnVGsAyCQfuiQY=;
 b=c4n7oeEFARRUka8ositA4o/VCohwIPrA3hn5jM/0nfGuPZUe/nBApQL9jgjW2bfKAUfz
 H13vKE2qUezxlYmEaVgCAR80uEtHuv7kvsMYvFmy2DvAOoDzLMugYomKZ3gh+px8qxbF
 XD+MHA4dGprQlplZY6MkETDUQYmnsVKKKn3pi5iEixHqL3Vg2298ZCCNVhb+HnIgBq3F
 mogl66LwsCNUHlBrJ12xjKfRUAEJxlV8IHSdHL797AiHk5ablNBifViYKXDPplQc5C94
 j8fw/omwRPB+VhC1Z1fqU0e/zVgJ7guhYiH562pRAjzJMI7aDsFfx2yeaJU9Em2OVtij Hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua1q1he4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Nov 2023 04:00:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AC404Rl010199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Nov 2023 04:00:04 GMT
Received: from [10.253.35.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sat, 11 Nov
 2023 20:00:02 -0800
Message-ID: <a822b44b-68ac-4383-b837-623dc86c8882@quicinc.com>
Date: Sun, 12 Nov 2023 11:59:59 +0800
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
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <2cb885fa-ab21-dd54-22ff-d23abfc7ea03@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B0Fr4Ed9EwO8y_ld4ylcMYJ1aK0J-M_I
X-Proofpoint-ORIG-GUID: B0Fr4Ed9EwO8y_ld4ylcMYJ1aK0J-M_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_01,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1011 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxlogscore=891
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311120034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_200022_966508_F4FD830B 
X-CRM114-Status: GOOD (  20.21  )
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

Ck9uIDExLzExLzIwMjMgMToxNCBBTSwgSmVmZnJleSBIdWdvIHdyb3RlOgo+IE9uIDExLzEwLzIw
MjMgMzoyMSBBTSwgS2FsbGUgVmFsbyB3cm90ZToKPj4gRnJvbTogQmFvY2hlbiBRaWFuZyA8cXVp
Y19icWlhbmdAcXVpY2luYy5jb20+Cj4+Cj4+IFdoZW4gdXNpbmcgbWhpX3Bvd2VyX2Rvd25fbm9f
ZGVzdHJveSgpIE1ISSBob3N0cyBuZWVkIHRvIHVucHJlcGFyZSAKPj4gTUhJIGNoYW5uZWxzCj4+
IGJ5IHRoZW1zZWx2ZXMuwqAgU2ltaWxhcmx5LCBNSEkgc3RhY2sgd2lsbCBhbHNvIG5vdCBjcmVh
dGUgbmV3IE1ISSAKPj4gZGV2aWNlIHNpbmNlCj4+IG9sZCBkZXZpY2VzIHdlcmUgbm90IGRlc3Ry
b3llZCwgc28gTUhJIGhvc3RzIG5lZWQgdG8gcHJlcGFyZSBjaGFubmVscyAKPj4gYXMgd2VsbC4K
Pj4gSGVuY2UgYWRkIHRoZXNlIHR3byBpbnRlcmZhY2VzIHRvIG1ha2UgdGhhdCBwb3NzaWJsZS4K
Pj4KPj4gVGVzdGVkLW9uOiBXQ042ODU1IGh3Mi4wIFBDSSAKPj4gV0xBTi5IU1AuMS4xLTAzMTI1
LVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpfTElURS0zLjY1MTAuMzAKPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQmFvY2hlbiBRaWFuZyA8cXVpY19icWlhbmdAcXVpY2luYy5jb20+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEthbGxlIFZhbG8gPHF1aWNfa3ZhbG9AcXVpY2luYy5jb20+Cj4+IC0tLQo+PiDCoCBk
cml2ZXJzL2J1cy9taGkvaG9zdC9tYWluLmMgfCA5MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+IMKgIGluY2x1ZGUvbGludXgvbWhpLmjCoMKgwqDCoMKgwqDCoMKgIHwg
MTggKysrKysrKysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvbWhpL2hvc3QvbWFpbi5jIGIvZHJpdmVycy9idXMv
bWhpL2hvc3QvbWFpbi5jCj4+IGluZGV4IGRjZjYyN2IzNmU4Mi4uOWJjZjhhNDljMDAwIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9tYWluLmMKPj4gKysrIGIvZHJpdmVycy9i
dXMvbWhpL2hvc3QvbWFpbi5jCj4+IEBAIC0xNjY3LDYgKzE2NjcsNDkgQEAgaW50IG1oaV9wcmVw
YXJlX2Zvcl90cmFuc2Zlcl9hdXRvcXVldWUoc3RydWN0IAo+PiBtaGlfZGV2aWNlICptaGlfZGV2
KQo+PiDCoCB9Cj4+IMKgIEVYUE9SVF9TWU1CT0xfR1BMKG1oaV9wcmVwYXJlX2Zvcl90cmFuc2Zl
cl9hdXRvcXVldWUpOwo+PiDCoCArc3RhdGljIGludCBfX21oaV9wcmVwYXJlX2Zvcl90cmFuc2Zl
cl9hdXRvcXVldWUoc3RydWN0IGRldmljZSAKPj4gKmRldiwgdm9pZCAqZGF0YSkKPj4gK3sKPj4g
K8KgwqDCoCBzdHJ1Y3QgbWhpX2RldmljZSAqbWhpX2RldjsKPj4gK8KgwqDCoCBzdHJ1Y3QgbWhp
X2NoYW4gKnVsX2NoYW4sICpkbF9jaGFuOwo+PiArwqDCoMKgIGVudW0gbWhpX2VlX3R5cGUgZWUg
PSBNSElfRUVfTUFYOwo+PiArCj4+ICvCoMKgwqAgaWYgKGRldi0+YnVzICE9ICZtaGlfYnVzX3R5
cGUpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gKwo+PiArwqDCoMKgIG1oaV9kZXYg
PSB0b19taGlfZGV2aWNlKGRldik7Cj4+ICsKPj4gK8KgwqDCoCAvKiBPbmx5IHByZXBhcmUgdmly
dHVhbCBkZXZpY2VzIHRoYXRzIGF0dGFjaGVkIHRvIGJ1cyAqLwo+Cj4gInRoYXQgYXJlIj8KPgpJ
dCBtZWFucyBNSEkgZGV2aWNlcyB3aXRoIGEgdHlwZSBvZiBNSElfREVWSUNFX1hGRVIuIFNlZSBh
bHNvIAptaGlfZGVzdHJveV9kZXZpY2UoKTsKCgo+PiArwqDCoMKgIGlmIChtaGlfZGV2LT5kZXZf
dHlwZSA9PSBNSElfREVWSUNFX0NPTlRST0xMRVIpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsKPj4gKwo+PiArwqDCoMKgIHVsX2NoYW4gPSBtaGlfZGV2LT51bF9jaGFuOwo+PiArwqDCoMKg
IGRsX2NoYW4gPSBtaGlfZGV2LT5kbF9jaGFuOwo+PiArCj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDC
oMKgICogSWYgZXhlY3V0aW9uIGVudmlyb25tZW50IGlzIHNwZWNpZmllZCwgcmVtb3ZlIG9ubHkg
dGhvc2UgCj4+IGRldmljZXMgdGhhdAo+PiArwqDCoMKgwqAgKiBzdGFydGVkIGluIHRoZW0gYmFz
ZWQgb24gZWVfbWFzayBmb3IgdGhlIGNoYW5uZWxzIGFzIHdlIG1vdmUgCj4+IG9uIHRvIGEKPj4g
K8KgwqDCoMKgICogZGlmZmVyZW50IGV4ZWN1dGlvbiBlbnZpcm9ubWVudAo+PiArwqDCoMKgwqAg
Ki8KPj4gK8KgwqDCoCBpZiAoZGF0YSkKPj4gK8KgwqDCoMKgwqDCoMKgIGVlID0gKihlbnVtIG1o
aV9lZV90eXBlICopZGF0YTsKPj4gKwo+PiArwqDCoMKgIGlmICh1bF9jaGFuICYmIGVlICE9IE1I
SV9FRV9NQVggJiYgISh1bF9jaGFuLT5lZV9tYXNrICYgQklUKGVlKSkpCj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gMDsKPj4gKwo+PiArCj4+ICvCoMKgwqAgaWYgKGRsX2NoYW4gJiYgZWUgIT0g
TUhJX0VFX01BWCAmJiAhKGRsX2NoYW4tPmVlX21hc2sgJiBCSVQoZWUpKSkKPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAwOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIG1oaV9wcmVwYXJlX2Zvcl90
cmFuc2Zlcl9hdXRvcXVldWUobWhpX2Rldik7Cj4+ICt9Cj4+ICsKPj4gK2ludCBtaGlfcHJlcGFy
ZV9hbGxfZm9yX3RyYW5zZmVyX2F1dG9xdWV1ZShzdHJ1Y3QgbWhpX2NvbnRyb2xsZXIgCj4+ICpt
aGlfY250cmwpCj4+ICt7Cj4+ICvCoMKgwqAgcmV0dXJuIGRldmljZV9mb3JfZWFjaF9jaGlsZCgm
bWhpX2NudHJsLT5taGlfZGV2LT5kZXYsIE5VTEwsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF9fbWhpX3ByZXBhcmVfZm9yX3RyYW5zZmVyX2F1dG9xdWV1ZSk7
Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTChtaGlfcHJlcGFyZV9hbGxfZm9yX3RyYW5zZmVy
X2F1dG9xdWV1ZSk7Cj4KPiBUaGlzIHNlZW1zIGJyb2tlbi7CoCBJdCBhcHBlYXJzIHRvIGNvbmZp
Z3VyZSBhbGwgY2hhbm5lbHMgYXMgYXV0b3F1ZXVlLCAKPiByZWdhcmRsZXNzIG9mIGhvdyB0aGUg
Y29udHJvbGxlciBpbml0aWFsbHkgY29uZmlndXJlZCB0aGVtLsKgIFRoaXMgCj4gd291bGQgb25s
eSBiZSBzYWZlIHRvIHVzZSBpZiBhbGwgY2hhbm5lbHMgd2VyZSBjb25maWd1cmVkIGZvciAKPiBh
dXRvcXVldWUsIGJ1dCB3b3VsZCBzaWxlbnRseSBjYXVzZSBpc3N1ZXMgb3RoZXJ3aXNlLgoKVGhh
bmtzIGZvciBwb2ludGluZyB0aGF0LiBZZXMsIGl0IGlzIG5vdCBjb3JyZWN0IHRvIHRyZWF0IGFs
bCBjaGFubmVscyAKYXMgYXV0b3F1ZXVlIHJlZ2FyZGxlc3Mgb2YgaXRzIGluaXRpYWwgY29uZmln
dXJhdGlvbi4gU28gaG93IGFib3V0IApjaGFuZ2UgYXMgYmVsb3c6CgovKiBUaGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIG1oaV9wcmVwYXJlX2Zvcl90cmFuc2Zlcl9hdXRvcXVldWUoKSBhbmQgCm1oaV9w
cmVwYXJlX2Zvcl90cmFuc2ZlcigpIGNvbWVzIGZyb20gaG93IHRvIHRyZWF0IGRvd25saW5rIGNo
YW5uZWwgKi8KCm1oaV9wcmVwYXJlX2Zvcl90cmFuc2Zlcl9kZXYoc3RydWN0IGRldmljZSAqZGV2
LCAuLi4pCgp7CgouLi4KCmRsX2NoYW4gPSBtaGlfZGV2LT5kbF9jaGFuOwoKLi4uCgppZiAoZGxf
Y2hhbi0+cHJlX2FsbG9jKQoKIMKgwqAgwqDCoMKgIG1oaV9wcmVwYXJlX2Zvcl90cmFuc2Zlcl9h
dXRvcXVldWUoZGV2KTsKCmVsc2UKCiDCoMKgIMKgwqDCoCBtaGlfcHJlcGFyZV9mb3JfdHJhbnNm
ZXIoZGV2KTsKCn0KCi8qIEFuZCB0aGVuIGl0ZXJhdGUgYWxsIGRldmljZXMgYW5kIGNhbGwgbWhp
X3ByZXBhcmVfZm9yX3RyYW5zZmVyX2RldigpIApmb3IgZWFjaC4gKi8KCmludCBtaGlfcHJlcGFy
ZV9hbGxfZm9yX3RyYW5zZmVyKHN0cnVjdCBtaGlfY29udHJvbGxlciAqbWhpX2NudHJsKQp7CiDC
oMKgwqAgcmV0dXJuIGRldmljZV9mb3JfZWFjaF9jaGlsZCgmbWhpX2NudHJsLT5taGlfZGV2LT5k
ZXYsIE5VTEwsCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1oaV9w
cmVwYXJlX2Zvcl90cmFuc2Zlcl9kZXYpOwp9CkVYUE9SVF9TWU1CT0xfR1BMKG1oaV9wcmVwYXJl
X2FsbF9mb3JfdHJhbnNmZXIpOwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
