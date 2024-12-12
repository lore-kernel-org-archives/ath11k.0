Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFB1E7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhekioNyEpahueZj3EOliOXkKSYfTJCi0WH05Jw+vpU=; b=Lod91+kFr/Uu8ssqz7AOC0Bqms
	NqJ9X8QW3B/QDi2nt7M4LMcgh3EIyaV1m7Rkz4N4Ohtr8Av+kmIcENbsBscElwaqkmX1vJfQ7gl6G
	tJfcgyhizV/Tof2I71rYBXBOXJW8/7ZssjhDb5h+6TJxNhkyEZO+T/YFXu3Ar21RiqjAYJcKHFPfo
	9BGL8WWiZ+XzUl16VCjsydbFhhTI+jkqXm7mMSRoPgDQE9HynTj7juaBoteJ4IRrMzY4IENMRam6W
	tQXsKKqoSD1Lv0hIpzmvPd5/tRsJV6WFH3+EUZZ3bPRAd3UauN5HmRyYLxgmKsaHdlb3dG6oVKSCH
	F3XMF30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnFV-00000001FnM-3ZFq;
	Thu, 12 Dec 2024 17:45:17 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn3o-00000001CF5-472q
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 17:33:15 +0000
Received: from eahariha-devbox.5bhznamrcrmeznzvghz2s0u2eh.xx.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id BE7E8204BA83;
	Thu, 12 Dec 2024 09:33:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BE7E8204BA83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1734024790;
	bh=KhekioNyEpahueZj3EOliOXkKSYfTJCi0WH05Jw+vpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qlEXm7LvQZ1WtmQ5xwu0xb+LrZ21hjKTyunPYA1nGpM0Q6GTj0/o0lFrdWCC4I+Vs
	 jR6xM2CwIp+NGeNBJldkRVL7KJPw+DFee5aYjmgZWnTZXV+UrjG7EEuMVcKgV0+wv0
	 ACikRVkTvYokwxuGGnCg+rsu/x4tT+FTyKxkEO60=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH net-next v4 1/2] gve: Convert timeouts to secs_to_jiffies()
Date: Thu, 12 Dec 2024 17:33:01 +0000
Message-ID: <20241212-netdev-converge-secs-to-jiffies-v4-1-6dac97a6d6ab@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
References: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_093313_280297_46E612DD 
X-CRM114-Status: UNSURE (   5.41  )
X-CRM114-Notice: Please train this message.
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

Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced=0D
secs_to_jiffies(). As the value here is a multiple of 1000, use=0D
secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.=
=0D
=0D
This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with=
=0D
the following Coccinelle rules:=0D
=0D
@@ constant C; @@=0D
=0D
- msecs_to_jiffies(C * 1000)=0D
+ secs_to_jiffies(C)=0D
=0D
@@ constant C; @@=0D
=0D
- msecs_to_jiffies(C * MSEC_PER_SEC)=0D
+ secs_to_jiffies(C)=0D
=0D
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>=0D
---=0D
 drivers/net/ethernet/google/gve/gve_tx_dqo.c | 6 ++----=0D
 1 file changed, 2 insertions(+), 4 deletions(-)=0D
=0D
diff --git a/drivers/net/ethernet/google/gve/gve_tx_dqo.c b/drivers/net/eth=
ernet/google/gve/gve_tx_dqo.c=0D
index f879426cb5523a7e150f363b5e57b9d472b5817c..394debc62268aadf2579f9b516e=
045cb48287e7c 100644=0D
--- a/drivers/net/ethernet/google/gve/gve_tx_dqo.c=0D
+++ b/drivers/net/ethernet/google/gve/gve_tx_dqo.c=0D
@@ -1146,8 +1146,7 @@ static void gve_handle_miss_completion(struct gve_pri=
v *priv,=0D
 	/* jiffies can wraparound but time comparisons can handle overflows. */=0D
 	pending_packet->timeout_jiffies =3D=0D
 			jiffies +=0D
-			msecs_to_jiffies(GVE_REINJECT_COMPL_TIMEOUT *=0D
-					 MSEC_PER_SEC);=0D
+			secs_to_jiffies(GVE_REINJECT_COMPL_TIMEOUT);=0D
 	add_to_list(tx, &tx->dqo_compl.miss_completions, pending_packet);=0D
 =0D
 	*bytes +=3D pending_packet->skb->len;=0D
@@ -1191,8 +1190,7 @@ static void remove_miss_completions(struct gve_priv *=
priv,=0D
 		pending_packet->state =3D GVE_PACKET_STATE_TIMED_OUT_COMPL;=0D
 		pending_packet->timeout_jiffies =3D=0D
 				jiffies +=0D
-				msecs_to_jiffies(GVE_DEALLOCATE_COMPL_TIMEOUT *=0D
-						 MSEC_PER_SEC);=0D
+				secs_to_jiffies(GVE_DEALLOCATE_COMPL_TIMEOUT);=0D
 		/* Maintain pending packet in another list so the packet can be=0D
 		 * unallocated at a later time.=0D
 		 */=0D
=0D
-- =0D
2.43.0=0D
=0D

