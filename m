Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06081E7C4EC
	for <ath11k@archiver.kernel.org>; Wed,  4 Oct 2023 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3iAH9clMEQlMwhmRTh45hDiUjiVOSuZx+iBKbBAmuLM=; b=pjji4A64/NBvaN
	IP1SdlOgeYfH4a7/ha+HFVUALgvOGaz6NaDM6NNrrjxLDLj3iMqSM+Lhywk28nauq0FuGo2jvuRfl
	z1H9Z4WY51EO5k3dK54f7u86S4jhOkKJiYDzirXKBUaBQjdi/vkI3SpQUc9TeujLNMrkOh2UvDEo/
	RVPaP73excG9b1/DwY/L8gNVcHmoteW/dT20xeaa20ivyLS9B69TOf4Z5opKqAFBHodDOstnSVDVu
	+SziLrAZJGP5r1hwo73oYrMtehuCni4u1gWWY4BCMdXKcx19g/BHp5etZXxEMSUumpyPnbjoLTafW
	NgT950KDpoRZgE12rWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6rt-000imR-2B;
	Wed, 04 Oct 2023 18:45:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6rq-000ilq-16
	for ath11k@lists.infradead.org;
	Wed, 04 Oct 2023 18:45:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394IdVbr012575;
	Wed, 4 Oct 2023 18:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=13wkz53jc/Vr3MPbZdp9C2xXm7HBK++7QkZVMb7s9TU=;
 b=Nf8K0KnYT/y/GBQ59flddmKeLbH7tyZg2igQHenkOEKm1yDjX1wd+9kiU+MR3I+xuysy
 vLjOwexG11BVxm8T2Xs2PEHCUBqlrm/1RzPAF9iuklXSdXSvgQg3Dygbom5dth5vx+w5
 thl9IfzLwQifqxVJ4uq18M8d906JLNsRIZ2zo40lCkl1wt04cQMOugUVF8UhBddcwzFs
 IZgyRdQzysuaJNhIeFWm3HZC6U0FmmcbYyvWMFR5SI9V5pIr/CcEU+pSo41ISqC8wyLq
 szNTbVcr1nvYCTvSjje/TYgQARf9uJTNoBfHLIIDwmrxZElnrY1viD7v8rvYnoim2MP3 9w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tgr9mjt0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 18:45:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 394Ij4bx004068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 18:45:04 GMT
Received: from [10.111.179.185] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 4 Oct
 2023 11:45:03 -0700
Message-ID: <be9ca925-4ae5-424f-a9cb-6a0ef57ad2d0@quicinc.com>
Date: Wed, 4 Oct 2023 11:45:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: add parsing of phy bitmap for reg rules
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231004092655.25020-1-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231004092655.25020-1-quic_adisi@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rtyCuZkrvgHC7txkb6FigFK1mRAKpCRQ
X-Proofpoint-ORIG-GUID: rtyCuZkrvgHC7txkb6FigFK1mRAKpCRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_114506_494226_EBF31E46 
X-CRM114-Status: GOOD (  12.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/4/2023 2:26 AM, Aditya Kumar Singh wrote:
> Certain regulatory domains could put restrictions on phy mode operation.
> For example, in a few countries HE Operation is not allowed. For such
> countries, firmware indicates this via phy bitmap in each reg rule.
> 
> Currently, there is no logic to parse this info and then pass it on to the
> cfg80211/regulatory.
> 
> Add parsing of this phy bitmap from the regulatory channel change event and
> then accordingly map it to cfg80211/regulatory flags and pass it on to it.
> 
> While at it, correct typo in debug print s/dsf/dfs.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
