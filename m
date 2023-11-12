Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53379C4332F
	for <ath11k@archiver.kernel.org>; Sun, 12 Nov 2023 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOgT1ZWdADxtc2A/GXVKHEeweGyi++IUwXdpOSThyv0=; b=4z9iCSEku09Uc4
	OrLyB0JVXst4AeeK7Y1eoAP1LNqmMEQPJjlXaGj7QgJONcBpWgeo4ISh/72KACjMbVYXKKJfkyPYK
	1UNIklUQp9xg7O2rf62A399VoO+vxqhZQrjfm19WUycH7RzummqqhBTmzY3MYI6SiLFmVIW0O8JW7
	U1FN5b7Z3Y9ghVvWitnqlLAPdg44u5IA15RkuLKGO6xYh43xL4DlSXlHfH4aYbA4Xid8l2TbgHmFk
	YoyqCaoGY1fYUpZXNZaLj6iHr3eoZL0XqVIb408LX5gc4avssouuYki+5RRjcWWUGjPKzA0cwUrk9
	EdQdldclcGhAyGJLdqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2DAL-00CZkr-36;
	Sun, 12 Nov 2023 16:18:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2DAI-00CZkW-1e
	for ath11k@lists.infradead.org;
	Sun, 12 Nov 2023 16:18:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ACGIGjS013572;
	Sun, 12 Nov 2023 16:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VINwU4iONYOmr6ilUPmy9pys1JqRZzTG5jkG63H7GtI=;
 b=KAw2hoy04d2+iZ7RZPdfgS7wXQ15kX+9Dy2swXePlgvaf9xkQWwZRdkCBGpr0jCVYdyQ
 lZ0syirDnC45mMq0dLpGMVLnSl2IsURDU5nmcPKxE6gCYyvSv53+x5g7V9vsRid1bWLY
 f2jB3vis9aUn4KaED0mz/Jw+KrxxDVQVUHahFprFIN/MYX9Tw9PZNF5REH2/8D+gygWP
 rPh/Km3TTu2K8wcIhdgAuls1m8yMZGyXV1VlHUy1lk05bvc8oMn3bo9+qZTGG98zknz7
 zVtRkywMfsSdXVsJYxfH6X29YsYbRaov7kb6lMgj1a8IS7XT5M6llh4YkbZIYbhFXSw9 jg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua20dt1me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Nov 2023 16:18:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ACGIEvO025252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Nov 2023 16:18:14 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sun, 12 Nov
 2023 08:18:14 -0800
Message-ID: <5d77e9da-4a83-547a-08d9-5d7626e2a600@quicinc.com>
Date: Sun, 12 Nov 2023 09:18:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH RFC 2/8] bus: mhi: host: add new interfaces to handle MHI
 channels directly
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
 <20231110102202.3168243-3-kvalo@kernel.org>
 <2cb885fa-ab21-dd54-22ff-d23abfc7ea03@quicinc.com>
 <a822b44b-68ac-4383-b837-623dc86c8882@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <a822b44b-68ac-4383-b837-623dc86c8882@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DWaFr1l9f1hObA3XvxwmpOYeeOHnL2Tc
X-Proofpoint-ORIG-GUID: DWaFr1l9f1hObA3XvxwmpOYeeOHnL2Tc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_15,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 mlxlogscore=994 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311120142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_081826_671802_DE0ECA77 
X-CRM114-Status: GOOD (  23.01  )
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

