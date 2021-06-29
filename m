Return-Path: <SRS0=pU+T=LX=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1604C11F67
	for <ath11k@archiver.kernel.org>; Tue, 29 Jun 2021 17:35:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A904F61DE2
	for <ath11k@archiver.kernel.org>; Tue, 29 Jun 2021 17:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A904F61DE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gjmtr2sQyzZYJ2cUnDyxylJgmPFm60D5JxzPanbkL+4=; b=2DwuIPTKYxRA/Jj+47f1h8+VQ8
	LW3OOhS4GQmVS4gT91QT3aMClIjGAIRcK0xmcIGXi8eXLOay0x/qMVU6Xw4yliDVhVcswG+YkC+F6
	Iqm+2skCOv6Mczz8t3VeX5cb1XLIYQIZl0vt/DAY76bbV9NJClLIzrdwD4OVTvmICYoTz2stNkdhn
	WIxhlTr3AWsQ31RKpevczWGUrKK6mfksZTc/P1WHcsKObGhO0AL1JkOhUBg55A8CqL2yPDmQ8dUo1
	yepWyfIXApWDs+NH3mwH9QaL52m38BZfS3lmVJ/VnuQVqBVOvjWQ72XiUuMiSPhIXlfwR6W2F91/G
	jmMwO0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyHeM-00BjZx-DA; Tue, 29 Jun 2021 17:35:54 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyHeH-00BjXR-Mq
 for ath11k@lists.infradead.org; Tue, 29 Jun 2021 17:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TErmZqWBMVcl3qGHU0sym2lQ8P6yQw5zwZrfOKjvNeM=; b=UaQZyFYYf8Za7e1vBft+VuhYUE
 kwFxJED0Q9ugj4dYsNK2F3BwLV5Duasz28jgYW8JN7glxjZirSKB1CMPshZCo+rHol3lYl8fqyW3Z
 Sc6zFWmVPj6BZh951S36AltGqQGYg2aHhotHod25ryEClJPMnUGq9CbVndPiBUG4ch10=;
Received: from p54ae93f7.dip0.t-ipconnect.de ([84.174.147.247] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lyHeB-00088b-Sx; Tue, 29 Jun 2021 19:35:43 +0200
Subject: Re: [PATCH 12/12] ath11k: avoid unnecessary lock contention in
 tx_completion path
To: Jouni Malinen <jouni@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>
References: <20210615211407.92233-1-jouni@codeaurora.org>
 <20210615211407.92233-13-jouni@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <b1dbd11a-e978-16ea-1473-7eb81399981c@nbd.name>
Date: Tue, 29 Jun 2021 19:35:43 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615211407.92233-13-jouni@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_103550_020181_984D36AA 
X-CRM114-Status: GOOD (  16.12  )
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

On 2021-06-15 23:14, Jouni Malinen wrote:
> From: P Praneesh <ppranees@codeaurora.org>
> 
> Lock is not needed for the readable idr operation, so avoid spin_lock_bh
> for the idr_find() call. No need to disable the bottom half preempt if
> it is already in bottom half context, so modify the spin_lock_bh to
> spin_lock in the data tx completion handler.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2
> 
> Co-developed-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: P Praneesh <ppranees@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index ab9ccf0eb274..659f9d98bc0c 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -288,19 +288,18 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
>  	struct sk_buff *msdu;
>  	struct ath11k_skb_cb *skb_cb;
>  
> -	spin_lock_bh(&tx_ring->tx_idr_lock);
>  	msdu = idr_find(&tx_ring->txbuf_idr, msdu_id);
> -	if (!msdu) {
> +	if (unlikely(!msdu)) {
>  		ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
>  			    msdu_id);
> -		spin_unlock_bh(&tx_ring->tx_idr_lock);
>  		return;
>  	}
>  
>  	skb_cb = ATH11K_SKB_CB(msdu);
>  
> +	spin_lock(&tx_ring->tx_idr_lock);
>  	idr_remove(&tx_ring->txbuf_idr, msdu_id);
Why are you doing the lookups twice instead of just using the return
value of idr_remove?

- Felix

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
