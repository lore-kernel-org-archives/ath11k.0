Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE34E6FE2A
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vwj4TEXFKw5IxSuCOpsyplf+9G8LQJnXyOogQrNrHw=; b=tcwqyeNWzNEuuH
	WebY8fboWz6uhH+Y6JsfrvrtSUL+0e+m4FgwdjkGpT25OKlmqjUOIuzSs8Xqsb2+fIdIl82S38cQT
	QaX/Mi7dAQYz0UdB7d4IPEKC64H82D6xkmrux7E7X+oYZsayfKruv6sXjMoM8oxpbnTfytxtITBvn
	D/Ggnu+D5TeNFmpav1KouKRMjHIugewBv6hr/XAMkz3lGG59m4Xj8Ulg8m8pC8em7KoYHo+NT6NyS
	M2d9pbdJqTtnQQAvD/nesflw3nyj6Yb138pNYIJ6FSWugegqCfLpn4q1IaXPGTSYtIufpUjBV/p0j
	2mnQ6wFRn5YrEOfKXrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjg9l-009782-1A;
	Fri, 22 Sep 2023 13:25:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjg9h-00977e-0j
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 13:25:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38MBTDYs019375;
	Fri, 22 Sep 2023 13:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=70eCGEBkn8Zebosxnq21A/1BJKgdyXbyLOT6ZT0QK64=;
 b=LoRApp6wNaJHFPkGRGUUr82ZMlqV6X/KD+DnCddYtGDqghoX57rt1yblvD1JOL6w8Y6A
 x+c5yPt9NJWBi+VNf5OeaV4VWpUAsdegH8PvWHBuJhn0F4LCzG8k3+zGlNaXCzCBZtj1
 kALa5CnR3GUgFVA445POrF4DYUP7ydZ+HlrtLTJ6qx/fZcrpsLp//9YTjgHBSRYsVeUo
 2JHTfYDWsvoveb/YAFw0wwjPoKz6WktFC7cVwAnX480/mNYaJ15BRWbq7kmhZR5LS7kh
 exJk/zv3iV5cu2U+MI8SpF6wjoF/VCRThG9vqFZLAhabSpR4TAbGguxn5lkTEWe0YDcE hA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9a3e886u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 13:25:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MDP8xK006385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 13:25:08 GMT
Received: from [10.216.13.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 06:25:06 -0700
Message-ID: <60aaa1fc-99cf-476c-af51-e5ad425792f9@quicinc.com>
Date: Fri, 22 Sep 2023 18:55:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] wifi: ath11k: send TPC power to firmware for 6
 GHz station
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-14-quic_wgong@quicinc.com>
 <eb08e0f2-c932-4d79-b2ee-813c2999d1a5@quicinc.com>
 <fbad2af6-9c3f-c241-b820-7820b4200bf4@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <fbad2af6-9c3f-c241-b820-7820b4200bf4@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aNl11cgHOBgzZKDwDorLgPEXrr5_wSX3
X-Proofpoint-GUID: aNl11cgHOBgzZKDwDorLgPEXrr5_wSX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_11,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_062513_399328_E1125EDA 
X-CRM114-Status: GOOD (  20.83  )
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

