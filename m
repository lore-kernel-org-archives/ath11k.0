Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6535CC02185
	for <ath11k@archiver.kernel.org>; Fri, 17 Jan 2025 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=99e4J68cxEKBg616wDoMXtPaePxmFVcHw1zkfBxnlHM=; b=mkllKtIMF/J3URB7zgmhguJoh6
	CWpcngU0kbQ2Bty9yW2ens9POoBsRXFzICmDL9LqSYtqlGV7CfItVK7w9EUGUO+NISoZ9xDT8NmLk
	nUdsEIcaxmMTTnOulrtLVLfUih33QTeiq3t+qipD538MQc1+4MP3EDcvJ10N5YIx255Kf2f7rY5Hj
	5daJj2Ldbud1sYeeE37C71h4lxCmhmvV3a2pQqf3nDuGKM5gjg/oqzX/80ccN/q2ml4XiDoDTFQLe
	XdkcT0fNNdiX+iLw0Jl78oLd41KNxNKq28ZRn7FzFNWynE9yanFomfEMDPDsnLhuhsmt4DYMqnMNk
	js1oNalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYro4-00000001DPY-32Qs;
	Fri, 17 Jan 2025 19:15:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYro2-00000001DOJ-32UK
	for ath11k@lists.infradead.org;
	Fri, 17 Jan 2025 19:15:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43675b1155bso26823005e9.2
        for <ath11k@lists.infradead.org>; Fri, 17 Jan 2025 11:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737141297; x=1737746097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99e4J68cxEKBg616wDoMXtPaePxmFVcHw1zkfBxnlHM=;
        b=kmi5iZqWLx7bmQm2x42cV4V97LNBasQzqHGr2RGUZrBz+pi8CPVPrqLJnJmQVtWIrO
         V7xZONb5SDJrBF5a/yashkKxAuKwqyiXuchRoteY1ukDJEkz99DEZmHs+AG9mA/YAzVo
         pf9hgAX6Ida8sWei8BmCtFJmqKKmCw8broU+3l5pDjOlzbcWpJVO5lO4ysEin+o1aCmK
         aD0UysLrzdbgMMJHM4vWL1xYizNPyNcy0E66aa2YdQzxdJ62a4OXa3+8sA7dJOMMc/a4
         x+wTS23goJ+tJpwTj8+Uwhk91o8SX9uGzfet7hdgAdPDnkGjbk5/3gCSWrxjfGTTvDUF
         ygeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737141297; x=1737746097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99e4J68cxEKBg616wDoMXtPaePxmFVcHw1zkfBxnlHM=;
        b=d+TUk0es7AkduGKvupdzj/ExC9NXqHIv49zewLis7o6C6V2yyVDQMsm0sBZgYsOCGB
         0sU2rdpY3KvikdNCQTIdoHIzUGy6Ioo52418JYHzrwCt621nawijCLpXfMEL9FgAJgYR
         ONsHm5zvMDY7CuWM2S4SRlJKe9DyP5JYELs0no7FjT0wwzGxeuiyXF55DwBpVAFpcq+w
         7iokZNGC0EtOTlFiSXlNcweiV129OVUC0bE7qBtgyHuorP6Xx1pZqR6kpLb4b45OZWDn
         u3FM+77RfU7MJCLxsfxBeHLdEOl77q0YlzMVPgTwa63O2BEz63XPgOMVGwarBqBtUnXL
         Q8Kw==
X-Gm-Message-State: AOJu0Ywxy3cDUZaUj/ppe8ZHlnxNmVhfrEocwFIh2F68pvctGvxB1lXe
	5Mu+mKaqbA0FhfdOQS1+LnLkrPJEQDbnV0J3sVBzW+RC7POBPGunASynzQ==
X-Gm-Gg: ASbGncv7qk/35fVEp+cz1V74JWHZHB89X3NV6yU/stxBSCnXHCnh0Dzqu+KgfIj37b2
	y04FBQVPHQln70zKh7UbOKMfmp6EuEXHRdwYUC8FZlJKTlq8L4KTZVpZjS1cq0rY3d4NIlRAJkD
	FIC+P1IWcxa5Otet7oX9JosClKaUSSHLZEI3zsbTbv2pQNmQ7J4W0HS0zBnCtI5JIxItcf8jRfb
	w3RU+Y6oIC/Asurit9vZ12KulkHZKRxumxDclxTplt2sZJ+VLKYe6ktVj/7vrIW0hKhCgKVSenQ
	YXWwYWz7wArWbw==
X-Google-Smtp-Source: AGHT+IFURGPATZai3ribvgNfR+gInUwm8jy4Na74LIXUvtGwyak3lYx45vrT3YiJNGXh9TnMeQyWRA==
X-Received: by 2002:a05:600c:5486:b0:434:f586:753c with SMTP id 5b1f17b1804b1-438913ca694mr39450775e9.7.1737141296811;
        Fri, 17 Jan 2025 11:14:56 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ace8sm3242709f8f.53.2025.01.17.11.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:14:56 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Steffen Moser <lists@steffen-moser.de>
Subject: [PATCH] Revert "ath11k: clear the keys properly via DISABLE_KEY"
Date: Fri, 17 Jan 2025 20:14:55 +0100
Message-ID: <20250117191455.3395145-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_111458_764469_7455E3BE 
X-CRM114-Status: GOOD (  11.44  )
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

This reverts commit 436a4e88659842a7cf634d7cc088c8f2cc94ebf5.

This as been reported by multiple people [0] that with this commit,
broadcast packets were not being delivered after GTK exchange.
Qualcomm seems to have a similar patch [1] confirming the issue.

[0] https://lore.kernel.org/linux-wireless/Z2Q9POuV-6MIdzRf@pilgrim/
[1] https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.wlan_host_opensource.3.0.r24/patches/ath11k/350-ath11k-Revert-clear-the-keys-properly-when-DISABLE_K.patch

Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
Reported-by: Steffen Moser <lists@steffen-moser.de>
Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +++-
 drivers/net/wireless/ath/ath11k/wmi.c | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1556392f7ad4..70793f8b1081 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4220,7 +4220,9 @@ static int ath11k_install_key(struct ath11k_vif *arvif,
 		return 0;
 
 	if (cmd == DISABLE_KEY) {
-		arg.key_cipher = WMI_CIPHER_NONE;
+		/* TODO: Check if FW expects  value other than NONE for del */
+		/* arg.key_cipher = WMI_CIPHER_NONE; */
+		arg.key_len = 0;
 		arg.key_data = NULL;
 		goto install;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 87abfa547529..02ff0a58952d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1854,8 +1854,7 @@ int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
 		      FIELD_PREP(WMI_TLV_LEN, key_len_aligned);
-	if (arg->key_data)
-		memcpy(tlv->value, (u8 *)arg->key_data, key_len_aligned);
+	memcpy(tlv->value, (u8 *)arg->key_data, key_len_aligned);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_INSTALL_KEY_CMDID);
 	if (ret) {
-- 
2.48.1


