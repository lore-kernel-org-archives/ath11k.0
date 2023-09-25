Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A0DCE7A94
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovDsGeK3FjP9TSVfTSm6VuPbgcWGbtkLlg9xpzvwoaw=; b=wEOpxshct49sMM
	PC3ixRkR1u6Jk+ErsReJTlUPoTgCxhMX6Kp3ojE/QHYMWJZu+7K+OWHEXwuVYMUWZVH9NycRUeb2J
	OKEZam9sndEPjUWFVmBAB3mT5vFae+xzEojumr9AwuY0qJ81+A3HDM8BX8HfKVNk9IoSuMnDxW3La
	TO1uxGHDzRiRitZxJZ+N6vTmAYzEAyln1aWYK/oZtx0YP26Ba03xJuaj1NadSoP8ks1sKiy2bklTA
	xyvwjNsrrOT0OjC8kIHxjkfCP/+QZ/biw/S5OOaLAvv/dS8irqWLwxAKEsgIwMsC9v48mrGNwquqy
	gJ/e8Z6Jb6LxvCW8dvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjHy-00E60R-26;
	Mon, 25 Sep 2023 10:58:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkjHv-00E5yE-2v
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 10:58:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38PAUVhn031234;
	Mon, 25 Sep 2023 10:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UivVDXNChTXUIsXPWXljXgTqRLdkGeTmOqnJP9TR378=;
 b=eYzent5SRuOyO3qng3ST68aOUy0rQBzhfobCJ8o+jgneDLXigRwX2me3sg4mNt1I9fUf
 fKbeDKSGO3I+jZDN9Bb8cKFYUxQmHLE4bRDmF2EixX59+lXlrVar+e2ABwGoSdighdAu
 QoKQoNgAOjjDQBoAT15Jgv2esQ6OeBbYg2LTwE+AztBafFgr2is6aln+UX+pyh/iA4OJ
 1MPKHKwf1ofqH0cBF5nRnfzl0+tCqeAkqZL4I9aMkwdWO2g1qDBAQsHgUn0xybEA/8Ri
 bmBGRdmecEPw3WfWAppNkGIQhcJB9zOAGWqd54MvVfL69o1onG2DBz3xe/vaUF9vvyBh CA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9rddbj67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:58:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38PAvxGw004856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:57:59 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 25 Sep
 2023 03:57:57 -0700
Message-ID: <fc02a441-bad9-6fba-bde8-dabd01d5ee18@quicinc.com>
Date: Mon, 25 Sep 2023 18:57:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 05/13] wifi: ath11k: update regulatory rules when
 connect to AP on 6 GHz band for station
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-6-quic_wgong@quicinc.com>
 <5e9439c5-fc02-4a18-8cc8-c76998bfcbc6@quicinc.com>
 <1f739d62-d5c0-a64b-ef9b-d5fd7b79755e@quicinc.com>
 <47e2ce79-2885-489c-b567-fdbcb120d056@quicinc.com>
 <2aae986b-1d16-3b75-d2c9-a740f6817650@quicinc.com>
 <5f95f931-e75f-459b-a7c7-b175ba12f981@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <5f95f931-e75f-459b-a7c7-b175ba12f981@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MqLJatQSC28JHKi562Q0MLkM8IWeRTEH
X-Proofpoint-ORIG-GUID: MqLJatQSC28JHKi562Q0MLkM8IWeRTEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_08,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309250081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_035804_081603_74847D21 
X-CRM114-Status: GOOD (  21.51  )
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

