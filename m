Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D697CF538D
	for <ath11k@archiver.kernel.org>; Wed, 23 Oct 2024 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfgOaPeA5MpppB/MxMW5onXIJT+Q9xb/umUkV0JAO4k=; b=H9abIWED6a8N99xQEwImb20H9p
	W7e1KCuop1Ixp9pqkS9X6rJx4Gn39sxHGp84khPCF6lU6bHvhfLy50shSoZe6QNPo5opAEZoSew9R
	rqLpMl+oXs6ljM5orHKr42/V6kaIFwoAeCglhb7kpDqRawYntL/6o3WbrcE1H1Ibya5BIlMjHKVB0
	sStIlOTP3UvQ6f9BNQYLzomoUhAFCtIFINtykl8PTjJkLPdCFHz4iXqkjzyniAy+irLbuBkEkqoxl
	1mwiHC5zXSuRWkVA5yJYDzIQ6kwH6Lw0BLz1Uows4k0Yp+jod/8+QL3Xsvcw/6kbTmHPnBCVJ6e8Z
	x7eYMArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bwx-0000000EdWa-2egm;
	Wed, 23 Oct 2024 14:02:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bwu-0000000EdVX-1Rqg
	for ath11k@lists.infradead.org;
	Wed, 23 Oct 2024 14:02:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9dBq8029637;
	Wed, 23 Oct 2024 14:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfgOaPeA5MpppB/MxMW5onXIJT+Q9xb/umUkV0JAO4k=; b=ViuqvDoUxrV26saV
	/RAFEXb2pfpZbisLniRtv3gJD+DQiUWXpBZkRvo2CCqI2dCkED90Jmfg+slP0QYa
	WV9O0rthTqTYXcMuLRrhJE24Kt4OxDs6l/i3Og/IKDqQFT2o1vNsCOf1rQUoGRbV
	iEBaABhO8Na/Nm7X5ldkrmApe+Jo7kBOxJyNF6sinQh97YMkr4Qo6J7Ds+w9kGGj
	prFSKHn1gCXB1GsKQrP04IDxJO+/OHcY4Ot9mi7KW/hbASTD8YtpkSVvS72oSbgS
	lguIPPx6Wqt/WR5vrNoaQwGHFmqvRQlz2mkYKmzpMLLbevNe+e9aYyWc3n4fTLaW
	vyWzsA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w2ejn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 14:02:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NE2hx4019122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 14:02:43 GMT
Received: from [10.48.242.6] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 07:02:42 -0700
Message-ID: <f8e6901a-0f68-44e1-81e6-729539693fa4@quicinc.com>
Date: Wed, 23 Oct 2024 07:02:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ath11k: fix return value check in
 ath11k_spectral_debug_register()
To: Zhen Lei <thunder.leizhen@huawei.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff
 Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <20241023074051.309-1-thunder.leizhen@huawei.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241023074051.309-1-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s2kbZA6Vu7Z0vNtTOG4IJzF3cW8ObMjj
X-Proofpoint-GUID: s2kbZA6Vu7Z0vNtTOG4IJzF3cW8ObMjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=969
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_070256_503530_723B1D07 
X-CRM114-Status: GOOD (  17.95  )
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

On 10/23/2024 12:40 AM, Zhen Lei wrote:
> Fix the incorrect return value check for debugfs_create_file(), which
> returns ERR_PTR(-ERROR) instead of NULL when it fails.

Based upon the commit text this change is incorrect.

 * NOTE: it's expected that most callers should _ignore_ the errors returned
 * by this function. Other debugfs functions handle the fact that the "dentry"
 * passed to them could be an error and they don't crash in that case.
 * Drivers should generally work fine even if debugfs fails to init anyway.

So ath11k should not be checking the return value at all, and definitely
should not be returning -EINVAL since the driver should still operate even if
creating a debugfs file fails.

> 
> Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/net/wireless/ath/ath11k/spectral.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
> index 79e091134515b43..4c545231292142a 100644
> --- a/drivers/net/wireless/ath/ath11k/spectral.c
> +++ b/drivers/net/wireless/ath/ath11k/spectral.c
> @@ -942,7 +942,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
>  						    0600,
>  						    ar->debug.debugfs_pdev, ar,
>  						    &fops_scan_ctl);
> -	if (!ar->spectral.scan_ctl) {
> +	if (IS_ERR(ar->spectral.scan_ctl)) {
>  		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
>  			    ar->pdev_idx);
>  		ret = -EINVAL;
> @@ -953,7 +953,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
>  						      0600,
>  						      ar->debug.debugfs_pdev, ar,
>  						      &fops_scan_count);
> -	if (!ar->spectral.scan_count) {
> +	if (IS_ERR(ar->spectral.scan_count)) {
>  		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
>  			    ar->pdev_idx);
>  		ret = -EINVAL;
> @@ -964,7 +964,7 @@ static inline int ath11k_spectral_debug_register(struct ath11k *ar)
>  						     0600,
>  						     ar->debug.debugfs_pdev, ar,
>  						     &fops_scan_bins);
> -	if (!ar->spectral.scan_bins) {
> +	if (IS_ERR(ar->spectral.scan_bins)) {
>  		ath11k_warn(ar->ab, "failed to open debugfs in pdev %d\n",
>  			    ar->pdev_idx);
>  		ret = -EINVAL;


