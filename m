Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A28EC6FD1D
	for <ath11k@archiver.kernel.org>; Wed, 15 Mar 2023 06:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH2pUFUqj4XV+fTYil9xIY9+H+qZztTZwhWH063UOJU=; b=hZOgxKRRvYRFeuSAf/619vImW/
	+fx170etIfx2wKNAW4XvI+vutxE4Y+h7k2hN5N8mXDfbLzHifi+aFzjK4bESPNDYQB7CNmVpa3lEJ
	6kaVHsbZ12pcJXzPhelQLy3UqJFbLunG84knlueaeFhaMVVB9OU0zap7677ZKjcsecmA5gGFMRZhN
	hHhu2nmmGUWbKs3KKsRmKRmSr8HTi7XcYmILmEkXZL1Sr6asq496RlY4wRZEeTWS76s2KZHQyLIWx
	q+9Xhj9iPnpQNo6j/LEDoI+6aeQZO3l88tKQynuVP1RHe4yQik26IRQ8+3Zs3HJw8QOlbtL77ecqM
	uM5CyZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKPD-00CUfF-17;
	Wed, 15 Mar 2023 06:14:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKP9-00CUef-1N
	for ath11k@lists.infradead.org;
	Wed, 15 Mar 2023 06:14:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F2NDDs028444
	for <ath11k@lists.infradead.org>; Wed, 15 Mar 2023 06:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0/1Z2/E4DeSnNkvvcigzIW9vUmEsdTY9hMQX05QjlbU=;
 b=H+eLIvB4H3vPH2gUbkraeBJWFNLr8TmvE/xszpM/yh/v9pMyXZWJBmU9QQKDfAQvR8xa
 kaDtYObwgo5dGgR+fJZCT8t9lgKDvnkj+lUSaT6G6m2SUk/fwywbJCCUvv43LASQQ4un
 jSETFte0U//c+1+xPl0xc1CScTg+dWqJZAe3QbpDgIePO7LpL2FYQAWixbZ9LveDAOgV
 byQjdyRu8V8VM0KHGe4kS6/+j3EILcMXrmZyQni4WmyO8SFOqIv1fw/hr9UqSsB+EMuH
 a8drwAai2oJjhsNC4INtpvVHPupDsj/tuXNkmrlXAwphrlXEzqtfgibo//0h9RJyitE7 kA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pb2c88qd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 15 Mar 2023 06:14:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32F6EGKM018113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 15 Mar 2023 06:14:16 GMT
Received: from [10.252.219.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 14 Mar
 2023 23:14:15 -0700
Message-ID: <ec11f8c6-239e-e8aa-7502-31ad2a3ba22e@quicinc.com>
Date: Wed, 15 Mar 2023 11:44:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/2] wifi: ath11k: Add coredump support
Content-Language: en-US
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        <quic_kvalo@quicinc.com>
References: <20230315060740.21503-1-quic_mpubbise@quicinc.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <20230315060740.21503-1-quic_mpubbise@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yZW8i-EN2LESGnOzl9gPrptML5trh8DP
X-Proofpoint-ORIG-GUID: yZW8i-EN2LESGnOzl9gPrptML5trh8DP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_02,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_231431_517884_594029BF 
X-CRM114-Status: GOOD (  20.28  )
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

Hi Kalle,

Jeff & Vasanth have reviewed the changes technically.
Could you please help review the series?

Thanks,
Manikanta

On 3/15/2023 11:37 AM, Manikanta Pubbisetty wrote:
> Add support for devcoredump in the driver. This helps in capturing
> the snapshot of DDR memory that firmware uses in the event of a
> firmware assert which aids in firmware debug.
> 
> First patch in the series adds the basic coredump infrastructure to
> the driver. Second one in the series adds the support to capture MSA
> memory during firmware assert on WCN6750.
> 
> Manikanta Pubbisetty (2):
>    wifi: ath11k: Add coredump support
>    wifi: ath11k: Add coredump support of MSA region for WCN6750
> ---
> V4:
>   - Updated the commit log in the cover-letter
> 
> V3:
>   - Moved the modparam to core.h and removed FIXME
>   - Driver continues to work even if coredump memory allocation fails
> 
> V2:
>   - struct ath11k_ramdump_hdr::start is now u64
>   - Added missing mutex_unlock() in ath11k_ahb_coredump_msa()
>   - Corrected hdr->length assignments in ath11k_ahb_coredump_msa()
> 
>   drivers/net/wireless/ath/ath11k/Kconfig    |   1 +
>   drivers/net/wireless/ath/ath11k/Makefile   |   1 +
>   drivers/net/wireless/ath/ath11k/ahb.c      | 127 +++++++++++-
>   drivers/net/wireless/ath/ath11k/ahb.h      |   8 +-
>   drivers/net/wireless/ath/ath11k/core.c     |  18 +-
>   drivers/net/wireless/ath/ath11k/core.h     |  19 +-
>   drivers/net/wireless/ath/ath11k/coredump.c | 225 +++++++++++++++++++++
>   drivers/net/wireless/ath/ath11k/coredump.h | 147 ++++++++++++++
>   8 files changed, 541 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath11k/coredump.c
>   create mode 100644 drivers/net/wireless/ath/ath11k/coredump.h
> 
> 
> base-commit: 3fa9da4001890def44801dd56d5fbc134689be28

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
