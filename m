Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC786C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 16:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATphLe1xZvrruGlc6uiKQ3ME94uOHRV52UqVAZ0CA1o=; b=b89mr0CtNlHQ1m
	8gFUbXI++LkfcoWaU7/0qGFMjebLsp17PlV0AaHxn7+DOl5FZ1Q6uCqAR21i8vynR6PzKJ362eYZ3
	LFjHRBsz/PW+IWxmP7zKcZWa84TiMdkx1YCHmwrlpbk/V2CW+swsFcx9+Rk/YoUZh9cXovv6V4gNg
	mzZW/sNk1MBbrsXlik3QxKf1mFC7Nf3C61noiez9BQYQVli5s4GlxjWguoKDDcUtF3HESruj00UUX
	/imxlaXdkwsCaW+o1Xd/3GCd1LVdpn/d/yFv19258E0Xnx5aHiBfRwkj9hIbr+ww41PZI25On4+ei
	fYAdhe7Ob97a0/lukvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mudVZ-009TaA-9c; Tue, 07 Dec 2021 16:40:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mudVW-009TZD-14
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 16:39:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7FE2AB816F8;
 Tue,  7 Dec 2021 16:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DACEC341C1;
 Tue,  7 Dec 2021 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638895195;
 bh=1spnHwy4th204lc7pdZzCubOOyR435yRFE5cuojtAT4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=AnkrF1MHMmZ3aeaNmmg4u3PjbksJowuUf70GOulIAYKB01Z4QpjfOgz05Lm0aGI0I
 8Lr/eLqjdBGQTL9buA4OodT0pNF78KGJxS+vrfcfGgsgfjWpAk7oDAkudDJ9BUe2G/
 ciJnovd8VHowdEvTqLJhMB0li/rnBYigxuQllFprkRbZ67dLrlY4XSNobtGEHBHfaP
 HJV5flOf1gw5ar+GxLrALmpT8yWtywyE8g1rOXTVzCo7bVgCuguvorvFNCXx6Q5ucW
 5A4VbJ63vsSWiSkEu5aoA9EV8M9wonxZSErl7Oe4iMM/vNxMRLY13Q3PAxoXdy5WCe
 5MfR9NvpEnsYA==
From: Kalle Valo <kvalo@kernel.org>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCHv2 1/2] ath11k: add dbring debug support
References: <1637312901-10279-1-git-send-email-quic_vnaralas@quicinc.com>
Date: Tue, 07 Dec 2021 18:39:49 +0200
In-Reply-To: <1637312901-10279-1-git-send-email-quic_vnaralas@quicinc.com>
 (Venkateswara Naralasetty's message of "Fri, 19 Nov 2021 14:38:20
 +0530")
Message-ID: <8735n4nzca.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_083958_386477_E1F93CAA 
X-CRM114-Status: GOOD (  20.38  )
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> writes:

> Target copies spectral report and CFR report through dbring to
> host for further processing. This mechanism involves ring and
> buffer management in the Host, FW, and uCode, where improper
> tail pointer update issues are seen.
>
> This dbring debug support help to debug such issues by tracking
> head and tail pointer movement along with the timestamp at which
> each buffer is received and replenished.
>
> Usage:
>
> echo <module_id> <val> > /sys/kernel/debug/ath11k/ipq8074_2/
> mac0/enable_dbr_debug
>
> module_id: 0 for spectral and 1 for CFR
> val: 0 - disable, 1 - enable.
>
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

The commit log is really minimal and is not really describing the whole
implementation. For example, I see that you create a new directory
debugfs and the commit log mentions nothing about that.

What about other hardware like QCA6390 or WCN6855? You mention nothing
about those, how are they affected?

And to be honest, I'm not sure if this debug feature is really worth to
have in upstream due to the extra complexity it creates.

Also usually it's a good idea to have the fix first in the patchset and
then extra patches after the fixes. That way it's easy to take the fixes
and skip the extra patches.

Few comments when I was skimming this over:

> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -442,6 +442,7 @@ struct ath11k_debug {
>  	u32 pktlog_peer_valid;
>  	u8 pktlog_peer_addr[ETH_ALEN];
>  	u32 rx_filter;
> +	struct ath11k_db_module_debug *module_debug[WMI_DIRECT_BUF_MAX];

module_debug is not really a descriptive name for a field.

> --- a/drivers/net/wireless/ath/ath11k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs.c
> @@ -50,6 +50,45 @@ static const char *htt_bp_lmac_ring[HTT_SW_LMAC_RING_IDX_MAX] = {
>  	"MONITOR_DEST_RING",
>  };
>  
> +void ath11k_dbring_add_debug_entry(struct ath11k *ar,
> +				   enum wmi_direct_buffer_module id,
> +				   enum ath11k_db_ring_dbg_event event,
> +				   struct hal_srng *srng)
> +{

The style used in ath11k is that the second word describes the filename
the function is in. So this should be something like
ath11k_debugfs_add_dbring_entry().

> +	struct ath11k_db_module_debug *db_module_debug;

Similar naming for structs, please.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
