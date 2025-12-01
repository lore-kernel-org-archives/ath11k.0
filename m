Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C947CD116F3
	for <ath11k@archiver.kernel.org>; Mon,  1 Dec 2025 17:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=; b=OUv/OZR3AZypTztgx89bbsP89L
	9QPNBBZ+4h8KFBjAjcr/UxTqJJnAJqX9E0DsxUDgM29vIpFBX9urpfRqLPmDwn+vT/uZx9cDiCObK
	V/nqpeV69fJVTl8enPKkc0GEWpsXlCWNSpl21WPugVLWyRSZ1RZyg+zUnRXpl5ugyErte1OPVMV3C
	vkpCOBlTpVxO7suu0e1BJiZt2+g1i6jEzjrhmFrrGCSXFlRqNkE32IdQ2TdvHyae4ijhloiDvpvkl
	q+4+zXMgMAj5EcYRY1GNPHavDIgGtWNllQ8nsT6QHaMYj3yLz8RlpSzfN3eU/DcllyDj2qNw84XBr
	Pc9TgiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7tc-00000004My4-3W87;
	Mon, 01 Dec 2025 17:41:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7ta-00000004MxG-2pBX
	for ath11k@lists.infradead.org;
	Mon, 01 Dec 2025 17:41:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19ZvKV451735
	for <ath11k@lists.infradead.org>; Mon, 1 Dec 2025 17:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=; b=ZxyuzaXv6A26qiRW
	3ib+4vKjJnwB99Ulmz3+RRb3QOIt9IEjEBZ2SK904Gsv6nMU2UluCtxKVvgbRPW5
	aXIV0VxAUSTF9gt+hZmetm/hPC3OkeqsVaPFydPZLYXkVi6jmR1m7IIpi7WMdh31
	G1p/Mm5LYsJGCX7rhrWPgKhgo7vMYyzGcSbUtkJSFYm8z2SL/nbgk217ze6jfZvJ
	eC0pkwM6QvoPRK63MsxQXNL1M+QTG01ljbQaMRJVju5uvMdOjxXBsAqaxu4C3s4H
	/zjOeRaj09yH4rJo95lgrRbtjeRy5qN6DQvXd2C/tC2nj88agyNrKRoRmpFD/Fpd
	eNuP+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8hesdc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Dec 2025 17:41:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba92341f38so4353107b3a.0
        for <ath11k@lists.infradead.org>; Mon, 01 Dec 2025 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764610864; x=1765215664; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
        b=hSdPi/6osfbrHUbKzyUbK+Zj2l54EywD+XmCkti8NkWksWEcorbHBJ2zczMmNN2caE
         BV00+M7yraRE/hga2jsDw6mq1mfD1A7vJ9Thqj1kNL7fY7r0bRLgtH6VfobprhVld268
         b/08s7yK+JW5KlqwtWxgPaJtfijKPyq4nwh0avSlc9yBPWNlhWSrxlkRRiwLDjt1O70r
         lpIupROZ7i0/X6LdlcfAld1YmkEQK6J2rixswjZfqK8q6mnVBWxRkrNIoraI7z8IQqck
         nNwXBIqN4NvVUAz9KOGWbZaB0liXPKBYnn+o+0Lb7Y/MCg9KxUtzBgzkqEZRJMXLUiGl
         yHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764610864; x=1765215664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
        b=bTawf/H/9E9uat8clwdNFWnvhl3bfiiQctODKGDSpKT2I6ibVLUQUq3rmDbF13sit/
         UoO3vBumk4nHtUeaP4vLLSEsvQzeqcc0tJcoKJBgcs2syqu9+YspZR2koQJPGqEtg9ei
         6QsbzmzGnCs2AguEY29Mb4nua6pdYerASyuWs6MpQKlovxKgtcsbQczTA11ArHj23y3z
         MpveOOfw284seLdPHt6d5VQMeVUUDhYBvggTBaGRKtEN92VLOR4jFhSVAjBhDeBmVwr8
         13xH/W3I+o8SZBRtOG3fyiAuxgB39+VES8GuMtx9RcuxQycudWb5PjPDmZh3jIIh9b98
         6Lxg==
X-Forwarded-Encrypted: i=1; AJvYcCWMSjd7aRzFZcgRQo0B3DQxt/3Br5JKuCR/5Ffo8yhto54BAeCGjY+cHmt1uag1ZCdX5PeHX0k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4GYU3iSsxzrbZQoDU4Nxc2zOSfZfcl70dr2xo/AJXyEuPjXZw
	+22R1Qu/qmtIugMpHxE13JimoV0f4SqMN7HmVGbth1OIB8fntLhCcngxPNAKbVIXPzpKUmpAxET
	oub/QtSQ8a5Z6TBWUg3ayPwFzuYUSMdPLXNVOOv/5jQ8XnU6Uxws/Vq1pPkC0NYhU
