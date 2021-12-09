Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACB4C433FE
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slp7MkTZlsQiaIFE5t8uobXnHiRb2W+OaVsYMmpp+34=; b=yPObWXotDJZS3I
	5BK/XFMgqthcFO7r7zyVEAJyASWsOl5NUetSyb24fDz6pjg5QtdJdf3sOSQRfrqSeuvqBq6HAAfMm
	BqZvxpspQdK5WQdZg1ABJNTSGe+VpIT87CGKakEhwJYoY+qDUga6o6b7hYomX9f+E3hNaGuzdw6YV
	3y4U8brp0KYPpB0shqNtsLUJOkNtrA4lo6FEjfa8oextKVfBGxPGBMn3EET4a1PosTUwhGp6Ga6oz
	2XXALvAqd7AQBMOreQDB0/l+oe6LG9iMq1w0HXB62bU0UOTyExXNnNmvxxLXcCzu3LvWhtGbSS5CN
	bmrv7H7ZPeP9EVT3LPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKrr-00GSHf-8u; Thu, 09 Dec 2021 14:57:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKro-00GSGQ-1s
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 14:57:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B103AB824DE;
 Thu,  9 Dec 2021 14:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF0CC004DD;
 Thu,  9 Dec 2021 14:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639061869;
 bh=BVZ94vOOKF2+D+qOMzxpayOxuIQkS0uZBmwk3JHtwLs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=vGyo+o0ZDsxEtYVvJ6e+KTRqAcF73L72MF/Q+pryABXZ0XE4/j+aLvx/V68z32Vy4
 +QRYmZSE++CAoW1KSSR3NXEW2zSmoX/pbX1n0rwxnXz1qjJrEm7sogA9ov2vNe044y
 Eup4ZTIBKiMPQ8GtlEiJJPBJuC6Q0C21x4y3EMxECAKMvWnqtKaKHj3xWc8BuMK0zv
 VbPkaW9fCRKnbXlMVdpd4r6Hip5DajWEow4nd+5HqqWl9CSHxjHebxHvrIY+qLUZOZ
 EMEq4T8TIVy0wcaTmEzrRwC5mMXz/3yLYBHrEHFS6qrHHIC5rBXRODk86c1hGTOf68
 oc586/0WwHmdQ==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/6] ath11k: Add WoW net-detect functionality
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-3-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 16:57:46 +0200
In-Reply-To: <20211011193750.4891-3-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:46 -0400")
Message-ID: <878rwt25cl.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_065752_266977_95915538 
X-CRM114-Status: GOOD (  15.92  )
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

> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -5626,6 +5626,173 @@ struct wmi_wow_del_pattern_cmd {
>  	u32 pattern_type;
>  } __packed;
>  
> +#define WMI_PNO_MAX_SCHED_SCAN_PLANS      2
> +#define WMI_PNO_MAX_SCHED_SCAN_PLAN_INT   7200
> +#define WMI_PNO_MAX_SCHED_SCAN_PLAN_ITRNS 100
> +#define WMI_PNO_MAX_NETW_CHANNELS         26
> +#define WMI_PNO_MAX_NETW_CHANNELS_EX      60
> +#define WMI_PNO_MAX_SUPP_NETWORKS         WLAN_SCAN_PARAMS_MAX_SSID
> +#define WMI_PNO_MAX_IE_LENGTH             WLAN_SCAN_PARAMS_MAX_IE_LEN
> +
> +/*size based of dot11 declaration without extra IEs as we will not carry those for PNO*/

The comment style is:

/* foo bar */

That is add space after and before asterisk.

> +
> +		memcpy(pno->a_networks[i].ssid.ssid,
> +		       nd_config->match_sets[i].ssid.ssid,
> +		       nd_config->match_sets[i].ssid.ssid_len);
> +		pno->a_networks[i].authentication = 0;
> +		pno->a_networks[i].encryption     = 0;
> +		pno->a_networks[i].bcast_nw_type  = 0;
> +
> +		/*Copying list of valid channel into request */

Same here.

> @@ -433,8 +592,14 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
>  	ath11k_hif_irq_enable(ar->ab);
>  
>  	ret = ath11k_wow_wakeup(ar->ab);
> -	if (ret)
> +	if (ret) {
>  		ath11k_warn(ar->ab, "failed to wakeup from wow: %d\n", ret);
> +		goto exit;
> +	}
> +
> +	ret = ath11k_wow_nlo_cleanup(ar);
> +	if (ret)
> +		ath11k_warn(ar->ab, "failed to cleanup nlo: %d\n", ret);
>  
>  exit:
>  	if (ret) {

For consistency please add goto exit also for ath11k_wow_nlo_cleanup().

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