T24gOS8yNS8yMDIzIDY6NTIgUE0sIEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPiBPbiA5LzI1
LzIzIDE2OjEzLCBXZW4gR29uZyB3cm90ZToKPj4gT24gOS8yMi8yMDIzIDk6MTggUE0sIEFkaXR5
YSBLdW1hciBTaW5naCB3cm90ZToKPj4+IE9uIDkvMjIvMjMgMTU6MzIsIFdlbiBHb25nIHdyb3Rl
Ogo+Pj4+IE9uIDkvMjIvMjAyMyA1OjM5IFBNLCBBZGl0eWEgS3VtYXIgU2luZ2ggd3JvdGU6Cj4+
Pj4+IE9uIDkvMjAvMjMgMTM6NTMsIFdlbiBHb25nIHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gK8KgwqDC
oCBpZiAoYXRoMTFrX21hY19zdXBwb3J0c182Z2h6X2NjX2V4dChhcikgJiYKPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBjdHgtPmRlZi5jaGFuLT5iYW5kID09IE5MODAyMTFfQkFORF82R0haICYmCj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXJ2aWYtPnZkZXZfdHlwZSA9PSBXTUlfVkRFVl9UWVBFX1NU
QSkgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJlZ19pbmZvID0gJmFiLT5yZWdfaW5mb19zdG9y
ZVthci0+cGRldl9pZHhdOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHBvd2VyX3R5cGUgPSB2aWYt
PmJzc19jb25mLnBvd2VyX3R5cGU7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXRoMTFrX2RiZyhh
YiwgQVRIMTFLX0RCR19NQUMsICJtYWMgY2hhbmN0eCBwb3dlciB0eXBlIAo+Pj4+Pj4gJWRcbiIs
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3dlcl90eXBlKTsKPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAocG93ZXJfdHlwZSA9PSBJRUVFODAyMTFfUkVHX1VOU0VUX0FQ
KQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG93ZXJfdHlwZSA9IElFRUU4MDIxMV9S
RUdfTFBJX0FQOwo+Pj4+PiBXaHkgaGF2aW5nIF9VTlNFVF8gcG93ZXIgdHlwZSBpbiB2aWYtPmJz
c19jb25mLnBvd2VyX3R5cGUgaXMgZmluZT8gCj4+Pj4+IFR5cGljYWxseSwgZHVyaW5nIGFzc29j
aWF0aW9uLCB3ZSB3b3VsZCBiZSBzZXR0aW5nIHRoaXMgZnJvbSB0aGUgCj4+Pj4+IGJlYWNvbi9h
c3NvY2lhdGlvbiByZXNwb25zZSBmcmFtZSdzIEhFIDYgR0h6IE9wZXJhdGlvbiBJbmZvIEZpZWxk
LiAKPj4+Pj4gU28gaXMgaXQgZmluZSBpZiB0aGUgZmllbGQgaXMgY2Fycnlpbmcgc29tZSBpbmZv
IHdoaWNoIHdlIGRvbid0IAo+Pj4+PiBrbm93IChvciBtYXkgYmUgZG9uJ3Qgc3VwcG9ydCBpdCB5
ZXQpPyBXaHkgYXJlIHdlIG1hc2tpbmcgaXQgd2l0aCAKPj4+Pj4gX0xQSV8gbW9kZT8KPj4+Pj4K
Pj4+Pj4gQWxzbywgSSBzZWUgdGhhdCBjdXJyZW50bHkgbWFjODAyMTEgb25seSBzZXRzIExQSSBv
ciBTUC4gU28gbGV0J3MgCj4+Pj4+IHNheSBTVEEgaXMgdHJ5aW5nIHRvIGNvbm5lY3QgdG8gVkxQ
IEFQLCBtYWM4MDIxMSB3aWxsIHNldCBpdCBhcyAKPj4+Pj4gX1VOU0VUXy4gQW5kIHRoZW4gaGVy
ZSwgd2Ugd2lsbCBiZSB0cmVhdGluZyBpdCBhcyBMUEkgQVAuIElzIHRoYXQgCj4+Pj4+IGZpbmU/
Cj4+Pj4KPj4+PiBDdXJyZW50bHkgb25seSBTUC9MUEkgYXJlIGRlZmluZWQgaW4gIlRhYmxlIEUt
MTLigJRSZWd1bGF0b3J5IEluZm8gCj4+Pj4gc3ViZmllbGQgZW5jb2RpbmcgaW4gdGhlIFVuaXRl
ZCBTdGF0ZXMiIG9mIElFRUUgU3RkIDgwMi4xMWF44oSi4oCQMjAyMS4KPj4+Pgo+Pj4+IFNvIG1h
eWJlIEkgbmVlZCB0byBzZXQgcG93ZXJfdHlwZSB0byBWTFAgd2hlbiBpdCBpcyBVTlNFVCBoZXJl
Lgo+Pj4gWWVhaCwgb3IgbWF5IGJlIGRlbnkgYXNzb2NpYXRpb24gaWYgd2UgZG9uJ3Qgc3VwcG9y
dCB0aGF0IG1vZGU/IEkgCj4+PiB3b3VsZCBsZXQgb3RoZXJzIGNvbW1lbnQgb24gdGhpcy4KPj4g
RG8geW91IGtub3cgaG93IHRvIGNoZWNrIHdoaWNoIG1vZGUgc3VwcG9ydCBieSBhdGgxMWs/Cj4g
SU1ITyB3ZSBzaG91bGQgbm90IG1haW50YWluIHR3byBkaWZmZXJlbnQgc3VwcG9ydGVkIG1vZGVz
LCBvbmUgaW4gCj4gZHJpdmVyIGFuZCBhbm90aGVyIGluIG1hYzgwMjExLiBJIG1lYW4gdy5yLnQg
bWFjODAyMTEgd2Ugc2hvdWxkIHRyeSB0byAKPiBtYXRjaCBpdCBhcyBmYXIgYXMgcG9zc2libGUu
IEluIHRoaXMgY2FzZSwgd2UgY2FuIHJldHVybiBlcnJvciBmcm9tIAo+IG1hYzgwMjExIGl0c2Vs
ZiB3aGVuIGEgbm9uLXN1cHBvcnRlZCBtb2RlIChhcyBpbiBWTFApIGlzIHRyeWluZyB0byAKPiBh
c3NvY2lhdGU/IFNpbmNlIGFzIHlvdSBoYXZlIHF1b3RlZCwgVkxQIGlzIG5vdCB5ZXQgZGVmaW5l
ZCBpbiBzcGVjIAo+IElFRUUgU3RkIDgwMi4xMWF44oCQMjAyMSBzbyB3aHkgdG8gbWFzayB0aGUg
bW9kZSBhbmQgY29udGludWUgaW4gCj4gbWFjODAyMTEgaXRzZWxmPwo+Cj4gSWYgd2UgZG8gbGlr
ZSB0aGlzLCB0aGVuIG1hYzgwMjExIHdpbGwgbm90IHNpbXBseSBzZXQgX1VOU0VUXyBmb3IgNiAK
PiBHSHogY2xpZW50IGludGVyZmFjZSBhbmQgaW4gZHJpdmVyIGlmIHdlIHNlZSBpdHMgc3RpbGwg
X1VOU0VUXyB0aGVuIHdlIAo+IGNhbiBiZSBzdXJlIHRoYXQgc29tZXRoaW5nIGhhcyBnb25lIHdy
b25nIGFuZCB3ZSBjYW4gdGFrZSBzdGVwcyAKPiBhY2NvcmRpbmdseS4KWWVzLCBJIHdpbGwgY2hh
bmdlIHRvIHJldHVybiBmYWlsIGZvciBfVU5TRVRfLgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QK
YXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMWsK
