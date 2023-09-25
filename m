Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCABECE7A94
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 10:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku/fFboqWxwxsM/cRMw9vZMOyINnwIq8G7lnX2Vmls0=; b=Zh2IL96WxnNwYX
	KYki48oOJ0bO/ka98rsoicYLA/81Go+cX/gx/cJ9vbyTajw7+U1u5zqXzHXvms6UzTWojUCTrPs0m
	oVuWojVx7kTC972cgAbXIvrEjvuMqiZ91gEU5144dSOAVkrI2aATB5hEUB04Xkud01VOCpEZKb2pn
	G246UHjkYLa/KbfLiZVjE2GCg3j/vP5e3sE6GpCqoA+TDANrl2+xsHqSOPnQ+/Q/xb2b5tPPpMlGc
	raqcZH2k0v8r/uUmN1ZaMg/GZUu/jXEE4Fs364MpYPYPb0dLQHvOokhoRjKCR+P6drtmzYPaWpDc0
	nFeerbfniWKlTknxWevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjAd-00E1bi-1X;
	Mon, 25 Sep 2023 10:50:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjAa-00E1YI-01
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 10:50:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38PARrUG025288;
	Mon, 25 Sep 2023 10:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZQCSUBeIGyN8J4WPf0m2erDZJKRBf+BhExm/END4HIw=;
 b=e4IbrfvApw3B6mNNwAeERy4hcSPjCjWOuzevWcO4z9LZzxVoYNrCDq7yFjnYgobOuLT8
 YCTnmx87ixRaLxIHwkPsudK1pvOXjS6EPKkwbX8tmZwCoN4BSf0HnwF1Xe+5pbwNTAPN
 DpnjGEtYahRQHDmYmxY3jpASg/mcRJJNcsFxyJojj7fYvRTX0aNfR/qumqA/8nRCbtZI
 j5yjN7rb/WoKlM/zT2uUtG1pBvdbgX43mWHWNKrWyitUs4LvSYGUHoXXJITdccGDhK8k
 Ybn/VOJRijrI+szSudN8kDwOtcaXzygCdZ5nMd/g3qt1srfnSsHBCcquqyaOoQrNuFRG KA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9rddbhu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:50:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38PAoNJc010571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:50:23 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 25 Sep
 2023 03:50:21 -0700
Message-ID: <56cfae0e-27b6-2527-fe76-1d0061804903@quicinc.com>
Date: Mon, 25 Sep 2023 18:50:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 13/13] wifi: ath11k: send TPC power to firmware for 6
 GHz station
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-14-quic_wgong@quicinc.com>
 <eb08e0f2-c932-4d79-b2ee-813c2999d1a5@quicinc.com>
 <fbad2af6-9c3f-c241-b820-7820b4200bf4@quicinc.com>
 <60aaa1fc-99cf-476c-af51-e5ad425792f9@quicinc.com>
 <145e9534-6610-9c11-b2b9-87fb8e50ef81@quicinc.com>
 <1c1391b6-9710-44c6-97b2-68ef23409c1b@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <1c1391b6-9710-44c6-97b2-68ef23409c1b@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aq39bt4mYyx3Ngh3NTxpu5wO354CsQt7
X-Proofpoint-ORIG-GUID: aq39bt4mYyx3Ngh3NTxpu5wO354CsQt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_07,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309250078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_035028_163608_F71EC74B 
X-CRM114-Status: GOOD (  22.29  )
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

