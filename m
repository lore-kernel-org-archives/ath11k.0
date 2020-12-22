Return-Path: <SRS0=oWPw=F2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A119C433E0
	for <ath11k@archiver.kernel.org>; Tue, 22 Dec 2020 03:29:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E0022B2D
	for <ath11k@archiver.kernel.org>; Tue, 22 Dec 2020 03:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2E0022B2D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aXLDDQMqanz9Ke9UhBM6R3tapPjTCvn/8uOkxpXkwiY=; b=wbeDUL5nkxaXsQtmv53whCgQBG
	HpKkEMLe9cwS788fam+aV1P6KYovsXqqew/rtTq+bDk3EyVq6NuMPxC6AWOLgJyuDYWJ+PWVfwsBO
	tYDDpqk7nNHZJWNAfijMKgX5RPlE537G/hrfl3tRZIeHbBFroKhmYR5ETihrh5jHI/AAAb4CrrtFM
	Dj7TQb4TkFoHw0qsF7jocHMynxZGbWB9TPxKUXZBEVrO7u4ZEivUyw/aWDvZAMvaXcwzJjMAHK25d
	/OaM1AFRl9ZwB3Fp8Fsq+QNb620sCNgm0k2nGl0mvbbxEzjDR4a5XNqho676Kqg5yiTPpXWiiPxim
	tHaUY+xQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krYMl-0002fz-KL; Tue, 22 Dec 2020 03:29:39 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krYMh-0002fM-RR
 for ath11k@lists.infradead.org; Tue, 22 Dec 2020 03:29:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608607777; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=A79wKvBfEMH8IfW9eGf+JVXVKyQccZwIj8WcgbnRg/o=;
 b=lrehgdMgmggqC8DJS/tETbh1mRjxBwkES/vBA5jR2Vq51w/TZHK1qHpJTBgNqbaY8pR2GWQ6
 1JUfIM+vboM4L3xl5y72AAVDDgHhcmA+d2tf03v2vIjUVceHgIfRQn4IqCE5O8W7NaFDN9MG
 zlhKTMtynkcwkAp2AzqHrIQX63A=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fe1680de61d77c971724a3c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 03:29:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 16263C433C6; Tue, 22 Dec 2020 03:29:17 +0000 (UTC)
Received: from gongwen-ThinkPad-T420.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 803ADC433CA;
 Tue, 22 Dec 2020 03:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 803ADC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: add ieee80211_unregister_hw to avoid kernel crash
 caused by NULL pointer
