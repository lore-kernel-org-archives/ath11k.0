Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD86C07E9D
	for <ath11k@archiver.kernel.org>; Sat, 24 Sep 2022 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yu4pzU/iSt5Se4os8hxIs2TeQtCiAe918k+toRSd9u8=; b=F4cscKg7+iKp3s
	FVXktkcrJJd06J9eh/OVHVYyEvhTp0XlWvcvHXRGkhcUu+tjlzaxChNBG+lx81DPSufFq0dLsr6Yp
	I43t5/aIiZ2TDD/pyNDnzIpH+k3KNvWanTR+q7o4t4KI4t63P93XOshthjHMcUE44yJ7Z2rzqZLh4
	OGlB1Zvk4YBRo65XK24nlSV86M5MjH8kAPeDOxFoi+iBh8s5wi8/QkfDZKESSMn1M/APSoyoMEh7T
	J6qMItk/TwHKikwBm4aXxeDNG0tf3/5zpzWKUDhOrf5PAr7PD8s8UaxQVrkRtp/MQ1yxLjYRVOgZm
	bkbDDkuTFf/eifbeq3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc5Qd-007I9U-Dn; Sat, 24 Sep 2022 13:42:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc5Qa-007I8c-NT
	for ath11k@lists.infradead.org; Sat, 24 Sep 2022 13:42:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BA8660921;
	Sat, 24 Sep 2022 13:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BB2C433D6;
	Sat, 24 Sep 2022 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664026962;
	bh=pw21qSEFcSihTyQSxp+ab2bgezDBBRwpASZx4DZ6rkU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=c1zQ/p5wHNuqBvMOWsAuU9h4/ul7HZgX5mSnePN67ZZb659v5UYneDUUQVNqfdgt1
	 XqJPZYVxvWKApy1ntBNMZK7+is15YWQ9V+W/zbZEpwaabh9Zojh6h0pFMVA7HAOh4/
	 IL6PfJSecUbRm/i2Zn8cvgoXeBqCbxrdIwhAiPN2piBxcWDNvQp9PGO/AEA7ID0DnA
	 RMQFN3ACN5TMnLegKegM259lUIm75vFEYNcA/iMOtxLNFdFS32ZX8CkHAAJZN6nlOl
	 WRHw+PttAL61Bs4YYUaQ0SCeOu5fyvwMyNlWN6SPO95dk1W46cR/VXmeUiM1MpqGHE
	 svIJpgwGHb4QQ==
MIME-Version: 1.0
Subject: Re: [RFC PATCH] ath11k: fix peer addition/deletion error on sta band
 migration
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220603164559.27769-1-ansuelsmth@gmail.com>
References: <20220603164559.27769-1-ansuelsmth@gmail.com>
To: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166402695696.26031.9505362425137556252.kvalo@kernel.org>
Date: Sat, 24 Sep 2022 13:42:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_064244_895217_10DEA513 
X-CRM114-Status: GOOD (  23.63  )
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

Christian 'Ansuel' Marangi <ansuelsmth@gmail.com> wrote:

> This patch try to fix the following error.
> 
> Wed Jun  1 22:19:30 2022 kern.warn kernel: [  119.561227] ath11k c000000.wifi: peer already added vdev id 0 req, vdev id 1 present
> Wed Jun  1 22:19:30 2022 kern.warn kernel: [  119.561282] ath11k c000000.wifi: Failed to add peer: 28:c2:1f:xx:xx:xx for VDEV: 0
> Wed Jun  1 22:19:30 2022 kern.warn kernel: [  119.568053] ath11k c000000.wifi: Failed to add station: 28:c2:1f:xx:xx:xx for VDEV: 0
> Wed Jun  1 22:19:31 2022 daemon.notice hostapd: wlan2: STA 28:c2:1f:xx:xx:xx IEEE 802.11: Could not add STA to kernel driver
> Wed Jun  1 22:19:31 2022 daemon.notice hostapd: wlan2: STA 28:c2:1f:xx:xx:xx IEEE 802.11: did not acknowledge authentication response
> Wed Jun  1 22:19:31 2022 daemon.notice hostapd: wlan1: AP-STA-DISCONNECTED 28:c2:1f:xx:xx:xx
> Wed Jun  1 22:19:31 2022 daemon.info hostapd: wlan1: STA 28:c2:1f:xx:xx:xx IEEE 802.11: disassociated due to inactivity
> Wed Jun  1 22:19:32 2022 daemon.info hostapd: wlan1: STA 28:c2:1f:xx:xx:xx IEEE 802.11: deauthenticated due to inactivity (timer DEAUTH/REMOVE)
> 
> To repro this:
> - Have 2 Wifi with the same bssid and pass on different band (2.4 and
> 5GHz)
> - Enable 802.11r Fast Transaction with same mobility domain
> - FT Protocol: FT over the Air
> From a openwrt system issue the command (with the correct mac)
> ubus call hostapd.wlan1 wnm_disassoc_imminent '{"addr":"28:C2:1F:xx:xx:xx"}'
> Notice the log printing the errors.
> 
> The cause of this error has been investigated and we found that this is
> related to the WiFi Fast Transaction feature. We observed that this is
> triggered when the router tells the device to change band. In this case
> the device first auth to the other band and then the disconnect path
> from the prev band is triggered.
> This is problematic with the current rhash implementation since the
> addrs is used as key and the logic of "adding first, delete later"
> conflicts with the rhash logic.
> In fact peer addition will fail since the peer is already added and with
> that fixed a peer deletion will cause unitended effect by removing the
> peer just added.
> 
> Current solution to this is to add additional logic to the peer delete,
> make sure we are deleting the correct peer taken from the rhash
> table (and fallback to the peer list) and for the peer add logic delete
> the peer entry for the rhash list before adding the new one (counting as
> an error only when a peer with the same vlan_id is asked to be added).
> 
> With this change, a sta can correctly transition from 2.4GHz and 5GHZ
> with no drop and no error are printed.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 7b0c70d92a43 ("ath11k: Add peer rhash table support")
> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d673cb6fe6c0 wifi: ath11k: fix peer addition/deletion error on sta band migration

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220603164559.27769-1-ansuelsmth@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
