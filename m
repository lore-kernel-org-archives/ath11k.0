Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D14C4332F
	for <ath11k@archiver.kernel.org>; Wed,  4 Jan 2023 04:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJMQzj21G8H2R6rsrZ6xxzzj5kg12GM3oJP/DqbJ/GI=; b=xxhGhooOnzAcvA
	yMpBaeoFi9RLmjkN4ZExkp+2b/t45/tsrEID8IZLwTVcZoXhORdRatmAtMOW+0POk/T6A5iZT4iC/
	NyEI6Ac2eX2x2Sa/RclYyRGQKlMdcIDX43bb0aczZl0O2twyJkwqXG1pbneAHYeOMOkhUaFjAAJiR
	wfHFS73xwsjckRqbDStlR+9EFnyq3uvI3tOmi9/yX0smJneHA0qnGzFjwdIB1bRMlH8ZsYCVSntIH
	l40FyZ/qjs6mFEUeB/7hWtR6cLzgmUJc+Ecflq6iSzWeP6qyHSfjL8GuNdwd59WcZcC3hjfUFKQIw
	g1TdJeE80PL8joeXuB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCvrf-006tCF-7n; Wed, 04 Jan 2023 04:58:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCvqA-006t25-NS
	for ath11k@lists.infradead.org; Wed, 04 Jan 2023 04:57:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3041OAqv031215;
	Wed, 4 Jan 2023 04:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KRwAMjnpltsWvxcNtrraxKdFNHuaR97XLM81aAxzojw=;
 b=ftcZHasFZsYO7CYoa2exbDPU0LXmgPktN0tYyB9qR23Z9oMja6sHbctfh9hoew15Ykwv
 AKlLN7HPcf0vIZqEjdXiF9PZsnLYDtyE00uqXyXAH2Y8ts/H2cNVOlZSgGgRrjGs/F3W
 IMPUJUomGjY4syFjvGm3n52c+EDE+80TsNQQP5LY/jGLtrIa0YmZFqhdXMnc300t0Enj
 +DIkL34gAUlpQZqjPF9kyJkjK7DmsezbYWnrRaM7IfJq1aW8OikJF2RGWkI/IBATHfrC
 vp8JaCjtPuF0auMVYeS6cF5uGs1t/582Ab7YMPkHvNhjzRFXLF+pIqLa/cXRczXHxhlW Cg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvv90j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 04:57:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3044vKAJ009183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jan 2023 04:57:20 GMT
Received: from [10.201.165.48] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 3 Jan 2023
 20:57:19 -0800
Message-ID: <61261415-b98b-7476-fd55-3141a26d0dd6@quicinc.com>
Date: Wed, 4 Jan 2023 10:26:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] wifi: ath11k: Set ext passive scan flag to adjust passive
 scan start time
Content-Language: en-US
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20221222131720.11368-1-quic_tamizhr@quicinc.com>
 <e11e4312-d373-ba54-6d48-a9c471f78532@quicinc.com>
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
In-Reply-To: <e11e4312-d373-ba54-6d48-a9c471f78532@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iHN3Wh0SyweoBDP85HYxumxN58BqfBXo
X-Proofpoint-GUID: iHN3Wh0SyweoBDP85HYxumxN58BqfBXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_02,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=982
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301040040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_205726_987281_A865A9E6 
X-CRM114-Status: GOOD (  11.01  )
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

T24gMS8yLzIwMjMgMzo0OSBQTSwgVmFzYW50aGFrdW1hciBUaGlhZ2FyYWphbiB3cm90ZToKPiAK
PiAKPiBPbiAxMi8yMi8yMDIyIDY6NDcgUE0sIFRhbWl6aCBDaGVsdmFtIFJhamEgd3JvdGU6Cj4+
IFNldCB0aGUgV01JX1NDQU5fRkxBR19FWFRfUEFTU0lWRV9TQ0FOX1NUQVJUX1RJTUVfRU5IQU5D
RSBmbGFnCj4+IHdoaWxlIHNlbmRpbmcgdGhlIHNjYW4gY29tbWFuZC7CoCBJZiB0aGlzIGZsYWcg
aXMgZW5hYmxlZCB3aGVuIHRoZQo+PiBpbmNvbWluZyBzY2FuIHJlcXVlc3QgY29tZXMgd2l0aCBh
IHN0cmljdCBzdGFydCB0aW1lIGFuZCBpdHMgZHVyYXRpb24KPj4gb3ZlcmxhcHMgd2l0aCBuZXh0
IFRCVFQsIHRoZW4gdGFyZ2V0IGFkanVzdCB0aGUgc3RhcnQgdGltZSBhY2NvcmRpbmdseQo+PiBm
b3IgcGFzc2l2ZSBzY2FuLiBUYXJnZXQgc3VwcG9ydGluZyB0aGlzIGZlYXR1cmUgd2lsbCBhZHZl
cnRpc2UKPj4gV01JX1RMVl9TRVJWSUNFX1BBU1NJVkVfU0NBTl9TVEFSVF9USU1FX0VOSEFOQ0Uu
Cj4+Cj4+IFRlc3RlZC1vbjogSVBRODA3NCBodzIuMCBBSEIgV0xBTi5ISy4yLjQuMC4xLTAxNDY3
LVFDQUhLU1dQTF9TSUxJQ09OWi0xCj4+Cj4gCj4gSWYgdGhpcyBjaGFuZ2UgZml4ZXMgYW55IHVz
ZXIgdmlzaWJsZSBpc3N1ZSwgYmV0dGVyIHRvIGluY2x1ZGUgdGhhdCBkZXRhaWxzLgo+IApUaGVy
ZSBhcmUgbm8gdXNlciB2aXNpYmxlIGlzc3VlcyB3aXRob3V0IHRoaXMgY2hhbmdlLgoKCi0tIApS
ZWdhcmRzLApUYW1pemgKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
