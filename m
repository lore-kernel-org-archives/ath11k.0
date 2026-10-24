Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C1606A31D
	for <ath11k@archiver.kernel.org>; Sat, 24 Oct 2026 05:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0q+QNbqt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Txt/RqYg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=F5lL8gtrm76MfXFYgN7B3cAbNKJht4qocJjaadImFYQ=; b=0q+QNbqtCY+lA83q5FI3ib23Pz
	9QXS6HskK8scD6t4+nwipfB0DBRAlarjZwKNxpelB/84W9u1o6NqMgEMsJF/Z8Dolb0h8AnkHyznf
	09mWPLsXOPTQfGb2C7wWKg/AT1A4o2BQNzK4aVCRBhVbpa7WH70eOaV/QVPsdIh/uGipgC/lW73KB
	JMLbfifORVCUXJo3+cGsWYykUHztU8q7LIzgxqeIgYvz3cHV0Pxq4UiduHUUhwOpTxK/WPnw6hKA4
	6+Mcq1rIDbInc+63tTk7H+AqNHa7LP+5523lKEanVzeMW9HWfXxXVw1RHpKQi9Pyx9Xiv/aZQuMIp
	jxOHdQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKUSq-0000000HT08-0Yh5;
	Sat, 24 Oct 2026 05:38:44 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKUSo-0000000HSzk-0M5v
	for ath11k@lists.infradead.org;
	Sat, 24 Oct 2026 05:38:43 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36661f953e4so2646599eec.1
        for <ath11k@lists.infradead.org>; Fri, 23 Oct 2026 22:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792820321; x=1793425121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5lL8gtrm76MfXFYgN7B3cAbNKJht4qocJjaadImFYQ=;
        b=Txt/RqYgleFz0CreCgnFn2ek+KgDHXSlnq/CVhFmy6lPkU1Qumub06Z78/tTfXDDbk
         ALnPEzkanaII/ba3qXQS5Ol1kzq15Nvn5EnN+dPl6ILhUBs2zWupZmgdm/6g9vprFZT/
         OgCJCfJjR6Z8q6IOTCJr5t9nwyADMhXfupjSNit+o8Bvcys4vgKF4oAY9M1CgAjrab34
         Mkv2K0UxO8vdYFhkr1xdSggR+cn7Q/T9dGMsDhjOEHIO4OseNs6MxAsb2U5g9M6A/Dwo
         IX0wA8Req093gUrZKx93TLOvy7f4z88IoIGB1hhNz4PAcEwHwnHJVjbOwis7CjV+Sode
         r8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820321; x=1793425121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5lL8gtrm76MfXFYgN7B3cAbNKJht4qocJjaadImFYQ=;
        b=Rjh2+T7ZCVPwImdG9ts8xSCj3Sk+DoHSsLi5LVYh7VAFelAY69SZl+4gYXciQ82+QS
         QydFvTV3FvjVOCce2CI8MyZWf3MKMsiSeGpvIpc6+pPpniwfvMnCL89VUjX6CWkDn4+c
         yPMmUCpFbuXQxLj3/U6KXdONihznZVu/ohSsty0Yt0nXTRwZpSRvfIesZE2bfocr8H9m
         WRFzz7v7/drkJLKUDUFHf/rtn5uCySStcO2q/BADuKGGjPnhfEuPTwVF+7FrM8+s+DCq
         ZPcmpL5b2HDjB3fq/AmM8AKkBCF8xkHgKIyvsImtzMGjzS409yOKGc8XlbQEUXBrYRJJ
         7jwA==
X-Forwarded-Encrypted: i=1; AKwUvBwgGH5VnmntcZvf4/ecEFNNQqHR8yY1PUujAedzcihX7VnlVl7jqXY8FoyvEaFNUTxJ0qEvP+w=@lists.infradead.org
X-Gm-Message-State: AFq9FYLMq3K0cKSh4s9PJ5YxVoPeSOYFEGBdKpsR1TKrXnimsQgD5oba
	DhsMcDymHK7EVpKlEw3BmcDtBaoAiU1Q8tblFIQvn9/YObwK++gy56Uo
X-Gm-Gg: AYBFou2KA9jUTW1mTjzcePkBO3Lib3OeTP4Vkr3WFankVvNn/vm98giQDzx7zIh4FoJ
	Hp/CuwSJ5VpxThfAtOQZStrUioxShT04SRnKSUfeRCQdpt+/3PMdHzsGRtDhgP/HInJkdJy3YQ0
	knpgCkjN4H+vK4XFXAgPVdXzQGqTTk7YTersCXdqo5syvu/AP52kQmJnd5EoeY4J44vqt7W1Djt
	PlQdBmHs7CtFQOXFaoQryhJ1ElbqDF221GZBALmrtWHaLVCHae2AYa1jyWs/KU0SO14N410CsMI
	WxI6M+wtDNEC8tPX805MzYypRs46IBegNkoKh0RmO+YnQ3parEqhDlPBwK2R2Mgn/7KY4LmYehP
	sftqg10hdk/zufAvRI64YHw3e2o9OjgQK3ZELle2FjQ64q0TJGG77sRjoYVtDrl3D9aC1KMw/Rd
	58SzP2EGrNwTsDQxNmeCHdgC7fAttD8C4JKKL5uLP8DZHR6eXv9zDBrFgGwvU2TF6m+iK3nWHBF
	/g/cpzISNZCGkyhV+H3LxWMq4X73WcfhZLROTDACnB29pAFk8N6VV5+VsNSo2pxov7eMGA+dB64
	cF9gflKgPxbG0fQGWq5LVsRDDg3ddnjodqAayvZxXNGvXOk7TnDNmBP0uUJvpZL/htzQB9Lu9m9
	QkWkS3ervNCK1jpA/AqZC89ygf6n4
X-Received: by 2002:a05:693c:8392:10b0:35f:ef9e:f846 with SMTP id 5a478bee46e88-369e8315eeemr2176820eec.3.1792820321076;
        Fri, 23 Oct 2026 22:38:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm3813684eec.27.2026.10.23.22.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:38:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath11k: don't select ATH_COMMON
Date: Fri, 23 Oct 2026 22:38:38 -0700
Message-ID: <20261024053838.3569557-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_223842_378730_FF7E10EC 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k only uses the header-only spectral_common.h and testmode_i.h
from the shared ath directory and none of the symbols exported by
ath.ko, the module does not depend on it. Selecting ATH_COMMON only
builds ath.ko for nothing on systems without another Atheros driver,
so drop it, like ath12k already does.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 44b520d2e66e..99f625b82fe1 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -2,7 +2,6 @@
 config ATH11K
 	tristate "Qualcomm 802.11ax chipset support"
 	depends on MAC80211 && HAS_DMA
-	select ATH_COMMON
 	select QCOM_QMI_HELPERS
 	help
 	  This module adds support for Qualcomm Technologies 802.11ax family of
-- 
2.56.0


