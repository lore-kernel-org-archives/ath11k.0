Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E760A2611
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3/xe5jnZ;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oJA7Ruak
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=; b=3/xe5jnZzr3zLo
	OjE02EVj1ZrgOuEIP4l0ul2Nfq+Vtgjv/jhtBVe2vJn6pwBJdwGzrl9RdTi0HZDCUbbBmUzw78r0x
	gWmFBsyOVpOBR3865muAchwyW7TLj+aOw9PRZnquXAUyqrRaub+YpGOuvtYLioJ9PeWTU20eI3o2k
	1Vs/QSn+aWefPRGCeKNB5oXNdu/D9csbAj0i4dWlHiqXKjff5m/ghc0dYkBKCuppaQgto+RHO3Wky
	AgjqieKMGwM0dbA8OieIEBnJvxNtdI5VWeJ8RrqPGwqrfjebaal7/leA/o5NMOYK/bXNGh9uHex3q
	NQeqr49PU7KvZVBwcorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBO-00000000S4K-0wHP;
	Sat, 21 Nov 2026 23:07:46 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBL-00000000S0A-2weo
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so391294366b.2
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302462; x=1795907262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=;
        b=oJA7RuakYBgxlftHZcEMJ0LPYxPg9nvw9dawakr6guBqM5uRBKlM45bNYc8w9auWWP
         AZcBInIgFgPJ9DclpumVIZ+DeRPPwiqpRbQUGQB/t3EV9QsfFug1epgjz5k3WbTFKTRK
         wSxh/tqphK3a5S7QLKrgiOhKDS70zri4TB0PrTX4QcFDrjnoISoyVXSCQJlvPK9VKzGK
         O171Cw/0JqjKPi7nzidmP0GC+tDfr9OZ93Ltvv92bXdZtvQL1zWreHLTLofQSIQbJUnP
         t2sQE6hUOCntKFxMP2t12LOrdDGir0OzcTaglAn2Vl+AKOdXPU7d2uJOiSeOLG9N2AtS
         RoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302462; x=1795907262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hlEiGChDshIaLlR9BvOU0o+rgL/gk2KuiaEP6jU9NU4=;
        b=hGKDR6A/7qoAZVgDBjuUSPnLHwySXimtDoo0XKWDHuRk6n/dQA1MQtEqOahB0w2Slz
         K0YDyjyW4NAJVshenmfsY7TQ6W2g82U4cylObLjL07ygVkyIU8XpukYQYFqFMom8XkKl
         iiiivzGZk/ZKVSqt0rbNRkudjFuhbC9lVj52VS/nWUyt4Rv3EXzDeBQNGsBss6A7jHG8
         0eVxY0I6Ff6XrqLvY++Q/w4hn5RfGfXg7+K/8rWyC0Ego3EdlO52O2jEqOOVlvlrXRzx
         LJt6TowdDUcczsgtMz9xwOfR8vEjjXDMLRn5j7qwOaGmAJk3vn0a7obnFUNSlAtXtJGC
         OJMQ==
X-Gm-Message-State: APuU4Z+2zjs/Z3tGeUndHiXmCmPu3zyBTyqOLHdRqd1rWqEZtElX0M2N
	ef/WLra+iuPeG60oy1eTFThDQ/gATrwDJhd/fi5C2jhr7BcCUXbBD5e4ona3G7q2mQ==
X-Gm-Gg: AZFdTZddxFuDi1Pioxml35X48FrvFt25+/WQGDg+28XtuQqMz7YOXDpQJXNlM4wg1FN
	5TNzCNXt7NKxTMWA/A+tkfoTRyxiRHKmq+F+7MsO6vTv/PJDkJM6VovS/OxwNpihDAnHIIMD419
	/TAo4Qon1/IB72gImHcVnzwArwi/iKKGzAPb51KlUWP6zzY0NFM6BdFTGsCwQ3tOC2DwzVxbSxA
	UTyUVm6pG4egF8+3cQyc0cayrCL8HqidzcN7v4q+NsBN+Qplgu5oKQk5X01CulfY12I1jR1z17V
	YrTdjH/ZcRY7kgoYt8dEt1aCEciULAcNdUNHgxZu6hK6+AiKwVM/YD4rRyx/ROxITyzilahrhPT
	qSSijNWUPXNU/fQ4CSaNB6LSRFAr6tDn2mJek0APmHRtP27bFRGHY5mMKzGNBeyTEV5vTOZIIh2
	EFqiyBC7+lGapF5tAthKMgz0swLyDE8DZcYAAuefuSxbdySaUnY1gNe51n9+ERv728NsHke5g34
	EeQQOnFD5iQp870szrpx2GZww0yOiGZYpY7inW12yEGh6CqSaM+sP4NGgW6TT4tRziD/90d09/H
	vvag/qgyV49LsU0y+MKMGiCVf9Ds8ESwAshzyYlCiHaADCUfjmoQmIihWYIZamYpmUKvpv1CBDl
	31HSi92OL8mjpDewDYwUXf7CkEZgYnrvDflBrpIXjd6PVZ9VJYF0QsYqsmAzCcBUELdOK5UIAKk
	M5IOo5iYCUQee/ogClugm4irWvsSPffm3hYl79t9rIpQLudQyIwGbBWni3lph8v8LnXt1cj85+u
	v5+zZ84yL5k6kxkYvpcRCW31ZFKgVQNAmG86z/VgSstd/52CEewGQaYgvPbIQdP5QudIDuMMJl9
	bz7VfYfKiRmqIjvg3CxZMVOCWhfhTamV5gSNevXt+nFryJjCTqzh64rMPPVWpIHHZ+XBzD++sAk
	=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id a640c23a62f3a-c513ab0cf13mr413314766b.26.1795302461807;
        Sat, 21 Nov 2026 15:07:41 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 05/13] wifi: ath11k: hold back WMI commands while the firmware restarts
