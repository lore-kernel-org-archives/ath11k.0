Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7295BC433F5
	for <ath11k@archiver.kernel.org>; Fri, 25 Mar 2022 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfOnRz6osAkyiBO8+l9XzB8F/gk3a6yV2ClsucGt54U=; b=cea/ebVlhm9bvZ
	YV3LaWhvAqsLMHTvErM+jufglQ0d2PKIYvej96nkV7c3JfN1+6GiWDACwSEhsJXa7p/BJeGUw9tke
	6n4vC6ajFWUVlIKAy/SGsOhspUVDQrcLyM55Aj/T4Pgoigg+dV13pM5tk4vv+FM85/UHfRdgvgiF0
	3fy22yun3c5KK9iqdAacC4UDZurlZPelzPnFEenNHJKctc6JjgSAeo/DdelSAQN4jRgU5QBeTdIh4
	fTnLTEy/XFDfCXsLxaPWGkQrvNsnfgqjRVE0VylgoQ8zqz37Sg7tKQ3f23EdefSZxyVCTiOK/v21O
	lfcVpxHHG6l5J3ckZ13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXhRm-001oZn-Vk; Fri, 25 Mar 2022 10:45:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXhRh-001oXb-Vs
 for ath11k@lists.infradead.org; Fri, 25 Mar 2022 10:45:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6BB8EB82703;
 Fri, 25 Mar 2022 10:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EBCC340E9;
 Fri, 25 Mar 2022 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648205127;
 bh=8FfUSBN/MqKEUt1dF6UlGFoqLXWVKYKCpSMOBXWYzGY=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=t63Tgpy9zexB1HQ9TH5xqPlcGxCtO+Zu/iUVzhEdLK22IQiKdzr0FY6yCoXs77c1W
 kh7vZ94NfjwyffF8YhDttIzjlQCnXRguJLYmnHpYM0EPhDS5UhtHhHHDVVCJI2sqf3
 CaXaoJ3PH9XdNRtvXjze2NKJlUOoIINh+58FfJve1Go34ntZnxbIme2ywujX0ye6nx
 zO5WlM8vSJv/HmHNzuiaoJh33b6bE3rY1WmpH+flyS+hJQVyxjlMORHewsxQqw+9N7
 iUDUYNgLjSrYbg05C+yzwpXNE6xYc6z6KDVd3tgfU5zIoMjFANITMPqCBI2YcN0FRa
 RZ3ufOMy7gFKA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: reduce the wait time of 11d scan and hw scan while
 add interface
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220322124226.18347-1-quic_wgong@quicinc.com>
References: <20220322124226.18347-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164820512408.2234.13144214774407671269.kvalo@kernel.org>
Date: Fri, 25 Mar 2022 10:45:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_034530_380644_9EE41C85 
X-CRM114-Status: GOOD (  18.36  )
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

I see new warnings in my regression tests:

[  755.217708] ath11k_pci 0000:06:00.0: failed to receive 11d scan complete: timed out
[  794.641670] ath11k_pci 0000:06:00.0: failed to receive 11d scan complete: timed out

Didn't investigate the patch in detail, gave up after seeing these warnings.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220322124226.18347-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
