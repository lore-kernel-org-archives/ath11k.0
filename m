Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0E7C433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 17:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Ofl3ycwHqoDDv2MHbQsD6H2DYBfuH/E86cq0EAyeV0=; b=1dKQtda92ac8h8
	M7LCzBZTgXIcuz03xPFxWnqNg9feGpfEBiGXuYZJsVAvi2Uhp+Z4UNlJk0aYRhGNT+gbk81r1Ymxz
	JFWKszLOR7gKsQQ2rilZS3cG/w6PjUl03FtL/eQFVRoQb0xKACjISDjpppr25KwcdvMMt+p4kndns
	FE6PLzPxXu9LX89GAICJsZAiJUAV405M3+xpq0/s+U7aSVSPKyZN1bh+HBOZ8UppoHmxtsOwWJ7qF
	6HCaCK0wO5PPBO+3G/zACOEz4wcMSI6eSOKchQnGafk0NERKsIuqREqBW84lKFptbJEXH/AeC7czt
	K6M18TWBZl2FOWIFNydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNM8-00H0NR-8k; Thu, 09 Dec 2021 17:37:20 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNM4-00H0MC-Sp
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 17:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639071436; x=1670607436;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=cnKC6v3RwzfsPigqhU8z9kF/y8ptdbENxJwfN3gN1wg=;
 b=zDSVn1U37UiLfw+VGy4XSF4vhmCRS0HhFFAPsLgAVMq/G50KntB8n8MN
 mqG3IiIj0IfvmNrHTvWsqNPTjmIB1XZJ2/vAl/gqhyTIEOFHJM+nQ4C4d
 Bt7ioTA8qMFBJbFb+zhhnkvGAME5fQczv3bwBd4F5K7nCe/DgtVHjrUWc 8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Dec 2021 09:37:15 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:37:15 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 09:37:14 -0800
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 09:37:12 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: [PATCH] ath11k: Fix deleting uninitialized kernel timer during
 fragment cache flush
Date: Thu, 9 Dec 2021 23:07:01 +0530
Message-ID: <1639071421-25078-1-git-send-email-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_093717_048143_B2B52217 
X-CRM114-Status: GOOD (  12.66  )
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

frag_timer will be created & initialized for stations when
they associate and will be deleted during every key installation
while flushing old fragments.

For AP interface self peer will be created and Group keys
will be installed for this peer, but there will be no real
Station entry & hence frag_timer won't be created and
initialized, deleting such uninitialized kernel timers causes below
warnings and backtraces printed with CONFIG_DEBUG_OBJECTS_TIMERS
enabled.

[ 177.828008] ODEBUG: assert_init not available (active state 0) object type: timer_list hint: 0x0
[ 177.836833] WARNING: CPU: 3 PID: 188 at lib/debugobjects.c:508 debug_print_object+0xb0/0xf0
[ 177.845185] Modules linked in: ath11k_pci ath11k qmi_helpers qrtr_mhi qrtr ns mhi
[ 177.852679] CPU: 3 PID: 188 Comm: hostapd Not tainted 5.14.0-rc3-32919-g4034139e1838-dirty #14
[ 177.865805] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
[ 177.871804] pc : debug_print_object+0xb0/0xf0
[ 177.876155] lr : debug_print_object+0xb0/0xf0
[ 177.880505] sp : ffffffc01169b5a0
[ 177.883810] x29: ffffffc01169b5a0 x28: ffffff80081c2320 x27: ffffff80081c4078
[ 177.890942] x26: ffffff8003fe8f28 x25: ffffff8003de9890 x24: ffffffc01134d738
[ 177.898075] x23: ffffffc010948f20 x22: ffffffc010b2d2e0 x21: ffffffc01169b628
[ 177.905206] x20: ffffffc01134d700 x19: ffffffc010c80d98 x18: 00000000000003f6
[ 177.912339] x17: 203a657079742074 x16: 63656a626f202930 x15: 0000000000000152
[ 177.919471] x14: 0000000000000152 x13: 00000000ffffffea x12: ffffffc010d732e0
[ 177.926603] x11: 0000000000000003 x10: ffffffc010d432a0 x9 : ffffffc010d432f8
[ 177.933735] x8 : 000000000002ffe8 x7 : c0000000ffffdfff x6 : 0000000000000001
[ 177.940866] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
[ 177.947997] x2 : ffffffc010c93240 x1 : ffffff80023624c0 x0 : 0000000000000054
[ 177.955130] Call trace:
[ 177.957567] debug_print_object+0xb0/0xf0
[ 177.961570] debug_object_assert_init+0x124/0x178
[ 177.966269] try_to_del_timer_sync+0x1c/0x70
[ 177.970536] del_timer_sync+0x30/0x50
[ 177.974192] ath11k_peer_frags_flush+0x34/0x68 [ath11k]
[ 177.979439] ath11k_mac_op_set_key+0x1e4/0x338 [ath11k]
[ 177.984673] ieee80211_key_enable_hw_accel+0xc8/0x3d0
[ 177.989722] ieee80211_key_replace+0x360/0x740
[ 177.994160] ieee80211_key_link+0x16c/0x210
[ 177.998337] ieee80211_add_key+0x138/0x338
[ 178.002426] nl80211_new_key+0xfc/0x258
[ 178.006257] genl_family_rcv_msg_doit.isra.17+0xd8/0x120
[ 178.011565] genl_rcv_msg+0xd8/0x1c8
[ 178.015134] netlink_rcv_skb+0x38/0xf8
[ 178.018877] genl_rcv+0x34/0x48
[ 178.022012] netlink_unicast+0x174/0x230
[ 178.025928] netlink_sendmsg+0x188/0x388
[ 178.029845] ____sys_sendmsg+0x218/0x250
[ 178.033763] ___sys_sendmsg+0x68/0x90
[ 178.037418] __sys_sendmsg+0x44/0x88
[ 178.040988] __arm64_sys_sendmsg+0x20/0x28
[ 178.045077] invoke_syscall.constprop.5+0x54/0xe0
[ 178.049776] do_el0_svc+0x74/0xc0
[ 178.053084] el0_svc+0x10/0x18
[ 178.056133] el0t_64_sync_handler+0x88/0xb0
[ 178.060310] el0t_64_sync+0x148/0x14c
[ 178.063966] ---[ end trace 8a5cf0bf9d34a058 ]---

Add changes to not to delete frag timer for peers during
group key installation.

Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01092-QCAHKSWPL_SILICONZ-1

Fixes: c3944a562102 ("ath11k: Clear the fragment cache during key install")
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 71d8796..9e3cb32a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2837,7 +2837,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	/* flush the fragments cache during key (re)install to
 	 * ensure all frags in the new frag list belong to the same key.
 	 */
-	if (peer && cmd == SET_KEY)
+	if (peer && sta && cmd == SET_KEY)
 		ath11k_peer_frags_flush(ar, peer);
 	spin_unlock_bh(&ab->base_lock);
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
