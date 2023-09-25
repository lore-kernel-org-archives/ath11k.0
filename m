Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDF0CE7A95
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 05:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvpoGqFSQA/VZ0CHx3ecbUlddHfS2WzvP+RBgLua9d4=; b=SmOW4IulwdhrXB
	LS3psYpIl9Qb/Wz+I1VT0mHNtfNbQQMtS03t84ELFAgjYv/HYgBKYo1nbjCKVMv9rtASdDXCCUpqf
	oK8NOhe5TJurJaCEcrA1D+B6lF8q9Z6JetTLTF/YxK4LZ4lACZFKQIfTmgKeSEs/Y2jkHM+rVFDkL
	VXGqmZNedg5ihtmCvyB/dwlFjpEAkZ66XZEgkCtWwU+vZELLuxpzxAOuDZsc7pewM1ZLK0lWrpJuB
	Le/xGNV1mULshgrB5HcMnThjlBur+pMaDGEAfpREef1T45foThdSgyskd9M+rmm0b3SfKLYnoTMSQ
	kjEC89ZlpmjXVYa+OKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkeMg-00DNhq-37;
	Mon, 25 Sep 2023 05:42:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkeMe-00DNhJ-1y
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 05:42:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P4pMG8001833;
	Mon, 25 Sep 2023 05:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sQY/AggV8xQysCTNPgy9O/5Bm+uQD1+d/f+Kyo4SrRU=;
 b=ZQJdEEBDxV+Ik49vFExCw3PY6I6AJAewKOi2Y29KdfWWn7BKYNlk0ONMpyxZ+cRkn1b/
 fwETAX67rh1RKpPjeKQglRQmx/7ADXs8ybyltciqNUOcms0ZHspT6TrPuOlu9g/3VNi7
 Isz4Ft+BizwrXkcnqWbBiZPGrxag6z/yqaLqiF01aHuYRMpH3e5qUjbZyPUtZVPJ7Jk9
 uH/3gP5+PIS33RjFc9uHzxc1cbVQ94zaPRBlb4YwS2X0Bp8F1FlwT7FL1/TjNp5JXKSS
 MoNocFS8z7mwKw5T15kkvh2mFihvRf4wRY5IdADY91kRUGVw79chuMUj7yRyslfbGX8O 9w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9safayr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 05:42:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38P5gU0i024934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 05:42:30 GMT
Received: from [10.201.207.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Sun, 24 Sep
 2023 22:41:56 -0700
Message-ID: <1c1391b6-9710-44c6-97b2-68ef23409c1b@quicinc.com>
Date: Mon, 25 Sep 2023 11:11:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] wifi: ath11k: send TPC power to firmware for 6
 GHz station
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-14-quic_wgong@quicinc.com>
 <eb08e0f2-c932-4d79-b2ee-813c2999d1a5@quicinc.com>
 <fbad2af6-9c3f-c241-b820-7820b4200bf4@quicinc.com>
 <60aaa1fc-99cf-476c-af51-e5ad425792f9@quicinc.com>
 <145e9534-6610-9c11-b2b9-87fb8e50ef81@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <145e9534-6610-9c11-b2b9-87fb8e50ef81@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DwgMISsP-LKseHoU73c1sEfKFqZ6t9w_
X-Proofpoint-GUID: DwgMISsP-LKseHoU73c1sEfKFqZ6t9w_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_03,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309250040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_224236_672044_1DBBD2C6 
X-CRM114-Status: GOOD (  24.40  )
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

