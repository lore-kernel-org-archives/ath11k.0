Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673DEC55174
	for <ath11k@archiver.kernel.org>; Wed,  5 Aug 2026 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vFVpN+bB4EEuxs813hnK+WuPIS45ZqdvBVCb5hchvAg=; b=q6ns+GxgpYvrQU0yDOxK0XPH8k
	ODyl0eCC4kC964ljbcsaoQmvlfPNk2XHYclAm7PwsuJM7qVzOivaiNBUaVWKtx4lsUlO86yKtkXzK
	aR/fC1HqYo4PnzcgeogWPOQpDCVOPy8upqyC2PJRfEvnUdP1tJOwnGm7u+dQ+RjUckTUM4zByclwg
	19jOlgq0fpN3l1xHD/oY1BBlVwzU0J1roaT1Yjryl2F266AAJgLaSB0eAj88oaTKRtr6uMxXM6tog
	KXyQXgUcfv2kJEvjF9Ho21XxrLwPJqzgNIU9h/3pBLoN14GIFK4vlYW+SDoXjK3zLIYvzVleJ9VH1
	oe3cVpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhCa-00000004SlW-0moo;
	Wed, 05 Aug 2026 19:22:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhCY-00000004SkM-0cBr
	for ath11k@lists.infradead.org;
	Wed, 05 Aug 2026 19:22:55 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso203412566b.3
        for <ath11k@lists.infradead.org>; Wed, 05 Aug 2026 12:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1785957772; x=1786562572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFVpN+bB4EEuxs813hnK+WuPIS45ZqdvBVCb5hchvAg=;
        b=M/n+NXywVuqdROCx/ER9PLqmxzeL8kfA0NxEUGdXS8JD+OmWlPHnkdPZPwrCEZhARg
         AXprHnE1zq6IedLADrX/MG83zs2MMiQGS1H4aWXLo1oEeINNYY7+wp4v/oPQOXrG/1xT
         okd0FxusyjXD67Y1wNlSZQD328AZA+xhs/pNbXC64LXKfPJN/xOHPhwSSwZPWsk6giXF
         9x4AhXoRq5d/pWJTE1kE4kzkw4OC/U91DLvG3QRmgjksZmb+OQm7em5jZPa/So0eqUGG
         oZ3qGMxSUz3QZyhqTvzNFyPXnOIq56GExak5Lq8GpFOyWm+Ao0qfT3eU8uyWYlN4FaGI
         B0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785957772; x=1786562572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFVpN+bB4EEuxs813hnK+WuPIS45ZqdvBVCb5hchvAg=;
        b=rekusLnII6MJhY0TNtwubvLslzsDjoxFoi0Vr3NB4IiF/x1VCOLkGIzU8pXNPo9t2D
         RezINmbR7vus3GRWA6kAUUWyWrZFzaL/A+e4iI56sxkaltgXm7qq9b8QykKF4sURkuJX
         3LYa9s+Hpt6eA7DSpBZQcWX2mbUJWwuCPIi3otg9p0ZnWFK7XfEiAiKqRXW2dW+VVedA
         MLcZfvWZozGVSPMobH8u37N3NtT1aDAA8S8bq8MMhGIm7aof7gTaXiON9w3yeZDDTKxl
         5MSkXkZwP1Y+M0zz7HcRu5AZfslxTY2dqg92H7N46l1EEFc3dhz5i2Z0KNQnCSaibIJY
         9dGA==
X-Gm-Message-State: AOJu0Yw6MAMI0XftiwvZ2hKe/5ZQ9HFm96rqzRqJw0Ct2yopQUTj6zeL
	QasL1JzrvHrI9EMmBRT7z5z0F8uvXcU38YtqoaIJ43FNLB8YWEZMIUIp1Ag2RbtlzQ==
X-Gm-Gg: AR+sD10HbwPFIWFE+RE3zDcq0CfDRXRg3GodK41OYxC4zyIqwbhSfiqj/zdmJiHPe0P
	S7w1BNyTe6hfeAIAFVzEFDw76WKFBCRJVyhth07ozcAMU9zV97Bzc/vRKnfvcexQaveo0oJKHiV
	idmugHVrfAToRnCoHZFxMnW+hX3LwcyPFh41yZoim56YaG2iiLAzthfvbSrzCIM7ulw/sdgeH4h
	gL3UbDttadUhoK7Bm3m1yw/hFFg/COqQEREcMGmfzsaX5Ti0GD+d7AAW6CfX9fbQnMRlApYMngW
	aNFEmJ8mjJ+vTDAvV8POykxBtetRn3vosMeMzuDJX6WjojLSEt6iMJsbq+NCR6Bjrak/2jTEYCQ
	G9LmX2zAO1zmbvCiL+0atj+5JnVSuYfwZDUKZFE+Fq1FYRQ2VFaEx0HmggmsDcbCbXxhAB20J+c
	6JSqkEU+AoEefkv7ecCyn0RgJMiTuEGbAd7tpIcHPCVVbFcJSXY3/ro1iCudVB5Gzucgjo3CCjc
	R5i2oUVLza5Vsi2Oiqpjx7C4u98L/3+k2SqZP8X4UGfQssMIV2Ak4vacR6NUrEa/geuN/XiFjYr
	yj3XayN+yrcD6XP7vnyzweMWxcrMIO09jikvGBIqfDDpUtwZWV6DCoqDvUonnpZw12/xiNFdZMS
	S3A97vURfPaJoh0d+LjkbQ0lkvi/tY4YatIHYT0MPqMK0wCVoA0Rh6xlC0psDIRqu12XO5O5ezr
	guSeCvDZiyHvdkZQ==