Date: Sun, 22 Nov 2026 00:07:23 +0100
Message-ID: <20261121230731.1206043-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150743_784667_0FEB363E 
X-CRM114-Status: GOOD (  16.58  )
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

ath11k_core_restart() brings the firmware up outside mac80211's restart,
so cfg80211 operations keep sending WMI commands while the HTC services
reconnect and before the firmware reports ready. These commands crash
the restarting firmware again, and recovery then fails on the unified
ready timeout:

  ath11k c000000.wifi: failed to receive wmi unified ready event: -110
  ath11k c000000.wifi: failed to reconfigure driver on crash recovery

With iw setting the RTS threshold in a loop from the moment the firmware
stops, the firmware crashed 15, 15 and 11 times on three triggers
before recovery succeeded. With this patch it crashed once per trigger
(5 of 5).

Return -ESHUTDOWN for commands from outside the restart worker while
ATH11K_FLAG_RECOVERY is set. mac80211 replays the configuration when the
driver restarts the hardware. Test the flag on every try of the send
loop, not only on entry: a command that already waits for a WMI credit
or a CE descriptor when the firmware crashes would otherwise be sent once
the restart worker's own commands free one. Wake the waiters for CE
descriptors in ath11k_core_pre_reconfigure_recovery(), as it already
does for credits, so they return when the recovery starts.

On targets that do not restart the firmware after the cold boot
calibration, the QMI FW_READY handler clears the flag also during a
recovery, while the restart worker is still bringing the firmware up.
Clear it there only on the first boot.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: test RECOVERY on every try of the send loops, wake the CE descriptor
waiters in ath11k_core_pre_reconfigure_recovery(), clear RECOVERY in the
FW_READY handler only on the first boot. Florian's Tested-by dropped, as the
code changed.

 drivers/net/wireless/ath/ath11k/core.c |  2 ++
 drivers/net/wireless/ath/ath11k/qmi.c  |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c  | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7456a8422654..e8d245f1023a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2463,6 +2463,8 @@ void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
+	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
+		wake_up(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
 	wake_up(&ab->peer_mapping_wq);
 
 	reinit_completion(&ab->driver_recovery);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index a176e6498ec9..aee32aec8732 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3291,10 +3291,10 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 			if (ab->hw_params.cbcal_restart_fw)
 				break;
 
-			clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 			if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 				clear_bit(ATH11K_FLAG_CRASH_FLUSH,
 					  &ab->dev_flags);
+				clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 				ret = ath11k_core_qmi_firmware_ready(ab);
 				if (ret) {
 					set_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5f2412982229..82b8481ba818 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -303,6 +303,17 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 	return ret;
 }
 
+/*
+ * While the firmware restarts, only the restart work talks to it.
+ * Tested on every try, so that a sender which already waits for a
+ * credit or a CE descriptor when the firmware crashes is held back too.
+ */
+static bool ath11k_wmi_cmd_held_back(struct ath11k_base *ab)
+{
+	return test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
+	       current_work() != &ab->restart_work;
+}
+
 int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			u32 cmd_id)
 {
@@ -314,7 +325,10 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 
 	if (ab->hw_params.credit_flow) {
 		wait_event_timeout(wmi_ab->tx_credits_wq, ({
-			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
+			if (ath11k_wmi_cmd_held_back(ab))
+				ret = -ESHUTDOWN;
+			else
+				ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
 			if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH,
 					    &wmi_ab->ab->dev_flags))
@@ -324,7 +338,10 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 			}), WMI_SEND_TIMEOUT_HZ);
 	} else {
 		wait_event_timeout(wmi->tx_ce_desc_wq, ({
-			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
+			if (ath11k_wmi_cmd_held_back(ab))
+				ret = -ESHUTDOWN;
+			else
+				ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
 
 			if (ret && test_bit(ATH11K_FLAG_CRASH_FLUSH,
 					    &wmi_ab->ab->dev_flags))
-- 
2.53.0


