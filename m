Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DCFC433EF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:38:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EAD060F42
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EAD060F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqmKAiMS/iOEZR7NO2BF4V0he+CSZ2xlvTREkMH3sTs=; b=GBrqggF0WKKsxw
	ndLSVqQFGDIXiTFOW7M9JeyPfECrXm2bO0FEq4ExdC8YQdNnuoDf1ud5WtlzhgrN0BVIPz7tqlFaT
	ybiChDfg4Zjo5EtEo+O8ZNbinJK793wFWohB6zDPuHtAYeq3xD6Lzz2KnV/xWjqS8abNzNAmVkeJu
	/0WtEz9Cv5KQ/P+uFQcff2FFk4hkKcuFb4nVOXUwaKmSiniu83aOO9GykCZge74Pck75flQOu55Fa
	NGsk7h2pveJAXMWzt051WZBkgksqa2+TxeD9hHZlGHibR8064BM8AM5qQpBmbzAMp4jX2gX3wf6Rz
	byywiOX5NVBLJxEdoidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlS5E-009jN5-NB; Fri, 12 Nov 2021 08:38:52 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlS24-009iFb-Dr
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 08:35:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636706136; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=zDBZZqPDeuoxjm1KFejo7u0R55YpZgn4I6H6JDOqu2o=;
 b=wlMLsceSZbtObeFb+YlxhvvBBR1lg9JKjIapfquPPZCWTTR5rvNN7ovc+1SDLpaDlE0byFsg
 3MSHvh2gIF3Av5a6OrnTs5RqFqawJfnfVE4EC8PGPpmnuVrpc4nGKs/l6VuW2SD2nrDIve9q
 +pvi8DICCxds4chqJRaH0UdtG7E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 618e2757c829077eda7ebfa0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Nov 2021 08:35:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C2FDCC43619; Fri, 12 Nov 2021 08:35:34 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D354C4361A;
 Fri, 12 Nov 2021 08:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8D354C4361A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: P Praneesh <ppranees@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sriram R <srirrama@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: Re: [PATCH v3 03/12] ath11k: modify dp_rx desc access wrapper calls
 inline
References: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
 <1630560820-21905-4-git-send-email-ppranees@codeaurora.org>
Date: Fri, 12 Nov 2021 10:35:30 +0200
In-Reply-To: <1630560820-21905-4-git-send-email-ppranees@codeaurora.org> (P.
 Praneesh's message of "Thu, 2 Sep 2021 11:03:31 +0530")
Message-ID: <87wnldixf1.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_003536_588589_EE7E4C7C 
X-CRM114-Status: GOOD (  14.89  )
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

P Praneesh <ppranees@codeaurora.org> writes:

> In data path, to reduce the CPU cycles spending on descriptor access
> wrapper function, changed those functions as static inline.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1
>
> Co-developed-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: P Praneesh <ppranees@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 114 +++++++++++++++++---------------
>  1 file changed, 59 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 9a22481..b84c2db 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -20,13 +20,15 @@
>  
>  #define ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS (2 * HZ)
>  
> -static u8 *ath11k_dp_rx_h_80211_hdr(struct ath11k_base *ab, struct hal_rx_desc *desc)
> +static inline
> +u8 *ath11k_dp_rx_h_80211_hdr(struct ath11k_base *ab, struct hal_rx_desc *desc)
>  {
>  	return ab->hw_params.hw_ops->rx_desc_get_hdr_status(desc);
>  }

The compiler does not optimise small static functions like this
automatically to inline? I'm surprised. Or are you using some really old
compiler?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
