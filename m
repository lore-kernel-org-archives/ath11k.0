Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523EFCA1005
	for <ath11k@archiver.kernel.org>; Fri, 30 Aug 2024 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sImSkeVueTgwZdggCrB1NZaYobr3QQ/PyuKf/vHJWuo=; b=48ThJfBoHPjJTeSOAxGHRkWVyf
	VIA3t3Gs6pqNnGvyvVY/E/EYvRfSj4j9zWDM77NQ66EUWJ1b+zJ5ykIP7tZgPXLBfm9Sbi4X+g3L0
	MoTUzFxjRQnQ9WuZfNbwYpBIdj57DCagnQz2kunHnb+5nd4ZO3dygy64wej13hK4sBIL8sa9lVnA5
	+wWE0fQj0GbmV1VBAMV7J7u9hNwqS7mNeonxKRMcyyyjR8QR79YQ6WRkPzczz8XHRTTXG0+Z6WApZ
	8+oDDRhKhiq/wRLjUJ9KM5tGZxjjd3TEwIqlsVym9Bj+dhm0uXJPeZZJju8d4yyz1H7t3TG8M0Vcp
	KaOeptiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk41j-00000006vIg-49ut;
	Fri, 30 Aug 2024 15:59:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk3yi-00000006uDt-2Tgy
	for ath11k@lists.infradead.org;
	Fri, 30 Aug 2024 15:56:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UANtrq026847;
	Fri, 30 Aug 2024 15:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sImSkeVueTgwZdggCrB1NZaYobr3QQ/PyuKf/vHJWuo=; b=A1xgzGDyKzgRqmk3
	S8GFAxUoPdW54sk0kHYKDMCVrMTLXwmlVLtjbxoOhOA4DwWBMiiIqrISaOSIOOry
	mRO2lMsx0pNqX5GfpFgxIJ631V7q9c84m/oNFWo15qgGgNvC51pT1Shhgd9PAxiw
	n1ItwtaQrrFw2MRUB0MJiSieiUsjm6RLl4QKno8+dZIYDsBUQm1ZzjTqIbazjLbj
	+nCT9MIp1k/ytfxFbu/gd06AWdgK+q09witawm3GfprgSZjvCXYgXDigZwQgfb6Q
	/cqJHGxZwqbTFyVOb42NfD6u3sNLIkjGbFkR+sqnTaa/qtOxpFe1KZFy94pMtitj
	56eufA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41arax4cgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 15:55:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UFtwAI004774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 15:55:58 GMT
Received: from [10.111.180.95] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 08:55:57 -0700
Message-ID: <8c764643-5af0-4752-acec-9ae23ea33171@quicinc.com>
Date: Fri, 30 Aug 2024 08:55:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 1/2] Revert "wifi: ath11k: restore country
 code during resume"
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240830073420.5790-1-quic_bqiang@quicinc.com>
 <20240830073420.5790-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240830073420.5790-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sNxIhQCohVUxG9y8jPnBj7A9YGX6r4Xk
X-Proofpoint-GUID: sNxIhQCohVUxG9y8jPnBj7A9YGX6r4Xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=902 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_085600_845948_FA15EB71 
X-CRM114-Status: UNSURE (   8.09  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 8/30/2024 12:34 AM, Baochen Qiang wrote:
> This reverts commit 7f0343b7b8710436c1e6355c71782d32ada47e0c.
> 
> We are going to revert commit 166a490f59ac ("wifi: ath11k: support hibernation"), on
> which this commit depends. With that commit reverted, this one is not needed any
> more, so revert this commit first.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