Date: Tue, 22 Dec 2020 11:30:24 +0800
Message-Id: <1608607824-16067-1-git-send-email-wgong@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_222937_735163_9E4CDC94 
X-CRM114-Status: GOOD (  15.84  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

When function return fail to __ath11k_mac_register after success called
ieee80211_register_hw, then it set wiphy->dev.parent to NULL by
SET_IEEE80211_DEV(ar->hw, NULL) in end of __ath11k_mac_register, then
cfg80211_get_drvinfo will be called by below call stack, but the
wiphy->dev.parent is NULL, so kernel crash.

Call stack to cfg80211_get_drvinfo:
NetworkManager   826 [001]  6696.731371:    probe:cfg80211_get_drvinfo: (ffffffffc107d8f0)
        ffffffffc107d8f1 cfg80211_get_drvinfo+0x1 (/lib/modules/5.10.0-rc1-wt-ath+/kernel/net/wireless-back/cfg80211.ko)
        ffffffff9d8fc529 ethtool_get_drvinfo+0x99 (vmlinux)
        ffffffff9d90080e dev_ethtool+0x1dbe (vmlinux)
        ffffffff9d8b88f7 dev_ioctl+0xb7 (vmlinux)
        ffffffff9d8668de sock_do_ioctl+0xae (vmlinux)
        ffffffff9d866d60 sock_ioctl+0x350 (vmlinux)
        ffffffff9d2ca30e __x64_sys_ioctl+0x8e (vmlinux)
        ffffffff9da0dda3 do_syscall_64+0x33 (vmlinux)
        ffffffff9dc0008c entry_SYSCALL_64_after_hwframe+0x44 (vmlinux)
            7feb5f673007 __GI___ioctl+0x7 (/lib/x86_64-linux-gnu/libc-2.23.so)
                       0 [unknown] ([unknown])

Code of cfg80211_get_drvinfo, the pdev which is wiphy->dev.parent is
NULL when kernel crash:
void cfg80211_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
{
	struct wireless_dev *wdev = dev->ieee80211_ptr;
	struct device *pdev = wiphy_dev(wdev->wiphy);

	if (pdev->driver)
....

kernel crash log:
[  973.619550] ath11k_pci 0000:05:00.0: failed to perform regd update : -16
[  973.619555] ath11k_pci 0000:05:00.0: ath11k regd update failed: -16
[  973.619566] ath11k_pci 0000:05:00.0: failed register the radio with mac80211: -16
[  973.619618] ath11k_pci 0000:05:00.0: failed to create pdev core: -16
[  973.636035] BUG: kernel NULL pointer dereference, address: 0000000000000068
[  973.636046] #PF: supervisor read access in kernel mode
[  973.636050] #PF: error_code(0x0000) - not-present page
[  973.636054] PGD 800000012452e067 P4D 800000012452e067 PUD 12452d067 PMD 0
[  973.636064] Oops: 0000 [#1] SMP PTI
[  973.636072] CPU: 3 PID: 848 Comm: NetworkManager Kdump: loaded Tainted: G        W  OE     5.10.0-rc1-wt-ath+ #24
[  973.636076] Hardware name: LENOVO 418065C/418065C, BIOS 83ET63WW (1.33 ) 07/29/2011
[  973.636161] RIP: 0010:cfg80211_get_drvinfo+0x25/0xd0 [cfg80211]
[  973.636169] Code: e9 c9 fe ff ff 66 66 66 66 90 55 53 ba 20 00 00 00 48 8b af 08 03 00 00 48 89 f3 48 8d 7e 04 48 8b 45 00 48 8b 80 90 01 00 00 <48> 8b 40 68 48 85 c0 0f 84 8d 00 00 00 48 8b 30 e8 a6 cc 72 c7 48
[  973.636174] RSP: 0018:ffffaafb4040bbe0 EFLAGS: 00010286
[  973.636180] RAX: 0000000000000000 RBX: ffffaafb4040bbfc RCX: 0000000000000000
[  973.636184] RDX: 0000000000000020 RSI: ffffaafb4040bbfc RDI: ffffaafb4040bc00
[  973.636188] RBP: ffff8a84c9568950 R08: 722d302e30312e35 R09: 74612d74772d3163
[  973.636192] R10: 3163722d302e3031 R11: 2b6874612d74772d R12: ffffaafb4040bbfc
[  973.636196] R13: 00007ffe453707c0 R14: ffff8a84c9568000 R15: 0000000000000000
[  973.636202] FS:  00007fd3d179b940(0000) GS:ffff8a84fa2c0000(0000) knlGS:0000000000000000
[  973.636206] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  973.636211] CR2: 0000000000000068 CR3: 00000001153b6002 CR4: 00000000000606e0
[  973.636215] Call Trace:
[  973.636234]  ethtool_get_drvinfo+0x99/0x1f0
[  973.636246]  dev_ethtool+0x1dbe/0x2be0
[  973.636256]  ? mntput_no_expire+0x35/0x220
[  973.636264]  ? inet_ioctl+0x1ce/0x200
[  973.636274]  ? tomoyo_path_number_perm+0x68/0x1d0
[  973.636282]  ? kmem_cache_alloc+0x3cb/0x430
[  973.636290]  ? dev_ioctl+0xb7/0x570
[  973.636295]  dev_ioctl+0xb7/0x570
[  973.636307]  sock_do_ioctl+0xae/0x150
[  973.636315]  ? sock_ioctl+0x350/0x3c0
[  973.636319]  sock_ioctl+0x350/0x3c0
[  973.636332]  ? __x64_sys_ioctl+0x8e/0xd0
[  973.636339]  ? dlci_ioctl_set+0x30/0x30
[  973.636346]  __x64_sys_ioctl+0x8e/0xd0
[  973.636359]  do_syscall_64+0x33/0x80
[  973.636368]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Sequence of function call when wlan load for success case when function
__ath11k_mac_register return 0:

kworker/u16:3-e  2922 [001]  6696.729734:   probe:ieee80211_register_hw: (ffffffffc116ae60)
kworker/u16:3-e  2922 [001]  6696.730210:        probe:ieee80211_if_add: (ffffffffc1185cc0)
NetworkManager   826 [001]  6696.731345:     probe:ethtool_get_drvinfo: (ffffffff9d8fc490)
NetworkManager   826 [001]  6696.731371:    probe:cfg80211_get_drvinfo: (ffffffffc107d8f0)
NetworkManager   826 [001]  6696.731639:     probe:ethtool_get_drvinfo: (ffffffff9d8fc490)
NetworkManager   826 [001]  6696.731653:    probe:cfg80211_get_drvinfo: (ffffffffc107d8f0)
NetworkManager   826 [001]  6696.732866:     probe:ethtool_get_drvinfo: (ffffffff9d8fc490)
NetworkManager   826 [001]  6696.732893:    probe:cfg80211_get_drvinfo: (ffffffffc107d8f0)
systemd-udevd  3850 [003]  6696.737199:     probe:ethtool_get_drvinfo: (ffffffff9d8fc490)
systemd-udevd  3850 [003]  6696.737226:    probe:cfg80211_get_drvinfo: (ffffffffc107d8f0)
NetworkManager   826 [000]  6696.759950:     probe:ethtool_get_drvinfo: (ffffffff9d8fc490)
NetworkManager   826 [000]  6696.759967:    probe:cfg80211_get_drvinfo: (ffffffffc107d8f0)
NetworkManager   826 [000]  6696.760057:     probe:ethtool_get_drvinfo: (ffffffff9d8fc490)
NetworkManager   826 [000]  6696.760062:    probe:cfg80211_get_drvinfo: (ffffffffc107d8f0)

After apply this patch, kernel crash gone, and below is the test case's
sequence of function call and log when wlan load with fail by function
ath11k_regd_update, and __ath11k_mac_register return fail:

kworker/u16:5-e   192 [001]   215.174388:   probe:ieee80211_register_hw: (ffffffffc1131e60)
kworker/u16:5-e   192 [000]   215.174973:        probe:ieee80211_if_add: (ffffffffc114ccc0)
NetworkManager   846 [001]   215.175857:     probe:ethtool_get_drvinfo: (ffffffff928fc490)
kworker/u16:5-e   192 [000]   215.175867: probe:ieee80211_unregister_hw: (ffffffffc1131970)
NetworkManager   846 [001]   215.175880:    probe:cfg80211_get_drvinfo: (ffffffffc107f8f0)
NetworkManager   846 [001]   215.176105:     probe:ethtool_get_drvinfo: (ffffffff928fc490)
NetworkManager   846 [001]   215.176118:    probe:cfg80211_get_drvinfo: (ffffffffc107f8f0)
[  215.175859] ath11k_pci 0000:05:00.0: ath11k regd update failed: -16
NetworkManager   846 [001]   215.196420:     probe:ethtool_get_drvinfo: (ffffffff928fc490)
NetworkManager   846 [001]   215.196430:    probe:cfg80211_get_drvinfo: (ffffffffc107f8f0)
[  215.258598] ath11k_pci 0000:05:00.0: failed register the radio with mac80211: -16
[  215.258613] ath11k_pci 0000:05:00.0: failed to create pdev core: -16

When ath11k_regd_update or ath11k_debugfs_register return fail, function
ieee80211_unregister_hw of mac80211 will be called, then it will wait
untill cfg80211_get_drvinfo finished, the wiphy->dev.parent is not NULL
at this moment, after that, it set wiphy->dev.parent to NULL by
SET_IEEE80211_DEV(ar->hw, NULL) in end of __ath11k_mac_register, so
not happen kernel crash.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 20004a18e3fd..db252fd2fbbc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7002,17 +7002,20 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ret = ath11k_regd_update(ar, true);
 	if (ret) {
 		ath11k_err(ar->ab, "ath11k regd update failed: %d\n", ret);
-		goto err_free_if_combs;
+		goto err_unregister_hw;
 	}
 
 	ret = ath11k_debugfs_register(ar);
 	if (ret) {
 		ath11k_err(ar->ab, "debugfs registration failed: %d\n", ret);
-		goto err_free_if_combs;
+		goto err_unregister_hw;
 	}
 
 	return 0;
 
+err_unregister_hw:
+		ieee80211_unregister_hw(ar->hw);
+
 err_free_if_combs:
 	kfree(ar->hw->wiphy->iface_combinations[0].limits);
 	kfree(ar->hw->wiphy->iface_combinations);
-- 
2.23.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
