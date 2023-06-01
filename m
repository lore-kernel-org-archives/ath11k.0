Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E74C77B7A
	for <ath11k@archiver.kernel.org>; Thu,  1 Jun 2023 10:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlunPYQeIGvxCaY0+P4tTZJrjkxazdMZjRD6+Qrhndc=; b=RlvFTG5bQyiHzn
	i0c2obp8fbLmTMAwe4uCnG7IXUUYTEcfxlLCFxEBAemGoIgFArOAi0FSVTOco9wirvO4VyYJeWwkK
	KT3M3exYMeamfKC3EDlfQYDA9FEb1G/s668HiuDybSE1v5Og1zM+rUDIm+gnx2aPVAWmD95Us5NM1
	IAdZMNY/SJf9vhUHuyk14UW5pZ0QUZS9CUYCAGK9yOmRTnNFoZol+T2DN3B5fJCznUPTXcU8sRgnc
	uwcgAxc+BU3v6PnlEArME7Lbv3V4EHjcz1U/w/9OlECu7Q5PCuapaZg3watNlAWztwfWqYlYUNRlO
	bOcE66PyIw0b1jMMXm9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fSz-002xJi-1H;
	Thu, 01 Jun 2023 10:23:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fSx-002xHE-0A
	for ath11k@lists.infradead.org;
	Thu, 01 Jun 2023 10:23:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F154264339;
	Thu,  1 Jun 2023 10:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC90C433EF;
	Thu,  1 Jun 2023 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685615013;
	bh=nT3VqUSHcgSuYegNgg5ujoQ1kd3Z2W22ZLPHr9mqYyY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kdB1r85nkRPJsTa3J5/llQdYEbqQFQ6ex4utYBKDrVleZSsr2zJROuYenv6ggZ0GG
	 S2PlPMeSK45xF7JmpvC6E/zCtPEIsMxSXb/6YZhFfElXrm5jOuOFwRxiSPQQdMTinz
	 xBkKwY4SMjlgtVvS18XkrXBTa/76nCfmhi7Qsub8IVUcziywB6WobpduQ9LQ64cqXM
	 pTjAiiXrjIKqob6NKiPdkhSpcNY9ke39pK3Pb94lgaS1Lm3V/3pAhlgImBYoQm7ae/
	 VEC9zfNQOTbcW5OA+VSgUH5P4WVi55NlW0UsvhlaILXKdQfxj8L3f0Mxlc7D57r1Rm
	 t3eCqS0Jwew5w==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Govindaraj Saminathan <quic_gsaminat@quicinc.com>,  Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,  Kalle Valo <quic_kvalo@quicinc.com>
Subject: Re: [PATCH v4 3/4] wifi: ath11k: factory test mode support
References: <20230517135934.16408-1-quic_rajkbhag@quicinc.com>
	<20230517135934.16408-4-quic_rajkbhag@quicinc.com>
Date: Thu, 01 Jun 2023 13:23:29 +0300
In-Reply-To: <20230517135934.16408-4-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Wed, 17 May 2023 19:29:33 +0530")
Message-ID: <87cz2fjxb2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_032335_175272_BA6FB632 
X-CRM114-Status: GOOD (  20.48  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> From: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
>
> Add support to process factory test mode commands(FTM) for calibration.
> By default firmware start with NORMAL mode and to process the FTM commands
> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
> The pre-request is all the radios should be down before starting the test.
>
> When start command ATH11K_TM_CMD_TESTMODE_START is received, ar state
> is set to Test Mode. If the FTM command or event length is greater
> than 256 bytes, it will be broken down into multiple segments and
> encoded with TLV header if it is segmented commands, else it is sent
> to firmware as it is.
>
> On receiving UTF event from firmware, if it is segmented event, the driver
> will wait until it receives all the segments and notify the complete
> data to user application. In case the segmented sequence are missed or
> lost from the firmware, driver will skip the already received partial data.
>
> In case of unsegmented UTF event from firmware, driver notifies the
> data to the user application as it comes. Applications handles
> the data further.
>
> Command to boot in ftm mode:
>
> insmod ath11k ftm_mode=1
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Co-developed-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/testmode.h
> +++ b/drivers/net/wireless/ath/ath11k/testmode.h
> @@ -8,11 +8,16 @@
>  
>  #ifdef CONFIG_NL80211_TESTMODE
>  
> +void ath11k_tm_wmi_event(struct ath11k_base *ab, u32 cmd_id, struct sk_buff *skb);
>  int ath11k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
>  		  void *data, int len);
>  
>  #else
>  
> +void ath11k_tm_wmi_event(struct ath11k_base *ab, u32 cmd_id, struct sk_buff *skb)
> +{
> +}
> +

This introduced an warning and to fix it I changed it to static inline function.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
