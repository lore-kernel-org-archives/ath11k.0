Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1946DCF8840
	for <ath11k@archiver.kernel.org>; Fri,  4 Oct 2024 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQGaxH01c90zyB7W2GgISPxiGHLC5E8st1li8CuHK0c=; b=agWUzDGXUaY9RneQu4TdeTK45+
	nqIVdWkPz1RJAHV2HQWhS6cxtgTz3BDwOGSUqivGPwS7Sx+3WzZacYVzGqEYc8YfD0GdLt6YglIHV
	SZVWgINR239gNx8w0HyflQ+cSSrlS/lIp0gpwcF3/1G6+xQmRxyGCh8NWcQlmdwawa/YwefawTw37
	ro6W7Bj4zhmruQud4IPjqzlRc5YpYrtX3/4xuUjYnamC56RIiVW3yK97XcqCA4eLKBYFBPDDn+c/T
	gpjjdVVrua87OE2PPT05l+HZfEo//G8utTgpPoOLupsGbD+OJGEbqniTBMasKLHmGd6pOjl/XwB/R
	alVxfSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swm7G-0000000DWNt-349E;
	Fri, 04 Oct 2024 17:29:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swlnP-0000000DP7i-0lKQ
	for ath11k@lists.infradead.org;
	Fri, 04 Oct 2024 17:08:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494B3xHM026679;
	Fri, 4 Oct 2024 17:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OQGaxH01c90zyB7W2GgISPxiGHLC5E8st1li8CuHK0c=; b=QB9EXLu+x02BWyk+
	AiZ1JyWO4StIJJBmIwK1saPc6qk6heaGq13cuMD3ft1J2ij8jTCKj9yTpSgp2Sef
	WxHZfLSri2/FcSvoWkRjbVRc/eIRTxxoc69Mrf8y8Awjs0WYP14NKpzGaY6qbk3Q
	w5wis99M4cOIYgKJidAcqLUAQZPdiZIEdBSPAdDQVjm7O8VCwSKDO5wy36Of8w5w
	hrKE/u0miKKArDYc9CStWZsdS99Yz40L+QPPi+HpgdTWK823IvE4gaQi/W6UKZ+b
	KbpMoLNpUXMz8KAKHCZJcHfmyY2Xl3nz3YWfpUjwGm7qPa2qCsAGtG8wwqMtviHd
	ax1kaw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42207v2shj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 17:08:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494H8mkP028834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 17:08:48 GMT
Received: from [10.111.183.136] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 10:08:47 -0700
Message-ID: <fc56f428-7dd5-4005-8873-9feb27706d4a@quicinc.com>
Date: Fri, 4 Oct 2024 10:08:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath11k: fix RCU stall while reaping monitor
 destination ring
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240924102345.811-1-quic_kangyang@quicinc.com>
 <20240924102345.811-2-quic_kangyang@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240924102345.811-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NmND4ohA8E6y-dNxe5p4e0taqx6VUNDV
X-Proofpoint-ORIG-GUID: NmND4ohA8E6y-dNxe5p4e0taqx6VUNDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_100851_682428_7E7D9325 
X-CRM114-Status: GOOD (  17.57  )
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

On 9/24/2024 3:23 AM, Kang Yang wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> While processing the monitor destination ring, MSDUs are reaped from the
> link descriptor based on the corresponding buf_id.
> 
> However, sometimes the driver cannot obtain a valid buffer corresponding
> to the buf_id received from the hardware. This causes an infinite loop
> in the destination processing, resulting in a kernel crash.

Seems this should have a Fixes: tag

> 
> kernel log:
> ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
> ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
> ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
> ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
> ……

let's avoid unnecessary Unicode characters

> 
> Fix this by skipping the problematic buf_id and reaping the next entry,
> replacing the break with the next MSDU processing.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index c087d8a0f5b2..072963d3396c 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -4781,7 +4781,7 @@ ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
>  			if (!msdu) {
>  				ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
>  					   "msdu_pop: invalid buf_id %d\n", buf_id);
> -				break;
> +				goto next_msdu;
>  			}
>  			rxcb = ATH11K_SKB_RXCB(msdu);
>  			if (!rxcb->unmapped) {
> @@ -5405,7 +5405,7 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
>  					   "full mon msdu_pop: invalid buf_id %d\n",
>  					    buf_id);
>  				spin_unlock_bh(&rx_ring->idr_lock);
> -				break;
> +				goto next_msdu;
>  			}
>  			idr_remove(&rx_ring->bufs_idr, buf_id);
>  			spin_unlock_bh(&rx_ring->idr_lock);


