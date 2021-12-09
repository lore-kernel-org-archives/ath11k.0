Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC148C4332F
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHQnx3jaE/o/481cHQTW33dSugJm3XsHKaAyk5DIpjo=; b=GtvtsvOCfS2dvW
	v7hXe1aG4bRljWBP9/ij3nhtKczjBo5Z5p/zzn4cZ6YudlatsHLAsI1ScUOjgoU5EYEk2dnf8X5r3
	TZA4ums3oCK7afJWCFBx2MhN6O++vo0IFRbD/HZMcHwpe7OILeMmAIyxnVTcS2rtWX4//0QV7D9AQ
	vfCFQLrfcm54SRxGheYxgTiMmAiysOJc8yxjRS/kwqP79+loxmZWVfp/9MAG1xL93qM/mxrwXv05/
	g5wDJssHNvoS7K2fjn0fJ2ndArEZBjkU2m8eqImZ5ct052Ug6FdeEnYxAuCmZxvLmTMn95eaaejWZ
	tBlhCZ0b/lGp6SYcLSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKxt-00GSzO-OI; Thu, 09 Dec 2021 15:04:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKxq-00GSyN-VO
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 15:04:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B73EB824B5;
 Thu,  9 Dec 2021 15:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716EDC004DD;
 Thu,  9 Dec 2021 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639062244;
 bh=8xs4YTLGZ98iWqV7F/ovnNkGI8pHbnjD07YgrV2I5Ig=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Y7nwfi+WLw9TyfVMQlQNfxkmQ1nTz44aFxVPOGXtel5T545sCFFMiIIPY6K05YRI/
 NRUw6o/56PWKvkjrFJu7eUP9jGCA4PBjB69idBCP+ZnSfswckC43iwmvgNKjU8rWSg
 wx6+q2lkkHCkmz++8YruJXityKNjhxW7MG9T57yCySrUZXMFr8BJdBgQ4iH57LjPKR
 /lFhPGRtAIigYKcI6/KPtv6odKj15nPIRkC2cgGijWSS2DJwE40K3xJAY8wY2li09z
 836jElyuEu4tDMHifSuLLQEDGdzx5qH0lLpHUzDg2BZwTOCzRXs7EvhNupLzaJbN0w
 Ehk9S7kWsqz6g==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/6] ath11k: Add WoW net-detect functionality
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-3-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 17:03:59 +0200
In-Reply-To: <20211011193750.4891-3-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:46 -0400")
Message-ID: <874k7h2528.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_070407_175023_D9DAB258 
X-CRM114-Status: GOOD (  16.82  )
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

> Implement net-detect feature by setting flag
> WIPHY_WOWLAN_NET_DETECT if firmware supports this
> feature. Driver sets the related PNO configuration
> to firmware before entering WoW and firmware then
> scans periodically and wakes up host if a specific
> SSID is found.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

[...]

> +static int ath11k_wmi_pno_check_and_convert(struct ath11k *ar, u32 vdev_id,
> +					    struct cfg80211_sched_scan_request *nd_config,
> +					    struct wmi_pno_scan_req *pno)
> +{
> +	int i, j;
> +	u8 ssid_len;
> +
> +	pno->enable = 1;
> +	pno->vdev_id = vdev_id;
> +	pno->uc_networks_count = nd_config->n_match_sets;
> +
> +	if (!pno->uc_networks_count ||
> +	    pno->uc_networks_count > WMI_PNO_MAX_SUPP_NETWORKS)
> +		return -EINVAL;
> +
> +	if (nd_config->n_channels > WMI_PNO_MAX_NETW_CHANNELS_EX)
> +		return -EINVAL;
> +
> +	/* Filling per profile params */
> +	for (i = 0; i < pno->uc_networks_count; i++) {
> +		ssid_len = nd_config->match_sets[i].ssid.ssid_len;
> +
> +		if (ssid_len == 0 || ssid_len > 32)
> +			return -EINVAL;

A define for 32 would be nice, WMI_MAC_MAX_SSID_LENGTH has a bad name
but I couldn't find anything better from wmi.h. sizeof(struct
wmi_ssid.ssid) might be other alternative.

But length from cfg80211 should be trustworthy anyway, so I'm not sure
if the check is even needed?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
