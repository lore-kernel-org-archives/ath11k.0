Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA92C433FE
	for <ath11k@archiver.kernel.org>; Mon, 14 Feb 2022 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wl85wM0yRVS/mSq2mzlJaslbkqvFv9PBFZxqD/qIlD4=; b=eyWp8hQOCIEM0h
	mBTAx/4k/xInu/jAAo4KX2sFHo2yD2pC2BX196CD8ylhHlK4nAmZpQoGsU4J3nKkwsp/pBIHKzOzx
	y7TxwKozsjGm7vVfg6WJDEO0t3cl2prPEZlO5J7tl8pSlmlDBoRcEO8wmXx16iwLoppSeuTgThp9K
	2ohHEjJ/HwW7WYusf9atFmULSuJvLH05NS1UVuBRUUqJ2WsC7bXdjCK+7dryiuX2PVlnehF2A6nf1
	MxOHFPT+HQEMBzeeRQE023U4zC8jrpxKzkzj4N1zJ214K79QR/O7oeOpj7cAcG4x/O77r4JJcoK+g
	+2ihj090dGr0HVfnACww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJfQu-00GQM3-9c; Mon, 14 Feb 2022 17:46:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJfQr-00GQLm-Ez
 for ath11k@lists.infradead.org; Mon, 14 Feb 2022 17:46:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0308261597;
 Mon, 14 Feb 2022 17:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6E8C340E9;
 Mon, 14 Feb 2022 17:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644860796;
 bh=mFZfJESN5YPqbf4m7yXIntL7A7Gn9sYUSUGxG6+Wneg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Vtpv4AXYQWO//hWfi8mccIeP4Qagl9HXJXnrmimr/ZhXi1sDfgsE4GczHBltFl1qK
 b+nJgXBk6gucX+7lhasrXF8pr8xsIxCEpiAfhOIdyyAKMBsvNmcLg0TDSbT41kFrVd
 KSm2+FvKiFiYndeqjtUHfY9jV3x/y3FjtV5adrby/vjHx+n9t9c8HmdOMiiv9qnTMu
 uIzOyen8joDXhcz/H5MW+dyJWgc2SOck+cnoZUeXDjVAuoSxaxaRTwlDl9EtRUi1lm
 ImDbKfk4IpAjEzUN9ayLaJk+I1K4/yho9u/UD8s39lz0j5coKr5cZP1pkNumne8UD0
 ioxQIzsUmtuew==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: fix WARN_ON during ath11k_mac_update_vif_chan
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1644416019-820-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1644416019-820-1-git-send-email-quic_vnaralas@quicinc.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164486079376.4355.9676044145803792175.kvalo@kernel.org>
Date: Mon, 14 Feb 2022 17:46:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_094637_590318_05DFC96B 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> wrote:

> Fix WARN_ON() from ath11k_mac_update_vif_chan() if vdev is not up.
> Since change_chanctx can be called even before vdev_up from
> ieee80211_start_ap->ieee80211_vif_use_channel->
> ieee80211_recalc_radar_chanctx.
> 
> Do vdev stop followed by a vdev start in case of vdev is down.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

5ed98fb704d9 ath11k: fix WARN_ON during ath11k_mac_update_vif_chan
4f6dd92305f7 ath11k: fix radar detection in 160 Mhz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1644416019-820-1-git-send-email-quic_vnaralas@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
