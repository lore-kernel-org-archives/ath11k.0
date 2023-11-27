Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB80C4167B
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 18:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqqMLRcLU4yONHWcToBV6a5+K1JItsZhtmM1RDUsmzk=; b=EiYa+HvwD0WrUV
	xdGrctO444fSNzx8q3RQSJHu5b73Md8c6ZsRI36Xq0THQ+gaxGMsdlT6uJmm230pnYR2HQJi5J7WR
	ulLCu5P5Rl8fIa9Yg5nb++NnUQOWzXzWMODrSWXO1P0wcrXkBDKL76ZWN7bHTYWkINTsPxRldODkf
	czbGn6E5N0PiRVH9jMAtm0ra0lfafF05vLyJsNMDiZ5RMcaegCLJWf1jNxOK8+0NFtdX2b3PI86e9
	Z3b4Gv1TzsjqK9xW9RZW2ubWPPekYetaI6IHORQwsZ0La1V01ZCZp2GmOs/ZdZ33NVpppWynHJ+Jx
	Et1zBfKSiST2dF0OqkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7gVJ-003F8P-0T;
	Mon, 27 Nov 2023 18:38:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7gVG-003F7s-14
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 18:38:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARIPxdY011556;
	Mon, 27 Nov 2023 18:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rYybWgokpVv90qBdPZiA3EOFqVOw/Kv9mBFSMTnnoE0=;
 b=JJLNC+ISB0x0FWeA4eViD10ZH3IkY/3cPuB/fhMFCbFS0o2RJX04zlpd6N3k833qZFc0
 rbIjTtFm054fXB+yC7V0Jkg5wdr1Lbub2D28xp3fLZ5mlNDO/F750LF91q88lehf9bDr
 SNi8RE9xf9Ljo89J585s9+H8Nr9u7TgB8+U5yjTPXI4lO6Iv8GdvbCrDB2eOTYXwXc2j
 NuGdaWOsN0eokPcbqMdusZhh7iJQHIduW59Ox5afA2kI7SXlDvs3RByI80yPIi8P5d5H
 8txNRPfIUUnDIwfRi5ukvtUfND5ulPL2iCz3bLX4Lh0EN21BEvsQJO8wFynAgxNShk29 Jg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umwn5rkxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 18:38:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARIcPlG005701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 18:38:25 GMT
Received: from [10.110.63.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 10:38:24 -0800
Message-ID: <bdcdbd06-e9bd-4a92-b27b-d94b2d8fb52d@quicinc.com>
Date: Mon, 27 Nov 2023 10:38:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix layout of scan_flags in struct
 scan_req_params
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <20231127180559.1696041-1-nico.escande@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231127180559.1696041-1-nico.escande@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RXxqDYP-mVAtsxhbjw4eJ6K8kykjEYWV
X-Proofpoint-GUID: RXxqDYP-mVAtsxhbjw4eJ6K8kykjEYWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_16,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=892 adultscore=0
 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_103842_878669_253BA831 
X-CRM114-Status: GOOD (  23.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/27/2023 10:05 AM, Nicolas Escande wrote:
> The is a layout mismatch between the bitfield representing scan_flags in
> struct scan_req_params & the bits as defined in the WMI_SCAN_XXX macros.
> Lets fix it by making the struct match the #defines.
> 
> I tried to correct it by making the struct match the #define and it 
> worked for WMI_SCAN_FLAG_FORCE_ACTIVE_ON_DFS / scan_f_force_active_dfs_chn
> so I'm assuming this is the right thing to do.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
> index 100bb816b592..0b4e6c2f7860 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -3348,17 +3348,17 @@ struct scan_req_params {
>  			    scan_f_filter_prb_req:1,
>  			    scan_f_bypass_dfs_chn:1,
>  			    scan_f_continue_on_err:1,
> +			    scan_f_promisc_mode:1,
> +			    scan_f_force_active_dfs_chn:1,
> +			    scan_f_add_tpc_ie_in_probe:1,
> +			    scan_f_add_ds_ie_in_probe:1,
> +			    scan_f_add_spoofed_mac_in_probe:1,
>  			    scan_f_offchan_mgmt_tx:1,
>  			    scan_f_offchan_data_tx:1,
> -			    scan_f_promisc_mode:1,
>  			    scan_f_capture_phy_err:1,
>  			    scan_f_strict_passive_pch:1,
>  			    scan_f_half_rate:1,
>  			    scan_f_quarter_rate:1,
> -			    scan_f_force_active_dfs_chn:1,
> -			    scan_f_add_tpc_ie_in_probe:1,
> -			    scan_f_add_ds_ie_in_probe:1,
> -			    scan_f_add_spoofed_mac_in_probe:1,
>  			    scan_f_add_rand_seq_in_probe:1,
>  			    scan_f_en_ie_whitelist_in_probe:1,
>  			    scan_f_forced:1,

You are convoluting two different data structures.

struct scan_req_params is used to represent a scan request within the
host driver. This does not use the WMI_SCAN_XXX macros.

struct wmi_start_scan_cmd is used to represent the scan request command
sent to firmware. This struct uses the WMI_SCAN_XXX macros to fill some
members of this struct in ath11k_wmi_copy_scan_event_cntrl_flags().

So your change has no effect on the driver operation and incorrectly
tries to foist the firmware definition upon the host internal
representation.

So NAK to this patch.

/jeff

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
