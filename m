Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037EACD342C
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7pexLJ9J+9YgCt2KZyZO6yiZqoTWaoO8wMjWHe+dEeI=; b=x8LXnreooB6PsfsHdI1OtFTxJD
	yleW8ZsTt2mBwskK1tflknT4BlKfAC4s8mxvD/OlPYXtQFY1mgmiqAmKYanr10vK4vpGLaFJsTCtb
	QikG/jTKqp5we6O7zF9wENM00mGb+DDUW2hYikoTkNQHLgkp3eYdwDEx9bNzIiaFmncgt+iLx1/N2
	WKZKZVO/eP7tQW/YFkrmHTjwnz1LJO3ZJm9tBHSMAycf45bMqO12ymqOVlq26yHbMUCpLmaRLUeGq
	5aZweWvG8864Gxs32plzB/j69GFo63/3ad+op43CGgn3BNHTAHsJhOc5zIXBSqlY07k9QyzVdzWH0
	Lc+v/s/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcWV-00000000vuK-0rjA;
	Wed, 06 May 2026 13:42:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcWR-00000000vr3-2Odo
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 13:42:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-441209fb77eso655370f8f.1
        for <ath11k@lists.infradead.org>; Wed, 06 May 2026 06:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778074961; x=1778679761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7pexLJ9J+9YgCt2KZyZO6yiZqoTWaoO8wMjWHe+dEeI=;
        b=ez5XN+zBCYF9fS1mL+Kjj7kP8jkksh8uqhUbsfOBNh2jwWN1IgkDUeDXub8Zj5A7CV
         8uiiRPv6pXXJQ6p5DS3WC0JW+6k/fP3la+zZwRV5tAIG4UU1x4+aiZj8LNhQLu8U6epe
         oQa3GEP5OqbSRBydpj0DWXMWxYKGTOg1LMac/noNYjNdAaDE8XS4LrxToNvl5IG7rk2Z
         H5F2PrdwMKG0CAwV8bKtVD96rp8H8spxHmJwF4skHwPr9/U63u09Af1QBa7kEmvwXLWD
         Maj75EYxEYnpirD8p+Z+RBgBzpvPBrsl3BPJGhGdoVHsdrmTRaaiahG9BXkeTh1KnuLC
         R1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778074961; x=1778679761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pexLJ9J+9YgCt2KZyZO6yiZqoTWaoO8wMjWHe+dEeI=;
        b=dDjOIOSsf3Bv9x6e3lQtbFJKSew0mm1h6Bq/OHwtS5o5Z5qZLzgVSnbTFZSc81ROqZ
         4Kj79IVBHYvGwNub3Xh2RlDOzjjXW4M3iQIp9/tgf2G0V6TexgnM2cDsCrBsbwCN4Yyb
         onSMo/RtfzZBXVRFzzZeWZzdS6935ugATIyx0CCa3XtEmVBblR9gC3ydzyexpIaLDeek
         wJjYeBxmfBsQjcqiS7ShfnTg5sU62uvVlDzBZgT2f2IOVCwVOynu3ALgO3jEfw2+6Rh+
         h+hcswQJWf5QQVtL7LyTsHzoABnLSNEnessiEJzOsfPrSi9rZ0JZKacUasQLSMMfpqFo
         hYoA==
X-Gm-Message-State: AOJu0YyI4PWtlbkKC+NScr5M80cLH4t8JfSC6C7JDmfAdNyNeuWtlGt/
	uE40oOK4xZlCbArIuKYDvHFQ2Qdx3adb1Z/DZy57vgfBxxcKBmyKNyvZSjqtUg==
X-Gm-Gg: AeBDieuDoYKu+nca7wOPVWx0d/zZLqP1x1qTR4hicGipnhFYfFmDNYW4/JYt1t2HElS
	0QaaUsNmMpS3P+U6+aVGmRZXrXuxn8rPd+DWndfioh5bjdHtYOKfyLl+JU+qsDpmF8iInmbivL9
	2Xf9eNWR1pU5E1jk8/XeT6htnT070Kt3rtizB8WlLTXBLrpp7SfcZiH9uhdtDgTHj/1yxG+Koj3
	Tj8JtlUONOPDgpKpBJUfVM2GJ1GxVXmvQL7ZWcq4WfQ+ZC1Vppc3Z+std3llHRMrPhB5l/DoaCH
	/t5dBpsI0JNquY2Vtn+S6xgtbnuPSKtpL9IOXZP80HsMLr2KNyR1IRtDrvcqiTBoelLNjD7LorJ
	cU17oqsvj7Wj9K9FWLz5X0AUoY9eE1qTfmrUrtg5YSmnC0bbzkUlEv4UznyXYXJdozFyiER7uTi
	tj02upYxFkZydElvYs3wmvjn7IN1G0FLd9b6Nsoe7X2+5d/XmPu+znO0Gefh4O/dPbrTE=
X-Received: by 2002:a05:6000:438a:b0:43f:df55:fe5e with SMTP id ffacd0b85a97d-44fd83c7bb1mr14066953f8f.0.1778074961246;
        Wed, 06 May 2026 06:42:41 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm12542182f8f.7.2026.05.06.06.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:42:40 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/3] fix leaks in some WMI error path
Date: Wed,  6 May 2026 15:42:37 +0200
Message-ID: <20260506134240.2284016-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_064243_614970_E27C7837 
X-CRM114-Status: UNSURE (   8.53  )
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

So this is similar work to what has been posted here [0] for ath12k.

When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
explicitly checking the return value we fail to free the allocated skb.

This has been split into 2 patches per Jeff's guidance to hopefully
ease the backporting process.

[0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico.escande@gmail.com/

---
Changes from v1:
  - Added patch to also fix ath11k_tm_cmd_wmi_ftm() as per Rameshkumar's remark

Nicolas Escande (3):
  wifi: ath11k: fix leak in error path of some WOW related WMI commands
  wifi: ath11k: fix error path leaks in some WMI calls
  wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()

 drivers/net/wireless/ath/ath11k/testmode.c |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++---
 2 files changed, 113 insertions(+), 19 deletions(-)

-- 
2.54.0


