Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FE6D3B7EA
	for <ath11k@archiver.kernel.org>; Mon,  8 Dec 2025 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d9WaSQQ0PkGqeHp9LL2kJRaAe2H4lpRnuEoZ98r23rw=; b=AK4JLwUReUOEB6iuW6av2X58Eh
	kh/iXZjKbnK7qsxaSPMuFBxcGeVt+Mmg0VH3IsqhZLLeMQ7lgXTPcwrjxiA2T6EO8xGZljv/SNXBY
	FM87NYsyeIoHBwjZJR14VSFjZ+h7YGUaQQUF6lNhBTtSNKoxFOZrluVLzaYHI/u44B7t/1NcXJtZ/
	4ghv001TnVroJ5542h0QAbet+ZaRSNQXeUsjYG6CAchEtN+EPr95+t/Hnp5urcJFKQWc77hL+j7e+
	n+EWGsWFTlkpATuBcrM0tl/bzynJnyYNDIx4j+jbrm+1LCX7bW+6J8xwaeJgzEQ5QsEejav1ecbv0
	1vAehx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vShTc-0000000DV79-1rYD;
	Mon, 08 Dec 2025 20:04:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vShTZ-0000000DV6E-1VEb
	for ath11k@lists.infradead.org;
	Mon, 08 Dec 2025 20:04:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso42339055e9.3
        for <ath11k@lists.infradead.org>; Mon, 08 Dec 2025 12:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765224291; x=1765829091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9WaSQQ0PkGqeHp9LL2kJRaAe2H4lpRnuEoZ98r23rw=;
        b=YOKifyohUAbUQmwtaW7pvjzlS+h9ztM19B8ZgyRU/FjJj2E/wsd3dc4RcynN1ZBm9E
         XXYpsZ01s5mEGU0T/nS9ISp86ffRgnYOV/pAJMH5lw9PXMem9oBg+Ne2DUjR1Zzrqthe
         nkk6Q5maL0FKnd1bJTBntNOUsWIefpuFhs1wPyh3ZqVKzQM+0HMtrQusq/fZWetOiBSk
         GFpYpGL9DPaSmel3xhFJF+kbP3AeseVI1zG9CaBp30Zt/qly9eH0B2k3ADnSYEk1ZPoa
         bKbWO3Bgs5coynOkNWgRrjLRkvL4FEn3CVJixNss5jzPTTeoH/CAJ7qFWPZ2Dl/ikL5x
         nULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765224291; x=1765829091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9WaSQQ0PkGqeHp9LL2kJRaAe2H4lpRnuEoZ98r23rw=;
        b=nj1Frk2W3lWQTstSArzK7TQ+LOp5SUnliiG0QKmCejmi2n8werJPZ2K7g2iK1CS3hr
         jwNTN+67xYsP9NCH5pUJI+ME3kLYhsYOD055Q1H0we1/RBCTnsjOAUfzMkaXat8v3asc
         JipDCbUg3HL5OcpmdOYjweLltWO8W7i730175ZJrh/wlT9bLYY6j1IvXjN3OS4BeNZkE
         xqFvTqt2ZUJs1ANC7ddjY/7ZPDQrD/ykkqV8ojPOkZUKJi0IkBz3E0yqTLJoWtuSfDWx
         dCIVn+TEjB36c1oAtefeI9InJpw9rZWezXHJoT2lyNFjIJMISJYoKmrTGtybr4b/hD8C
         zfMw==
X-Forwarded-Encrypted: i=1; AJvYcCWT4PLDHUzGkk7TQEbwSHlJ7Pf2UVXX2eTBrvtxSONoMDYs0JvW06b5Y8tVbRVWARZSQCOcY6I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMem6k9f3U8zgAb99gGzR4yOwv6a0Jw7OBt2+1dvngLvj7ALxx
	/E70MveZhX16xRYbtGvJqwK7DaRfJchb0cnp2MUr3LN3CWoJKXwD7fpr
