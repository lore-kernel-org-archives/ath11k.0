Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DBFC197A0
	for <ath11k@archiver.kernel.org>; Fri, 17 Nov 2023 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JNJcoVUe4aV6pKqxPdHkHwF8IvcKFqqEgS4boAzr4o=; b=SCTm8nEEyz3qq2
	f4jtNRXZ3c2806MOQ9tYDGfYqerUe56j48ru1wiooTlen1QoRFmOlPg0l+NDxpE78U5rX6Kk9N/w/
	z0mRJB9VQFe90nqjhonoiTwWkuTD/FKw+Xb8vKyACElNFqcEaxbYGIdXVsw4QlPg20ji7fKSJ6DWZ
	n2qtMCvPHFUSFOzH+cCavgz+8+CKHtzrOuZg2e3BBq6QO53ETtIidso5rfquEqdACgdtgnJoaFLfY
	GbxJCutoeqNqaEFIZISg5OXZSralREUC/pc/aCYGC158QoiyAhHF06h9EBhRy7HbBOXEdvEGtO4a1
	i7Dnuab/mxBEKZP2ObWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r42Z3-0070zm-0W;
	Fri, 17 Nov 2023 17:23:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r42Z0-0070zL-0s
	for ath11k@lists.infradead.org;
	Fri, 17 Nov 2023 17:23:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AHBxaSw031874;
	Fri, 17 Nov 2023 17:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OOs0J4hfvKI2bT13KzEGG3NF4a93twa4+FvtyJ2hsAE=;
 b=cjhPSz8GZO0AZn7BJTobLhperN3PuN2GfecKot8bYLBO3x1XUSO/DCMsMASrVkNJL1wd
 MZQ0cQAOo9a8W91ol+nfurY1Ls2tNdcxLxn+Y/SP4L+sJkZ5J/RqE7aiUwv4f8I55rQS
 3fAF5ZrFKGw+GFh7fW7N+Agm0bWP2eKZFqY6/ffWbm7Fzoezw/o/B+BKR3b69n7OhvJx
 uwnH8sprpAd69OHlk1TR3cSpmA2PM06mQR89oFOquNEE8I88sSgjECSi/+OTS5K2ONec
 ikYQ72f5iAmhR22eKitxx8R+vZngG3oWDCCJpKtTMp82m7ZoiS2h6EtdI+3B8bbzuC8n nA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue6vars6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 17:23:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHHNNAW025028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 17:23:23 GMT
Received: from [10.110.1.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 17 Nov
 2023 09:23:23 -0800
Message-ID: <fdc9b3b2-fe54-41ae-9886-614fc88f6861@quicinc.com>
Date: Fri, 17 Nov 2023 09:23:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wifi-next 1/6] wifi: ath11k: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Kalle
 Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <kernel@pengutronix.de>
References: <20231117093056.873834-8-u.kleine-koenig@pengutronix.de>
 <20231117093056.873834-9-u.kleine-koenig@pengutronix.de>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231117093056.873834-9-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tZD3HYRhyXhiBNBblhCYYcuxoluvpThC
X-Proofpoint-ORIG-GUID: tZD3HYRhyXhiBNBblhCYYcuxoluvpThC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_15,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=980 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_092330_452598_6538554D 
X-CRM114-Status: GOOD (  14.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMTEvMTcvMjAyMyAxOjMwIEFNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcwo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJs
ZSB0byBkbyBlcnJvciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dl
dmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydAo+IGZyb20gZW1pdHRpbmcg
YSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4K
PiAKPiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuCj4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBh
bGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvCj4gLnJlbW92ZV9uZXcoKSwgd2hpY2ggYWxyZWFk
eSByZXR1cm5zIHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMKPiBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCj4gCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+CkFja2VkLWJ5OiBKZWZmIEpvaG5zb24gPHF1aWNfampvaG5zb25AcXVpY2luYy5j
b20+CgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
