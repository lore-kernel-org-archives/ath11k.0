Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65714C433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 15:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F7561213
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 15:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33F7561213
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wG761ypJze087hm2sdA5D9BWzsOFYiqEf7GRzjw9LG8=; b=g0tt2sflecV9wf
	vwblx4WIlu5t02JYF9/nA8b+lNbL4UJPTQsMF53II0VFS2HMHQUsToR6OuplobPr9elJaCRnKrBoQ
	tFOoPT1i0JFclGK576nceEI9nplnm214uxLww8aME2sZ41A3btzdJDZYFXHgKDvZyE9HOTxWiQNZR
	PYWBLyFv+rxQRACoeLHn8y+ltIrkWJO+MJTQ5ujmlQus8wsPZBRHbA9m++3bn1vGFsJ58UQOpm/FX
	D+6ie9fQkEOqyztR7K4qavuxtb/8sP6l1LlY4LWQn2JIU2d8gbAVgjxsBQMECvb1wtu8vHd1pTdP1
	+uQwdFeAUAAE5Oi375cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVEpU-007jTV-GA; Tue, 28 Sep 2021 15:15:36 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVEpF-007jQK-9r
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 15:15:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632842132; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=JDk7dCPVVNhR9ZQSMtm5M00Z4sbXWA4AtO7xCSL/wXg=;
 b=ft6AvPmmvSNiXYB6r57o51jaPN21FUK78yQhL7kuWNknRHUAjrox1uLlw5SQuqY8IhH4jV2Y
 IWcc+YHWk0rY+EyxXcB4ordApKpwkqR5cOWjtKQDvVG9AmmwEoOY1DpT6tM2vJlFi3ladiD0
 VBU+DUw/mE7lmcXyULBvCfT7d5c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6153303d1abbf21d348c0c98 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 15:09:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5E20AC4360C; Tue, 28 Sep 2021 15:09:48 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8DADAC4338F;
 Tue, 28 Sep 2021 15:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8DADAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>
Subject: Re: [PATCH 2/3] ath11k: change return buffer manager for QCA6390
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <20210914163726.38604-2-jouni@codeaurora.org>
Date: Tue, 28 Sep 2021 18:09:41 +0300
In-Reply-To: <20210914163726.38604-2-jouni@codeaurora.org> (Jouni Malinen's
 message of "Tue, 14 Sep 2021 19:37:25 +0300")
Message-ID: <87y27gpwi2.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_081533_157730_07615ABD 
X-CRM114-Status: GOOD (  14.54  )
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

> From: Baochen Qiang <bqiang@codeaurora.org>
>
> QCA6390 firmware uses HAL_RX_BUF_RBM_SW1_BM, not HAL_RX_BUF_RBM_SW3_BM.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -189,6 +189,14 @@ static const struct hal_srng_config hw_srng_config_template[] = {
>  	},
>  };
>  
> +const struct hal_param ath11k_hal_params_ipq8074 = {
> +	.rx_buf_rbm = HAL_RX_BUF_RBM_SW3_BM,
> +};
> +
> +const struct hal_param ath11k_hal_params_qca6390 = {
> +	.rx_buf_rbm = HAL_RX_BUF_RBM_SW1_BM,
> +};
> +
>  static int ath11k_hal_alloc_cont_rdp(struct ath11k_base *ab)
>  {
>  	struct ath11k_hal *hal = &ab->hal;
> diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
> index 35ed3a14e200..1bf6e040120f 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.h
> +++ b/drivers/net/wireless/ath/ath11k/hal.h
> @@ -903,6 +903,13 @@ struct ath11k_hal {
>  	int num_shadow_reg_configured;
>  };
>  
> +struct hal_param {
> +	enum hal_rx_buf_return_buf_manager rx_buf_rbm;
> +};
> +
> +extern const struct hal_param ath11k_hal_params_ipq8074;
> +extern const struct hal_param ath11k_hal_params_qca6390;

In the pending branch I renamed these to struct ath11k_hw_hal_params and
moved to hw.c and hw.h, respectively.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