X-Gm-Gg: ASbGncvUkviKW/dVKK0YgFxL6wWpUYkyURN/0kXl7d6aqUnWeihUJS+GJt9XAisfPMB
	46c7hExAta3Yr8Fq6A6t6qXAcfgdWxJpQ2hXkPS042nH12b79lg7ngAbm3pKYAGA8L3pLN/zfgX
	0FAxFWuaaQXPoGJ6a5sV3QGRoQLMceEU6yKP3UPB2BfY/JosGthuJeAjQrlBIF5N+SBKrbSmI97
	N5DZh4D0rBQ5dtnVfoEu1KQygDiwzbPiIyuLXq9pJzcqpA1j/okcEBfamXmuinl3o3UYWrXAFFx
	RnxGJYYC4g9aoAi8fGJicUT4NUeR4o/Ad1feyOyfUMmT5S7+m6RYlkOmK7/dSeXa644LfLb9F1o
	ZVOFrKS+wx4SvtQPVFCBnyc8ro/p8UY6oF0gcE5u5/nEkGVcjHKEjVuGYsMRr8lgxMBP1l/hPih
	IIhsknnXCI3mqsiju2r6Vv4yUZywWaO3mX/RDTLUxBi0jibJQht4U=
X-Google-Smtp-Source: AGHT+IELJ4QWyLI18G+CslWw8CT4fzH53HDJS5AGtq1akWXecKkPf5nz0AOnRqyw1ggDtLTR6UltQg==
X-Received: by 2002:a05:600c:3b8b:b0:477:af07:dd17 with SMTP id 5b1f17b1804b1-47939e3897cmr134757755e9.24.1765224290994;
        Mon, 08 Dec 2025 12:04:50 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a7d6eb1f1sm1906885e9.2.2025.12.08.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 12:04:50 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [net PATCH] wifi: ath11k: fix wrong usage of resource_size() causing firmware panic
Date: Mon,  8 Dec 2025 21:04:32 +0100
Message-ID: <20251208200437.14199-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_120453_415757_62A19A0A 
X-CRM114-Status: GOOD (  18.73  )
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

On converting to the of_reserved_mem_region_to_resource() helper with
commit 900730dc4705 ("wifi: ath: Use
of_reserved_mem_region_to_resource() for "memory-region"") a logic error
was introduced in the ath11k_core_coldboot_cal_support() if condition.

The original code checked for hremote_node presence and skipped
ath11k_core_coldboot_cal_support() in the other switch case but now
everything is driven entirely on the values of the resource struct.

resource_size() (in this case) is wrongly assumed to return a size of
zero if the passed resource struct is init to zero. This is not the case
as a resource struct should be always init with correct values (or at
best set the end value to -1 to signal it's not configured)
(the return value of resource_size() for a resource struct with start
and end set to zero is 1)

On top of this, using resource_size() to check if a resource struct is
initialized or not is generally wrong and other measure should be used
instead.

To better handle this, use the DEFINE_RES macro to initialize the
resource struct and set the IORESOURCE_UNSET flag by default.

Replace the resource_size() check with checking for the resource struct
flags and check if it's IORESOURCE_UNSET.

This change effectively restore the original logic and restore correct
loading of the ath11k firmware (restoring correct functionality of
Wi-Fi)

Cc: stable@vger.kernel.org
Fixes: 900730dc4705 ("wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"")
Link: https://lore.kernel.org/all/20251207215359.28895-1-ansuelsmth@gmail.com/T/#m990492684913c5a158ff0e5fc90697d8ad95351b
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index ff6a97e328b8..afa663c00620 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2039,8 +2039,8 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 
 static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 {
+	struct resource res = DEFINE_RES(0, 0, IORESOURCE_UNSET);
 	struct device *dev = ab->dev;
-	struct resource res = {};
 	u32 host_ddr_sz;
 	int i, idx, ret;
 
@@ -2086,7 +2086,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			}
 
 			if (ath11k_core_coldboot_cal_support(ab)) {
-				if (resource_size(&res)) {
+				if (res.flags != IORESOURCE_UNSET) {
 					ab->qmi.target_mem[idx].paddr =
 							res.start + host_ddr_sz;
 					ab->qmi.target_mem[idx].iaddr =
-- 
2.51.0


