Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD25CD4F4E
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rSi92wNht90suLPFbPCKRpladlNKLYxv5zYJ0quq/c=; b=YLVn8aJHmiLHW1
	NCO60f+pHXIAMoUozrpVmMe0YzhQyCMhO6KaNCtpTYnI/r0dREquKO2s3zXj0UUawzGI/SindtNif
	tKlRGBVDQ/g+IBqFMqeJknmrE+Lwy2511CCEufXYgFM6sgZc+s5AHJJu5D04P1m7TuwTXPEwogGqb
	J7Jve0/LOAgwEzBQtsee8XxlPtEKBI5eQhdzm6icHbzhba+D7/esSS5ckePNVakkgZ7GXvVd8AZZQ
	CFZyOJXvGtTXFw5GI2/GsnA3FClUzqttbbVhSmCwsnIPIESID+GmSfEJ99FmfoKnu8a027f98o2xG
	5q91earp5iIjmR5MYryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjd94-008hPD-2o;
	Fri, 22 Sep 2023 10:12:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjd91-008hNm-1T
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 10:12:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M9teFK032009;
	Fri, 22 Sep 2023 10:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fLVl/z53WaGW7KIB0FMieYrhjsDggvHqtk4DZbD+HUE=;
 b=nVQRKIDBtWoBcc9Nghigvm6os8QvgbE66WoizEyfRoALb57VB+UFs6+ZVfMD9ZjQM8DF
 1MRpyHgF/14rIAkFje9rAYChqhRkhRur+VOTpwjj65FsyZr8TvCioAsHD9HYKCKr8mO5
 e7GrBofgN4+iBOJoP5fLjdJie3etQ6OH8m+jE93kH5fej9ZtRaGWV+t6fWQfF3OlYLXQ
 gSGpxvTFzms9Fr2+ednbZ2HcBeBN9qyp5KmNl2SrJiDBCO0kX5SdkJZ0MyxOExqE/OA5
 f+LixeQEApV9q0lVwZ6FQ+NiYglTSVtY5qx6jcbytDIIn7E7Ml+NFZT0RfYUM7E1BiC9 Pw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8txg9kf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 10:12:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MACG70029327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 10:12:16 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 03:12:13 -0700
Message-ID: <fbad2af6-9c3f-c241-b820-7820b4200bf4@quicinc.com>
Date: Fri, 22 Sep 2023 18:12:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 13/13] wifi: ath11k: send TPC power to firmware for 6
 GHz station
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-14-quic_wgong@quicinc.com>
 <eb08e0f2-c932-4d79-b2ee-813c2999d1a5@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <eb08e0f2-c932-4d79-b2ee-813c2999d1a5@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4G5xzwNmCXqlaJEng_Ge8w0elfJ50qb1
X-Proofpoint-GUID: 4G5xzwNmCXqlaJEng_Ge8w0elfJ50qb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_031219_499615_65A6A9A5 
X-CRM114-Status: GOOD (  21.16  )
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

