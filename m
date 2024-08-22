Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE41BC52D7C
	for <ath11k@archiver.kernel.org>; Thu, 22 Aug 2024 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nTjowvDhOTUyB4F0H0n2xGGFmLYWxSeGI86EXZL8Ys=; b=IoZE1wcts8MMFgB0emHjSQSYNK
	eXqoQV1fZCJjLTtwNFNjNELZp1btdpA1ozxPg7S4sZr015yq91D6deSfkdVRRtM9GJ6axthDytqYw
	9zS20SKEFpP9U8lOUauR94/elsEXwKL4zKrYjjANTMCkmO60+B+Jj39B5SFnPMzXiAaquzlS1qKQd
	gcM04Gv4Jp3BgDHnIHZegW82nEQ/hOUw/UaTo8AWgGSoepinjBas3QlF1FlSCixuMbufIqG7BRRq7
	JQ0GkViUoMDJPQtJDVw/qZPZ/BuDYs25YTjV6icc6vmwfqns27wClRz2OLYT16wl5icjZcabHWLeX
	apWrJ1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh5oq-0000000CY0X-0jrq;
	Thu, 22 Aug 2024 11:17:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh5od-0000000CXvd-0r9I
	for ath11k@lists.infradead.org;
	Thu, 22 Aug 2024 11:17:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 55AC6CE0B8A;
	Thu, 22 Aug 2024 11:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4B9C32782;
	Thu, 22 Aug 2024 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724325436;
	bh=q6nA+xULn1IKnQ25AEemK++PTuEK3oiJ89ePjZL2ASY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=THJbabcw7PmRrS6KFY8aT4EY4FpcJukzShgbi2Q5qMHZg592AblJqaLRgb17hIodQ
	 5IhJwsLToIXs6nKLmL478qiP32fQe3nzLqrQ7FL4LC5KPWtnXhC0EpKQa2XOrGV/UX
	 5FZZ4M5ci/SfvkjoV8uRyrMYFtpK6sL02jgVsatgQRucZPdQorTCEv5uJoopqF5fFT
	 glo2mitgtGO8KJ6ieQZ34JfMpmCiY+BAEHQppFN7CP44aVzNSMbsr9ycQ79K+zXhEv
	 S5wU+Cjx3j7phQnJ9pkg9uqgFS/+cg27S9d1ZTuPxu3VigD6jHURa/FcL7zPQR/ABk
	 piEnIznB8pqXA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH ath-current] wifi: ath11k: fix NULL pointer dereference in
 ath11k_mac_get_eirp_power()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240813083808.9224-1-quic_bqiang@quicinc.com>
References: <20240813083808.9224-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172432543412.2365229.4521966986927365757.kvalo@kernel.org>
Date: Thu, 22 Aug 2024 11:17:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_041719_669088_54E47021 
X-CRM114-Status: GOOD (  11.38  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Commit 39dc8b8ea387 ("wifi: mac80211: pass parsed TPE data to drivers") breaks
> ath11k, leading to kernel crash:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000018
> RIP: 0010:ath11k_mac_get_eirp_power.isra.0+0x5b/0x80 [ath11k]
> Call Trace:
>  <TASK>
>  ath11k_mac_fill_reg_tpc_info+0x3d6/0x800 [ath11k]
>  ath11k_mac_vdev_start_restart+0x412/0x4d0 [ath11k]
>  ath11k_mac_op_sta_state+0x7bc/0xbb0 [ath11k]
>  drv_sta_state+0xf1/0x5f0 [mac80211]
>  sta_info_insert_rcu+0x28d/0x530 [mac80211]
>  sta_info_insert+0xf/0x20 [mac80211]
>  ieee80211_prep_connection+0x3b4/0x4c0 [mac80211]
>  ieee80211_mgd_auth+0x363/0x600 [mac80211]
> 
> The issue scenario is, AP advertises power spectral density (PSD) values in its
> transmit power envelope (TPE) IE and supports 160 MHz bandwidth in 6 GHz. When
> connecting to this AP, in ath11k_mac_parse_tx_pwr_env(), the local variable
> psd is true and then reg_tpc_info.num_pwr_levels is set to 8 due to 160 MHz
> bandwidth. Note here ath11k fails to set reg_tpc_info.is_psd_power as TRUE due
> to above commit. Then in ath11k_mac_fill_reg_tpc_info(), for each of the 8
> power levels, for a PSD channel, ath11k_mac_get_psd_channel() is expected to
> be called to get required information. However due to invalid
> reg_tpc_info.is_psd_power, it is ath11k_mac_get_eirp_power() that gets called
> and passed with pwr_lvl_idx as one of the arguments. Note this function
> implicitly requires pwr_lvl_idx to be no more than 3. So when pwr_lvl_idx is
> larger than that ath11k_mac_get_seg_freq() returns invalid center frequency,
> with which as the input ieee80211_get_channel() returns NULL, then kernel
> crashes due to NULL pointer dereference.
> 
> Fix it by setting reg_tpc_info.is_psd_power properly.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: 39dc8b8ea387 ("wifi: mac80211: pass parsed TPE data to drivers")
> Reported-by: Mikko Tiihonen <mikko.tiihonen@iki.fi>
> Tested-by: Mikko Tiihonen <mikko.tiihonen@iki.fi>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219131
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

9abf199943a6 wifi: ath11k: fix NULL pointer dereference in ath11k_mac_get_eirp_power()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240813083808.9224-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


