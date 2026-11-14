Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206E606A891
	for <ath11k@archiver.kernel.org>; Sat, 14 Nov 2026 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=je8EVJnj;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HHpumL9+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=; b=je8EVJnjdI2zMQ
	GOSrmFzXNNEU6EwxuTEO4yZC3VBDPeTvR/tsjH9G87ptNDgz+mIIXzU4C0IBdcU1HeXZExsj57Vn5
	3sXpoGGRxKxWk88lbl/ym6Z3pAI2hE785fu29/OnX9rZmqBNLS/k2TAedRFMDFMoTq3qiJwiSAf5d
	RcX8u1EqYCvj7zRK9+syocUn+PTPJgP+dpxmAdLtCrDmE4eKausdS2Bywbov5qHVRJ7Nvu/psD/wc
	ScbvZiL3H5/BL+BceMGMkX+mPlwHQbxHdM48I5tRUrzvrmdtVlTMu5HPmaiXA5ddnCNb2H7DmaXhu
	s4Rgo1QAXe7ti1fibJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7R-0000000GpVa-0HsT;
	Sat, 14 Nov 2026 22:21:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7N-0000000GpRm-49Q4
	for ath11k@lists.infradead.org;
	Sat, 14 Nov 2026 22:21:07 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c50933bdf4bso474895866b.1
        for <ath11k@lists.infradead.org>; Sat, 14 Nov 2026 14:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694864; x=1795299664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=;
        b=HHpumL9+1Z1HTycjh2Jx/I63M5D3XvCEsUqfCiLPJ7oSLneTlC1ES+V7a3ds+tvgbD
         172M2n1eVPQFEjEynsJBJAPYAhn4BZ37MHDtBm227rMEZZN+on2YaAHq5WqP3gwmNBPM
         Uflh+ek4NXJuNqialPf6loNswz92pdkgqB9vidy/Ak3J3E9gbgHNl+euCMr9dUqwlL8Z
         OJroaCs+85HjH95KXpJXNBlgGcoUEeh6Tz9qIimBRlUlyzx9+56U+cxsygYG2GhrgTI/
         0JT7Ve7fcaPnKIVka1OsDFPsnyj5S6qqfxcSFVxlj3CprshKgnmg2/a42g7sgf5KtlG7
         hU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694864; x=1795299664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=;
        b=WmxTJabZCWOwAI0G8LsrtP4p3BWIBTKxQUwolEbTI4P7Cj5cXB5fdG2L5aZyb7tkoL
         wOIYUkkSN/uJGKpvZ1gAdQ9zWHq18HCAZebQ6OhV+3cb2G7VOewDRo9MDVqdykEQM51z
         R2UZkZpXZhnqEcQl2wiNjbdQS7zLE4mhTQSreUJ85m2UzP+qLewZYHhM2UZptUsRak2N
         imZgtumCA4z6KfaO7p5Y/pwBfVim/ar1jsP4aWD4cfdHINKxcjDBgF+E0uQo8xWK3X3G
         QsKCo7lIbvGLKhzkKwxMnEJzrd68rRS0Zm0PBa7eyQ3rSjouh0+KFhRmoc6QOQNZGpyD
         7/6w==
X-Gm-Message-State: APuU4Z+1bUGe46/I3LVWOFNoCR5OLmnPSiYhOKIxCWavUVSeRRV5zDC8
	2Y8aQkEfw+Up9FtJAN2Pc4DrTe5TWt8LBOr7/OFUeJdeiQSyd0SRKss/rH1ZjWp3VA==
