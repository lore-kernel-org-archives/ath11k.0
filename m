Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA0AC433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 14:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6068160F9C
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 14:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6068160F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5LCkS3+b5dEn+IavkLFi0kVjc8a7fT+h3edwVXrnGc=; b=T2ByyEM7n9vDRT
	mZl9r/uRg1td7ulHpOyvsocfordadDAPMX+fSSmPlYCYkqpt0Qb+tu7+ulKR9gCKFbhEgXwJhqM5s
	mI2ME776YaqthZZWM16XAvMhmV6a43PRzdABMSU2/bCypwofKpIy6OJYuoWmxcTR9m+Hp8oOGGvzU
	66ZXFPdStgKIPQHt+p9DScqFqDUSsL+tfdkd0hRnO1KUQ082Tjhu5vKM2S+DmrGaOSpd5BYK9wwhg
	qZ6z1lfOWcYhTcd8ziyhKvwOLis/TcFnKhbLfPPcO925VHA83U+wRvBd6OL0Wn8XQUTFv3uNP0Dcp
	WwApnPil55UU7sjZsomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTmWl-00EsFc-Cu; Fri, 24 Sep 2021 14:50:15 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTmWd-00EsER-2y
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 14:50:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632495012; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=IPy3De90pi9TJLFW7o3m3ltgiGwyZvzoByewFFcLi2Q=;
 b=lftxUW+mD4K8E8ZqWg0Yuuzws9RMjKAg/xvuKJ1URz7lAhALMPjq6qMTuPSJ93qxYpH/7QiS
 n/rpc3EezkEpFKSU3ncnc8uIq1bpLqiG5pIt1f0XlOT1KfYfjwWM9Rq7BAA+Eip0k1oqhM8r
 r20axl4WhJxexCRwbYVwCkcSCl0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 614de595e0f78151d61d81be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 14:49:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 33427C43460; Fri, 24 Sep 2021 14:49:57 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F726C4338F;
 Fri, 24 Sep 2021 14:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9F726C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 1/4] ath11k: use hw_params to access board_size and
 cal_offset
References: <20210721201927.100369-1-jouni@codeaurora.org>
 <20210721201927.100369-2-jouni@codeaurora.org>
Date: Fri, 24 Sep 2021 17:49:51 +0300
In-Reply-To: <20210721201927.100369-2-jouni@codeaurora.org> (Jouni Malinen's
 message of "Wed, 21 Jul 2021 23:19:24 +0300")
Message-ID: <87a6k2rptc.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_075012_579629_3B43DF2A 
X-CRM114-Status: GOOD (  19.28  )
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

> From: Anilkumar Kolli <akolli@codeaurora.org>
>
> Reuse board_size from hw_params, add cal_offset to hw params.
> This patch is clean up only, there is no change in functionality.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 10 +++++-----
>  drivers/net/wireless/ath/ath11k/hw.h   |  2 +-
>  drivers/net/wireless/ath/ath11k/qmi.c  |  4 ++--
>  drivers/net/wireless/ath/ath11k/qmi.h  |  2 --
>  4 files changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index c97830633f1f..d2ab3b134632 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -37,7 +37,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.fw = {
>  			.dir = "IPQ8074/hw2.0",
>  			.board_size = 256 * 1024,
> -			.cal_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
>  		},
>  		.max_radios = 3,
>  		.bdf_addr = 0x4B0C0000,
> @@ -87,7 +87,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.fw = {
>  			.dir = "IPQ6018/hw1.0",
>  			.board_size = 256 * 1024,
> -			.cal_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
>  		},
>  		.max_radios = 2,
>  		.bdf_addr = 0x4ABC0000,
> @@ -134,7 +134,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.fw = {
>  			.dir = "QCA6390/hw2.0",
>  			.board_size = 256 * 1024,
> -			.cal_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
>  		},
>  		.max_radios = 3,
>  		.bdf_addr = 0x4B0C0000,
> @@ -180,7 +180,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.fw = {
>  			.dir = "QCN9074/hw1.0",
>  			.board_size = 256 * 1024,
> -			.cal_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
>  		},
>  		.max_radios = 1,
>  		.single_pdev_only = false,
> @@ -226,7 +226,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.fw = {
>  			.dir = "WCN6855/hw2.0",
>  			.board_size = 256 * 1024,
> -			.cal_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
>  		},
>  		.max_radios = 3,
>  		.bdf_addr = 0x4B0C0000,
> diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
> index 5d150cd793b2..3a03e09563e7 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -128,7 +128,7 @@ struct ath11k_hw_params {
>  	struct {
>  		const char *dir;
>  		size_t board_size;
> -		size_t cal_size;
> +		size_t cal_offset;

You don't mention anything about cal_size. I'll add this to the commit
log:

cal_size was unused, so remove that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
