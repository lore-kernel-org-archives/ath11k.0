Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633BAE6FE27
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 13:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVG8PWQIkIA/6H1XhkDRsaaS7p9Oj09GdD2tByf+bnU=; b=mvO/sMNo+vsQ5g
	9mBS0t+BRSMau7/x5acJRmuhDH0xsKBuANxadBHnkWOEsJuPa2cA7zFDga2bWAt6Sawf05SFBNV5T
	Bs6GKKuQjvxU1Li4pdo/wttqm6Y9ViFcl5TtYkIHdI0fIfCBxe8E176xWUCROVhauaSx9a+dPlzL1
	0PSEiqGO9IotOqj/SBjoUIIGp3PDRR4lqJbzLELPhIqsNftR5K+/c4khglSs34t8qStNclzuf8Ldi
	k5M0VvrGcMPYLR7eblLObj0o/ANmUpC52JlKMT3exUTgVecvhyOxvEjDeolfn3sGsZw6A5sZ8g6KF
	rWJKywKxOqZ92yuQMxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjg3O-0096hm-0j;
	Fri, 22 Sep 2023 13:18:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjg3K-0096h5-1S
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 13:18:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38MBV4jP023156;
	Fri, 22 Sep 2023 13:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=B+/ACta5Uv0EYpox8tHiK6YZhFkMUmjy5h4LeKkghVM=;
 b=A70V3NOgNEXH+OXBFPeb02l/7cSlQg9SbxBYAgtdcJYNfhllFDmqZ+OE8GocF8e3XnsH
 U9m99pA8tmyOampxmxbD0VdWtrfg8QkreC+MwUVOOpPN0kAtFCzDwNgCtBQTA4ASmRs4
 RFLF0ZquX6pwMxrJEAkSZL0HTxRk3YNyCNBaOT4vrZhMLGBJCICy2N/9XnZFIzH/liSW
 3qWtyyVfUHiYDX4LKdkRUcrnTN1zdd0umAkFRFKxUZC3wdcUupOvSx3N8vcGF8wSNKNH
 EBOQvmOGmQmHNl173IaaJ6fg1jbmL4LiCptKk9IVMbCUzB/bXgtCECpaxax5OjRUERHz Nw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9a3e87ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 13:18:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MDIWdg031776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 13:18:32 GMT
Received: from [10.216.13.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 06:18:30 -0700
Message-ID: <47e2ce79-2885-489c-b567-fdbcb120d056@quicinc.com>
Date: Fri, 22 Sep 2023 18:48:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] wifi: ath11k: update regulatory rules when
 connect to AP on 6 GHz band for station
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-6-quic_wgong@quicinc.com>
 <5e9439c5-fc02-4a18-8cc8-c76998bfcbc6@quicinc.com>
 <1f739d62-d5c0-a64b-ef9b-d5fd7b79755e@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <1f739d62-d5c0-a64b-ef9b-d5fd7b79755e@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -L4IplQhQ2bqOvIb-UxjlkrqrnP-qVWl
X-Proofpoint-GUID: -L4IplQhQ2bqOvIb-UxjlkrqrnP-qVWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_11,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_061838_620199_C647191C 
X-CRM114-Status: GOOD (  15.67  )
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