T24gOS8yMi8yMDIzIDU6MjQgUE0sIEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPiBPbiA5LzIw
LzIzIDEzOjUzLCBXZW4gR29uZyB3cm90ZToKPj4gV2hlbiBzdGF0aW9uIGlzIGNvbm5lY3RlZCB0
byBhIDYgR0h6IEFQLCBpdCBoYXMgMiB3YXkgdG8gY29uZmlndXJlCj4+IHRoZSBwb3dlciBsaW1p
dCB0byBmaXJtd2FyZS4gVGhlIGZpcnN0IHdheSBpcyB0byBzZW5kIDIgd21pIGNvbW1hbmQKPj4g
V01JX1BERVZfUEFSQU1fVFhQT1dFUl9MSU1JVDJHL1dNSV9QREVWX1BBUkFNX1RYUE9XRVJfTElN
SVQ1RyB0bwo+PiBmaXJtd2FyZSwgdGhlIHNlY29uZCB3YXkgaXMgdG8gc2VuZCBXTUlfVkRFVl9T
RVRfVFBDX1BPV0VSX0NNRElEIHRvCj4+IGZpcm13YXJlIHdoaWNoIGluY2x1ZGUgbW9yZSBwYXJh
bWV0ZXJzIGZvciBwb3dlciBjb250cm9sLgo+Pgo+PiBUaGUgZmlyc3Qgd2F5IGlzIGRpc2FibGVk
IGluIHByZXZpb3VzIHBhdGNoCj4+ICJhdGgxMWs6IGRpc2NhcmQgQlNTX0NIQU5HRURfVFhQT1dF
UiB3aGVuIEVYVF9UUENfUkVHX1NVUFBPUlQgZm9yIDYgCj4+IEdIeiIuCj4+Cj4+IFByZXBhcmUg
dGhlIHBhcmFtZXRlciBmb3Igd21pIGNvbW1hbmQgV01JX1ZERVZfU0VUX1RQQ19QT1dFUl9DTURJ
RCBhbmQKPj4gc2VuZCB0aGUgZmlybXdhcmUgYWZ0ZXIgdmRldiBzdGFydCByZXNwb25zZSBzdWNj
ZXNzIGZyb20gZmlybXdhcmUsIGl0Cj4+IGlzIGZvciB0aGUgc2Vjb25kIHdheSBvZiBwb3dlciBj
b250cm9sLgo+Pgo+PiBUZXN0ZWQtb246IFdDTjY4NTUgaHcyLjAgUENJIAo+PiBXTEFOLkhTUC4x
LjEtMDMxMjUtUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09OWl9MSVRFLTMuNjUxMC4yMwo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBXZW4gR29uZyA8cXVpY193Z29uZ0BxdWljaW5jLmNvbT4KPj4gLS0tCj4+
IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCA4ICsrKysrKystCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgCj4+IGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYwo+PiBpbmRleCBhOGFlMjgxZDI2
MzUuLmY4YjkwN2E3NThiMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDExay9tYWMuYwo+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21h
Yy5jCj4+IEBAIC03Mjk2LDYgKzcyOTYsMTIgQEAgYXRoMTFrX21hY192ZGV2X3N0YXJ0X3Jlc3Rh
cnQoc3RydWN0IAo+PiBhdGgxMWtfdmlmICphcnZpZiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiByZXQ7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCArwqDCoMKgIGlmIChhdGgxMWtfbWFjX3N1
cHBvcnRzX3N0YXRpb25fdHBjKGFyLCBhcnZpZiwgY2hhbmRlZikpIHsKPj4gK8KgwqDCoMKgwqDC
oMKgIGF0aDExa19tYWNfZmlsbF9yZWdfdHBjX2luZm8oYXIsIGFydmlmLT52aWYsICZhcnZpZi0+
Y2hhbmN0eCk7Cj4gU28gd2UgYXJlIHBhc3NpbmcgbG9jYWwgY29weSBvZiBjaGFubmVsIGNvbnRl
eHQgc3RvcmVkIGluIAo+IGFydmlmLT5jaGFuY3R4LiBEbyB3ZSBuZWVkIHRvIHVwZGF0ZSBpdCB3
aGVuIGNoYW5uZWwgY2hhbmdlcz8KPgo+IEkgc2VlIHRoYXQgZHVyaW5nIGFzc2lnbm1lbnQgdGlt
ZSwgd2UgYXJlIGNvcHlpbmcvdXBkYXRpbmcgaXQgYW5kIAo+IGFjY29yZGluZ2x5IHRoZSBjb21t
YW5kIHdpbGwgYmUgc2VudCB0byBmaXJtd2FyZSwgYnV0IHdoYXQgYWJvdXQgd2hlbiAKPiBTVEEg
bW92ZXMgY2hhbm5lbD8gYXJ2aWYtPmNoYW5jdHggc2hvdWxkIGJlIHVwZGF0ZWQgYW5kIHRwYyBj
b21tYW5kIAo+IHNob3VsZCBiZSBzZW50IGFnYWluIGluIHRoYXQgY2FzZT8KClRoaXMgaGFzIGJl
ZW4gZGlzY3Vzc2VkIGJlZm9yZSBoZXJlIHBlciBxdWVzdGlvbiBvZiBKb2hhbm5lczoiQ291bGQg
dGhpcyAKaW5mb3JtYXRpb24gY2hhbmdlPyBTaG91bGQgd2UgdHJhY2sgaXQgaW4gYmVhY29ucz8i
OgoKW1BBVENIIDkvOV0gbWFjODAyMTE6IHNhdmUgdHJhbnNtaXQgcG93ZXIgZW52ZWxvcGUgZWxl
bWVudCBhbmQgcG93ZXIgCmNvbnN0cmFpbnQKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXdpcmVsZXNzLzM4ZTdkOWQyZWViYWZhNzI0NWEzNmEwYTAzOTYwOTQ1MjZlYjNlZmQuY2FtZWxA
c2lwc29sdXRpb25zLm5ldC8KCj4KPj4gKyBhdGgxMWtfd21pX3NlbmRfdmRldl9zZXRfdHBjX3Bv
d2VyKGFyLCBhcnZpZi0+dmRldl9pZCwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmFydmlmLT5yZWdfdHBjX2luZm8pOwo+PiArwqDCoMKg
IH0KPj4gKwo+PiDCoMKgwqDCoMKgIGlmICghcmVzdGFydCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGFyLT5udW1fc3RhcnRlZF92ZGV2cysrOwo+PiDCoCBAQCAtODEwOCw3ICs4MTE0LDcgQEAgYXRo
MTFrX21hY19vcF9hc3NpZ25fdmlmX2NoYW5jdHgoc3RydWN0IAo+PiBpZWVlODAyMTFfaHcgKmh3
LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBvd2VyX3R5cGUgPT0gSUVFRTgwMjExX1JFR19V
TlNFVF9BUCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG93ZXJfdHlwZSA9IElFRUU4
MDIxMV9SRUdfTFBJX0FQOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYXRoMTFrX3JlZ19oYW5kbGVf
Y2hhbl9saXN0KGFiLCByZWdfaW5mbywgcG93ZXJfdHlwZSk7Cj4+IC0KPj4gK8KgwqDCoMKgwqDC
oMKgIGFydmlmLT5jaGFuY3R4ID0gKmN0eDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGF0aDExa19t
YWNfcGFyc2VfdHhfcHdyX2VudihhciwgdmlmLCBjdHgpOwo+PiDCoMKgwqDCoMKgIH0KCi0tIAph
dGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
