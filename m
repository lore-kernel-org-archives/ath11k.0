Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF64C07E9D
	for <ath11k@archiver.kernel.org>; Mon, 26 Sep 2022 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tQ8qJrvEGmfMmp/iUqIxA8UGLiGFekHCSjVJ+7wVfw=; b=yr7Tgwr04RL1Rp
	jeP0D5W/XH0K0hqoojcPsodsMm8PIPuuPuLfBMTF/4g1YfuACH8L55unDRkSDG2ZxqGBpLhCiYm0X
	4IyG3rOYYI3FogV5Oymzba7Z6RFF1bNjq6HudFV4lq3NsB62O9hnCyXLO1S9hTXM5rx6Cl4wjLgST
	p1DCIFOv+w2+bYgylLA/m1V1/0Q3UTr4i6qLGeb8lWKAP9RutGZA6hGkltEMG/nanezujed8WUsiz
	S2bSHLyUGUZ8/tQ2UbmjmdRhniAmur7hbaWlXiR/yKIpTAfsXK4vLWH1nM4h6pzG38QaoMRyyNcU+
	vCKHPUPYH3LZ/vHOhlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockVs-003g1E-1b; Mon, 26 Sep 2022 09:34:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockVp-003fzs-Uc
	for ath11k@lists.infradead.org; Mon, 26 Sep 2022 09:34:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A889B60AB0;
	Mon, 26 Sep 2022 09:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AEFC433D6;
	Mon, 26 Sep 2022 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664184892;
	bh=keryL8x5WQ7BOAAsT9qNGImfmldpWW17GqsPeM7DcLY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=g/8UANutZ9YJFO4wALhZq+j0Hin6Xmq/vk4Ic7IPEpneSjWoSHHc2tcWaYXLYFbbn
	 2sVVwDYZvW4i0yi6BKAGA+GHne800fM7qhQQKMxfUii4OmI7yX9mM4HW/cVgDc0+CL
	 64N9TWiy4oR/i+JhTg5vWR9HKe8phy70RX9KG/V945sFwPZxSO7vKr2LfOMN1IuyCB
	 pGeH2tk+W8o9aBmLWoUGo/uQsfcydiaqAxC0cCjQSTx1YrGLHdh7OQ/4QmfzguZfZ4
	 FVABymthhL3kt9WDjy7zNt+5b1wGVre/wGgVk0wrGHyYTPzWzK8dMfwAdVpTtiNDik
	 p9gwhtGb1v+Zg==
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
Message-ID: <166418488625.13691.4613820697908403573.kvalo@kernel.org>
Date: Mon, 26 Sep 2022 09:34:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_023454_069073_053FAD0D 
X-CRM114-Status: GOOD (  12.67  )
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
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

710a95f95586 wifi: ath11k: Add support to get power save duration for each client

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220725054601.14719-1-quic_tamizhr@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
