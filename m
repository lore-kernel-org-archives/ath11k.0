Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DBEC433EF
	for <ath11k@archiver.kernel.org>; Wed,  1 Jun 2022 19:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVLvqnLaUb/XQ2fYwx/WCQgT5A6UJinG0QWZ8cqtFE4=; b=OZOJYIO4Zl4C+u
	VKE96j1SvQDwrgldcrGVhxnHUqyTRq6LhUe+iHHDu+Fj8G+s7wugnzMrBUtjFPxciarCmfXpNh9+k
	kJ2KtNQrlGFn4+mLvWyyEBs/x2Q8BNLLuspCGinSCS1E+IMkXibLNSZ8gHyaLxRorP9KXrmL8VLcn
	Zr/wBiw3gCigd8mab/NS9FHolsy8ejMlsAB2lmd3nZvlviOlz68vvzU5uya40Bsr+BEUlCh/REhSw
	WBwjytHbRK9mwAIUmfytvboseRnGcyaeyCVCE6kGX1YBtynQ0wEr7OEzUuDMJhHk7FdWlj8LBz7kE
	THmQ8AywZhswZo2FPHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwTj9-0007qR-Cy; Wed, 01 Jun 2022 19:09:55 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwTj7-0007pX-FV
	for ath11k@lists.infradead.org; Wed, 01 Jun 2022 19:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654110594; x=1685646594;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0nFXnQ37/awaKQICaD8CGQ++kuJwX2JMyTTgWh2bDxE=;
  b=UTmuCFp/5LJ6rfGZ+DBXPB2/JrYiby8vNq1ucaj9MVgV1VnVflg6qXD5
   lmoEU9Ij2VJULpxZ7/TRqYx8xNc0+lhHIxNwJfNsibaxXBXvo2qWweBQL
   /SHEqHG3kku7xCE5e7oE+zuLWt3l5OGi7u4MsEHJtf+hnB1siJIdCZ2Ho
   I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 01 Jun 2022 12:09:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 12:09:50 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 1 Jun 2022 12:09:50 -0700
Received: from [10.110.9.238] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 1 Jun 2022
 12:09:48 -0700
Message-ID: <4f289038-c5ca-ce55-edc8-45ff98efc716@quicinc.com>
Date: Wed, 1 Jun 2022 12:09:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] ath11k: fix missing srng_access_end in CE
Content-Language: en-US
To: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>,
	<ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220528142516.20819-1-ansuelsmth@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220528142516.20819-1-ansuelsmth@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_120953_607653_8ABB8479 
X-CRM114-Status: GOOD (  16.46  )
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
> When a CE completed send next operation is done, the srng access end is
> never called. Correctly end the srng access to make sure we have the
> correct values in the srng struct.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
> ---
>   drivers/net/wireless/ath/ath11k/ce.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
> index c14c51f38709..665205d2322e 100644
> --- a/drivers/net/wireless/ath/ath11k/ce.c
> +++ b/drivers/net/wireless/ath/ath11k/ce.c
> @@ -490,6 +490,8 @@ static struct sk_buff *ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe
>   	pipe->src_ring->sw_index = sw_index;
>   
>   err_unlock:
> +	ath11k_hal_srng_access_end(ab, srng);
> +
>   	spin_unlock_bh(&srng->lock);
>   
>   	spin_unlock_bh(&ab->ce.ce_lock);

NAK -- Not calling ath11k_hal_srng_access_end() is intentional.

CE_SRC ring is a special ring, we perform tx_request and tx_completion 
on the same ring. The completion processing frees SKBs associated to the 
ce_desc, this is what ath11k_ce_completed_send_next() does, it does not 
update the head pointer to hw because the ce_desc at hp does not have 
any new data, it is just available for new messages. ath11k_ce_send() 
retrieves a processed (processed by ath11k_ce_completed_send_next) 
ce_desc and sets it up for the new message. Then it updates the hw about 
the newly available ce_desc by calling ath11k_hal_srng_access_end().

If you want to do anything here, adding a comment based upon the above 
would be good.

/jeff

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
