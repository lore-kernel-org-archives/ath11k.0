Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2017C433F5
	for <ath11k@archiver.kernel.org>; Mon,  2 May 2022 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YiZrTsRe8oZpJSqt4ENhqUKzSWtXxbJ1LRiUpAdhyCk=; b=xCcr1M37BA7nG8
	/RET4Z9vx3Duap77IUlixM6cmJbSiFdzCnn8yLukAy5QbWXdPQI5pNmH/xAzDvZEQh80IbLyFHqV+
	eRmobij1W+Bz7biodauGseLC/XEGSCPJ9TuFNI4drKeCJImUcSY+AagC6A0WiVBhQzH0yDQ3c2o9b
	ZJGqC34R3t/wNCg7ORha6tYpbFjR1iUavA267GXqFODgj0zauesd9f+CHFRB3DHDq20UnTuEW8RQL
	vAHPxipSfa4jZhPmnjPXAcMJybsVb0c64nk9fJID580EC0FMNM9Ay0QK4GNbulmWrmsZmsBsAP+qK
	W3M/CZKYAUacXXZ9eenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlWXn-001KHX-Dt; Mon, 02 May 2022 13:56:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlWXi-001KHB-FM
 for ath11k@lists.infradead.org; Mon, 02 May 2022 13:56:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E89B160AC7;
 Mon,  2 May 2022 13:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3C5C385A4;
 Mon,  2 May 2022 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651499809;
 bh=qyL8unxF+GYrVSHUEoChKceFv97ML8X3CkWqmc1gLF8=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=LysZ0fWzWI48gQ/ZefycReTb23H9tvtrhmFLONjUOsfhbmC9XWTO1e2/zSnrvQcJ3
 g5yK6U4ogXvGflmyOV8vX5fWXgfabRnAbCGzSp9jTQiA10L2zEnOLmj9R4fbsLolbz
 Zor2fCRLb5gp7Is2rCK3JMforn73lKrIwKgx4DqT2V68vsHmGtVTry4G+CEhlpXz99
 yLaR+ufEz3mIOqgGuWP5Df7A7fudAoD9+zX3In+dZ6SMcjCUPSL3iYPKs0CO9kHlOQ
 ja2c6HvkNj2lYZ4V8UI2AfbiNA3b/MK5Dr5ExjEx2yHbUoZZdnfFVlq8NXFDvorP+d
 nosvcii0lbwXA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix warning of not found station for bssid in
 message
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220428022426.2927-1-quic_wgong@quicinc.com>
References: <20220428022426.2927-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165149980392.16977.654671468717148799.kvalo@kernel.org>
Date: Mon,  2 May 2022 13:56:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_065650_814922_E365BE71 
X-CRM114-Status: GOOD (  17.81  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When test connect/disconnect to an AP frequently with WCN6855, sometimes
> it show below log.
> 
> [  277.040121] wls1: deauthenticating from 8c:21:0a:b3:5a:64 by local choice (Reason: 3=DEAUTH_LEAVING)
> [  277.050906] ath11k_pci 0000:05:00.0: wmi stats vdev id 0 mac 00:03:7f:29:61:11
> [  277.050944] ath11k_pci 0000:05:00.0: wmi stats bssid 8c:21:0a:b3:5a:64 vif         pK-error
> [  277.050954] ath11k_pci 0000:05:00.0: not found station for bssid 8c:21:0a:b3:5a:64
> [  277.050961] ath11k_pci 0000:05:00.0: failed to parse rssi chain -71
> [  277.050967] ath11k_pci 0000:05:00.0: failed to pull fw stats: -71
> [  277.050976] ath11k_pci 0000:05:00.0: wmi stats vdev id 0 mac 00:03:7f:29:61:11
> [  277.050983] ath11k_pci 0000:05:00.0: wmi stats bssid 8c:21:0a:b3:5a:64 vif         pK-error
> [  277.050989] ath11k_pci 0000:05:00.0: not found station for bssid 8c:21:0a:b3:5a:64
> [  277.050995] ath11k_pci 0000:05:00.0: failed to parse rssi chain -71
> [  277.051000] ath11k_pci 0000:05:00.0: failed to pull fw stats: -71
> [  278.064050] ath11k_pci 0000:05:00.0: failed to request fw stats: -110
> 
> Reason is:
> When running disconnect operation, sta_info removed from local->sta_hash
> by __sta_info_destroy_part1() from __sta_info_flush(), after this,
> ieee80211_find_sta_by_ifaddr() which called by
> ath11k_wmi_tlv_fw_stats_data_parse() and ath11k_wmi_tlv_rssi_chain_parse()
> cannot find this station, then failed log printed.
> 
> steps are like this:
> 1. when disconnect from AP, __sta_info_destroy() called __sta_info_destroy_part1()
> and __sta_info_destroy_part2().
> 
> 2. in __sta_info_destroy_part1(),  it has "sta_info_hash_del(local, sta)"
> and "list_del_rcu(&sta->list)", it will remove the ieee80211_sta from the
> list of ieee80211_hw.
> 
> 3. in __sta_info_destroy_part2(), it called drv_sta_state()->ath11k_mac_op_sta_state(),
> then peer->sta is clear at this moment.
> 
> 4. in __sta_info_destroy_part2(), it then called sta_set_sinfo()->drv_sta_statistics()
> ->ath11k_mac_op_sta_statistics(), then WMI_REQUEST_STATS_CMDID sent to firmware.
> 
> 5. WMI_UPDATE_STATS_EVENTID reported from firmware, at this moment, the
> ieee80211_sta can not be found again because it has remove from list in
> step2 and also peer->sta is clear in step3.
> 
> 6. in __sta_info_destroy_part2(), it then called cleanup_single_sta()->
> sta_info_free()->kfree(sta), at this moment, the ieee80211_sta is freed
> in memory, then the failed log will not happen because function
> ath11k_mac_op_sta_state() will not be called.
> 
> Actually this print log is not a real error, it is only to skip parse the
> info, so change to skip print by default debug setting.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7330e1ec9748 ath11k: fix warning of not found station for bssid in message

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220428022426.2927-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
