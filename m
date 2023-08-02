Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C742C00528
	for <ath11k@archiver.kernel.org>; Wed,  2 Aug 2023 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcndBGkaQXB72gOKGJCyQTlbxmW9CJ/MJy1Zl5v55ZE=; b=YaOiaEb2fOknk2
	JWQQXfq/3ngd5lbM4XpIhQHox4IKv6lgCaLjcBDVaBXJfNl8HhL5tEOf+woWm2Zy1c/LtPTAJ+7L4
	ZXqRAQF4MD7JlSl8Bi9ZfP9OZv5DzshZdjlOA39yAPQSHRAnS41FC+AFkDdRUbv+TZ/5CBRR6m6LV
	GfrDiC8wdotkI95bpWetPf+mcoo1Wr/t15HMdqKWz6REyHczZwwS1RSd2HHkGzZshVfWwqFHctsek
	OJa8kpdu7OEWIifwxiW3HPYLcta6MRzp+py57X4so3EqxUQqTZnlvf34CtnflGQNp2YBmIlxcu5xL
	EWm4bKt/X9Juhj3ZmPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRAIY-004plc-02;
	Wed, 02 Aug 2023 11:45:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRAIU-004plC-2i
	for ath11k@lists.infradead.org;
	Wed, 02 Aug 2023 11:45:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53F0A61941;
	Wed,  2 Aug 2023 11:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19DFC433C7;
	Wed,  2 Aug 2023 11:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690976745;
	bh=zwoKG3lx3jesoWIM65Zml8EW8Hft2kRROiIGMP7TCKs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YR9WmRRwYB3w+kXXEB0NwMed/Q9l1QF6KxLe8+Jc3GC31rsCeu35OGfprLGtoQg8O
	 9k7hsNstZgCi5AdFiAPd0Nd5ptrHI/zadBnV/0MxNHZSRmjOxDyfHX8LYgBkcD429n
	 OMskULJz0rFqqP4Lhyp7HSutYKQo5ii3PaQKy+er1bQqNaCHrrPo2+s42IUSk3Jba/
	 lJoh0UzC8N5HfDF/ChVsT9xN8JkOVmw3yM9zCmclvcmRApBVIVVgFzxYoCA7eEtkA4
	 UriD/OpjUudKHWGnUWk3QO03APkwJ9K+BD3WtXHCZCYMkYNmz2+YojfTu1Vbk2jlK4
	 pFL4BeqtKCePQ==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] wifi: ath11k: add support to select 6 GHz
 Regulatory type
References: <20230607094810.26707-1-quic_wgong@quicinc.com>
	<20230607094810.26707-2-quic_wgong@quicinc.com>
Date: Wed, 02 Aug 2023 14:45:43 +0300
In-Reply-To: <20230607094810.26707-2-quic_wgong@quicinc.com> (Wen Gong's
	message of "Wed, 7 Jun 2023 05:48:06 -0400")
Message-ID: <87v8dxvfa0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_044546_924346_971AD8C0 
X-CRM114-Status: GOOD (  11.63  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> There are 3 types of regulatory rules for AP mode and 6 type for
> station mode. Add wmi_vdev_type and ieee80211_ap_reg_power to
> select the exact reg rules.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/reg.c
> +++ b/drivers/net/wireless/ath/ath11k/reg.c
> @@ -607,25 +607,64 @@ ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
>  	*rule_idx = i;
>  }
>  
> +enum wmi_reg_6ghz_ap_type
> +ath11k_ieee80211_ap_pwr_type_convert(enum ieee80211_ap_reg_power power_type)
> +{
> +	switch (power_type) {
> +	case IEEE80211_REG_LPI_AP:
> +		return WMI_REG_INDOOR_AP;
> +	case IEEE80211_REG_SP_AP:
> +		return WMI_REG_STANDARD_POWER_AP;
> +	case IEEE80211_REG_VLP_AP:
> +		return WMI_REG_VERY_LOW_POWER_AP;
> +	default:
> +		return WMI_REG_MAX_AP_TYPE;
> +	}

Rename to something like ath11k_reg_ap_pwr_convert()? And this can be a
static function, I don't see it used outside of reg.c.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
