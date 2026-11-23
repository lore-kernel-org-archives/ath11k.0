Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D0606A682
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OxdwTLMe;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gyfMd8eJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hZNZFDMt84el0uzbl7Y+L0/EjDGNQFFEF3vsJXRqTkI=; b=OxdwTLMe+DFIwb
	xvKNR/7QkRmNcss3uK5oOcbttCJB3TuG4WaOErUuhGxzsFte+XgLl9DPwp9uc1cA+xDzMu8kKyCxY
	l/JSMO2gWXKgztiDUvjN9Md+XLK55RjCcP/L4uBKbCPzeib7koqRqYpUbuzUXbVZFMZbUEH2WaCLJ
	IiN2M4U5WanPTcAHKeM6k0401o6EFp9bPYRGsdEVtXOHwIaIvqrYQm7bNEwsZ+POwr2aEf+rAOG1d
	PCzb/FnQNnFDDgn95FNsqcw130lSylyfTqOOwynmh64MTOHjXXfHBqWf1s01iNr3U0OKlLiHvQ+nQ
	ziavp6qGXdz8hyAW0kdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIp-00000003c2t-0c9s;
	Mon, 23 Nov 2026 13:41:51 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIl-00000003btu-1SL3
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:48 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6baa6f27904so1485763a12.0
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441305; x=1796046105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZNZFDMt84el0uzbl7Y+L0/EjDGNQFFEF3vsJXRqTkI=;
        b=gyfMd8eJ5RrmgOL55238ZwYpaYkzva02Mdf7cDvGvuLeuIiBv31Kr35FeG4Imap1nh
         6vUWRqyD8d6z6PqKynxKqdVsYeAjtPemp/Q9PCBDSFXA6+b+7Eld7hlDys4ddqfzVHVG
         R0eAedYIFV/ZhNHDZyQ5D91JmqaLSIqGQh1gT06sUbgXJVXZ/hjPzBmwGRbcYN9aHBvV
         eHZbNDMge67E5MpRXfiBmSgSlogBREzemqVX5AwlzXgspk7FHGdFZv59pyzgOxbDXkWU
         agDgck8QBsNyikM4bhqAoYAHQO9PtV0VeL+A8rZnGCRHh70GaJN+WI5gWVsu6bjt+yId
         7P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441305; x=1796046105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZNZFDMt84el0uzbl7Y+L0/EjDGNQFFEF3vsJXRqTkI=;
        b=opNREEJL6pp6SAA3EgTt1GKalziEASr/UQaTItE3N/6LD6u3wrDktqwxZZb2+8uciM
         GseCWZa/8KpjSegx4MN9HLnSAYEqBiLJfh5c2JrmM/4PA9ABvulAXI4FsBhu7SmWs3ov
         bJ3Zebo5lfaGc5VhTyNzrF5xODsz5+t8ik9ZHHzU40blzNZ5XJiRGnBeSrakEL6Fws7Q
         8fWR8wMKlH+7c4/EKRolkMHzBlOb/Gp+s5HAroI2f44cz/7Ae18UQUdloiy774Fubstn
         cz+9enmlA41iVYrMZVS6srnZKAcKAliqKgr0nJFUGiy9203zoLSlGCm423pHalU9b0wl
         eH3g==
X-Gm-Message-State: APuU4Z92wJjGdHTWBafDu4jWEUjoi05tYa7K/e57ktAw0blGJksB91uo
	fCmLqetX+pIeHNHcP3XxA9NHbXvZAasaXC+xz67sCWkYgIVkNs+O1Quer9IyAxPTrQ==