X-Received: by 2002:a17:906:99d4:b0:c19:611c:fa8f with SMTP id a640c23a62f3a-c2039c1f2b9mr464669266b.18.1785957771812;
        Wed, 05 Aug 2026 12:22:51 -0700 (PDT)
Received: from Desktop (pd9513cee.dip0.t-ipconnect.de. [217.81.60.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a17d6216cesm1180713a12.31.2026.08.05.12.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:22:50 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com
Subject: [PATCH ath-next 1/2] wifi: ath11k: guard copy engine access against a cleared srng
Date: Wed,  5 Aug 2026 21:21:28 +0200
Message-ID: <20260805192129.61113-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_122254_234387_6BF05402 
X-CRM114-Status: GOOD (  16.76  )
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

ath11k_core_reconfigure_on_crash() zeroes the ring list with
ath11k_hal_srng_clear() and only rebuilds the copy engine rings later,
inside ath11k_core_qmi_firmware_ready() -> ath11k_ce_init_pipes().

ath11k_ce_send() is gated on ATH11K_FLAG_CRASH_FLUSH, but that flag is
cleared before ath11k_core_qmi_firmware_ready() is called - it has to be,
since the firmware bring-up itself sends WMI commands through the copy
engine. For the whole of that bring-up the gate is open while the ring is
still zeroed, so any WMI command issued in that window dereferences the
NULL u.src_ring.tp_addr in ath11k_hal_srng_access_begin():

  Unable to handle kernel read from unreadable memory at virtual address 0
  CPU: 0 UID: 101 PID: 1846 Comm: hostapd
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_ce_send+0x114/0x350 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_htc_send+0x188/0x3c8 [ath11k]
   ath11k_wmi_cmd_send+0xc8/0x2f4 [ath11k]
   ath11k_wmi_send_peer_create_cmd+0x78/0xe0 [ath11k]
   ath11k_peer_create+0x138/0x500 [ath11k]

The caller matters: this is a command issued fresh during the recovery,
not a task that was already blocked in ath11k_wmi_cmd_send(). A blocked
one sleeps through the whole window and never re-enters ath11k_ce_send(),
which is why hammering beacon updates does not reproduce it and a station
associating during recovery does.

ath11k_ce_completed_send_next() has no gate at all, and
ath11k_core_reconfigure_on_crash() calls ath11k_ce_cleanup_pipes() before
anything else, so a crash arriving after a previous recovery already ran
ath11k_hal_srng_clear() reaps rings whose tp_addr is NULL. This is a
different entry into the same dereference from the one fixed by
commit e8d85672dd7e ("wifi: ath11k: fix NULL pointer dereference in
ath11k_hal_srng_access_begin"), which stops a successful bring-up from
being repeated; it does not close this window.

Test u.src_ring.tp_addr rather than srng->initialized in both places:
ath11k_hal_srng_setup() publishes ->initialized before ->tp_addr with no
barrier between them, so an ->initialized check can be true while the
pointer that is about to be dereferenced is still NULL.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/ce.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -472,6 +472,17 @@ static struct sk_buff *ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe

 	spin_lock_bh(&srng->lock);

+	/*
+	 * ath11k_ce_cleanup_pipes() can reach this on a ring that
+	 * ath11k_hal_srng_clear() has zeroed and that recovery has not
+	 * rebuilt. Bail out as for an empty ring rather than dereference
+	 * the NULL tp_addr in ath11k_hal_srng_access_begin().
+	 */
+	if (unlikely(!srng->u.src_ring.tp_addr)) {
+		skb = ERR_PTR(-EIO);
+		goto err_unlock;
+	}
+
 	ath11k_hal_srng_access_begin(ab, srng);

 	desc = ath11k_hal_srng_src_reap_next(ab, srng);
@@ -750,6 +761,19 @@ int ath11k_ce_send(struct ath11k_base *ab, struct sk_buff *skb, u8 pipe_id,

 	srng = &ab->hal.srng_list[pipe->src_ring->hal_ring_id];

+	/*
+	 * ATH11K_FLAG_CRASH_FLUSH is cleared before the copy engine rings
+	 * are rebuilt, so the check above lets a send through while the
+	 * ring is still zeroed. Test the pointer that would be
+	 * dereferenced: ath11k_hal_srng_setup() publishes ->initialized
+	 * before ->tp_addr without a barrier, so ->initialized would still
+	 * race the rebuild.
+	 */
+	if (unlikely(!srng->u.src_ring.tp_addr)) {
+		spin_unlock_bh(&ab->ce.ce_lock);
+		return -ESHUTDOWN;
+	}
+
 	spin_lock_bh(&srng->lock);

 	ath11k_hal_srng_access_begin(ab, srng);

