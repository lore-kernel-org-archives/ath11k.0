Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C441CD4F49
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9C889O8IL+yoHydyFTZbhZ71r+O4bd98uhnEf1Bz3dA=; b=ybE2Qq787aEiof
	/CNsK+nYVlV+9yvinOHa+CsnJo7LR+zUYWomgdPKs1dNLna2GKPofJTppgdxB0sb8yCC/5FBVdhrm
	5exFFwQFhQzJ3TeNznhbWD2dsEvhxxx8MGJW0YJnC4hlYujq4LfsbapVwZ1HCvb6n/7FKJOzmJdeH
	zfXdAagEPY0GjVCYzWIvLpzvTx2as6k4r7VcKFUBae9tPgkVoi/AOC/aHLsZ51ui4bxlglSGXwyXn
	tqgSP9rYmCJqLT+8Cr5j2UKkimQIJG7c91Z1hgjXi8ZkYOmThSjDsbf6bihl0ff9wa4E/tjFI4nwm
	inU5/7C/RoY5K34SiMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjczd-008fUJ-0N;
	Fri, 22 Sep 2023 10:02:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjczZ-008fTa-2b
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 10:02:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M9Atmi009375;
	Fri, 22 Sep 2023 10:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0TnD9f6FxYg7gX07CI55x4QpAZLP9HkdLxSmNetS2us=;
 b=TX9peuJd2ntDIJhkJtFvN5huuNF5yxVVfsM7lC0hPvJ+6r8IQRFAOZi/AZLz/fSm6knS
 NgCsoMYX/C7GI6A5iV2dOeU8xt8k7RWx/5TcbHmTrMLnUmH2ot6C0KDvKPYGatyET6yL
 pvtba9ilwoWtoqKk3/kp7xqnLSBDzh4UR6hA/j0ZI3FOxb73aAN0MGTOjm7nWfwfAYHH
 NUmW4YWxKXBtaj9VLYgA+N0HhwexJ3BopR7fzVR2viMP+rc0A7CsDSwcOXPEEh50gSN8
 dIdEMKu6vDhiDaamhfAq8DOewklphfnjSAe68f1P9KkYgfZWOabsWgKMSmgHdd9Y1aev LA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u0hhhm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 10:02:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MA2PUD029887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 10:02:25 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 03:02:23 -0700
Message-ID: <1f739d62-d5c0-a64b-ef9b-d5fd7b79755e@quicinc.com>
Date: Fri, 22 Sep 2023 18:02:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 05/13] wifi: ath11k: update regulatory rules when
 connect to AP on 6 GHz band for station
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-6-quic_wgong@quicinc.com>
 <5e9439c5-fc02-4a18-8cc8-c76998bfcbc6@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <5e9439c5-fc02-4a18-8cc8-c76998bfcbc6@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WblmAIz8XkOvMWNTHTD8ZOpnw6TteJvH
X-Proofpoint-GUID: WblmAIz8XkOvMWNTHTD8ZOpnw6TteJvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_030233_961861_69FDD730 
X-CRM114-Status: GOOD (  15.49  )
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

T24gOS8yMi8yMDIzIDU6MzkgUE0sIEFkaXR5YSBLdW1hciBTaW5naCB3cm90ZToKPiBPbiA5LzIw
LzIzIDEzOjUzLCBXZW4gR29uZyB3cm90ZToKPgo+PiArwqDCoMKgIGlmIChhdGgxMWtfbWFjX3N1
cHBvcnRzXzZnaHpfY2NfZXh0KGFyKSAmJgo+PiArwqDCoMKgwqDCoMKgwqAgY3R4LT5kZWYuY2hh
bi0+YmFuZCA9PSBOTDgwMjExX0JBTkRfNkdIWiAmJgo+PiArwqDCoMKgwqDCoMKgwqAgYXJ2aWYt
PnZkZXZfdHlwZSA9PSBXTUlfVkRFVl9UWVBFX1NUQSkgewo+PiArwqDCoMKgwqDCoMKgwqAgcmVn
X2luZm8gPSAmYWItPnJlZ19pbmZvX3N0b3JlW2FyLT5wZGV2X2lkeF07Cj4+ICvCoMKgwqDCoMKg
wqDCoCBwb3dlcl90eXBlID0gdmlmLT5ic3NfY29uZi5wb3dlcl90eXBlOwo+PiArwqDCoMKgwqDC
oMKgwqAgYXRoMTFrX2RiZyhhYiwgQVRIMTFLX0RCR19NQUMsICJtYWMgY2hhbmN0eCBwb3dlciB0
eXBlICVkXG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3dlcl90eXBlKTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwb3dlcl90eXBlID09IElFRUU4MDIxMV9SRUdfVU5TRVRf
QVApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBvd2VyX3R5cGUgPSBJRUVFODAyMTFfUkVH
X0xQSV9BUDsKPiBXaHkgaGF2aW5nIF9VTlNFVF8gcG93ZXIgdHlwZSBpbiB2aWYtPmJzc19jb25m
LnBvd2VyX3R5cGUgaXMgZmluZT8gCj4gVHlwaWNhbGx5LCBkdXJpbmcgYXNzb2NpYXRpb24sIHdl
IHdvdWxkIGJlIHNldHRpbmcgdGhpcyBmcm9tIHRoZSAKPiBiZWFjb24vYXNzb2NpYXRpb24gcmVz
cG9uc2UgZnJhbWUncyBIRSA2IEdIeiBPcGVyYXRpb24gSW5mbyBGaWVsZC4gU28gCj4gaXMgaXQg
ZmluZSBpZiB0aGUgZmllbGQgaXMgY2Fycnlpbmcgc29tZSBpbmZvIHdoaWNoIHdlIGRvbid0IGtu
b3cgKG9yIAo+IG1heSBiZSBkb24ndCBzdXBwb3J0IGl0IHlldCk/IFdoeSBhcmUgd2UgbWFza2lu
ZyBpdCB3aXRoIF9MUElfIG1vZGU/Cj4KPiBBbHNvLCBJIHNlZSB0aGF0IGN1cnJlbnRseSBtYWM4
MDIxMSBvbmx5IHNldHMgTFBJIG9yIFNQLiBTbyBsZXQncyBzYXkgCj4gU1RBIGlzIHRyeWluZyB0
byBjb25uZWN0IHRvIFZMUCBBUCwgbWFjODAyMTEgd2lsbCBzZXQgaXQgYXMgX1VOU0VUXy4gCj4g
QW5kIHRoZW4gaGVyZSwgd2Ugd2lsbCBiZSB0cmVhdGluZyBpdCBhcyBMUEkgQVAuIElzIHRoYXQg
ZmluZT8KCkN1cnJlbnRseSBvbmx5IFNQL0xQSSBhcmUgZGVmaW5lZCBpbiAiVGFibGUgRS0xMuKA
lFJlZ3VsYXRvcnkgSW5mbyAKc3ViZmllbGQgZW5jb2RpbmcgaW4gdGhlIFVuaXRlZCBTdGF0ZXMi
IG9mIElFRUUgU3RkIDgwMi4xMWF44oSi4oCQMjAyMS4KClNvIG1heWJlIEkgbmVlZCB0byBzZXQg
cG93ZXJfdHlwZSB0byBWTFAgd2hlbiBpdCBpcyBVTlNFVCBoZXJlLgoKPgo+Cj4KCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