X-Gm-Gg: AZFdTZe7yD6wlmNhQcOOy1iTue6disgoI7mHinr0aPg0attKOkV9XBme5fCYoO/9vtA
	bfQKGMAiq/tyrP7kTG+AUZKpbIGoN/o/9rZiA4X9+G1qsJi+FAFELZYTBKJkvSnnwdQE8Jjj2wc
	pjHW4Vd2uZDC0spT1CVqvF14e2Pjl9cwo+3SQ/acquZTolxr0zoKSX3mJOHkNUQivDfSaasDVhF
	IRr7ldriKrFy6QUCs3YE5hRFBECrWcSQkkwrV34ePzLYWo3SC9aGAoNUWmTnwGTPRintQ4GSRoE
	ibTqoBRzzR/2HtfBqA7UpdAXAhh2t4tePOwb0UTrsSnGe4hindPxG01vDADeJgjGOi1V2Uai3Vc
	mUIFpLTQEKJ6SajNl1rY8SYLGb2lk0CQbFXiuUSyVniFHq67Ny7CUWuOT5Vu06oiBM7Fungoagp
	HGLMSZzPoBUap3GlXWxk0HJsdKS5Oiv2TJcBZ7DAglQ5OO0Eu5z5/YnuOjmbPGKupTpSzC2bCai
	d6MYm4EQJ/1nAu0Xbfj+pCePDY9UlPevCWS1MftoQVyqNcIX3jR7+ImP9QCX692wigknoHJ8lxP
	u56wieerlOFU3ekx8azF+F9L6mVS0kX0yRL7xQ8TYqFiNweGu8W7VwA/DfwEeoUJcfhLABX+Que
	AcotKrxjAlTotTfswiqtpq09+UGKgmDcrIGgVuL1zmr2jC9G0f2ZnZvbG6K82XBQ/Km3FUZ9HNl
	kfAal2fXZyYDyihIyJHnHuakElC4N1n9KEIlH/PGKaHMJnr2ot/Wop627mlurIyg1FCLC1DQX+u
	XcM9WYMC9+Gauj1QuA/atmqqAtFciQXVB0/CM0Ypgngoh0v9d/OPtPxjVYvts7l/4vN28PFslRu
	JTY/Ra/QdfNBwbkn1+OGkY7NXq3RHA4os2NcYhJwyOzCq5bNgIaj7NrQF6E9SqTAa/j3eoXoPBr
	Igpr6ZkqTZXY1tcRLCTs=
X-Received: by 2002:aa7:cccf:0:b0:6b7:cc0c:945e with SMTP id 4fb4d7f45d1cf-6ba37e84fbemr6637619a12.23.1795441305235;
        Mon, 23 Nov 2026 05:41:45 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:44 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 07/10] wifi: ath11k: look the peer of a received MSDU up once
