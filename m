Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1955ACE7A81
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 10:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0di4DZ3gLbw5dcq9LU4MX70MtG2UlEANjLtslKj/8k=; b=A/zZmUFt4S4ZmY
	3b8Zed71e4Z7U8h5xdT6Xw1EkOJwADpG40iGBtiQLS45gD3syoKJx2bv2xfDJSL+2eMiOVH+PJCPo
	CHMXC3SeFzJaoNbaG2KbYHzWXTwKLnmkApbQZ8Pt9vHibiHFIrVNbTB4ql0xsefC1o6BPnK1mOLHv
	JM9FIxaOxlg29WSgC1ZOOUVLuAg2fasj0Lh9KKv7wjQharkJLmaNJ9yfLWbzmPplU7m4YBLm86iZH
	2bJto7HlcXPoauJc1LdvWe4uaRD5P7FvDiEyQ0oCxZa7NV5HFSZ+StZ2iK+7PVmwrxsFpB2tEJuxT
	VOZ7eYOM39iU1qOtb4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkj3e-00Dzpr-2U;
	Mon, 25 Sep 2023 10:43:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkj3b-00DzpG-0O
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 10:43:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38P9Oiwb028120;
	Mon, 25 Sep 2023 10:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OUoEKTmMxCx+vq623ICuvH1JQjknRMxyE0mOmxlcN40=;
 b=YWJK5eiXz5b4YEujnaTMMXzjWSx1bI0c3H8GpOcs7j7KLCtOA2phyQWMzaaGAzNiOmUq
 5QitnkY4ph5hIWn78xdK+FOPb09ZxJ7icG+GcYFshUq7HuBEVc3qmnbLuDsEgcIom2gi
 9vtNCpMwa8e1UKX9xIYCx1+XAtgGkYmim8yvV+PBIXcTdfKDYdpHUpKVp54jfC2U9X5i
 NEy/fSPC8lHAlZO+kS7aAFxP1jOCdFnSIJhrJ0FMStG+QNiDdcCCXL2YK4+bCK/i/jxy
 bhgGJOD07qx5ZNxk++lIXHQcuSwRcRagYXgpInHl8lepyHkZTAAABXEDBdx537CGGVFS ng== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tb3hfrwjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:43:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38PAh9CU005745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:43:09 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 25 Sep
 2023 03:43:06 -0700
Message-ID: <2aae986b-1d16-3b75-d2c9-a740f6817650@quicinc.com>
Date: Mon, 25 Sep 2023 18:43:03 +0800
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
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <47e2ce79-2885-489c-b567-fdbcb120d056@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WptxZKIoz6kQ0QIGK4y_brGWcPRKO1zU
X-Proofpoint-ORIG-GUID: WptxZKIoz6kQ0QIGK4y_brGWcPRKO1zU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309250078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_034315_169009_F231A0B1 
X-CRM114-Status: GOOD (  14.48  )
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

