Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5D1C433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFE460F94
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCFE460F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viKQZS7T9TdZT6Xv7C5NLOg4GujopXj9tVD0rcQhCRc=; b=b+6oqUZbumD6gw
	xBYAz8m+QEyE7nGsZsvmMgWwcdFPYt2J8pf0TCvHLdwUXOjU7ec19bDdEi+hGfPsSO/SE6bexiGCm
	EDrekzhwr0fSk+yJLTtU24lauVNcEi2VHmBeHmB9P42opAkP3WfxqwKZcgIckbIIB8iCVJfGc0QV2
	5TeDtUnm2H0U8N8qKKZoSzAKX9FGPiIiM4UJ5/k+dNwThHJY9r2obnldkEI8RrdHP4ZdLoiO4nln3
	plFmDns6KTnyTUMA8GiiG0XZbz6u1bA4+U3gOm979AdGw70ysJPFx+y4HRfzEFF0b55TuCvMnUojo
	eN1XGLx20eFen0bND4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVAds-006ptq-Mt; Tue, 28 Sep 2021 10:47:20 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVAdn-006psm-0l
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 10:47:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632826037; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=5VxBcWj7WadgElMm3An2ujPwLljXKPv67MUI7mVEm28=;
 b=gG8c7JudFw6i1bKo9w6MlWfQo39ZwzUWpNt+44CyEl03CnU1C0NFw3UJhiaMOWogRV30lZci
 YZgjkNE7OUXEQt4u4SVRnrmN/kzxcC69BkhV5XQdXJTrkBo7O1tEuvsPdy4PUNQ6YQKiP9Ar
 wVQZANJ1EPMkswQsLhvpjD4heqg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6152f2a93cc3a01f26291888 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 10:47:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 07212C43617; Tue, 28 Sep 2021 10:47:05 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4E98C4338F;
 Tue, 28 Sep 2021 10:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E4E98C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Rameshkumar Sundaram <ramess@codeaurora.org>,
 Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: Re: [PATCH 10/12] ath11k: Send PPDU_STATS_CFG with proper pdev mask
 to firmware
References: <20210721212029.142388-1-jouni@codeaurora.org>
 <20210721212029.142388-10-jouni@codeaurora.org>
Date: Tue, 28 Sep 2021 13:46:58 +0300
In-Reply-To: <20210721212029.142388-10-jouni@codeaurora.org> (Jouni Malinen's
 message of "Thu, 22 Jul 2021 00:20:27 +0300")
Message-ID: <87a6jxq8nx.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_034718_041651_802F3DBD 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Rameshkumar Sundaram <ramess@codeaurora.org>
>
> HTT_PPDU_STATS_CFG_PDEV_ID bit mask for target FW PPDU stats request
> message was set as bit 8 to 15. Bit 8 is reserved for soc stats and
> pdev id starts from bit 9. Hence change the bitmask as bit 9 to 15
> and fill the proper pdev id in the request message.
>
> Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01092-QCAHKSWPL_SILICONZ-1
> Tested on: IPQ6018 hw1.0 WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
>
> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
>
> Co-developed-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Rameshkumar Sundaram <ramess@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp.h    | 3 ++-
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
> index b2e7621969c5..522d3a6ce253 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.h
> +++ b/drivers/net/wireless/ath/ath11k/dp.h
> @@ -541,7 +541,8 @@ struct htt_ppdu_stats_cfg_cmd {
>  } __packed;
>  
>  #define HTT_PPDU_STATS_CFG_MSG_TYPE		GENMASK(7, 0)
> -#define HTT_PPDU_STATS_CFG_PDEV_ID		GENMASK(15, 8)
> +#define HTT_PPDU_STATS_CFG_SOC_STATS		BIT(8)
> +#define HTT_PPDU_STATS_CFG_PDEV_ID		GENMASK(15, 9)

This part is clear after reading the commit log.

> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -906,7 +906,7 @@ int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
>  		cmd->msg = FIELD_PREP(HTT_PPDU_STATS_CFG_MSG_TYPE,
>  				      HTT_H2T_MSG_TYPE_PPDU_STATS_CFG);
>  
> -		pdev_mask = 1 << (i + 1);
> +		pdev_mask = 1 << (ar->pdev_idx + i);
>  		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_PDEV_ID, pdev_mask);
>  		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK, mask);

But this part isn't. All I can see in the commit log is a vague comment
"and fill the proper pdev id in the request message" and nothing else.
Please provide a proper explanation for this change and I can then add
that to the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