T24gOS8yNS8yMyAwNzo0NSwgV2VuIEdvbmcgd3JvdGU6Cj4gT24gOS8yMi8yMDIzIDk6MjUgUE0s
IEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPj4gT24gOS8yMi8yMyAxNTo0MiwgV2VuIEdvbmcg
d3JvdGU6Cj4+PiBPbiA5LzIyLzIwMjMgNToyNCBQTSwgQWRpdHlhIEt1bWFyIFNpbmdoIHdyb3Rl
Ogo+Pj4+IE9uIDkvMjAvMjMgMTM6NTMsIFdlbiBHb25nIHdyb3RlOgo+Pj4+PiBXaGVuIHN0YXRp
b24gaXMgY29ubmVjdGVkIHRvIGEgNiBHSHogQVAsIGl0IGhhcyAyIHdheSB0byBjb25maWd1cmUK
Pj4+Pj4gdGhlIHBvd2VyIGxpbWl0IHRvIGZpcm13YXJlLiBUaGUgZmlyc3Qgd2F5IGlzIHRvIHNl
bmQgMiB3bWkgY29tbWFuZAo+Pj4+PiBXTUlfUERFVl9QQVJBTV9UWFBPV0VSX0xJTUlUMkcvV01J
X1BERVZfUEFSQU1fVFhQT1dFUl9MSU1JVDVHIHRvCj4+Pj4+IGZpcm13YXJlLCB0aGUgc2Vjb25k
IHdheSBpcyB0byBzZW5kIFdNSV9WREVWX1NFVF9UUENfUE9XRVJfQ01ESUQgdG8KPj4+Pj4gZmly
bXdhcmUgd2hpY2ggaW5jbHVkZSBtb3JlIHBhcmFtZXRlcnMgZm9yIHBvd2VyIGNvbnRyb2wuCj4+
Pj4+Cj4+Pj4+IFRoZSBmaXJzdCB3YXkgaXMgZGlzYWJsZWQgaW4gcHJldmlvdXMgcGF0Y2gKPj4+
Pj4gImF0aDExazogZGlzY2FyZCBCU1NfQ0hBTkdFRF9UWFBPV0VSIHdoZW4gRVhUX1RQQ19SRUdf
U1VQUE9SVCBmb3IgNiAKPj4+Pj4gR0h6Ii4KPj4+Pj4KPj4+Pj4gUHJlcGFyZSB0aGUgcGFyYW1l
dGVyIGZvciB3bWkgY29tbWFuZCBXTUlfVkRFVl9TRVRfVFBDX1BPV0VSX0NNRElEIGFuZAo+Pj4+
PiBzZW5kIHRoZSBmaXJtd2FyZSBhZnRlciB2ZGV2IHN0YXJ0IHJlc3BvbnNlIHN1Y2Nlc3MgZnJv
bSBmaXJtd2FyZSwgaXQKPj4+Pj4gaXMgZm9yIHRoZSBzZWNvbmQgd2F5IG9mIHBvd2VyIGNvbnRy
b2wuCj4+Pj4+Cj4+Pj4+IFRlc3RlZC1vbjogV0NONjg1NSBodzIuMCBQQ0kgCj4+Pj4+IFdMQU4u
SFNQLjEuMS0wMzEyNS1RQ0FIU1BTV1BMX1YxX1YyX1NJTElDT05aX0xJVEUtMy42NTEwLjIzCj4+
Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlbiBHb25nIDxxdWljX3dnb25nQHF1aWNpbmMuY29t
Pgo+Pj4+PiAtLS0KPj4+Pj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMu
YyB8IDggKysrKysrKy0KPj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDExay9tYWMuYyAKPj4+Pj4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTFrL21hYy5jCj4+Pj4+IGluZGV4IGE4YWUyODFkMjYzNS4uZjhiOTA3YTc1OGIxIDEwMDY0NAo+
Pj4+PiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jCj4+Pj4+ICsr
KyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKPj4+Pj4gQEAgLTcyOTYs
NiArNzI5NiwxMiBAQCBhdGgxMWtfbWFjX3ZkZXZfc3RhcnRfcmVzdGFydChzdHJ1Y3QgCj4+Pj4+
IGF0aDExa192aWYgKmFydmlmLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsK
Pj4+Pj4gwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgICvCoMKgwqAgaWYgKGF0aDExa19tYWNfc3VwcG9y
dHNfc3RhdGlvbl90cGMoYXIsIGFydmlmLCBjaGFuZGVmKSkgewo+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgYXRoMTFrX21hY19maWxsX3JlZ190cGNfaW5mbyhhciwgYXJ2aWYtPnZpZiwgCj4+Pj4+ICZh
cnZpZi0+Y2hhbmN0eCk7Cj4+Pj4gU28gd2UgYXJlIHBhc3NpbmcgbG9jYWwgY29weSBvZiBjaGFu
bmVsIGNvbnRleHQgc3RvcmVkIGluIAo+Pj4+IGFydmlmLT5jaGFuY3R4LiBEbyB3ZSBuZWVkIHRv
IHVwZGF0ZSBpdCB3aGVuIGNoYW5uZWwgY2hhbmdlcz8KPj4+Pgo+Pj4+IEkgc2VlIHRoYXQgZHVy
aW5nIGFzc2lnbm1lbnQgdGltZSwgd2UgYXJlIGNvcHlpbmcvdXBkYXRpbmcgaXQgYW5kIAo+Pj4+
IGFjY29yZGluZ2x5IHRoZSBjb21tYW5kIHdpbGwgYmUgc2VudCB0byBmaXJtd2FyZSwgYnV0IHdo
YXQgYWJvdXQgCj4+Pj4gd2hlbiBTVEEgbW92ZXMgY2hhbm5lbD8gYXJ2aWYtPmNoYW5jdHggc2hv
dWxkIGJlIHVwZGF0ZWQgYW5kIHRwYyAKPj4+PiBjb21tYW5kIHNob3VsZCBiZSBzZW50IGFnYWlu
IGluIHRoYXQgY2FzZT8KPj4+Cj4+PiBUaGlzIGhhcyBiZWVuIGRpc2N1c3NlZCBiZWZvcmUgaGVy
ZSBwZXIgcXVlc3Rpb24gb2YgSm9oYW5uZXM6IkNvdWxkIAo+Pj4gdGhpcyBpbmZvcm1hdGlvbiBj
aGFuZ2U/IFNob3VsZCB3ZSB0cmFjayBpdCBpbiBiZWFjb25zPyI6Cj4+Pgo+Pj4gW1BBVENIIDkv
OV0gbWFjODAyMTE6IHNhdmUgdHJhbnNtaXQgcG93ZXIgZW52ZWxvcGUgZWxlbWVudCBhbmQgcG93
ZXIgCj4+PiBjb25zdHJhaW50Cj4+Pgo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
d2lyZWxlc3MvMzhlN2Q5ZDJlZWJhZmE3MjQ1YTM2YTBhMDM5NjA5NDUyNmViM2VmZC5jYW1lbEBz
aXBzb2x1dGlvbnMubmV0Lwo+PiBUaGF0J3MgZmluZS4gVGhhdCdzIHcuci50IHRvIFRYIHBvd2Vy
IGNoYW5nZS4gSSdtIHNheWluZyBoZXJlIGFib3V0IAo+PiBDU0E/IFdoYXQgd2hlbiBBUCB0cmll
cyB0byBzd2l0Y2ggY2hhbm5lbD8gRm9yIHRoYXQgY2xpZW50IG5lZWQgbm90IAo+PiBkaXNhc3Nv
Y2lhdGUgYW5kIGFzc29jaWF0ZSBiYWNrIHJpZ2h0Pwo+Pgo+PiBJbiB0aGF0IGNhc2UsIGNoYW5u
ZWwgY29udGV4dCBpbiBtYWM4MDIxMSBsYXllciB3aWxsIGNoYW5nZS4gQnV0IG91ciAKPj4gZHJp
dmVyJ3MgYXJ2aWYtPmNoYW5jdHggd2lsbCBoYXZlIHByZXZpb3VzIG9uZSBvbmx5LiBXZSBhcmUg
dXNpbmcgCj4+IGNoYW5uZWwgY29udGV4dCB0byBnZXQgdGhlIGllZWU4MDIxMV9jaGFubmVsIHdo
aWNoIGhhcyB0aGUgUFNEIHZhbHVlLCAKPj4gYW5kIHRoYXQgdmFsdWUgd2UgYXJlIHNlbmRpbmcg
dG8gZmlybXdhcmUgdmlhIFRQQyBjb21tYW5kIGR1cmluZyAKPj4gaW50aWFsIGFzc29jaWF0aW9u
IHRpbWUuIFNvIHdoZW4gY2hhbm5lbCBjaGFuZ2VzLCBmaXJtd2FyZSBhbHNvIHNob3VsZCAKPj4g
YmUgdXBkYXRlZCB3aXRoIHRoZSBsYXRlc3QgUFNEIHZhbHVlcyB2aWEgVFBDIGNvbW1hbmQgZm9y
IHRoZSBsYXRlc3QgCj4+IGNoYW5uZWwgcmlnaHQ/Cj4+Cj4gWW91IGFyZSByaWdodC4gQ1NBIG1h
eSBiZSBjaGFuZ2UgY2hhbm5lbCBiYW5kd2lkdGguCj4gCj4gQ3VycmVudGx5IHdlIGNvdWxkIGtl
ZXAgTk9UIHN1cHBvcnQgQ1NBIGFzIHdlbGwgYXMgQ1NBIGZvciBNTE8gc2luY2UgCj4gdGhlc2Ug
YXJlIHRoZSBiYXNpYyBUUEMgc3VwcG9ydCBmZWF0dXJlLgo+IAo+IFdlIGNvdWxkIG1ha2UgbmV3
IHBhdGNoIGxhdGVyIHRvIHN1cHBvcnQgQ1NBIGZybyBUUEMgcG93ZXIsIE9LPwpOb3Qgc3VwcG9y
dGluZyB3LnIudCBNTE8gQ1NBIGlzIG9rYXkuIFRoYXQncyBXSVAuIEJ1dCBmb3Igbm9uLU1MTyBj
YXNlLCAKSSB0aGluayBpdCBzaG91bGQgYmUgc3VwcG9ydGVkLiBBbmQgaWYgbm90LCB0aGVuIG1h
eSBiZSBleHBsaWNpdGx5IAptZW50aW9uIGl0IHNvbWV3aGVyZSBhcyBfVE9ET18gPyBXaGF0IGlm
IGJ5IHRoZSB0aW1lIHBhdGNoIGlzIHNlbnQgZm9yIAp0aGF0LCBtZWFud2hpbGUgYSBidWcgaXMg
ZmlsZWQ/CgpBbnl3YXlzLCBJIHdpbGwgbGV0IG1haW50YWluZXJzIHRha2UgYSBjYWxsIG9uIHRo
aXMuIEkgZG9uJ3QgaGF2ZSBhbnkgCmZ1cnRoZXIgY29tbWVudHMuCgoKLS0gCmF0aDExayBtYWls
aW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
