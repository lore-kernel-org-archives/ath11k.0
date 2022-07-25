Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6919DC43334
	for <ath11k@archiver.kernel.org>; Mon, 25 Jul 2022 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXLaCCucZpBUr3hc4Ngwnvx7ba73J2hTggLdHlZaFBY=; b=0J6Jath/UkuWww
	kJe5KsI9Pi1cDDNGK+hqnOOuBeudTnhJDjTKnXI/Pp1OClBU8cfCXe3HeewZvY1lbOwe+FT9E+ysD
	VWDbxhdwyEO44zVeAgs2DuFxE7S+UP+v3cNLhHC1ztcnMLK4qMR/5aC3a2iG0P5ldICQFGHkVcykO
	mybeGjfH6ALDsQhSq2/SfiMwDPK7L77mRFYWKuv7UQ5ZQH9MGzLObM/Z+LdONRtiI/I7UtPqqgCEF
	4FEcmrOh9QquOtd8V4xarmz2rxY5mXN5AXlwPWBXVzPaHMjMNYZ3Rb+SBtQ7UMos56Y8uUb94ODO5
	7AOquuvXHGpkphK0IH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFwB8-008qrL-7K; Mon, 25 Jul 2022 11:23:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFwB5-008qpH-HF
	for ath11k@lists.infradead.org; Mon, 25 Jul 2022 11:23:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F9FB60F7E;
	Mon, 25 Jul 2022 11:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7B5C341C8;
	Mon, 25 Jul 2022 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658748190;
	bh=BVdjLwLxOOb/BTqcmnVSOT7tpDS8HiwfdQrWI1fdU4M=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=JCO18uHVn822/vHLs34I00heNZZKFBrNacEisIqzwqUg+UTTv00u0vzqJVffPkfH7
	 HsqIH1lDSpIMMo/5Cq+kbbcwpsqfWpRkH4fTZV7iE5g82HN2UBFTVsiDaPLf/jXmpE
	 7Od3y5OFs/L+FpY+JMW0i5vSgiZZEDpebzRz+EhWgcvM2s2uA3igqJ7VsXWsZuA+j4
	 vamXT0EL9RUqxPZwJWK5jzf2xBD77CyaaI1KBlCAvJ/diEGn7lMItY1plHdlIVk5Km
	 LEeZvD7MyOalF1UZYcT3YqQQkN1OjKUHtKcGLQ9OABsomu9QoWLjNho9zdjgufHU42
	 u3eOVyzaKvvgQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add support to get power save duration for each
 client
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220725054601.14719-1-quic_tamizhr@quicinc.com>
References: <20220725054601.14719-1-quic_tamizhr@quicinc.com>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165874818328.809.14159736625387988844.kvalo@kernel.org>
Date: Mon, 25 Jul 2022 11:23:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_042311_638068_20DF61E5 
X-CRM114-Status: GOOD (  13.62  )
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

Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> wrote:

> Add support to get the following power save information through debugfs interface,
> 
>  * Current ps state of the peer
>  * Time duration since the peer is in power save
>  * Total duration of the peer spent in power save
> 
> Above information is helpful in debugging the issues with power save clients.
> 
> This patch also add trace log support for PS timekeeper to track the PS state
> change of the peers alongs with the peer MAC address and timestamp.
> 
> Use the below commands to get the above power save information,
> 
> To know the time_since_station_in_power_save:
> cat /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/
> XX:XX:XX:XX:XX:XX/current_ps_duration
> 
> To know power_save_duration:
> cat /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/
> XX:XX:XX:XX:XX:XX/total_ps_duration
> 
> To reset the power_save_duration of all stations connected to AP:
> echo 1 > /sys/kernel/debug/ieee80211/phyX/ath11k/reset_ps_duration
> 
> To enable/disable the ps_timekeeper:
> echo Y > /sys/kernel/debug/ieee80211/phyX/ath11k/ps_timekeeper_enable
> Y = 1 to enable and Y = 0 to disable.
> 
> To record PS timekeeer logs after enabling ps_timekeeper:
> trace-cmd record -e ath11k_ps_timekeeper
> 
> Tested-on: Tested-on: IPQ8074 WLAN.HK.2.5.0.1-00991-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This failed to build:

drivers/net/wireless/ath/ath11k/wmi.c:6771:1: error: no previous prototype for 'ath11k_wmi_event_peer_sta_ps_state_chg' [-Werror=missing-prototypes]

I fixed it in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220725054601.14719-1-quic_tamizhr@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