T24gOS8yNS8yMDIzIDE6NDEgUE0sIEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPiBPbiA5LzI1
LzIzIDA3OjQ1LCBXZW4gR29uZyB3cm90ZToKPj4gT24gOS8yMi8yMDIzIDk6MjUgUE0sIEFkaXR5
YSBLdW1hciBTaW5naCB3cm90ZToKPj4+IE9uIDkvMjIvMjMgMTU6NDIsIFdlbiBHb25nIHdyb3Rl
Ogo+Pj4+IE9uIDkvMjIvMjAyMyA1OjI0IFBNLCBBZGl0eWEgS3VtYXIgU2luZ2ggd3JvdGU6Cj4+
Pj4+IE9uIDkvMjAvMjMgMTM6NTMsIFdlbiBHb25nIHdyb3RlOgo+Pj4+Pj4gV2hlbiBzdGF0aW9u
IGlzIGNvbm5lY3RlZCB0byBhIDYgR0h6IEFQLCBpdCBoYXMgMiB3YXkgdG8gY29uZmlndXJlCj4+
Pj4+PiB0aGUgcG93ZXIgbGltaXQgdG8gZmlybXdhcmUuIFRoZSBmaXJzdCB3YXkgaXMgdG8gc2Vu
ZCAyIHdtaSBjb21tYW5kCj4+Pj4+PiBXTUlfUERFVl9QQVJBTV9UWFBPV0VSX0xJTUlUMkcvV01J
X1BERVZfUEFSQU1fVFhQT1dFUl9MSU1JVDVHIHRvCj4+Pj4+PiBmaXJtd2FyZSwgdGhlIHNlY29u
ZCB3YXkgaXMgdG8gc2VuZCBXTUlfVkRFVl9TRVRfVFBDX1BPV0VSX0NNRElEIHRvCj4+Pj4+PiBm
aXJtd2FyZSB3aGljaCBpbmNsdWRlIG1vcmUgcGFyYW1ldGVycyBmb3IgcG93ZXIgY29udHJvbC4K
Pj4+Pj4+Cj4+Pj4+PiBUaGUgZmlyc3Qgd2F5IGlzIGRpc2FibGVkIGluIHByZXZpb3VzIHBhdGNo
Cj4+Pj4+PiAiYXRoMTFrOiBkaXNjYXJkIEJTU19DSEFOR0VEX1RYUE9XRVIgd2hlbiBFWFRfVFBD
X1JFR19TVVBQT1JUIGZvciAKPj4+Pj4+IDYgR0h6Ii4KPj4+Pj4+Cj4+Pj4+PiBQcmVwYXJlIHRo
ZSBwYXJhbWV0ZXIgZm9yIHdtaSBjb21tYW5kIAo+Pj4+Pj4gV01JX1ZERVZfU0VUX1RQQ19QT1dF
Ul9DTURJRCBhbmQKPj4+Pj4+IHNlbmQgdGhlIGZpcm13YXJlIGFmdGVyIHZkZXYgc3RhcnQgcmVz
cG9uc2Ugc3VjY2VzcyBmcm9tIAo+Pj4+Pj4gZmlybXdhcmUsIGl0Cj4+Pj4+PiBpcyBmb3IgdGhl
IHNlY29uZCB3YXkgb2YgcG93ZXIgY29udHJvbC4KPj4+Pj4+Cj4+Pj4+PiBUZXN0ZWQtb246IFdD
TjY4NTUgaHcyLjAgUENJIAo+Pj4+Pj4gV0xBTi5IU1AuMS4xLTAzMTI1LVFDQUhTUFNXUExfVjFf
VjJfU0lMSUNPTlpfTElURS0zLjY1MTAuMjMKPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBX
ZW4gR29uZyA8cXVpY193Z29uZ0BxdWljaW5jLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYyB8IDggKysrKysrKy0KPj4+Pj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4+Cj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYyAK
Pj4+Pj4+IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYwo+Pj4+Pj4gaW5k
ZXggYThhZTI4MWQyNjM1Li5mOGI5MDdhNzU4YjEgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJz
L25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCj4+Pj4+PiBAQCAtNzI5Niw2ICs3Mjk2LDEyIEBAIGF0
aDExa19tYWNfdmRldl9zdGFydF9yZXN0YXJ0KHN0cnVjdCAKPj4+Pj4+IGF0aDExa192aWYgKmFy
dmlmLAo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+PiDCoMKgwqDC
oMKgIH0KPj4+Pj4+IMKgICvCoMKgwqAgaWYgKGF0aDExa19tYWNfc3VwcG9ydHNfc3RhdGlvbl90
cGMoYXIsIGFydmlmLCBjaGFuZGVmKSkgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF0aDExa19t
YWNfZmlsbF9yZWdfdHBjX2luZm8oYXIsIGFydmlmLT52aWYsIAo+Pj4+Pj4gJmFydmlmLT5jaGFu
Y3R4KTsKPj4+Pj4gU28gd2UgYXJlIHBhc3NpbmcgbG9jYWwgY29weSBvZiBjaGFubmVsIGNvbnRl
eHQgc3RvcmVkIGluIAo+Pj4+PiBhcnZpZi0+Y2hhbmN0eC4gRG8gd2UgbmVlZCB0byB1cGRhdGUg
aXQgd2hlbiBjaGFubmVsIGNoYW5nZXM/Cj4+Pj4+Cj4+Pj4+IEkgc2VlIHRoYXQgZHVyaW5nIGFz
c2lnbm1lbnQgdGltZSwgd2UgYXJlIGNvcHlpbmcvdXBkYXRpbmcgaXQgYW5kIAo+Pj4+PiBhY2Nv
cmRpbmdseSB0aGUgY29tbWFuZCB3aWxsIGJlIHNlbnQgdG8gZmlybXdhcmUsIGJ1dCB3aGF0IGFi
b3V0IAo+Pj4+PiB3aGVuIFNUQSBtb3ZlcyBjaGFubmVsPyBhcnZpZi0+Y2hhbmN0eCBzaG91bGQg
YmUgdXBkYXRlZCBhbmQgdHBjIAo+Pj4+PiBjb21tYW5kIHNob3VsZCBiZSBzZW50IGFnYWluIGlu
IHRoYXQgY2FzZT8KPj4+Pgo+Pj4+IFRoaXMgaGFzIGJlZW4gZGlzY3Vzc2VkIGJlZm9yZSBoZXJl
IHBlciBxdWVzdGlvbiBvZiBKb2hhbm5lczoiQ291bGQgCj4+Pj4gdGhpcyBpbmZvcm1hdGlvbiBj
aGFuZ2U/IFNob3VsZCB3ZSB0cmFjayBpdCBpbiBiZWFjb25zPyI6Cj4+Pj4KPj4+PiBbUEFUQ0gg
OS85XSBtYWM4MDIxMTogc2F2ZSB0cmFuc21pdCBwb3dlciBlbnZlbG9wZSBlbGVtZW50IGFuZCAK
Pj4+PiBwb3dlciBjb25zdHJhaW50Cj4+Pj4KPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC13aXJlbGVzcy8zOGU3ZDlkMmVlYmFmYTcyNDVhMzZhMGEwMzk2MDk0NTI2ZWIzZWZkLmNh
bWVsQHNpcHNvbHV0aW9ucy5uZXQvIAo+Pj4+Cj4+PiBUaGF0J3MgZmluZS4gVGhhdCdzIHcuci50
IHRvIFRYIHBvd2VyIGNoYW5nZS4gSSdtIHNheWluZyBoZXJlIGFib3V0IAo+Pj4gQ1NBPyBXaGF0
IHdoZW4gQVAgdHJpZXMgdG8gc3dpdGNoIGNoYW5uZWw/IEZvciB0aGF0IGNsaWVudCBuZWVkIG5v
dCAKPj4+IGRpc2Fzc29jaWF0ZSBhbmQgYXNzb2NpYXRlIGJhY2sgcmlnaHQ/Cj4+Pgo+Pj4gSW4g
dGhhdCBjYXNlLCBjaGFubmVsIGNvbnRleHQgaW4gbWFjODAyMTEgbGF5ZXIgd2lsbCBjaGFuZ2Uu
IEJ1dCBvdXIgCj4+PiBkcml2ZXIncyBhcnZpZi0+Y2hhbmN0eCB3aWxsIGhhdmUgcHJldmlvdXMg
b25lIG9ubHkuIFdlIGFyZSB1c2luZyAKPj4+IGNoYW5uZWwgY29udGV4dCB0byBnZXQgdGhlIGll
ZWU4MDIxMV9jaGFubmVsIHdoaWNoIGhhcyB0aGUgUFNEIAo+Pj4gdmFsdWUsIGFuZCB0aGF0IHZh
bHVlIHdlIGFyZSBzZW5kaW5nIHRvIGZpcm13YXJlIHZpYSBUUEMgY29tbWFuZCAKPj4+IGR1cmlu
ZyBpbnRpYWwgYXNzb2NpYXRpb24gdGltZS4gU28gd2hlbiBjaGFubmVsIGNoYW5nZXMsIGZpcm13
YXJlIAo+Pj4gYWxzbyBzaG91bGQgYmUgdXBkYXRlZCB3aXRoIHRoZSBsYXRlc3QgUFNEIHZhbHVl
cyB2aWEgVFBDIGNvbW1hbmQgCj4+PiBmb3IgdGhlIGxhdGVzdCBjaGFubmVsIHJpZ2h0Pwo+Pj4K
Pj4gWW91IGFyZSByaWdodC4gQ1NBIG1heSBiZSBjaGFuZ2UgY2hhbm5lbCBiYW5kd2lkdGguCj4+
Cj4+IEN1cnJlbnRseSB3ZSBjb3VsZCBrZWVwIE5PVCBzdXBwb3J0IENTQSBhcyB3ZWxsIGFzIENT
QSBmb3IgTUxPIHNpbmNlIAo+PiB0aGVzZSBhcmUgdGhlIGJhc2ljIFRQQyBzdXBwb3J0IGZlYXR1
cmUuCj4+Cj4+IFdlIGNvdWxkIG1ha2UgbmV3IHBhdGNoIGxhdGVyIHRvIHN1cHBvcnQgQ1NBIGZy
byBUUEMgcG93ZXIsIE9LPwo+IE5vdCBzdXBwb3J0aW5nIHcuci50IE1MTyBDU0EgaXMgb2theS4g
VGhhdCdzIFdJUC4gQnV0IGZvciBub24tTUxPIAo+IGNhc2UsIEkgdGhpbmsgaXQgc2hvdWxkIGJl
IHN1cHBvcnRlZC4gQW5kIGlmIG5vdCwgdGhlbiBtYXkgYmUgCj4gZXhwbGljaXRseSBtZW50aW9u
IGl0IHNvbWV3aGVyZSBhcyBfVE9ET18gPyBXaGF0IGlmIGJ5IHRoZSB0aW1lIHBhdGNoIAo+IGlz
IHNlbnQgZm9yIHRoYXQsIG1lYW53aGlsZSBhIGJ1ZyBpcyBmaWxlZD8KSSB3aWxsIGFkZCBfVE9E
T18gbmV4dCB2ZXJzaW9uIGFzIHlvdSBzYWlkLgo+Cj4gQW55d2F5cywgSSB3aWxsIGxldCBtYWlu
dGFpbmVycyB0YWtlIGEgY2FsbCBvbiB0aGlzLiBJIGRvbid0IGhhdmUgYW55IAo+IGZ1cnRoZXIg
Y29tbWVudHMuCj4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFr
Cg==
