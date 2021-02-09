Return-Path: <SRS0=1RzP=HL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDEFC433E0
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 09:31:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A118E64ECA
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 09:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A118E64ECA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FX499outwW5pnad+I1oQpu/2b+dxNg78Rpx4nYQiLQE=; b=GygnFUq00eg0rqVw5NG0BlgV8
	JwUagRK7d4yZ+E46/7dff+RnBOd1uOMCIt4QzsT3dR3qYy21QyYxyHNvgBe3Uzc7D6nITemh9rC13
	9nwMzogXf9ZyNM0onq/636ODwQ7FgKD6cwBg9Ns103v+SBEKkh9AmLgdEBcmn+NH3i6z8GRlr/EuP
	4zQnl/+EfmmWq3Rpk3b8saWR77SzoCTxpuGdnZHY+mqR+346yO4uWZBu9IGG1p1iZcXmyeFjBRJHW
	bnwnzcJi7S4Bw2vTzYnliGT9U1D7DzBUKA11B0lC3v8oEas08jWiuMSLniGjAsXOkhHlkKH3yk85x
	V2tt2O07A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9PMO-0005Ue-Dw; Tue, 09 Feb 2021 09:31:04 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9PMK-0005Ty-8O
 for ath11k@lists.infradead.org; Tue, 09 Feb 2021 09:31:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612863061; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=zo0gvDHuV2hYczPP7dK3bMYetHdvog14VSL75+shPCc=;
 b=sPzsezelN0YamaHTo2PtlQC210T+oFjTcH4EHsVcIQh1okAFbQFbDTcpZCsiM5FGr1SoQzJb
 71zLf23KamLdH+0lzzRVBrHlHxetgGKzuH2oMbeQKYfc+p9EsP9/eBr4eKUy1QLFGWEAlzMd
 bi0l0gJh++s6kWoIbI2pSHGZPNc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6022563a81f6c45dcefb4c09 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 09:30:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 17771C43463; Tue,  9 Feb 2021 09:30:34 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5626FC433CA;
 Tue,  9 Feb 2021 09:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5626FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Subject: Re: [PATCH V4 2/2] ath11k: add debugfs for TWT debug calls
References: <20210120023048.5016-1-alokad@codeaurora.org>
 <20210120023048.5016-3-alokad@codeaurora.org>
Date: Tue, 09 Feb 2021 11:30:28 +0200
In-Reply-To: <20210120023048.5016-3-alokad@codeaurora.org> (Aloka Dixit's
 message of "Tue, 19 Jan 2021 18:30:48 -0800")
Message-ID: <87sg65io5n.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_043101_196426_C956ECBA 
X-CRM114-Status: GOOD (  19.90  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

+ ath11k

Aloka Dixit <alokad@codeaurora.org> writes:

> From: John Crispin <john@phrozen.org>
>
> These new debugfs files allow us to manually add/del/pause/resume TWT
> dialogs for test/debug purposes.
>
> The debugfs files expect the following parameters
> add_dialog	- mac dialog_id wake_intvl_us wake_intvl_mantis
> 		  wake_dura_us sp_offset_us twt_cmd flag_bcast
> 		  flag_trigger flag_flow_type flag_protection
> del_dialog	- mac dialog_id
> pause_dialog	- mac dialog_id
> resume_dialog	- mac dialog_id sp_offset_us next_twt_size
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/debug.h
> +++ b/drivers/net/wireless/ath/ath11k/debug.h
> @@ -64,4 +64,12 @@ do {								\
>  		__ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__);	\
>  } while (0)
>  
> +#ifdef CONFIG_MAC80211_DEBUGFS
> +void ath11k_debugfs_twt(struct ath11k_vif *arvif, bool enable);
> +#else
> +static inline void ath11k_debugfs_twt(struct ath11k_vif *arvif, bool enable)
> +{
> +}
> +#endif
> +
>  #endif /* _ATH11K_DEBUG_H_ */
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index c1608f64ea95..564cdf7a5331 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2111,6 +2111,8 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  			ath11k_wmi_send_twt_enable_cmd(ar, ar->pdev->pdev_id);
>  		else
>  			ath11k_wmi_send_twt_disable_cmd(ar, ar->pdev->pdev_id);
> +		if (vif->type == NL80211_IFTYPE_AP)
> +			ath11k_debugfs_twt(arvif, info->twt_requester);
>  	}

These hunks gave my deja vu and indeed I have provided comments before:

http://lists.infradead.org/pipermail/ath11k/2020-July/000039.html

I'll copy my comments here:

To make this more generic can you call this
ath11k_debugs_add_interface() or something like that? Ah, but this is in
ath11k_mac_op_bss_info_changed(). Shouldn't it be in
ath11k_mac_op_add_interface()?

Hmm, I think I get now. You create the debugfs directory and files only
when twt is actually enabled, not when the interface is added. I have
concerns about files coming and going like that dynamically. Wouldn't it
be cleaner to create the directory and the files when the interface is
added? And just return a good error code if someone tries to use the
debugfs files when twt is disabled?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
