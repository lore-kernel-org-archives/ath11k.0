Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C85C48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 20:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CTTzyf5c0o0CUjYZTNUpPtWcbvkvG3axZfXwX5A2IM=; b=KSWmCBxe/zsZ+rpvJ3z+Dd1YX+
	TkuEPidnKCaZrDF5Lw6F2BeGjVl4DWYxa7QnSMN5AuJtMRXnUfqOmrCUR5iBt4B5sKihvA6pK3vdF
	3RSw2ePjqnFY17eNg2NPWGc3w4TMy/QTODlQH3ctKndi8fZeyfZpEjQ7WVd2/747k7xhsm2xdagUm
	g9joZ5QBC290rxbM3TszFPEggVAeTivSV9ojqJvjy5s3tDbz/054vNMpI38Q2V4sPguT1Pj1D+VPb
	K6xjBr2Vo/6X6Kdr3MnjzOC/cZNU/9W7U34k5r2m8LA4PyUPYjVVYr2T88ipELRBFANjRkbSnzGwE
	a5rOYgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rehm0-00000002YZM-1oor;
	Mon, 26 Feb 2024 20:40:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rehly-00000002YYw-2WWi
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 20:40:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QKcp2E002608;
	Mon, 26 Feb 2024 20:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0CTTzyf5c0o0CUjYZTNUpPtWcbvkvG3axZfXwX5A2IM=; b=lB
	bPPmbsOI4W6Kxz9Pw/R09e4oWhWhBkeoxpkReFuqaDHVgazOwHB+I2vlY6aRlOR6
	UsxQUWOLlc3/P9K2U3PQXCOdm0B4PNnLPjiuzrbrknbDgELLl3vJrKnPeBODWNhD
	VD8MWtLybJ33upEEw4yXdB4Y78ESAOevqfy7oviUGBDt7R2T+mo7FDqXIq9mSwuS
	XfyvZw2XA+VwR4AxCfw227UKm0aZxQoxx53qq7Zz774WGnEQPw5CIw2bNQVKUxV6
	W7pCnRE7uSS7BvHjZAMO0Ph3yC5LJPT26vT/TPkQSnCMLjQHSgMml1U9gLRBWERy
	oTmyHt9emT8HNdx+LyDw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxmj23f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 20:40:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QKeOoM025661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 20:40:24 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 12:40:24 -0800
Message-ID: <00db4b62-4cd4-474f-bbe9-33f64d5e3853@quicinc.com>
Date: Mon, 26 Feb 2024 12:40:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] wifi: ath11k: invert scan flag
 WMI_SCAN_FILTER_PROBE_REQ for QCA6390/WCN6855/QCA2066
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
 <20240226060203.2040444-6-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240226060203.2040444-6-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ebNtgn9_QpzVFVEqqVkrJZd0i8vWhIA-
X-Proofpoint-ORIG-GUID: ebNtgn9_QpzVFVEqqVkrJZd0i8vWhIA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_124026_687322_A1BDB781 
X-CRM114-Status: GOOD (  15.60  )
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

On 2/25/2024 10:02 PM, Kang Yang wrote:
> Current ROC scan will filter probe request. But probe request is
> necessary for P2P mode. A P2P device cannot be discovered by others if
> it doesn't respond to others' probe request.
> 
> So invert scan flag WMI_SCAN_FILTER_PROBE_REQ for
> QCA6390/WCN6855/QCA2066.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index bbccddd7d729..1dd0cbdda199 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -2317,6 +2317,9 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
>  	ether_addr_copy(cmd->mac_addr.addr, params->mac_addr.addr);
>  	ether_addr_copy(cmd->mac_mask.addr, params->mac_mask.addr);
>  
> +	if (ar->ab->hw_params.single_pdev_only)
> +		cmd->scan_ctrl_flags ^=  WMI_SCAN_FILTER_PROBE_REQ;
> +

Why is this being done in WMI? Ideally WMI should just be doing host to
firmware translation, so seems this should be further up the stack, i.e.
in ath11k_mac_op_hw_scan() / ath11k_mac_op_remain_on_channel()

It also seems strange to invert the flag (which assumes a known starting
value) instead of just explicitly setting it to the required value.

>  	ptr += sizeof(*cmd);
>  
>  	len = params->num_chan * sizeof(u32);