T24gMTEvMTEvMjAyMyA4OjU5IFBNLCBCYW9jaGVuIFFpYW5nIHdyb3RlOgo+IAo+IE9uIDExLzEx
LzIwMjMgMToxNCBBTSwgSmVmZnJleSBIdWdvIHdyb3RlOgo+PiBPbiAxMS8xMC8yMDIzIDM6MjEg
QU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+PiBGcm9tOiBCYW9jaGVuIFFpYW5nIDxxdWljX2JxaWFu
Z0BxdWljaW5jLmNvbT4KPj4+Cj4+PiBXaGVuIHVzaW5nIG1oaV9wb3dlcl9kb3duX25vX2Rlc3Ry
b3koKSBNSEkgaG9zdHMgbmVlZCB0byB1bnByZXBhcmUgCj4+PiBNSEkgY2hhbm5lbHMKPj4+IGJ5
IHRoZW1zZWx2ZXMuwqAgU2ltaWxhcmx5LCBNSEkgc3RhY2sgd2lsbCBhbHNvIG5vdCBjcmVhdGUg
bmV3IE1ISSAKPj4+IGRldmljZSBzaW5jZQo+Pj4gb2xkIGRldmljZXMgd2VyZSBub3QgZGVzdHJv
eWVkLCBzbyBNSEkgaG9zdHMgbmVlZCB0byBwcmVwYXJlIGNoYW5uZWxzIAo+Pj4gYXMgd2VsbC4K
Pj4+IEhlbmNlIGFkZCB0aGVzZSB0d28gaW50ZXJmYWNlcyB0byBtYWtlIHRoYXQgcG9zc2libGUu
Cj4+Pgo+Pj4gVGVzdGVkLW9uOiBXQ042ODU1IGh3Mi4wIFBDSSAKPj4+IFdMQU4uSFNQLjEuMS0w
MzEyNS1RQ0FIU1BTV1BMX1YxX1YyX1NJTElDT05aX0xJVEUtMy42NTEwLjMwCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogQmFvY2hlbiBRaWFuZyA8cXVpY19icWlhbmdAcXVpY2luYy5jb20+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgo+Pj4gLS0t
Cj4+PiDCoCBkcml2ZXJzL2J1cy9taGkvaG9zdC9tYWluLmMgfCA5MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+PiDCoCBpbmNsdWRlL2xpbnV4L21oaS5owqDCoMKgwqDC
oMKgwqDCoCB8IDE4ICsrKysrKysrCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEwOSBpbnNlcnRp
b25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L21haW4uYyBi
L2RyaXZlcnMvYnVzL21oaS9ob3N0L21haW4uYwo+Pj4gaW5kZXggZGNmNjI3YjM2ZTgyLi45YmNm
OGE0OWMwMDAgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2J1cy9taGkvaG9zdC9tYWluLmMKPj4+
ICsrKyBiL2RyaXZlcnMvYnVzL21oaS9ob3N0L21haW4uYwo+Pj4gQEAgLTE2NjcsNiArMTY2Nyw0
OSBAQCBpbnQgbWhpX3ByZXBhcmVfZm9yX3RyYW5zZmVyX2F1dG9xdWV1ZShzdHJ1Y3QgCj4+PiBt
aGlfZGV2aWNlICptaGlfZGV2KQo+Pj4gwqAgfQo+Pj4gwqAgRVhQT1JUX1NZTUJPTF9HUEwobWhp
X3ByZXBhcmVfZm9yX3RyYW5zZmVyX2F1dG9xdWV1ZSk7Cj4+PiDCoCArc3RhdGljIGludCBfX21o
aV9wcmVwYXJlX2Zvcl90cmFuc2Zlcl9hdXRvcXVldWUoc3RydWN0IGRldmljZSAKPj4+ICpkZXYs
IHZvaWQgKmRhdGEpCj4+PiArewo+Pj4gK8KgwqDCoCBzdHJ1Y3QgbWhpX2RldmljZSAqbWhpX2Rl
djsKPj4+ICvCoMKgwqAgc3RydWN0IG1oaV9jaGFuICp1bF9jaGFuLCAqZGxfY2hhbjsKPj4+ICvC
oMKgwqAgZW51bSBtaGlfZWVfdHlwZSBlZSA9IE1ISV9FRV9NQVg7Cj4+PiArCj4+PiArwqDCoMKg
IGlmIChkZXYtPmJ1cyAhPSAmbWhpX2J1c190eXBlKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAwOwo+Pj4gKwo+Pj4gK8KgwqDCoCBtaGlfZGV2ID0gdG9fbWhpX2RldmljZShkZXYpOwo+Pj4g
Kwo+Pj4gK8KgwqDCoCAvKiBPbmx5IHByZXBhcmUgdmlydHVhbCBkZXZpY2VzIHRoYXRzIGF0dGFj
aGVkIHRvIGJ1cyAqLwo+Pgo+PiAidGhhdCBhcmUiPwo+Pgo+IEl0IG1lYW5zIE1ISSBkZXZpY2Vz
IHdpdGggYSB0eXBlIG9mIE1ISV9ERVZJQ0VfWEZFUi4gU2VlIGFsc28gCj4gbWhpX2Rlc3Ryb3lf
ZGV2aWNlKCk7CgpJIHRoaW5rIHlvdSBhcmUgY29uZnVzZWQgYWJvdXQgbXkgY29tbWVudC4gICJ0
aGF0cyIgaXMgbm90IGNvcnJlY3QgCkVuZ2xpc2guICBJIHdhcyBzdWdnZXN0aW5nIHlvdSByZXBs
YWNlIGl0IHdpdGggInRoYXQgYXJlIiwgYnV0IHRoZXJlIGFyZSAKbWFueSB3YXlzIHRvIHJld29y
ZCB0aGUgY29tbWVudC4KCj4gCj4gCj4+PiArwqDCoMKgIGlmIChtaGlfZGV2LT5kZXZfdHlwZSA9
PSBNSElfREVWSUNFX0NPTlRST0xMRVIpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+
PiArCj4+PiArwqDCoMKgIHVsX2NoYW4gPSBtaGlfZGV2LT51bF9jaGFuOwo+Pj4gK8KgwqDCoCBk
bF9jaGFuID0gbWhpX2Rldi0+ZGxfY2hhbjsKPj4+ICsKPj4+ICvCoMKgwqAgLyoKPj4+ICvCoMKg
wqDCoCAqIElmIGV4ZWN1dGlvbiBlbnZpcm9ubWVudCBpcyBzcGVjaWZpZWQsIHJlbW92ZSBvbmx5
IHRob3NlIAo+Pj4gZGV2aWNlcyB0aGF0Cj4+PiArwqDCoMKgwqAgKiBzdGFydGVkIGluIHRoZW0g
YmFzZWQgb24gZWVfbWFzayBmb3IgdGhlIGNoYW5uZWxzIGFzIHdlIG1vdmUgCj4+PiBvbiB0byBh
Cj4+PiArwqDCoMKgwqAgKiBkaWZmZXJlbnQgZXhlY3V0aW9uIGVudmlyb25tZW50Cj4+PiArwqDC
oMKgwqAgKi8KPj4+ICvCoMKgwqAgaWYgKGRhdGEpCj4+PiArwqDCoMKgwqDCoMKgwqAgZWUgPSAq
KGVudW0gbWhpX2VlX3R5cGUgKilkYXRhOwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAodWxfY2hhbiAm
JiBlZSAhPSBNSElfRUVfTUFYICYmICEodWxfY2hhbi0+ZWVfbWFzayAmIEJJVChlZSkpKQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gKwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoZGxf
Y2hhbiAmJiBlZSAhPSBNSElfRUVfTUFYICYmICEoZGxfY2hhbi0+ZWVfbWFzayAmIEJJVChlZSkp
KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gKwo+Pj4gK8KgwqDCoCByZXR1cm4g
bWhpX3ByZXBhcmVfZm9yX3RyYW5zZmVyX2F1dG9xdWV1ZShtaGlfZGV2KTsKPj4+ICt9Cj4+PiAr
Cj4+PiAraW50IG1oaV9wcmVwYXJlX2FsbF9mb3JfdHJhbnNmZXJfYXV0b3F1ZXVlKHN0cnVjdCBt
aGlfY29udHJvbGxlciAKPj4+ICptaGlfY250cmwpCj4+PiArewo+Pj4gK8KgwqDCoCByZXR1cm4g
ZGV2aWNlX2Zvcl9lYWNoX2NoaWxkKCZtaGlfY250cmwtPm1oaV9kZXYtPmRldiwgTlVMTCwKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fbWhpX3ByZXBhcmVf
Zm9yX3RyYW5zZmVyX2F1dG9xdWV1ZSk7Cj4+PiArfQo+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKG1o
aV9wcmVwYXJlX2FsbF9mb3JfdHJhbnNmZXJfYXV0b3F1ZXVlKTsKPj4KPj4gVGhpcyBzZWVtcyBi
cm9rZW4uwqAgSXQgYXBwZWFycyB0byBjb25maWd1cmUgYWxsIGNoYW5uZWxzIGFzIGF1dG9xdWV1
ZSwgCj4+IHJlZ2FyZGxlc3Mgb2YgaG93IHRoZSBjb250cm9sbGVyIGluaXRpYWxseSBjb25maWd1
cmVkIHRoZW0uwqAgVGhpcyAKPj4gd291bGQgb25seSBiZSBzYWZlIHRvIHVzZSBpZiBhbGwgY2hh
bm5lbHMgd2VyZSBjb25maWd1cmVkIGZvciAKPj4gYXV0b3F1ZXVlLCBidXQgd291bGQgc2lsZW50
bHkgY2F1c2UgaXNzdWVzIG90aGVyd2lzZS4KPiAKPiBUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQu
IFllcywgaXQgaXMgbm90IGNvcnJlY3QgdG8gdHJlYXQgYWxsIGNoYW5uZWxzIAo+IGFzIGF1dG9x
dWV1ZSByZWdhcmRsZXNzIG9mIGl0cyBpbml0aWFsIGNvbmZpZ3VyYXRpb24uIFNvIGhvdyBhYm91
dCAKPiBjaGFuZ2UgYXMgYmVsb3c6CgpTZWVtcyBvay4KCj4gCj4gLyogVGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiBtaGlfcHJlcGFyZV9mb3JfdHJhbnNmZXJfYXV0b3F1ZXVlKCkgYW5kIAo+IG1oaV9w
cmVwYXJlX2Zvcl90cmFuc2ZlcigpIGNvbWVzIGZyb20gaG93IHRvIHRyZWF0IGRvd25saW5rIGNo
YW5uZWwgKi8KPiAKPiBtaGlfcHJlcGFyZV9mb3JfdHJhbnNmZXJfZGV2KHN0cnVjdCBkZXZpY2Ug
KmRldiwgLi4uKQo+IAo+IHsKPiAKPiAuLi4KPiAKPiBkbF9jaGFuID0gbWhpX2Rldi0+ZGxfY2hh
bjsKPiAKPiAuLi4KPiAKPiBpZiAoZGxfY2hhbi0+cHJlX2FsbG9jKQo+IAo+ICDCoMKgIMKgwqDC
oCBtaGlfcHJlcGFyZV9mb3JfdHJhbnNmZXJfYXV0b3F1ZXVlKGRldik7Cj4gCj4gZWxzZQo+IAo+
ICDCoMKgIMKgwqDCoCBtaGlfcHJlcGFyZV9mb3JfdHJhbnNmZXIoZGV2KTsKPiAKPiB9Cj4gCj4g
LyogQW5kIHRoZW4gaXRlcmF0ZSBhbGwgZGV2aWNlcyBhbmQgY2FsbCBtaGlfcHJlcGFyZV9mb3Jf
dHJhbnNmZXJfZGV2KCkgCj4gZm9yIGVhY2guICovCj4gCj4gaW50IG1oaV9wcmVwYXJlX2FsbF9m
b3JfdHJhbnNmZXIoc3RydWN0IG1oaV9jb250cm9sbGVyICptaGlfY250cmwpCj4gewo+ICDCoMKg
wqAgcmV0dXJuIGRldmljZV9mb3JfZWFjaF9jaGlsZCgmbWhpX2NudHJsLT5taGlfZGV2LT5kZXYs
IE5VTEwsCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWhpX3By
ZXBhcmVfZm9yX3RyYW5zZmVyX2Rldik7Cj4gfQo+IEVYUE9SVF9TWU1CT0xfR1BMKG1oaV9wcmVw
YXJlX2FsbF9mb3JfdHJhbnNmZXIpOwo+IAoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
