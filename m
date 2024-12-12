Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460AFC3DA4A
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejEwRygxca6lQ1bnnmgGz/a6d9eFvOqci4xwtvOcijY=; b=flbR6tk0z5PED0zk3cdNbTSy48
	4KHDBOuvvP6/grLNYaSQ45T/zkBkgjnDTR4JEjs7sysVYfWSK8Z4CLCmhwHOZst6LU361s1tpAy7W
	4pmIoS4odI0PLWk9Ge08uxZqQ3+vWbbZhxsofDlb7GqepzfuXvgEXn6z3mfWDwqMbbvXH43BiMJ35
	2UIvLAMtE1QWgVsX1/JjlJMDxCMBgUZxz4L9b44ScYx7oqAPI0LZNK/phEAf/fTOWQZuH82fOKhIH
	bCblBuNmyqjTW3ipcBrzGb4W4W+22C7wtzAWOlT9s7uuL2Oo1ZrG2KFVN4Q3XPWRnDoUX/laMzjvJ
	eyBw0Kpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnFV-00000001FnA-0PEq;
	Thu, 12 Dec 2024 17:45:17 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn3o-00000001CF4-4BRF
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 17:33:14 +0000
Received: from eahariha-devbox.5bhznamrcrmeznzvghz2s0u2eh.xx.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id DC255204BA86;
	Thu, 12 Dec 2024 09:33:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DC255204BA86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1734024790;
	bh=ejEwRygxca6lQ1bnnmgGz/a6d9eFvOqci4xwtvOcijY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sH1e0U+KayP+lsFRd5cH4rW4QJHnRLOWDFCTJoPjZRvL6dwQYhPEw6wLSEiQVtzIz
	 MGjOiqbZKlHIKC/I0x+IjPT78qNmm2OrOBklKG81Gn4wy67uMgQIlzYxTIMktAVNJA
	 yGuIpYUjNjbN3EVimHdjo9phwdZ8Nt/bD5dSfqhA=
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
	ath11k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH net-next v4 2/2] wifi: ath11k: Convert timeouts to secs_to_jiffies()
Date: Thu, 12 Dec 2024 17:33:02 +0000
Message-ID: <20241212-netdev-converge-secs-to-jiffies-v4-2-6dac97a6d6ab@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
References: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_093313_280318_08BD05F5 
X-CRM114-Status: UNSURE (   5.98  )
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
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>=0D
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>=0D
---=0D
 drivers/net/wireless/ath/ath11k/debugfs.c | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wirele=
ss/ath/ath11k/debugfs.c=0D
index 57281a135dd7fa6b8610636f47873c8bba21053c..bf192529e3fe26a91e72105a77b=
4c6f849b905ec 100644=0D
--- a/drivers/net/wireless/ath/ath11k/debugfs.c=0D
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c=0D
@@ -178,7 +178,7 @@ static int ath11k_debugfs_fw_stats_request(struct ath11=
k *ar,=0D
 	 * received 'update stats' event, we keep a 3 seconds timeout in case,=0D
 	 * fw_stats_done is not marked yet=0D
 	 */=0D
-	timeout =3D jiffies + msecs_to_jiffies(3 * 1000);=0D
+	timeout =3D jiffies + secs_to_jiffies(3);=0D
 =0D
 	ath11k_debugfs_fw_stats_reset(ar);=0D
 =0D
=0D
-- =0D
2.43.0=0D
=0D