T24gOS8yMi8yMDIzIDk6MTggUE0sIEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPiBPbiA5LzIy
LzIzIDE1OjMyLCBXZW4gR29uZyB3cm90ZToKPj4gT24gOS8yMi8yMDIzIDU6MzkgUE0sIEFkaXR5
YSBLdW1hciBTaW5naCB3cm90ZToKPj4+IE9uIDkvMjAvMjMgMTM6NTMsIFdlbiBHb25nIHdyb3Rl
Ogo+Pj4KPj4+PiArwqDCoMKgIGlmIChhdGgxMWtfbWFjX3N1cHBvcnRzXzZnaHpfY2NfZXh0KGFy
KSAmJgo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjdHgtPmRlZi5jaGFuLT5iYW5kID09IE5MODAyMTFf
QkFORF82R0haICYmCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFydmlmLT52ZGV2X3R5cGUgPT0gV01J
X1ZERVZfVFlQRV9TVEEpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmVnX2luZm8gPSAmYWItPnJl
Z19pbmZvX3N0b3JlW2FyLT5wZGV2X2lkeF07Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHBvd2VyX3R5
cGUgPSB2aWYtPmJzc19jb25mLnBvd2VyX3R5cGU7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF0aDEx
a19kYmcoYWIsIEFUSDExS19EQkdfTUFDLCAibWFjIGNoYW5jdHggcG93ZXIgdHlwZSAlZFxuIiwK
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3dlcl90eXBlKTsKPj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKHBvd2VyX3R5cGUgPT0gSUVFRTgwMjExX1JFR19VTlNFVF9BUCkKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3dlcl90eXBlID0gSUVFRTgwMjExX1JFR19MUElf
QVA7Cj4+PiBXaHkgaGF2aW5nIF9VTlNFVF8gcG93ZXIgdHlwZSBpbiB2aWYtPmJzc19jb25mLnBv
d2VyX3R5cGUgaXMgZmluZT8gCj4+PiBUeXBpY2FsbHksIGR1cmluZyBhc3NvY2lhdGlvbiwgd2Ug
d291bGQgYmUgc2V0dGluZyB0aGlzIGZyb20gdGhlIAo+Pj4gYmVhY29uL2Fzc29jaWF0aW9uIHJl
c3BvbnNlIGZyYW1lJ3MgSEUgNiBHSHogT3BlcmF0aW9uIEluZm8gRmllbGQuIAo+Pj4gU28gaXMg
aXQgZmluZSBpZiB0aGUgZmllbGQgaXMgY2Fycnlpbmcgc29tZSBpbmZvIHdoaWNoIHdlIGRvbid0
IGtub3cgCj4+PiAob3IgbWF5IGJlIGRvbid0IHN1cHBvcnQgaXQgeWV0KT8gV2h5IGFyZSB3ZSBt
YXNraW5nIGl0IHdpdGggX0xQSV8gCj4+PiBtb2RlPwo+Pj4KPj4+IEFsc28sIEkgc2VlIHRoYXQg
Y3VycmVudGx5IG1hYzgwMjExIG9ubHkgc2V0cyBMUEkgb3IgU1AuIFNvIGxldCdzIAo+Pj4gc2F5
IFNUQSBpcyB0cnlpbmcgdG8gY29ubmVjdCB0byBWTFAgQVAsIG1hYzgwMjExIHdpbGwgc2V0IGl0
IGFzIAo+Pj4gX1VOU0VUXy4gQW5kIHRoZW4gaGVyZSwgd2Ugd2lsbCBiZSB0cmVhdGluZyBpdCBh
cyBMUEkgQVAuIElzIHRoYXQgZmluZT8KPj4KPj4gQ3VycmVudGx5IG9ubHkgU1AvTFBJIGFyZSBk
ZWZpbmVkIGluICJUYWJsZSBFLTEy4oCUUmVndWxhdG9yeSBJbmZvIAo+PiBzdWJmaWVsZCBlbmNv
ZGluZyBpbiB0aGUgVW5pdGVkIFN0YXRlcyIgb2YgSUVFRSBTdGQgODAyLjExYXjihKLigJAyMDIx
Lgo+Pgo+PiBTbyBtYXliZSBJIG5lZWQgdG8gc2V0IHBvd2VyX3R5cGUgdG8gVkxQIHdoZW4gaXQg
aXMgVU5TRVQgaGVyZS4KPiBZZWFoLCBvciBtYXkgYmUgZGVueSBhc3NvY2lhdGlvbiBpZiB3ZSBk
b24ndCBzdXBwb3J0IHRoYXQgbW9kZT8gSSAKPiB3b3VsZCBsZXQgb3RoZXJzIGNvbW1lbnQgb24g
dGhpcy4KRG8geW91IGtub3cgaG93IHRvIGNoZWNrIHdoaWNoIG1vZGUgc3VwcG9ydCBieSBhdGgx
MWs/CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
