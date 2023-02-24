Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1844C61DA3
	for <ath11k@archiver.kernel.org>; Fri, 24 Feb 2023 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftuh0C5XFAfvwsPMpl/Y9jV6Lwi/kYEHRRU9WZQeRmo=; b=eFPxD5j8iUVTHN
	lhvLCkulMXHPXPojnCA2y+rWyE12kHUqLHbLEv/2g/w8lm2A5l1CtpwPI4l8r6FffL8ZScxaxlWqQ
	JajX6df5wDPA/ZKeJrmvPK5WBZ/1CrKCQFIm1laSYScjdw+zUpUYZ+IeOtwum17IBUdZBvewwJ+p9
	kl2jO8m1rNV9fPQHbV0Vv2VSqGyxzZpbNESfV8EMFegLO+UtLaaMV8pshmDgdwAk29xpgi1/iQgcH
	GYgSO8KUYvgBXYrTuUw0YVPsdUxKixFBF9NDn7uLX4TgIGl1D5HXBUAvQEY5vsxj0Se9mfZA2c+4E
	R+SZXgJr/ZYmhd4v0UIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZOz-002oX3-6H; Fri, 24 Feb 2023 14:50:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZOw-002oWZ-SY
	for ath11k@lists.infradead.org; Fri, 24 Feb 2023 14:50:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72095618CF;
	Fri, 24 Feb 2023 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2255BC4339E;
	Fri, 24 Feb 2023 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677250221;
	bh=3KYModGEa1fFUiOUb3e6wEc1y8k/P7sxe/QwXRZ0OKc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qGHibDBPCsXXluVYelKbKM01+ZB6GWzXSZLPFqoFEn96mLloJ0DDUvEagcn2loaNO
	 fXKo/MPLbexwy+d/kInrZ58pU9ZMKMoEbBNNJynMhu32iFpy5t7bZyOn9C9ylGXWPP
	 IhUmembG7wbhL7QVhyBD1GRlsei1nVSm/JIKjlWcZQ01r0VyhWNuRk8XFn5HvhAGbN
	 5kHayr1gWZKPwUtIWTdrSrYsUgs4L5CSdNGsphj4Ka0VVm1L1hOKBHgWP2zN+OVvj6
	 0a+Vbs/om6JCWsDvpNUHMuzYtCjwaz3zavUnaWCH4MnrVyBKv5M9tvsbgXgPk32u1Q
	 /fWcr2cvXyHrQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] ath11k: Enable low power mode when WLAN is not active
References: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
	<20230203060128.19625-4-quic_mpubbise@quicinc.com>
Date: Fri, 24 Feb 2023 16:50:17 +0200
In-Reply-To: <20230203060128.19625-4-quic_mpubbise@quicinc.com> (Manikanta
	Pubbisetty's message of "Fri, 3 Feb 2023 11:31:28 +0530")
Message-ID: <87cz5zruc6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_065023_017465_EA6DC99B 
X-CRM114-Status: GOOD (  22.80  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> Currently, WLAN chip is powered once during driver probe and is kept
> ON (powered) always even when WLAN is not active; keeping the chip
> powered ON all the time will consume extra power which is not
> desirable for a battery operated device. Same is the case with non-WoW
> suspend, chip will never be put into low power mode when the system is
> suspended resulting in higher battery drain.
>
> As per the recommendation, sending a PDEV suspend WMI command followed
> by a QMI MODE OFF command will cease all WLAN activity and put the device
> in low power mode. When WLAN interfaces are brought up, sending a QMI
> MISSION MODE command would be sufficient to bring the chip out of low
> power. This is a better approach than doing hif_power_down()/hif_power_up()
> for every WiFi ON/OFF sequence since the turnaround time for entry/exit of
> low power mode is much less. Overhead is just the time taken for sending
> QMI MODE OFF & QMI MISSION MODE commands instead of going through the
> entire chip boot & QMI init sequence.
>
> Currently the changes are applicable only for WCN6750. This can be
> extended to other targets with a future patch.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

[...]

> +static int ath11k_ahb_core_start_ipq8074(struct ath11k_base *ab)
> +{
> +	/* TODO: Currently initializing the hardware/firmware only
> +	 * during hardware recovery. Support to shutdown/turn-on
> +	 * the hardware during Wi-Fi OFF/ON will be added later.
> +	 */
> +	if (!test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags))
> +		return 0;
> +
> +	return ath11k_core_start_device(ab);
> +}
> +
> +static void ath11k_ahb_core_stop_ipq8074(struct ath11k_base *ab)
> +{
> +	/* TODO: Currently stopping the hardware/firmware only
> +	 * during driver unload. Support to shutdown/turn-on
> +	 * the hardware during Wi-Fi OFF/ON will be added later.
> +	 */
> +	if (!test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags))
> +		return;
> +
> +	return ath11k_core_stop_device(ab);
> +}

Please clarify what Wi-Fi OFF/ON exactly means on these two comments,
it's not clear for me.

Also I want to mention that I suspect eventually we have to always power
off the firmware during suspend to get hibernation working:

https://bugzilla.kernel.org/show_bug.cgi?id=214649

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
