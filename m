Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F07FE7E62E
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x4l8j+HojDWSql6kDeuyKGq3P+GTBd9CtkUsrh3o7U=; b=UkfTK0yTykxOj6KOS4N/5ClWL+
	Nfjp+qAw05Mm5QHYQGs8qpZCgPF26lCXJ1SdMLcOjE0PddWwX97A6y9hJPQkcuejXiX1DkOV5C6RG
	iCacKg3FuTE4/7YlJPoQ+uuvoCUVc5lyKSxGaJwuQWbZdTUOxSjK//bXC2JPDUsSXfp7DGWRMnRay
	1o50+VTmn2A3YA6Khde2sYOsVoIjGDPGHQGzrmH1vutsIpo/goHLPfE2jSLbjURo8cA6mndlb0bIm
	YFJSz798UjizsbeYgZOCAR38mg9CfT32ZUB8gp+vxm/6NQ0rOLOQ+RawtvHwyVf3s+/5SFINzKKrL
	6YuYZULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6tp-00GKoX-2y;
	Tue, 26 Sep 2023 12:10:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6tn-00GKnl-13
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 12:10:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38QB7Hhq014501;
	Tue, 26 Sep 2023 12:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vnnoxD1nBqBb1dEfKfVj/5K191VKsOvYaCL68t+wFZY=;
 b=DjHn0V7xaHoUKg198yJS83qdzz9LSIGAwN/GC6LPKWZYEwVTFhOVBYyCbqhReGgdkYGU
 VGcYTeiZYmmOT/xtUM8OOL84SfnA7q3Ncfsddglwh50OUZ2PlKTVZEX13pIkQLLutD2y
 K27BkEioA/ySYEH/OLkIWy/t1mJDQB2vlgJskYEKaoEIPYT6fDdREcWhGoa8jXdX3fXk
 bUi2hogzQmbPL3J+T8gapmPEn+tjvApGrt6GZqvHKyyGePiGDTo7VW/oCwRnXlQTjc3d
 nLhc4er1P9GcLOkM0iUlSL2QyLl7ezNJVQOUlevnq0hhvRiXS9pGniyoBOnyv/MLPIiR Cg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tbv660e2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 12:10:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38QCAanb027633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 12:10:36 GMT
Received: from [10.216.14.100] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 26 Sep
 2023 05:10:34 -0700
Message-ID: <9e2f39c5-4a58-4be8-a320-da1432287086@quicinc.com>
Date: Tue, 26 Sep 2023 17:40:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCN9074 monitor mode crash
Content-Language: en-US
To: "Lindner, Frank" <Frank.Lindner@ghmt.de>,
        "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
References: <FRYP281MB01607D994228CF144904CDEDEBC3A@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <FRYP281MB01607D994228CF144904CDEDEBC3A@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Dp9eTmpR2Mdxr_OGTzvwXJj8CK_DfSGj
X-Proofpoint-GUID: Dp9eTmpR2Mdxr_OGTzvwXJj8CK_DfSGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_08,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=633 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_051043_369987_4678550B 
X-CRM114-Status: GOOD (  10.78  )
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

T24gOS8yNi8yMyAxNzozMCwgTGluZG5lciwgRnJhbmsgd3JvdGU6Cj4gSGksCj4gCj4gSeKAmW0g
ZmFjaW5nIGlzc3VlcyB3aXRoIFFDTjkwNzQgaW4gbW9uaXRvci1tb2RlLgo+IEFzIHNvb24gYXMg
SSBzd2l0Y2ggdG8gbW9uLW1vZGUgYW5kIHRoZSBmaXJzdCBwYWNrZXQgaXMgcmVjZWl2ZWQsIHRo
ZSBtb2R1bGUva2VybmVsIGNyYXNoZXMuIEl0IGlzIGluZGVwZW5kZW50IG9mIGtlcm5lbC12ZXJz
aW9uLCBJJ3ZlIHRlc3RlZCBmcm9tIDUueCB1cCBsYXRlc3QgKDEgbW9udGggYWdvKSA2LjIuCj4g
Cj4gQW55IGhpbnQgd2hlcmUgdG8gbG9vayBmdXJ0aGVyPwo+IAo+IEJSCj4gRnJhbmsKPiAKPiAK
PiBWb3JzdGFuZHN2b3JzaXR6ZW5kZXI6IERpcGwuLUluZy4gRGlyayBXaWxoZWxtCj4gQXVmc2lj
aHRzcmF0c3ZvcnNpdHplbmRlcjogRHIuLUluZy4gUGV0ZXIgSGFzc2UKPiBIYW5kZWxzcmVnaXN0
ZXI6IEhSQiBTYWFyYnLDvGNrZW4gTnIuIDEzMjAxCj4gVXN0LklEIE5yLjogREUgMTUzODA3NjI3
CgpJcyB5b3VyIGlzc3VlIHNpbWlsYXIgdG8gdGhpcyBvbmUgLQpodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMjExMjkxNDI1MzIuMjM0
MjEtMS1xdWljX25tYXJhbkBxdWljaW5jLmNvbS8gCj8KCgoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
