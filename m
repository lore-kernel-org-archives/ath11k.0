Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD29DC7EE23
	for <ath11k@archiver.kernel.org>; Sun, 26 Feb 2023 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lh29N3eYfb6FjnKTmkabo+ZYuYrDF7krWDC7rpnQxds=; b=eeWmOeD8WMvSYX
	/VAevvIay3v9jS3uwYirEYNicqgfRCnQkG6ffi7FzVaOK90UtYqqL9Yk0wpTp7hJEWNpJSP5dcRIY
	D14dYkwQArl8ailo/TJ/jaLliLgP/6Q0C4DgxEcoVzpXzfHZTQiRMPgArpU2JipZ8U2jVlZju+hJQ
	9SJcjfi5MsiAisby9rO07ylv61MNLuwk77ZsK5kFqimaNZN16Z46D0uBBLq6VaEv4Ia7aLeLoCiKo
	I7JKA/Joftr64ZI5gehGZcd2lKTluesHqKjm2H1iyZfX9ilJmYTenZdTgPjeF17rTBXVC2Aza3Uls
	XpIGA/CXsjurDdg4rGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIIn-007P8w-32; Sun, 26 Feb 2023 14:47:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIIj-007P7H-Lm
	for ath11k@lists.infradead.org; Sun, 26 Feb 2023 14:46:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5EF55B80C03;
	Sun, 26 Feb 2023 14:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C183EC4339C;
	Sun, 26 Feb 2023 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677422815;
	bh=+u7jStlcUUUltunC9OISuObdw424NUJH1LgK4IVaQHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bkcc9hKD2TpmR9c7Eu99Y+PAH10v/WXKernkXkEgJfjCqw1WH7ICLES/WXDQsLxPM
	 qNJnYWB4Tlp5KTPwb/VMfwwNs3nz0ysWd9jCLmtTSGmaTRbg39cUybmQifl5PQTyAQ
	 8rgiY5RSPJEMNK3GxrBs5bM8ySvNur0YDcA5uRNDNCykeCj/24/A78kKkgP9FkuovW
	 RdnY2WiTZ9++i4cHaUsF5GNLqwRUyKvkMjdzCzfA6hG3cP09/oHP9xjr4la+roiLGn
	 6MrYFys/bisQB1RSPGMUc9Wuk9YFc8hSr54FHkjUaSR83my2vSB4DOir9sPmbHgHpu
	 xLHvw9WkD7DgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nagarajan Maran <quic_nmaran@quicinc.com>,
	Florian Schmidt <florian@fls.name>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/49] wifi: ath11k: fix monitor mode bringup crash
Date: Sun, 26 Feb 2023 09:46:02 -0500
Message-Id: <20230226144650.826470-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226144650.826470-1-sashal@kernel.org>
References: <20230226144650.826470-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_064658_172901_BD3428DF 
X-CRM114-Status: GOOD (  10.37  )
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

From: Nagarajan Maran <quic_nmaran@quicinc.com>

[ Upstream commit 950b43f8bd8a4d476d2da6d2a083a89bcd3c90d7 ]

When the interface is brought up in monitor mode, it leads
to NULL pointer dereference crash. This crash happens when
the packet type is extracted for a SKB. This extraction
which is present in the received msdu delivery path,is
not needed for the monitor ring packets since they are
all RAW packets. Hence appending the flags with
"RX_FLAG_ONLY_MONITOR" to skip that extraction.

Observed calltrace:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000064
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000048517000
[0000000000000064] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in: ath11k_pci ath11k qmi_helpers
CPU: 2 PID: 1781 Comm: napi/-271 Not tainted
6.1.0-rc5-wt-ath-656295-gef907406320c-dirty #6
Hardware name: Qualcomm Technologies, Inc. IPQ8074/AP-HK10-C2 (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : ath11k_hw_qcn9074_rx_desc_get_decap_type+0x34/0x60 [ath11k]
lr : ath11k_hw_qcn9074_rx_desc_get_decap_type+0x5c/0x60 [ath11k]
sp : ffff80000ef5bb10
x29: ffff80000ef5bb10 x28: 0000000000000000 x27: ffff000007baafa0
x26: ffff000014a91ed0 x25: 0000000000000000 x24: 0000000000000000
x23: ffff800002b77378 x22: ffff000014a91ec0 x21: ffff000006c8d600
x20: 0000000000000000 x19: ffff800002b77740 x18: 0000000000000006
x17: 736564203634343a x16: 656e694c20657079 x15: 0000000000000143
x14: 00000000ffffffea x13: ffff80000ef5b8b8 x12: ffff80000ef5b8c8
x11: ffff80000a591d30 x10: ffff80000a579d40 x9 : c0000000ffffefff
x8 : 0000000000000003 x7 : 0000000000017fe8 x6 : ffff80000a579ce8
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
x2 : 3a35ec12ed7f8900 x1 : 0000000000000000 x0 : 0000000000000052
Call trace:
 ath11k_hw_qcn9074_rx_desc_get_decap_type+0x34/0x60 [ath11k]
 ath11k_dp_rx_deliver_msdu.isra.42+0xa4/0x3d0 [ath11k]
 ath11k_dp_rx_mon_deliver.isra.43+0x2f8/0x458 [ath11k]
 ath11k_dp_rx_process_mon_rings+0x310/0x4c0 [ath11k]
 ath11k_dp_service_srng+0x234/0x338 [ath11k]
 ath11k_pcic_ext_grp_napi_poll+0x30/0xb8 [ath11k]
 __napi_poll+0x5c/0x190
 napi_threaded_poll+0xf0/0x118
 kthread+0xf4/0x110
 ret_from_fork+0x10/0x20

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Reported-by: Florian Schmidt <florian@fls.name>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216573
Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20221129142532.23421-1-quic_nmaran@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c5a4c34d77499..2c2b9da37b3f0 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5022,6 +5022,7 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 		} else {
 			rxs->flag |= RX_FLAG_ALLOW_SAME_PN;
 		}
+		rxs->flag |= RX_FLAG_ONLY_MONITOR;
 		ath11k_update_radiotap(ar, ppduinfo, mon_skb, rxs);
 
 		ath11k_dp_rx_deliver_msdu(ar, napi, mon_skb, rxs);
-- 
2.39.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
