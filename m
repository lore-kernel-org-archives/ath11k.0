Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB46AE7D0A6
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhzM7DYBtA5pmDM8w4Dc9SQl5TG0424jrzhYq4hYTDA=; b=iBofeYPznHshrX
	yd8qxxw8WzNJNlKHNMvYr155F2qxO5xmOydVC9mWPQEWm1bTFN4l4FEuKT2E6ltwriizk8YRRoTRl
	IPnjsOjTQBrQ8vp5jqqiHk+IcivAp805hkiP9UNtnpI6AFxlSx7a4zwXaulkph0qpKb3DviNva5fy
	bESwPpGaH6OkmTgrErRYyCZakzQsT7xb3s9b1C8iQHlLfe/vE7sj/wZ6Tuh8ldg/LcPdLS0PbATLc
	q7NYGENaCL3D4RgJKJNud3hTTO9NBZsK9F1W03JQbqUStKlRVrV7cmADxgZr2NEWt/TJXmMflYdVI
	yNh0+MNy8ubGf7ntPcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPuG-0072bl-28;
	Thu, 21 Sep 2023 20:04:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPuD-0072aA-2f
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:04:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LIIpCd028747;
	Thu, 21 Sep 2023 20:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=U9E1Zf/ACOZ/XWrmzMsS/3gS8ERNfOBV3Kb7Y9oVPHE=;
 b=ipZYEXr6FJ4tOXbtsVZDkm8xahEPyLqU7e2cA5lrbi383Bvx0vuAaP1CaznuEOqM5oU9
 8D+hagDH8+RJlXjnRBlwOXAZ7HR/qepbpjZD8nERcsq/YV3dS/3Q/bVuv0u/JwWUf/7o
 LT9eQ7kvGm7PFibKiNYLJ2ywNxyO1nmDBlHYJe1WxENz2XANhWW9JtTM9tRbfUItwi7y
 9GIF804FyVoPtl0yojpv6kamVDojOvggmF5OPMkiH4XbW31zryaQDt6B9fNPUom9FWP0
 9Jv4Aj2Th2o2Ys/XniB4jOKbBZ8dCp/rquyeXL5BuHrf4VjeZ8iJzeQy0WaAc5nt4MCd Kg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u0hg6ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:04:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LK44nl011039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:04:04 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:04:03 -0700
Message-ID: <2dd83f9f-2e40-4dce-aef0-be0c4fb55c6e@quicinc.com>
Date: Thu, 21 Sep 2023 13:04:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] wifi: ath11k: add parse of transmit power
 envelope element
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-8-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-8-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CoZMXs0l93P5BokFCBhHa_VlMren5LtD
X-Proofpoint-GUID: CoZMXs0l93P5BokFCBhHa_VlMren5LtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=500 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_130409_983380_905C2D24 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

T24gOS8yMC8yMDIzIDE6MjMgQU0sIFdlbiBHb25nIHdyb3RlOgo+IFRoZSB0cmFuc21pdCBwb3dl
ciBlbnZlbG9wZSBlbGVtZW50IGhhcyBzb21lIGZpZWxkcyBmb3IgcG93ZXIsIGF0aDExawo+IHNo
b3VsZCBwYXJzZSBpdCBhY2NvcmRpbmcgdG8gSUVFRSBTdGQgODAyLjExYXjihKLigJAyMDIxLgo+
IAo+IFRlc3RlZC1vbjogV0NONjg1NSBodzIuMCBQQ0kgV0xBTi5IU1AuMS4xLTAzMTI1LVFDQUhT
UFNXUExfVjFfVjJfU0lMSUNPTlpfTElURS0zLjY1MTAuMjMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBX
ZW4gR29uZyA8cXVpY193Z29uZ0BxdWljaW5jLmNvbT4KQWNrZWQtYnk6IEplZmYgSm9obnNvbiA8
cXVpY19qam9obnNvbkBxdWljaW5jLmNvbT4KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgx
MWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDExawo=
