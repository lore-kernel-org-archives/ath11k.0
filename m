Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4EDC4332F
	for <ath11k@archiver.kernel.org>; Mon, 17 Oct 2022 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fE00kDYSId/iY8qJ0ZvC4MciAvDaTKnyiFhHlV3MYVk=; b=BUYIRxBF342apO
	jy3TVuJrWrsNQIbPG6Djxlvkca1VgXxf74XBK6nDP0g1lZDRyezB8qXjcT851n2kGbey4Dpr1qzbM
	iQEwMP4NNRduPhBmGcAXnQzjJf4uGZYiWkndhygBw4Bm562l26R3h1xpalZb2immuG8CzPqTj9hKp
	IyKCL9jG3euJYtmRPDdzKWQiIuyCiqjDfXr8UOlfscPsFpIY51lVy6OB0zztWrzVaUK7kkBiCc1y8
	/3e+LW3nQtzzAvE4+BUNbiLuSYAuH02ReTFtoUJ5fLcbBDSFSHmVHb+41zFPUwkWiZnSrCTKGrm8P
	Bmioij0D+3m7qa2HlXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKGn-008Mzy-RE; Mon, 17 Oct 2022 07:10:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKGj-008Mp1-Ev
	for ath11k@lists.infradead.org; Mon, 17 Oct 2022 07:10:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H77PxL018508;
	Mon, 17 Oct 2022 07:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=BhlGNW953+5Y219pY2aK+nsabIJDn+S+PDNng0R+ELE=;
 b=J1zTMi03xDWuCal5YBeYRUmcn2aOqR6XE662Y+SeVOFCydXLj+m7QeScaWNO/11ZUO59
 52v333rD6/8ULNtHre8UFJiC2CVgxkd+WHKveZ9VAc1OO0W5w+B32vcOMs2Pswe8nOI7
 n2jLL2LJLfSbGKs4XzoOdwylNCD314AePN+mlLwc9IsKfQcan8i4VRWGbPrCO7GI4T4N
 OMMRXpksC9VSyBozxmu7/WRgGjU2l5uzyvx592fFZkl8Ips+McysavenERiA/L0JCZ7J
 okLKsA0NoiKb+5xgojD15HgXdqbfT0uJOBh23OVnmWu04yAzU0f3Q7LiIez0409tmmD1 lA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7kvgbd9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 07:10:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29H7ARGT025132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 07:10:27 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 17 Oct
 2022 00:10:25 -0700
Message-ID: <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
Date: Mon, 17 Oct 2022 15:10:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: wifi: mac80211: mlo rx nss value 0 of wifi
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
In-Reply-To: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5Yqr-mI0_OPkrZmMzcUA1RIEScPzYWJo
X-Proofpoint-GUID: 5Yqr-mI0_OPkrZmMzcUA1RIEScPzYWJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 mlxlogscore=835 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_001037_664649_75A765C5 
X-CRM114-Status: GOOD (  12.36  )
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

SGkgSm9oYW5uZXMsCgpNYXkgSSBnZXQgeW91ciBjb21tZW50IGFib3V0IHRoaXM/CgpPbiA5LzEz
LzIwMjIgMTI6MzcgUE0sIFdlbiBHb25nIHdyb3RlOgo+IEhpIEpvaGFubmVzLAo+Cj4gQ3VycmVu
dGx5IGZvciBNTE8gdGVzdCwgdGhlIG90aGVycyBsaW5rcydzIHJ4X25zcyBvZiBzdHJ1Y3QKPiBp
ZWVlODAyMTFfbGlua19zdGEgaXMgc3RpbGwgdmFsdWUgMCBpbiBpZWVlODAyMTFfc2V0X2Fzc29j
aWF0ZWQoKSwKPiBiZWNhdWUgdGhleSBhcmUgbm90IHBhc3MgaW50byBpZWVlODAyMTFfc3RhX3Nl
dF9yeF9uc3MoKSBpbgo+IG1hYzgwMjExIGV4Y2VwdCB0aGUgZGVmbGluayB3aGljaCBtZWFucyB0
aGUgcHJpbWFyeSBsaW5rIGluCj4gcmF0ZV9jb250cm9sX3JhdGVfaW5pdCgpLiBUaGlzIGxlYWQg
ZHJpdmVyIGdldCBuc3MgPSAwIGZvcgo+IG90aGVyIGxpbmtzLiBXaWxsIHlvdSBmaXggaXQgb3Ig
aXMgaXQgZGVzaWduIGJ5IGRlZmF1bHQ/Cj4KPiBPbmx5IHByaW1hcnkgbGluayBoYXMgdmFsaWQg
cnhfbnNzIHZhbHVlIHdoaWNoIGlzIG5vdCAwIGJ5IGJlbG93IGNhbGwgCj4gc3RhY2suCj4gaWVl
ZTgwMjExX2Fzc29jX3N1Y2Nlc3MoKQo+IMKgwqDCoCAtPnJhdGVfY29udHJvbF9yYXRlX2luaXQo
c3RhKTsKPiDCoMKgIMKgwqDCoMKgIC0+aWVlZTgwMjExX3N0YV9zZXRfcnhfbnNzKCZzdGEtPmRl
ZmxpbmspOwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