X-Gm-Gg: AYBFou0umzmQM55i+2SPHFhL7ti9/gMTxTclxsf3VV54f1eLp7AVQsLVWpaKhJkq/mx
	C7TaeMXNB96fTnQZeZTIkkzGAdeHpV7qwB8S+9UCHgy94a/CbRM36G7eGOwmVoh8C41D+nSxmwY
	F0QZLxRHwbw1phTLhly41Djc3rzRiMlctKuckS5VFxg6AZ/c/6/OybCNomEh6fW/YQFJpBfsqGe
	bztGyP7MMqZz8v82TCUuBcrBsK0ZSALStE+sZuym1iVAC+qOXMviQijHAxPj69BI8P+qdjZ7E1S
	pVaOFo3wOrRwrGil/dh5lujhqCoIMYDNI7CKSgOWccfGRbGOFCP4sa298qFQXraGKTcekkV049N
	X7hqvWn1qoJNMyYjszLvtUylVhCkyT1AL8P1x1xRYlXFmd8WjBspzFMKuZQ0q6UjzPVZx0aBecR
	GTKEycyvCf4gCGqz8+AlYvDvPfCOALJDZKJP6eZpGaxy2J4kuS0RI5eltVdecfpJ/PYUtTM8nl0
	QBDKXZf94k0vzu9ePvG8rmnJqIEkRyc7Su9nZx3ERYjhpZr/sJ25mMcDmEhavjXlSzLJwwlXY5K
	mclJfzTfb3/taqjF8xPXTOE45GLA/ROXk6Uj+2TD/MwmLWeVDa6I7MtHjAgdC5XeHLMLyvHeTi0
	cstW8KEj/3PjYjCg1ToDhVsQqRhxfeaLcrQ0o4SBBDTGFc5HcOtg+D5bJ3VL+PwvU+c7QQaOazt
	T2spEMciwbuRNm0DAtm3cyNb+2KHpkOwchcoZyFMmCjFNbmOgscbs+s/MsxCCboOLJ9eCpK0H/J
	UPE47glq+qSIb4Sz5RP0SKZc6hbo/yMvZCC0JuUpPR1QLibnPANNhf6OhmeY+QPJGCWbjoyvGEO
	yR7D7VINYCUhy8LpnX63MxHYryBxi175qSA+1FLZUMrtON1XDJkALgTPtfrfOE+5
X-Received: by 2002:a17:906:f5a0:b0:c46:d493:47be with SMTP id a640c23a62f3a-c50963bba24mr513799866b.19.1794694864369;
        Sat, 14 Nov 2026 14:21:04 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:03 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:58 +0100
Message-ID: <20261114222058.184034-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114222058.184034-1-julius@bairaktaris.de>
References: <20261114222058.184034-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_142106_047407_188F242A 
X-CRM114-Status: GOOD (  13.42  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k requests the optional firmware-2.bin with
firmware_request_nowarn() and uses API 1 when the request fails.
firmware_request_nowarn() only silences the kernel's warning. It does
not set FW_OPT_NOFALLBACK_SYSFS, so with
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y the lookup of a missing file
falls back to sysfs and sends a firmware uevent, which user space such
as OpenWrt's procd hotplug handler reports as a missing firmware file.

Request the file with request_firmware_direct(), which sets
FW_OPT_NOFALLBACK_SYSFS, so a missing file is not passed to user space.
This is the same change as for ath11k.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- target ath-next in the subject
- name the code path that produces the message and why request_firmware_direct() avoids it
- drop the Assisted-by trailer
- rebased on ath-next 1be6c8d3027d, no code change
- new patch, same change for ath12k

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath12k/fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
index 22074653cbb8..842830d2bfa3 100644
--- a/drivers/net/wireless/ath/ath12k/fw.c
+++ b/drivers/net/wireless/ath/ath12k/fw.c
@@ -15,10 +15,12 @@ static int ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
 	struct ath12k_fw_ie *hdr;
 	const u8 *data;
 	__le32 *timestamp;
+	char path[100];
 
-	ab->fw.fw = ath12k_core_firmware_request(ab, name);
-	if (IS_ERR(ab->fw.fw)) {
-		ret = PTR_ERR(ab->fw.fw);
+	ath12k_core_create_firmware_path(ab, name, path, sizeof(path));
+
+	ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
+	if (ret) {
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
 		ab->fw.fw = NULL;
 		return ret;
-- 
2.53.0