Date: Mon, 23 Nov 2026 14:41:34 +0100
Message-ID: <20261123134137.718575-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054147_419566_1C2FCBD5 
X-CRM114-Status: GOOD (  18.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_dp_rx_h_mpdu() looks up the peer of each MSDU by its peer id in the
rhashtable, under base_lock, for the cipher, and
ath11k_dp_rx_deliver_msdu() looks it up again for the station it hands to
mac80211, under a second hold of the lock. In a profile of bridged uplink
at 900 Mbit/s (IPQ8074, one run) the lookup and its hash take 1.7 % of
all samples (ath11k_peer_find_by_id() 1.12 %, rhashtable_jhash2()
0.62 %).

Keep the station ath11k_dp_rx_h_mpdu() found in the frame's control
block, and have ath11k_dp_rx_deliver_msdu() take it from there. mac80211
then gets the station of the peer whose cipher the frame was handled
with, where two lookups could find different peers if the peer table
changed between them. The station is used after the lock and in the same
NAPI poll, as ath11k_dp_rx_deliver_msdu() used the station of its own
lookup after the lock. A frame that does not pass ath11k_dp_rx_h_mpdu(),
from the monitor and error paths, still looks its peer up; the mark is
cleared where those frames are reaped and when it is read. The debug
message prints the station's address.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  |  3 +++
 drivers/net/wireless/ath/ath11k/dp_rx.c | 33 ++++++++++++++++++++-----
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..4eb40e674c14 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -131,6 +131,8 @@ struct ath11k_skb_rxcb {
 	bool is_continuation;
 	bool is_mcbc;
 	bool is_eapol;
+	/* sta holds the station of the peer ath11k_dp_rx_h_mpdu() found */
+	bool sta_valid;
 	struct hal_rx_desc *rx_desc;
 	u8 err_rel_src;
 	u8 err_code;
@@ -140,6 +142,7 @@ struct ath11k_skb_rxcb {
 	u8 tid;
 	u16 peer_id;
 	u16 seq_no;
+	struct ieee80211_sta *sta;
 };
 
 enum ath11k_hw_rev {
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index e8226b2b832c..ff09463d829f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2512,6 +2512,14 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 
 	spin_lock_bh(&ar->ab->base_lock);
 	peer = ath11k_dp_rx_h_find_peer(ar->ab, msdu);
+	/*
+	 * For ath11k_dp_rx_deliver_msdu(): the station of the peer whose
+	 * cipher the frame is handled with, from the same hold of the lock.
+	 */
+	BUILD_BUG_ON(sizeof(struct ath11k_skb_rxcb) >
+		     sizeof_field(struct sk_buff, cb));
+	rxcb->sta = peer ? peer->sta : NULL;
+	rxcb->sta_valid = true;
 	if (peer) {
 		if (rxcb->is_mcbc)
 			enctype = peer->sec_type_grp;
@@ -2721,17 +2729,27 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	if (!(status->flag & RX_FLAG_ONLY_MONITOR))
 		decap = ath11k_dp_rx_h_msdu_start_decap_type(ar->ab, rxcb->rx_desc);
 
-	spin_lock_bh(&ar->ab->base_lock);
-	peer = ath11k_dp_rx_h_find_peer(ar->ab, msdu);
-	if (peer && peer->sta)
-		pubsta = peer->sta;
-	spin_unlock_bh(&ar->ab->base_lock);
+	/*
+	 * The station ath11k_dp_rx_h_mpdu() found for the frame, if it ran,
+	 * so that mac80211 gets the station whose cipher the frame was
+	 * handled with.
+	 */
+	if (rxcb->sta_valid) {
+		rxcb->sta_valid = false;
+		pubsta = rxcb->sta;
+	} else {
+		spin_lock_bh(&ar->ab->base_lock);
+		peer = ath11k_dp_rx_h_find_peer(ar->ab, msdu);
+		if (peer && peer->sta)
+			pubsta = peer->sta;
+		spin_unlock_bh(&ar->ab->base_lock);
+	}
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
 		   "rx skb %p len %u peer %pM %d %s sn %u %s%s%s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag 0x%x fcs-err %i mic-err %i amsdu-more %i\n",
 		   msdu,
 		   msdu->len,
-		   peer ? peer->addr : NULL,
+		   pubsta ? pubsta->addr : NULL,
 		   rxcb->tid,
 		   is_mcbc ? "mcast" : "ucast",
 		   rxcb->seq_no,
@@ -3081,6 +3099,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			continue;
 		}
 
+		rxcb->sta_valid = false;
 		rxcb->is_first_msdu = !!(desc->rx_msdu_info.info0 &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
 		rxcb->is_last_msdu = !!(desc->rx_msdu_info.info0 &
@@ -4562,6 +4581,7 @@ int ath11k_dp_rx_process_wbm_err(struct ath11k_base *ab,
 			continue;
 		}
 
+		rxcb->sta_valid = false;
 		rxcb->err_rel_src = err_info.err_rel_src;
 		rxcb->err_code = err_info.err_code;
 		rxcb->rx_desc = (struct hal_rx_desc *)msdu->data;
@@ -5471,6 +5491,7 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 		rxs->flag |= RX_FLAG_ONLY_MONITOR;
 		ath11k_update_radiotap(ar, ppduinfo, mon_skb, rxs);
 
+		ATH11K_SKB_RXCB(mon_skb)->sta_valid = false;
 		ath11k_dp_rx_deliver_msdu(ar, napi, mon_skb, rxs);
 		mon_skb = skb_next;
 	} while (mon_skb);
-- 
2.53.0