T24gOS8yMi8yMyAxNTozMiwgV2VuIEdvbmcgd3JvdGU6Cj4gT24gOS8yMi8yMDIzIDU6MzkgUE0s
IEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPj4gT24gOS8yMC8yMyAxMzo1MywgV2VuIEdvbmcg
d3JvdGU6Cj4+Cj4+PiArwqDCoMKgIGlmIChhdGgxMWtfbWFjX3N1cHBvcnRzXzZnaHpfY2NfZXh0
KGFyKSAmJgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGN0eC0+ZGVmLmNoYW4tPmJhbmQgPT0gTkw4MDIx
MV9CQU5EXzZHSFogJiYKPj4+ICvCoMKgwqDCoMKgwqDCoCBhcnZpZi0+dmRldl90eXBlID09IFdN
SV9WREVWX1RZUEVfU1RBKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmVnX2luZm8gPSAmYWItPnJl
Z19pbmZvX3N0b3JlW2FyLT5wZGV2X2lkeF07Cj4+PiArwqDCoMKgwqDCoMKgwqAgcG93ZXJfdHlw
ZSA9IHZpZi0+YnNzX2NvbmYucG93ZXJfdHlwZTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBhdGgxMWtf
ZGJnKGFiLCBBVEgxMUtfREJHX01BQywgIm1hYyBjaGFuY3R4IHBvd2VyIHR5cGUgJWRcbiIsCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3dlcl90eXBlKTsKPj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAocG93ZXJfdHlwZSA9PSBJRUVFODAyMTFfUkVHX1VOU0VUX0FQKQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcG93ZXJfdHlwZSA9IElFRUU4MDIxMV9SRUdfTFBJX0FQOwo+
PiBXaHkgaGF2aW5nIF9VTlNFVF8gcG93ZXIgdHlwZSBpbiB2aWYtPmJzc19jb25mLnBvd2VyX3R5
cGUgaXMgZmluZT8gCj4+IFR5cGljYWxseSwgZHVyaW5nIGFzc29jaWF0aW9uLCB3ZSB3b3VsZCBi
ZSBzZXR0aW5nIHRoaXMgZnJvbSB0aGUgCj4+IGJlYWNvbi9hc3NvY2lhdGlvbiByZXNwb25zZSBm
cmFtZSdzIEhFIDYgR0h6IE9wZXJhdGlvbiBJbmZvIEZpZWxkLiBTbyAKPj4gaXMgaXQgZmluZSBp
ZiB0aGUgZmllbGQgaXMgY2Fycnlpbmcgc29tZSBpbmZvIHdoaWNoIHdlIGRvbid0IGtub3cgKG9y
IAo+PiBtYXkgYmUgZG9uJ3Qgc3VwcG9ydCBpdCB5ZXQpPyBXaHkgYXJlIHdlIG1hc2tpbmcgaXQg
d2l0aCBfTFBJXyBtb2RlPwo+Pgo+PiBBbHNvLCBJIHNlZSB0aGF0IGN1cnJlbnRseSBtYWM4MDIx
MSBvbmx5IHNldHMgTFBJIG9yIFNQLiBTbyBsZXQncyBzYXkgCj4+IFNUQSBpcyB0cnlpbmcgdG8g
Y29ubmVjdCB0byBWTFAgQVAsIG1hYzgwMjExIHdpbGwgc2V0IGl0IGFzIF9VTlNFVF8uIAo+PiBB
bmQgdGhlbiBoZXJlLCB3ZSB3aWxsIGJlIHRyZWF0aW5nIGl0IGFzIExQSSBBUC4gSXMgdGhhdCBm
aW5lPwo+IAo+IEN1cnJlbnRseSBvbmx5IFNQL0xQSSBhcmUgZGVmaW5lZCBpbiAiVGFibGUgRS0x
MuKAlFJlZ3VsYXRvcnkgSW5mbyAKPiBzdWJmaWVsZCBlbmNvZGluZyBpbiB0aGUgVW5pdGVkIFN0
YXRlcyIgb2YgSUVFRSBTdGQgODAyLjExYXjihKLigJAyMDIxLgo+IAo+IFNvIG1heWJlIEkgbmVl
ZCB0byBzZXQgcG93ZXJfdHlwZSB0byBWTFAgd2hlbiBpdCBpcyBVTlNFVCBoZXJlLgpZZWFoLCBv
ciBtYXkgYmUgZGVueSBhc3NvY2lhdGlvbiBpZiB3ZSBkb24ndCBzdXBwb3J0IHRoYXQgbW9kZT8g
SSB3b3VsZCAKbGV0IG90aGVycyBjb21tZW50IG9uIHRoaXMuCgoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
