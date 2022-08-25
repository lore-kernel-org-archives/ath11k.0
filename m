Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE9AC32774
	for <ath11k@archiver.kernel.org>; Thu, 25 Aug 2022 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePyDjNsiDc/rM/RebJhwwudmBKvW1YjXE8ENvc3zNHg=; b=qBkdV1lKGLrmfj
	gKmooczNiI46QBv/2zPlaGQskQs1U30iF/v25uWpXZEDMUtphFATsXE6QHoZab1y2nIEC4GWi4wtL
	pcOyWrorr25GRHjWc32BMOJLlBnCLFbQ2C5Ce0AT27b+7lpgvXTqkpdcYrgR1ILsyxZExFknlSJlg
	3YwWtQ3DNXxTlkQkIlr6kbsEJHokq3pZnVoP7zXYDafOrNj3HYrW9VtI5qyOO5uV8/tjrOl2qRaXX
	/JIA3oya91/QZPx+Zb1PaQ+KtKo6iZ8XsPxStTQQNIk9t28vs1wUfWME3HO6GN3YToKZNlvYiwAr+
	a0VTlleMtlhF1hx5VquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREKe-00FTvL-2I; Thu, 25 Aug 2022 14:59:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREKa-00FTrT-Fn
	for ath11k@lists.infradead.org; Thu, 25 Aug 2022 14:59:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PBLRbQ020598;
	Thu, 25 Aug 2022 14:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qCk5VESLGfnaSsTlBTBGfMQ1jV8FlbrNCIhmlJBvPlc=;
 b=dmOBioTwWMadYVnnG3+Ki6UNnJ9rGqhutD5QrFqbNsACLFAbFj0yXvSXBLasu2tfxwI5
 LNkwhLyq9fdLa2PZfLo5pAkQHWlZQqG7qTnHpQAq0tWRgcRdRwyNhnskn3qeE5QJv4Fe
 CUQfgiICXL42C6ixxZ4AiKo6HVZq2Lf0SWYKGgJGD7twx60T4zVSfuYChtm0KS1ZuHOY
 PK/oU1Qs5fA1SN5BdsIqM0xvXthnmuarLA0gEaJkKjd7Xt+1w6YSwBM/BY6XSKs8uFGh
 zv6Hzu2JUZbaqWH+Wc762xVGeTc6D00xFBTTqXYkhnrIZeuEQLv66V8xdR6LJQ3G6VdV YA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j5xcujfku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 14:59:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27PExXRX023694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 14:59:33 GMT
Received: from [10.110.120.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 25 Aug
 2022 07:59:32 -0700
Message-ID: <44b3af84-1a83-7ff0-b826-8532bee0b4c0@quicinc.com>
Date: Thu, 25 Aug 2022 07:59:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/4] ath11k: Fix double free issue during SRNG deinit
Content-Language: en-US
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220825111818.30869-1-quic_mpubbise@quicinc.com>
 <20220825111818.30869-2-quic_mpubbise@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220825111818.30869-2-quic_mpubbise@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ipx_u9gPZkfz5CwwgEKMyB2Sc26wyu-_
X-Proofpoint-ORIG-GUID: ipx_u9gPZkfz5CwwgEKMyB2Sc26wyu-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_06,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=985 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208250056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_075940_736501_8630C38D 
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

On 8/25/2022 4:18 AM, Manikanta Pubbisetty wrote:
> Currently struct ath11k_hal::srng_config pointer is not assigned
> to NULL after freeing the memory in ath11k_hal_srng_deinit().
> This could lead to double free issue in a scerario where

nit: s/scerario/scenario/

> ath11k_hal_srng_deinit() is invoked back to back.
> 
> In the current code, although the chances are very low, the above
> said scenario could happen when hardware recovery has failed and
> then there is another FW assert where ath11k_hal_srng_deinit() is
> invoked once again as part of recovery. Addressing this issue is
> important when low power mode support is enabled in the driver
> (will be added by a future patch) where this scenario is likely.
> 
> Fix this by assigning the struct ath11k_hal::srng_config pointer
> to NULL after freeing the memory.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/hal.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index bda71ab5a1f2..ebdf3b1a6661 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1319,6 +1319,7 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>   	ath11k_hal_free_cont_rdp(ab);
>   	ath11k_hal_free_cont_wrp(ab);
>   	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>   }
>   EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>   


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
