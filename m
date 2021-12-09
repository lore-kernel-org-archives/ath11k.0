Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ABFC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCI1ofqWHbPaF7ajsAViRh9sRQdNBSmyOZAaenKXWRM=; b=g3+F28cE/g4wdU
	Nz/6rOZFFi4ISq9yJNFHdN2tvDQ1JaZ5DeRZDxzVYsXt815P+ahQK3ICD0fhxjQRy1ZeAzSr96/Q3
	/SnbB0SrhJYSC9guQpzDjdifQf4A3cefZ5Y4Hp7xYO9ROXmhdKQs3iKSHQOSNTNDsDMlO+weCRqeA
	L4G7P1pQZM4jWe8yGcnqGldPUkjqcbsbZEeHqOE2G2hFZSFNqPQ91M4BcyCoKcPFCsNZG+M9wURV0
	P6tYIHkQhsxwRjNk7vywSzgeSDkx/cKWJ+nF5DfK9PmqEpNRTgw5FAyNHZL8JxWXeMqcTm6SLI7Nf
	Z21gDArTgQD6r/i2NtqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvLvB-00GcyO-N2; Thu, 09 Dec 2021 16:05:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvLv7-00Gcy0-Tz
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 16:05:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85136B8219F;
 Thu,  9 Dec 2021 16:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D5CC004DD;
 Thu,  9 Dec 2021 16:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639065919;
 bh=R1H1+X2TdX7qLWWKSZ+yPIZbGpjcqddy8hYUbMEIC4c=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=G5GWGhpc8gyekR9aLYkFOAPe2ylmbVjPnz5Yqr6iRou89jhMY0a8nEn5kPLkLD5+b
 T0/cwfg4nmJhwGrdT286l/5xXJeCQwghyDfc7pzMVFmIipvzxEacnDCTjYjSA1y2xA
 i6S6KXAj8GALRCjDHRchMTgMyevtgfFtw1LVyuB3QI+VYre0E4fkpF+9TiPId0PrGr
 8mTNcRDLyE4j8Aka9u9zxA0a9WrdZQsfwiS3rZCnoEEvgYAn+puaGPCmAb6ILNQ08Y
 ojRLixv63trqbRsZHAuoJRIDFq5OktQ+nfZVVJZ/AZz4ifqipn5sKS9wMNHwiIvoWV
 k6qzRCEK5lz0A==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-7-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 18:05:14 +0200
In-Reply-To: <20211011193750.4891-7-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:50 -0400")
Message-ID: <87lf0tydad.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_080522_129523_0BDB15AB 
X-CRM114-Status: GOOD (  11.62  )
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

Carl Huang <cjhuang@codeaurora.org> writes:

> Host sets GTK related info to firmware before WoW is enabled, and
> gets rekey replay_count and then disables GTK rekey when WoW quits.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -5850,6 +5850,41 @@ struct wmi_set_arp_ns_offload_cmd {
>  	 */
>  } __packed;
>  
> +#define GTK_OFFLOAD_OPCODE_MASK             0xFF000000
> +#define GTK_OFFLOAD_ENABLE_OPCODE           0x01000000
> +#define GTK_OFFLOAD_DISABLE_OPCODE          0x02000000
> +#define GTK_OFFLOAD_REQUEST_STATUS_OPCODE   0x04000000
> +
> +#define GTK_OFFLOAD_KEK_BYTES       16
> +#define GTK_OFFLOAD_KCK_BYTES       16
> +#define GTK_REPLAY_COUNTER_BYTES    8
> +#define WMI_MAX_KEY_LEN             32
> +#define IGTK_PN_SIZE                6
> +
> +struct wmi_gtk_offload_status_event {
> +	u32 vdev_id;
> +	u32 flags;
> +	u32 refresh_cnt;
> +	u8 replay_counter[GTK_REPLAY_COUNTER_BYTES];
> +	u8 igtk_key_index;
> +	u8 igtk_key_length;
> +	u8 igtk_key_rsc[IGTK_PN_SIZE];
> +	u8 igtk_key[WMI_MAX_KEY_LEN];
> +	u8 gtk_key_index;
> +	u8 gtk_key_length;
> +	u8 gtk_key_rsc[GTK_REPLAY_COUNTER_BYTES];
> +	u8 gtk_key[WMI_MAX_KEY_LEN];
> +} __packed;

[...]

> +	arvif->rekey_data.replay_ctr = le64_to_cpup((__le64 *)ev->replay_counter);
> +	/* supplicant expects big-endian replay counter */
> +	replay_ctr = cpu_to_be64(le64_to_cpup((__le64 *)ev->replay_counter));
> +
> +	ieee80211_gtk_rekey_notify(arvif->vif, arvif->bssid,
> +				   (void *)&replay_ctr, GFP_KERNEL);

Please avoid casting as much possible, and also otherwise this just
looks weird. Isn't ath11k WMI commands and events supposed to be in CPU
endian and the firmware automatically translates them if CPU is little
or big endian? So why do you cast ev->replay_counter to __le64 then?
Wouldn't that break on big endian?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