T24gOS8yMi8yMyAxNTo0MiwgV2VuIEdvbmcgd3JvdGU6Cj4gT24gOS8yMi8yMDIzIDU6MjQgUE0s
IEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPj4gT24gOS8yMC8yMyAxMzo1MywgV2VuIEdvbmcg
d3JvdGU6Cj4+PiBXaGVuIHN0YXRpb24gaXMgY29ubmVjdGVkIHRvIGEgNiBHSHogQVAsIGl0IGhh
cyAyIHdheSB0byBjb25maWd1cmUKPj4+IHRoZSBwb3dlciBsaW1pdCB0byBmaXJtd2FyZS4gVGhl
IGZpcnN0IHdheSBpcyB0byBzZW5kIDIgd21pIGNvbW1hbmQKPj4+IFdNSV9QREVWX1BBUkFNX1RY
UE9XRVJfTElNSVQyRy9XTUlfUERFVl9QQVJBTV9UWFBPV0VSX0xJTUlUNUcgdG8KPj4+IGZpcm13
YXJlLCB0aGUgc2Vjb25kIHdheSBpcyB0byBzZW5kIFdNSV9WREVWX1NFVF9UUENfUE9XRVJfQ01E
SUQgdG8KPj4+IGZpcm13YXJlIHdoaWNoIGluY2x1ZGUgbW9yZSBwYXJhbWV0ZXJzIGZvciBwb3dl
ciBjb250cm9sLgo+Pj4KPj4+IFRoZSBmaXJzdCB3YXkgaXMgZGlzYWJsZWQgaW4gcHJldmlvdXMg
cGF0Y2gKPj4+ICJhdGgxMWs6IGRpc2NhcmQgQlNTX0NIQU5HRURfVFhQT1dFUiB3aGVuIEVYVF9U
UENfUkVHX1NVUFBPUlQgZm9yIDYgCj4+PiBHSHoiLgo+Pj4KPj4+IFByZXBhcmUgdGhlIHBhcmFt
ZXRlciBmb3Igd21pIGNvbW1hbmQgV01JX1ZERVZfU0VUX1RQQ19QT1dFUl9DTURJRCBhbmQKPj4+
IHNlbmQgdGhlIGZpcm13YXJlIGFmdGVyIHZkZXYgc3RhcnQgcmVzcG9uc2Ugc3VjY2VzcyBmcm9t
IGZpcm13YXJlLCBpdAo+Pj4gaXMgZm9yIHRoZSBzZWNvbmQgd2F5IG9mIHBvd2VyIGNvbnRyb2wu
Cj4+Pgo+Pj4gVGVzdGVkLW9uOiBXQ042ODU1IGh3Mi4wIFBDSSAKPj4+IFdMQU4uSFNQLjEuMS0w
MzEyNS1RQ0FIU1BTV1BMX1YxX1YyX1NJTElDT05aX0xJVEUtMy42NTEwLjIzCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogV2VuIEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+Cj4+PiAtLS0KPj4+
IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgfCA4ICsrKysrKystCj4+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgCj4+
PiBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMKPj4+IGluZGV4IGE4YWUy
ODFkMjYzNS4uZjhiOTA3YTc1OGIxIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDExay9tYWMuYwo+Pj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDExay9tYWMuYwo+Pj4gQEAgLTcyOTYsNiArNzI5NiwxMiBAQCBhdGgxMWtfbWFjX3ZkZXZfc3Rh
cnRfcmVzdGFydChzdHJ1Y3QgCj4+PiBhdGgxMWtfdmlmICphcnZpZiwKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiDCoCArwqDCoMKgIGlmIChh
dGgxMWtfbWFjX3N1cHBvcnRzX3N0YXRpb25fdHBjKGFyLCBhcnZpZiwgY2hhbmRlZikpIHsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBhdGgxMWtfbWFjX2ZpbGxfcmVnX3RwY19pbmZvKGFyLCBhcnZpZi0+
dmlmLCAmYXJ2aWYtPmNoYW5jdHgpOwo+PiBTbyB3ZSBhcmUgcGFzc2luZyBsb2NhbCBjb3B5IG9m
IGNoYW5uZWwgY29udGV4dCBzdG9yZWQgaW4gCj4+IGFydmlmLT5jaGFuY3R4LiBEbyB3ZSBuZWVk
IHRvIHVwZGF0ZSBpdCB3aGVuIGNoYW5uZWwgY2hhbmdlcz8KPj4KPj4gSSBzZWUgdGhhdCBkdXJp
bmcgYXNzaWdubWVudCB0aW1lLCB3ZSBhcmUgY29weWluZy91cGRhdGluZyBpdCBhbmQgCj4+IGFj
Y29yZGluZ2x5IHRoZSBjb21tYW5kIHdpbGwgYmUgc2VudCB0byBmaXJtd2FyZSwgYnV0IHdoYXQg
YWJvdXQgd2hlbiAKPj4gU1RBIG1vdmVzIGNoYW5uZWw/IGFydmlmLT5jaGFuY3R4IHNob3VsZCBi
ZSB1cGRhdGVkIGFuZCB0cGMgY29tbWFuZCAKPj4gc2hvdWxkIGJlIHNlbnQgYWdhaW4gaW4gdGhh
dCBjYXNlPwo+IAo+IFRoaXMgaGFzIGJlZW4gZGlzY3Vzc2VkIGJlZm9yZSBoZXJlIHBlciBxdWVz
dGlvbiBvZiBKb2hhbm5lczoiQ291bGQgdGhpcyAKPiBpbmZvcm1hdGlvbiBjaGFuZ2U/IFNob3Vs
ZCB3ZSB0cmFjayBpdCBpbiBiZWFjb25zPyI6Cj4gCj4gW1BBVENIIDkvOV0gbWFjODAyMTE6IHNh
dmUgdHJhbnNtaXQgcG93ZXIgZW52ZWxvcGUgZWxlbWVudCBhbmQgcG93ZXIgCj4gY29uc3RyYWlu
dAo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXdpcmVsZXNzLzM4ZTdkOWQyZWVi
YWZhNzI0NWEzNmEwYTAzOTYwOTQ1MjZlYjNlZmQuY2FtZWxAc2lwc29sdXRpb25zLm5ldC8KVGhh
dCdzIGZpbmUuIFRoYXQncyB3LnIudCB0byBUWCBwb3dlciBjaGFuZ2UuIEknbSBzYXlpbmcgaGVy
ZSBhYm91dCBDU0E/IApXaGF0IHdoZW4gQVAgdHJpZXMgdG8gc3dpdGNoIGNoYW5uZWw/IEZvciB0
aGF0IGNsaWVudCBuZWVkIG5vdCAKZGlzYXNzb2NpYXRlIGFuZCBhc3NvY2lhdGUgYmFjayByaWdo
dD8KCkluIHRoYXQgY2FzZSwgY2hhbm5lbCBjb250ZXh0IGluIG1hYzgwMjExIGxheWVyIHdpbGwg
Y2hhbmdlLiBCdXQgb3VyIApkcml2ZXIncyBhcnZpZi0+Y2hhbmN0eCB3aWxsIGhhdmUgcHJldmlv
dXMgb25lIG9ubHkuIFdlIGFyZSB1c2luZyAKY2hhbm5lbCBjb250ZXh0IHRvIGdldCB0aGUgaWVl
ZTgwMjExX2NoYW5uZWwgd2hpY2ggaGFzIHRoZSBQU0QgdmFsdWUsIAphbmQgdGhhdCB2YWx1ZSB3
ZSBhcmUgc2VuZGluZyB0byBmaXJtd2FyZSB2aWEgVFBDIGNvbW1hbmQgZHVyaW5nIGludGlhbCAK
YXNzb2NpYXRpb24gdGltZS4gU28gd2hlbiBjaGFubmVsIGNoYW5nZXMsIGZpcm13YXJlIGFsc28g
c2hvdWxkIGJlIAp1cGRhdGVkIHdpdGggdGhlIGxhdGVzdCBQU0QgdmFsdWVzIHZpYSBUUEMgY29t
bWFuZCBmb3IgdGhlIGxhdGVzdCAKY2hhbm5lbCByaWdodD8KCgoKCi0tIAphdGgxMWsgbWFpbGlu
ZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
