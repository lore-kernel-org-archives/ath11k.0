Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAC4C433F5
	for <ath11k@archiver.kernel.org>; Tue, 31 May 2022 20:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwpeBjKi1/eRpZKsfnjW+BJlJuaQ7T/PEqP2tTRrqeY=; b=ONDdFLw2Do6PdI
	IEX8cTenpRd8Xbn6RemLXGLvmEFRCRd6MRkYB2g0dXpwfZR5Fe24UrAZu1ehWpQsiQpwZNeJD5qbH
	OBdq38cLBf/vWuUBQRIyjXw75EKodZ1QnYAxjRHjN3K9+ji05GOLQ3TRYOnbqk8NNhil3zy2xC/SY
	G8OACKOPM3UBO6wYO4xiizyKw45jNt9fMTdNVv2u+wTUnW7p5X7PCInXdSAGpixbLpDZnkOT+iAnP
	s9ckAgIrgkw5iszypvbnw3pRGUqn08f0BVReJkm/6YAw5ZwrMZ5o8P/+6bpL418o/kKQKNFuVWJyt
	NAmeVkv0VTIQzzBjrTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8XR-00CWrA-Pi; Tue, 31 May 2022 20:32:25 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw8XP-00CWpT-Lm
	for ath11k@lists.infradead.org; Tue, 31 May 2022 20:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654029144; x=1685565144;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0FN3bOxIhdy/N2r45nd/6ZtoVXh9fCyHLUsbHUleE0I=;
  b=IwHdnETmCLEB/q9pTeZ1AiwYawaKJKn60Qf+vnXA7gTxMTAR1bpoTnID
   ElSSIbhuijUag5hF8B5fD86PYWw6RxwQb0V8I17bZxUcYrBLimzVB2Yfj
   IV90FmPEVuzY4ycwSVbxkZrzJYGEfwX8FL4bRdkRmon4NQJ9vQ5HSOByk
   E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 31 May 2022 13:32:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 13:32:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 13:32:20 -0700
Received: from [10.110.67.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 31 May
 2022 13:32:19 -0700
Message-ID: <cfb03aa3-1a98-8131-0090-93c8ae918e7f@quicinc.com>
Date: Tue, 31 May 2022 13:32:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] ath11k: fix missing skb drop on htc_tx_completion
 error
Content-Language: en-US
To: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>,
	<ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220528142516.20819-1-ansuelsmth@gmail.com>
 <20220528142516.20819-2-ansuelsmth@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220528142516.20819-2-ansuelsmth@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_133223_799782_FFC2B461 
X-CRM114-Status: GOOD (  13.38  )
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

On 5/28/2022 7:25 AM, Christian 'Ansuel' Marangi wrote:
> On htc_tx_completion error the skb is not dropped. This is wrong since
> the completion_handler logic expect the skb to be consumed anyway even
> when an error is triggerer. Not freeing the skb on error is a memory

nit: s/triggerer/triggered/

Kalle can fix this when he merges so no need to post a correction

> leak since the skb won't be freed anywere else. Correctly free the
> packet on eid >= ATH11K_HTC_EP_COUNT before returning.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/htc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
> index 069c29a4fac7..ca3aedc0252d 100644
> --- a/drivers/net/wireless/ath/ath11k/htc.c
> +++ b/drivers/net/wireless/ath/ath11k/htc.c
> @@ -258,8 +258,10 @@ void ath11k_htc_tx_completion_handler(struct ath11k_base *ab,
>   	u8 eid;
>   
>   	eid = ATH11K_SKB_CB(skb)->eid;
> -	if (eid >= ATH11K_HTC_EP_COUNT)
> +	if (eid >= ATH11K_HTC_EP_COUNT) {
> +		dev_kfree_skb_any(skb);
>   		return;
> +	}
>   
>   	ep = &htc->endpoint[eid];
>   	spin_lock_bh(&htc->tx_lock);


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