X-Gm-Gg: ASbGnct0nt59qAGzt/V2ZtNDusftS351FFJZ87HEf9bRJLrmMvTltGogV54YoOVdrEp
	R6aN2kZGwZ0Oe1pBChqWrHF8FWFGeh2WKucVu1QpacUPR8MWcKuL4dcRPlk3Fwm8It2sjS11Qqx
	iv/JXxDB/LObwTL6x3yQqRUpl7tyRj6W9wVNrHHBwQoTyFJa1+kWlLuXb8rmOOBft7egNnCq/Ps
	7XbRTJ7nJJqraK6fRDzLcNNZNgB0VBLI0wGpeouMrMn9QAp6t2g5jZIbaAWlfqK354WhJkd4ZUU
	agFMrzqCGD9s+5a3L0aPp+2RH2+okhIBsJNRrGObnyGSUC6LLDK77qasZz29HI/dv676nLpVErS
	J2qASkQmUv2zC8UiTL2qB3HTUWW0NqryG0RFFI9Av+BpbhlOMKcsslNLx
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id adf61e73a8af0-3637db29723mr30315571637.17.1764610863751;
        Mon, 01 Dec 2025 09:41:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuoKHcI6kog7ZiSeUimSTc1QQRfMcR0gyLQvIhQiA98rGJvDjNieYJ0dzMpSwyxYjBOD4K6Q==
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id adf61e73a8af0-3637db29723mr30315517637.17.1764610863190;
        Mon, 01 Dec 2025 09:41:03 -0800 (PST)
Received: from [10.73.112.168] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150c618e7sm14245014b3a.3.2025.12.01.09.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:41:02 -0800 (PST)
Message-ID: <ce68d28f-c737-402c-9f6d-f13fec4d2e82@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 09:41:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chris Lew <quic_clew@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LewxKzfi c=1 sm=1 tr=0 ts=692dd330 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vwh-6NgWTdBnnHhUpCYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: gWtRHOu3wDMMAP49Sovi4YYjne8vnPlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0NCBTYWx0ZWRfX26XI0wr+BFfZ
 7seUvUnskZKCGPeiwDHZi6A6C2K0IJQkVCv0jUw0jCUWUYW+M7zb+2ClGlsk4X8wynbq/7Ea2JG
 w/JBvgPggmXUTGdfpYJ+4nLkMYrhuk8pwcl2b9oMq8A2AsUTcMzVVYuWCtT+5EXKiTPwHcINFAY
 FcGVejgyXa9Ce1Ay4pW94vQV4IgcCunYNSevJtEuyt5y6bzhL5901yvyycSl/lniJ7EyAkVZe0l
 X7B6FKxPW8Pb8v7Kb/tbtneK8/UI1MXypYq2to19sEewsKvnKNGE/yLfZq3Hyqe94OWXNj0rB6Z
 FEs0scQJyE/5JzsnWtuLUofBa8aqaocuaBgqaTNdu0w++hhQH0XV1w/PllL5etae6dDDPNqM0wg
 QZ0e/r7TsA1phkGmb/pJL5ytveGaSg==
X-Proofpoint-ORIG-GUID: gWtRHOu3wDMMAP49Sovi4YYjne8vnPlW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_094106_871574_B83EF1DF 
X-CRM114-Status: GOOD (  21.31  )
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

+ Chris

Do we need to consider updating client driver (net/qrtr/mhi.c) ?

Regards,
Mayank

On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
> Add runtime power management support to the mhi_net driver to align with
> the updated MHI framework, which expects runtime PM to be enabled by client
> drivers. This ensures the controller remains active during data transfers
> and can autosuspend when idle.
> 
> The driver now uses pm_runtime_get() and pm_runtime_put() around
> transmit, receive, and buffer refill operations. Runtime PM is initialized
> during probe with autosuspend enabled and a 100ms delay. The device is
> marked with pm_runtime_no_callbacks() to notify PM framework that there
> are no callbacks for this driver.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/net/mhi_net.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/skbuff.h>
>   #include <linux/u64_stats_sync.h>
>   
> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	struct mhi_device *mdev = mhi_netdev->mdev;
>   	int err;
>   
> +	pm_runtime_get(&mdev->dev);
>   	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>   	if (unlikely(err)) {
>   		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	return NETDEV_TX_OK;
>   }
>   
> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>   	}
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>   		netif_wake_queue(ndev);
>   }
> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   
>   	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>   
> +	pm_runtime_get_sync(&mdev->dev);
>   	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>   		skb = netdev_alloc_skb(ndev, size);
>   		if (unlikely(!skb))
> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   		cond_resched();
>   	}
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	/* If we're still starved of rx buffers, reschedule later */
>   	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>   		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>   
>   	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>   
> +	pm_runtime_no_callbacks(&mhi_dev->dev);
> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
> +	pm_runtime_get(&mhi_dev->dev);
>   	err = mhi_net_newlink(mhi_dev, ndev);
>   	if (err) {
>   		free_netdev(ndev);
> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>   		return err;
>   	}
>   
> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>   	return 0;
>   }
>   
> 


