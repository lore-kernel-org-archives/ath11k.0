Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD6AC433EF
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 08:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkogjUlMOH1rg8d86y4v2CCGjmzI+1QBK0EiWfEpk4M=; b=nTGd/x+WU0Z5M/
	nPU9ofZEvFd3K/UE1SfpGWBraC3ZsdmtLMWbr6G9+EoEGefkWn9ijqrtuXhtFUBXRG7OyMpcFH9Mw
	qYfhXN7PrEQOuYviCPHzNhL7XKmgv7DxSeBi/F7s2R0tmYW+9tKN/68nPiy1dOEZPIDmeHfnhb28S
	7zuPfzSmbIOJE8qLiNJZlwH8S41k2ozXCOR8OON4oTCA+9mQ5tRHUrcpzl8P0ZCnH8siAIDeAVPf6
	2qcf1aHndyDLszMvJENi7KNEICMBuryPbJN2pFP0Le/CeWLNHR4o2kWQNdqiUrSEc2Kk/afuoNUKF
	qtGDTe04qYiQKMIf/+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTMQ-00EhCe-NO; Wed, 30 Mar 2022 08:07:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTMN-00EhBv-VV
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 08:07:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D149617E6;
 Wed, 30 Mar 2022 08:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03264C340EC;
 Wed, 30 Mar 2022 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648627639;
 bh=VeqVUHrwVumQkd/+UiBnyW9Un4ZO7zwAY3fgeshHU4g=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=nLIh3E9B7EknvVUTaYGP7itaLzZ5Kgoa0IumWbg0de/g6j/3BSKe1BzqrR2dQ3F/G
 Y3qSQGtjMCufKzL/B5pFnhLAHMklNel80iu0aRcMIuIq4uLyOmmRfYkc6ZaiPboDYZ
 8vL2Iv/yVitvt2WRPGK0jVYPM8sVnZj3bXhSOAsMlgXUPSp7ahm19aGXHRo4JQ4EAR
 w64+S98oaR6df5FUQd72vld4UlMeiIyIirYS1bqC6SiRO51cS7nbr6nrmKiPBXK4H8
 p29cXnMbIedjGo4xDNaYNI04OEU2LCM9iM7snoJhOWk3GeAY8G2Mj5vV65WQWpFE2d
 u7g+TWKEV5Cmg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: reduce the wait time of 11d scan and hw scan
 while add interface
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220328035832.14122-1-quic_wgong@quicinc.com>
References: <20220328035832.14122-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164862763578.10264.10006075245448797606.kvalo@kernel.org>
Date: Wed, 30 Mar 2022 08:07:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_010720_127144_817CFC41 
X-CRM114-Status: GOOD (  17.43  )
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

> Currently ath11k will wait 11d scan complete while add interface in
> ath11k_mac_op_add_interface(), when system resume without enable
> wowlan, ath11k_mac_op_add_interface() is called for each resume, thus
> it increase the resume time of system. And ath11k_mac_op_hw_scan()
> after ath11k_mac_op_add_interface() also needs some time cost because
> the previous 11d scan need more than 5 seconds when 6 GHz is enabled,
> then the scan started event will indicated to ath11k after the 11d
> scan completed.
> 
> While 11d scan/hw scan is running in firmware, if ath11k update channel
> list to firmware by WMI_SCAN_CHAN_LIST_CMDID, then firmware will cancel
> the current scan which is running, it lead the scan failed. The patch
> commit 9dcf6808b253 ("ath11k: add 11d scan offload support") used
> finish_11d_scan/finish_11d_ch_list/pending_11d to synchronize the 11d
> scan/hw scan/channel list between ath11k/firmware/mac80211 and to avoid
> the scan fail.
> 
> Add wait operation before ath11k update channel list, function
> ath11k_reg_update_chan_list() will wait until the current 11d scan/hw
> scan completed. And remove the wait operation of start 11d scan and
> waiting channel list complete in hw scan. After these changes, resume
> time cost reduce about 5 seconds and also hw scan time cost reduced
> obviously, and scan failed not seen.
> 
> The 11d scan is sent to firmware only one time for each interface added
> in mac.c, and it is moved after the 1st hw scan because 11d scan will
> cost some time and thus leads the AP scan result update to UI delay.
> Currently priority of ath11k's hw scan is WMI_SCAN_PRIORITY_LOW, and
> priority of 11d scan in firmware is WMI_SCAN_PRIORITY_MEDIUM, then the
> 11d scan which sent after hw scan will cancel the hw scan in firmware,
> so change the priority to WMI_SCAN_PRIORITY_MEDIUM for the hw scan which
> is in front of the 11d scan, thus it will not happen scan cancel in
> firmware.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: 9dcf6808b253 ("ath11k: add 11d scan offload support")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1f682dc9fb37 ath11k: reduce the wait time of 11d scan and hw scan while add interface

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220328035832.14122-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
