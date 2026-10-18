Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23028CCF2C9
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gp82D46O8wvY4gHZCDROdmv/VEli/DkrbpYd3Iw4T+M=; b=z0cO9UCtQlsoUOWlXXcBhplrSW
	FyPu+whoq2oF8GKSuKql1b0GPA9a7t4Ek2lbjNMWk3ZY369/MKRS0S98WgDqwKY4C++nOemQ/pkcr
	C5ai6ETf90pwYp6SKfll2442Pz7ybyZ+MuckkhhGm0Pqx3uDYokQT2L9aTPTR+kfXUROlG5JpufGu
	mEzLwCtBKlYt9TtIN9J3hiDzorXHs8SxlbvCPwkNPuAR0pUGFJsFZZoeoHsZ+FOUsEo32Wr2FD466
	UF8c7uPoLBQt3ZTH9XALduCyQx7KHxFzvCqJJxsMt2ThpOZVzkWlZAPTbii78Hw2DXpbwzJeHmG5Y
	VOGwYn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY1E-00000006EIy-35D9;
	Sun, 18 Oct 2026 21:02:12 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY1A-00000006EEk-3Cej
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 21:02:10 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso4357568a12.0
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357327; x=1792962127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gp82D46O8wvY4gHZCDROdmv/VEli/DkrbpYd3Iw4T+M=;
        b=iqQDCnSkuNzHi2drwwXM3k5sq+BR//JHupBvZ+FnYuvsucN1x68d63oJoMwKGlk7rZ
         IUPoTI0X1D+1YYCa2hwfroSvkb5I/ns8OtD++v+aEj8YKJxDdSPt5sGzXXd/yaDqRy2N
         A8/7c2OcxfG+DvYK+gHh9fi5sUm0OLgTVPvzxxZ6Ky/5Bx+8+WwxsmnbJdGeTUx0YUjg
         QDBqOXAYBNBwy6yzAeljSywT4nJ3/U34rH0SDFAB2A8VeoVUnFDnItKoJ82BvFjXW3+u
         UXR4ZTHwiPqVrii+64FEachCuGEJCjvzYSjUCYhUqghKy2cpEMVotcG3uOhly7GoMzSf
         +AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357327; x=1792962127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gp82D46O8wvY4gHZCDROdmv/VEli/DkrbpYd3Iw4T+M=;
        b=EaJkXAWHkfN1ejl3cmZmF+DrE402C4PY+PqpJOF5ohrm5lh5leWFxaQekCV1Mp2Gu5
         r+G61TCn9C53zq1kAJqtkN/hrvghiAKIw+ZR6TMOaXNjUT7fLodEnYTjYjXhKwpVHnyx
         L74SQ8qaDD3kSnu0c0q4SKtLY4lme84+O9xBRB1nOInvmaeoHYCqec6u4PiOWgSQu2Gu
         LBD0kptf4vJGFeZ77O/TNs8h/4oLObXcqCz3zCe8ue74wyCaEZ0jJz1afuGlwVMAYGlx
         P9x/D7hcKyb6gQIZLvt7WTrZnJrfbswLlibQTUOCvjq1o75dnGzRikYgDwmv2YAuPbmt
         mJHQ==
X-Gm-Message-State: AFq9FYKVJnQx2bh1FtmG3XTl1zGude3LFzSTf/QXKDOyueCB0QYYZ8KS
	KvoH00ItxcJbpj+N7j/jyOLzsW4+C3U7LRpTgO/ER/2j6YskwHqFofneqixC4VCaDg==
X-Gm-Gg: AYBFou05kVS9lLRxp/UkZg0V6fC3SdsDgqlGDpLuQ5x/zFWYmP/CKwX9IlwlihusVfV
	Q4mzUYJSW88lNo+hZdNNFowHFN/yPBgDauQUAuoupECp5aH5Z29dkH+LCY+Ao2xgObAc4JBUD2n
	OS2kHq9UM04sglzIKgm6x8gzzIW6ohJeGI169o7Iylg+BhS2JXypJyLXTOnBqXichywx52qujS0
	QFSiE95EYQD9fHXc6pEiXM+lJexU+vkRJ3748Q87Rfd2lSBR8GDzY8Q8ZYXMjw1mOTEKy8i2l/2
	jDbd+vBZ6cmXXHwufC8Yz8EWeNobpTk3C/+OJkGCDQHKXkEHvwpheHK6UhwSSHiD5ZauYROONpx
	zPbwJy3SQfrW5mfnWcdQ+xeIVbv+yrXn+2MgjkpWmSr007r431KoSWrBn0G8VIDYfCd5qQF7e5Z
	WVOTXWGEbOmE/8R0JRL0hEwsvNL3BOVfDikY2ITSAK++B8y52ww0iP4Va8zkxNE8HAUOUj8Upve
	8gY1DB3CXdVbL7eOgIJC/jGG+3bnPeM4ZacUnPVYn+2nFdnqLdHgAg+INcFzsxySCF+HCjn0wbx
	w1kEj4MmnURaOlie9VwGkQ1hJ45ffGzGVIgxAm6w2Xuk6XNTAHOfw+XksP6XpYFOsU+g5+tH+sY
	deEXfLwjymH+KTFdXpmCrC8XCXi2ca55MPt4EFf0w41ManIk7g/po7JhlZfYHJot/EpDxd6fhBR
	0GZOvg8wcieM/8+HJQNc4=
X-Received: by 2002:a17:907:d19:b0:c2d:c6e7:9e9a with SMTP id a640c23a62f3a-c419e23799cmr365428566b.11.1792357326420;
        Sun, 18 Oct 2026 14:02:06 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:02:05 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 5/5] wifi: ath11k: hold back WMI commands while the firmware restarts
Date: Sun, 18 Oct 2026 23:01:53 +0200
Message-ID: <20261018210153.1925962-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_140208_817710_82790628 
X-CRM114-Status: UNSURE (   9.69  )
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
driver restarts the hardware.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3d5b6605eace8..5c27e7057e6ad 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -312,6 +312,10 @@ int ath11k_wmi_cmd_send(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 
 	might_sleep();
 
+	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
+	    current_work() != &ab->restart_work)
+		return -ESHUTDOWN;
+
 	if (ab->hw_params.credit_flow) {
 		wait_event_timeout(wmi_ab->tx_credits_wq, ({
 			ret = ath11k_wmi_cmd_send_nowait(wmi, skb, cmd_id);
-- 
2.53.0


