Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0B0C433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 13:56:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16DF61050
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 13:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D16DF61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tplEejEyKfouPMVYF2oy9BiLTleQJsyGBCWWzxLTykM=; b=xbTZLvv3Oq4QUR
	7vCvN5TAcsiKSLc07twDa9qS5zmWbthhNfkbEUrz7H2mQETgvYWYmH5sVI41nX7oRKQ07zrikIBRT
	SLCmrtRjtGnIvvyxIER4zGNBrawfwj4hdiUKxspnWCo8G8cccG/SyKnvb/V73c5G4TRyM270l3TwK
	gwiitjVO4J8rDcf/N4i8BnNgIGwGfsCrwSkEp3v4w9vqMAITqVJYBIQL/fojg4cyCZeJ+tS6DgA+R
	Dhon6Tl675tNCzLxM+ZGdm5JeAmPREQKpKQ8xYQpzoJsvKYK7F/NKyhSkCh5un9Cztx/eC+84WqZc
	Mw0ZFXhhtjCaNnXfjg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTlgy-00El02-IL; Fri, 24 Sep 2021 13:56:44 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTld6-00EjTC-Br
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 13:52:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632491564; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=pcTVrwUuMYYa1fd+/Gk31WRvxLa+fVnV7jCDUBlS3a0=;
 b=UDZEB4sISv2D2KuYnn0QyHDEd2f72joRCh9GjujCfjmzkjZ1jOQ2Daphqu97SH+yhzlSztnh
 8cR8wvd8wAojjXWE/6KRl85Bw5z5J2ISflw9X7WNlbWwH0e8vjXqhzDjLHcoeTGrZhBriCHA
 fDuGO4EYxKfaZQi9PiuRjW8TlyU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 614dd829bd9e12ebc5cdf46a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 13:52:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6E563C43460; Fri, 24 Sep 2021 13:52:40 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D77EC4360D;
 Fri, 24 Sep 2021 13:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7D77EC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 1/3] ath11k: add htt cmd to enable full monitor mode
References: <20210721171905.61838-1-jouni@codeaurora.org>
 <20210721171905.61838-2-jouni@codeaurora.org>
Date: Fri, 24 Sep 2021 16:52:34 +0300
In-Reply-To: <20210721171905.61838-2-jouni@codeaurora.org> (Jouni Malinen's
 message of "Wed, 21 Jul 2021 20:19:03 +0300")
Message-ID: <87ilyqrsgt.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_065244_559203_1593400B 
X-CRM114-Status: GOOD (  19.80  )
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
> Add a new hw_param full_monitor_mode to enable full monitor support for
> QCN9074. HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to the
> firmware to enable the full monitor mode.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.c  |  4 ++
>  drivers/net/wireless/ath/ath11k/dp.h    | 74 +++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 48 ++++++++++++++++
>  drivers/net/wireless/ath/ath11k/dp_tx.h |  2 +
>  drivers/net/wireless/ath/ath11k/hw.h    |  1 +
>  5 files changed, 129 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 969bf1a590d9..3179495cb3c9 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -65,6 +65,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  					BIT(NL80211_IFTYPE_AP) |
>  					BIT(NL80211_IFTYPE_MESH_POINT),
>  		.supports_monitor = true,
> +		.full_monitor_mode = false,
>  		.supports_shadow_regs = false,
>  		.idle_ps = false,
>  		.cold_boot_calib = true,
> @@ -106,6 +107,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  					BIT(NL80211_IFTYPE_AP) |
>  					BIT(NL80211_IFTYPE_MESH_POINT),
>  		.supports_monitor = true,
> +		.full_monitor_mode = false,
>  		.supports_shadow_regs = false,
>  		.idle_ps = false,
>  		.cold_boot_calib = true,
> @@ -146,6 +148,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>  					BIT(NL80211_IFTYPE_AP),
>  		.supports_monitor = false,
> +		.full_monitor_mode = false,
>  		.supports_shadow_regs = true,
>  		.idle_ps = true,
>  		.cold_boot_calib = false,
> @@ -184,6 +187,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  					BIT(NL80211_IFTYPE_AP) |
>  					BIT(NL80211_IFTYPE_MESH_POINT),
>  		.supports_monitor = true,
> +		.full_monitor_mode = true,
>  		.supports_shadow_regs = false,
>  		.idle_ps = false,
>  		.cold_boot_calib = false,

wcn6855 was not updated, I added that.

> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -1034,6 +1034,15 @@ int ath11k_dp_tx_htt_monitor_mode_ring_config(struct ath11k *ar, bool reset)
>  	struct htt_rx_ring_tlv_filter tlv_filter = {0};
>  	int ret = 0, ring_id = 0, i;
>  
> +	if (ab->hw_params.full_monitor_mode) {
> +		ret = ath11k_dp_tx_htt_rx_full_mon_setup(ab,
> +							 dp->mac_id, !reset);
> +		if (ret < 0) {
> +			ath11k_err(ab, "failed to setup full monitor %d\n", ret);

I changed this to:

		if (ret) {
			ath11k_warn(ab, "failed to setup full monitor: %d\n", ret);
			return ret;
		}

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
