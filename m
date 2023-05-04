Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E0CC7EE21
	for <ath11k@archiver.kernel.org>; Thu,  4 May 2023 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMXEfPv8nQ81gdEs3E8MzosmPnsqn+0vdiJ2WR+abb4=; b=1BCJIbVyOjLZlw
	07dBuP45jqnQDWH6VBNLi40SIBke+OGoBksqoMpC3sroACyA2g9tuuuOqrS46kivrUVanxWLap1Jz
	GYtOkNwZs9qyd0t5/NawXjaOkswNmnVe8b0aT7lLWFDeJGuhAJkgKdKADYzh7xaO1voHTbNsfEH1M
	gkM8yrIhaDj6sG3SHoStwKfoc2HyVoIdIARC5+IDoqhSnIogFTA6JrWw0KOFgycS+uLCQTdcw1Oxr
	T6lLK/g0hDxGu1nnggbagDrQC02ftfuB9dHJ1MDut8nyte+xFA+3OyIyDw7h63mu7qvuOnW4bM5hu
	PB8sa0oRzX1vStNTEzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pugmu-00976s-0O;
	Thu, 04 May 2023 21:46:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pugmt-00976Y-0D
	for ath11k@bombadil.infradead.org;
	Thu, 04 May 2023 21:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i90mKJgHlAu2irIcAAiE8xEa27k6HkJBY0n4+X/NzT8=; b=h2g6riF13OLRcQReH4lNkBIZO8
	a0pWe7/4LI11d3t6YFWRK6K0WTn98Sk3TO4g7FHGY9JQDSUqt7IdWl5G2G5UwgrqKxBO4LNr1plNp
	CJ6tPoWM0JzDzORTZD4nELBBrAqMRNLRwTSSZ22i9Wx/RQsCBwB47Ya1gIM59Z40dvYt4+zOFgYFX
	K1SR0HyNXm7mtFSZsrZ6VjijmobT4scGAO9ft0TXJoE00VngReqOJCTWWP/pICAk80eFV0BiFSN59
	guaRqsU4lBh644OUCLcpZT2IfKa/7BvwUTXJvXFSJ3z5QhJ6qiRGiaNOEVo2iRNo9WeYz9gqMUDAJ
	Bc42Y0hw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puevm-001p3Y-33
	for ath11k@lists.infradead.org;
	Thu, 04 May 2023 19:48:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DAF5637C7;
	Thu,  4 May 2023 19:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADB3C4339E;
	Thu,  4 May 2023 19:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683229669;
	bh=DZKU6XSyyuM1gByFJC0vIm3uimmnBCy1jTXJ/4/A0vE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qKha44qjgMkKhpbxHjr1tV5F5agZrW46StTHSxKtKnA7nq71/OUT1o159Zi6g6kx+
	 u6FHolQgnE2tffU57SEWt3fpof1u6D4x2zMS7t/J33KUjFr0wyRCBgvGatUWlEXv7v
	 zv/gASALGOLzM7joP3j8jK44XDUqZtJiVnJYPPzEc4eXlpBA6RAJxyKqy7d92fs/ot
	 B5BUvQ++QovuFuN6IFVx7nZUijs94vWypYaeDtA0oUSd2MXndVtKOpC+i6Z2iR3Cm6
	 c8Uuhlc6PKxiZBOc7xVVAksHU9YknFMFIYspxob9yfN91ODcvbkt2UOO5ajhbg3vAe
	 iP+nOnqXf4wdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Harshitha Prem <quic_hprem@quicinc.com>,
	Nagarajan Maran <quic_nmaran@quicinc.com>,
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
Subject: [PATCH AUTOSEL 6.1 33/49] wifi: ath11k: Ignore frags from uninitialized peer in dp.
Date: Thu,  4 May 2023 15:46:10 -0400
Message-Id: <20230504194626.3807438-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194626.3807438-1-sashal@kernel.org>
References: <20230504194626.3807438-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_204759_615758_6E15E5DA 
X-CRM114-Status: GOOD (  15.89  )
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

From: Harshitha Prem <quic_hprem@quicinc.com>

[ Upstream commit a06bfb3c9f69f303692cdae87bc0899d2ae8b2a6 ]

When max virtual ap interfaces are configured in all the bands with
ACS and hostapd restart is done every 60s, a crash is observed at
random times.
In this certain scenario, a fragmented packet is received for
self peer, for which rx_tid and rx_frags are not initialized in
datapath. While handling this fragment, crash is observed as the
rx_frag list is uninitialised and when we walk in
ath11k_dp_rx_h_sort_frags, skb null leads to exception.

To address this, before processing received fragments we check
dp_setup_done flag is set to ensure that peer has completed its
dp peer setup for fragment queue, else ignore processing the
fragments.

Call trace:
  ath11k_dp_process_rx_err+0x550/0x1084 [ath11k]
  ath11k_dp_service_srng+0x70/0x370 [ath11k]
  0xffffffc009693a04
  __napi_poll+0x30/0xa4
  net_rx_action+0x118/0x270
  __do_softirq+0x10c/0x244
  irq_exit+0x64/0xb4
  __handle_domain_irq+0x88/0xac
  gic_handle_irq+0x74/0xbc
  el1_irq+0xf0/0x1c0
  arch_cpu_idle+0x10/0x18
  do_idle+0x104/0x248
  cpu_startup_entry+0x20/0x64
  rest_init+0xd0/0xdc
  arch_call_rest_init+0xc/0x14
  start_kernel+0x480/0x4b8
  Code: f9400281 f94066a2 91405021 b94a0023 (f9406401)

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230403184155.8670-2-quic_nmaran@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 4 +++-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 8 ++++++++
 drivers/net/wireless/ath/ath11k/peer.h  | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index f5156a7fbdd7a..d070bcb3fe247 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -36,6 +36,7 @@ void ath11k_dp_peer_cleanup(struct ath11k *ar, int vdev_id, const u8 *addr)
 	}
 
 	ath11k_peer_rx_tid_cleanup(ar, peer);
+	peer->dp_setup_done = false;
 	crypto_free_shash(peer->tfm_mmic);
 	spin_unlock_bh(&ab->base_lock);
 }
@@ -72,7 +73,8 @@ int ath11k_dp_peer_setup(struct ath11k *ar, int vdev_id, const u8 *addr)
 	ret = ath11k_peer_rx_frag_setup(ar, addr, vdev_id);
 	if (ret) {
 		ath11k_warn(ab, "failed to setup rx defrag context\n");
-		return ret;
+		tid--;
+		goto peer_clean;
 	}
 
 	/* TODO: Setup other peer specific resource used in data path */
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index e964e1b722871..1786d83f8f2ed 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3138,6 +3138,7 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
 	}
 
 	peer->tfm_mmic = tfm;
+	peer->dp_setup_done = true;
 	spin_unlock_bh(&ab->base_lock);
 
 	return 0;
@@ -3583,6 +3584,13 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 		ret = -ENOENT;
 		goto out_unlock;
 	}
+	if (!peer->dp_setup_done) {
+		ath11k_warn(ab, "The peer %pM [%d] has uninitialized datapath\n",
+			    peer->addr, peer_id);
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
 	rx_tid = &peer->rx_tid[tid];
 
 	if ((!skb_queue_empty(&rx_tid->rx_frags) && seqno != rx_tid->cur_sn) ||
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index 6dd17bafe3a0c..9bd385d0a38c9 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -35,6 +35,7 @@ struct ath11k_peer {
 	u16 sec_type;
 	u16 sec_type_grp;
 	bool is_authorized;
+	bool dp_setup_done;
 };
 
 void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id);
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
