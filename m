Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB7A606A31B
	for <ath11k@archiver.kernel.org>; Tue, 27 Oct 2026 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C+f74kI7;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=tlPsn5AK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i1SNxIXweOOqIgbJIjQEMXKXOyJJ3/czuTf5ENSChcw=; b=C+f74kI7JD1NAD
	EJrPps5OQsr2bor+7YNruiUOfusD3dzmy8QLACI09HupOCBIBoFNWxY/leCIflcqMicFjuFRAWzgc
	+VsrFGvJzmnbz4T2R5+Stl/DnRpKXHU/S7rXmv2HZ4AF8oQsCv4UOzTNtRsiKzlZQIqTM/aewsei7
	cIGRCW5uetTQM77B8G+uMBM8Aua+4Wj2ToGMaIoEJS5MTGqYPjAak4kJyDET8GSQaJBfh65UpmzFG
	uOvtVKXZ2ZH+s9LEAViuQsBW5TkAesUF0Qgd+d2pta88CZpzam7+hqlsgckATNkhO7ZI5zRpZGAJR
	wRHTM6YPvAb78CD5HkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc2F-00000003xUJ-08zU;
	Tue, 27 Oct 2026 07:55:55 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLc2B-00000003xPT-3MYJ
	for ath11k@lists.infradead.org;
	Tue, 27 Oct 2026 07:55:53 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso3893083a12.1
        for <ath11k@lists.infradead.org>; Tue, 27 Oct 2026 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793087750; x=1793692550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1SNxIXweOOqIgbJIjQEMXKXOyJJ3/czuTf5ENSChcw=;
        b=tlPsn5AKhYvcgYZ+AwODy2GPbP1Fz6gUC92edVxQE2rvE6GTSYSsQ5im5wzMl7VfOW
         Y+LYhHyLDbenRE4/wShhr6G5N33hzQxTXVueajX3JQgZwX73t2c7GzUJR1xqXedQ75Lt
         MW5ZyjFoTMlQqKhDB58DmBSzmCY0wiX/geimyUzihqD9H0viV3/uW81AnkmogBfIRDei
         NruBYZFOtwxg01iKo2uPXl/sGw8M1d7Rbd9TgE5DQu4cVjGQpoSDsoE+8p1M6EdHjdne
         CdUazq0edJe/W6qsV0Tan8UgApIRgtjhkMYXQ2qCHMCro70NO6khrarJQEEWBmyPwSFm
         BY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087750; x=1793692550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1SNxIXweOOqIgbJIjQEMXKXOyJJ3/czuTf5ENSChcw=;
        b=F9nDBpObhKDU9U7GhDIRRbNEa//UHFRGWfQ/IfOGhwBHyk4BmOogsRAxykla7pe0Ge
         HX86CeTocXIm3xS7XKPxt/KS8JeTiKPAUHgzQW98WlDX8UlW7p7UpGwa8CJPGuM3T+F1
         rV216SyS74aux3v3N3CU7p4jM/frSVT5rhd1K6tn7Su+QhTl0Em85cjEO35dPOh3J5H5
         dQp+IesWWRvvTje2MWswwV7Z9FIPJWcea7MPi4FPTZVgU/WN1Px/wqhwOLQH62oZB5df
         YTBv929nevFuz0pS1WBq4Ctt7Cl9MBWPspSPISeF1XRQFcifSpiw7VSxfNA0SV+fSePO
         ACXw==
X-Gm-Message-State: AFq9FYJ5mwsmvAGGs51ugZxZHbaacd294+WLLrj+9Ft8EuN6Yxd6ZTi+
	dw+/0dciD3gFCIsDWNRQrnFiNeFs5i1Tw0j5ckjK0ov2WdAbbE82MUfPCPNDu612Pg==
X-Gm-Gg: AYBFou0TxjKtc9SPT00nn/67rj1+2Yg7CGfDetAUIiAe+qwFbgIr6ISQtPupMpoe/KZ
	rQ2x9X5oBK0hu6edxc/J+g+2XIPDAdhE5OpFEadZT9HHzQJkcs8/NPopamTNFmojonQgeB8oYei
	++2GLr//lvowoRRWqOgM5o6hno2OSfq1piZTUAyQXDS8oNuH/dVTBOV7Ksep/Ygl3AYvK7cGaS/
	euJO4/RxbAGg2zuR1Oi11z50+ojsJ15Mk8e/xY7QwNBRL6U5rV/tF7B90BacBKI/NkHF+0yrlD2
	fdHcYLB+RszclmU8oXjGod2mmicB6FbT15qHIIh3XNppeh9XxWVqzSU6N2cgO0TZmFev/oC4a4v
	hhlaRwXsdOjZPGcayXYdsZcIIG7TkSrWOVlAzoLpEb+HA8U/zUWmAZRXAg2m6XqNDZPTTGrG6KY
	eODAIbKYxbUk/l/ScXKCQQcMUgZ84atbsnIQOrYUGre64XJZKRv9FSRwKDhOat4pU+cxtNrzorx
	jtd2tFDjCSqEpExlmf7Lgh9j9q72toPwuggt/xaEESKtZqkW1WM0ahhh/1plnhpilBfMsIo2DCT
	cLemx9s1OQRK8wp8j+rHw7TXHMejRF6otZo0m7wC4ddN8lMgtciyB077/GUalKfI+l53r4FuPyQ
	AOElT2mEy88c9SvbCe0/ptwK+eoPd6gWJolVuddaNd79EnFpvGSr09QrM85vPW/NNPbYlboNNEZ
	/6Hov2VK790VmDFqJ6v6ww6jNYSS2yNCxglA//nt1zpaXYERfGIJL/snDz7e7FRZz7CLaxxV+Rt
	Zlyl438
X-Received: by 2002:a05:6402:c18a:b0:6b1:c774:58c4 with SMTP id 4fb4d7f45d1cf-6b442fe1896mr5512109a12.7.1793087749785;
        Tue, 27 Oct 2026 00:55:49 -0700 (PDT)
Received: from Desktop (pd9513dae.dip0.t-ipconnect.de. [217.81.61.174])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4669251a12.19.2026.10.27.00.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:55:48 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Semih Baskan <strst.gs@gmail.com>
Subject: [PATCH ath-next 3/3] wifi: ath11k: add a module parameter to select the hardware mode
Date: Tue, 27 Oct 2026 08:55:44 +0100
Message-ID: <20261027075544.19144-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027075544.19144-1-julius@bairaktaris.de>
References: <20261027075544.19144-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_005551_908048_3226471D 
X-CRM114-Status: GOOD (  16.43  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k always uses the highest priority hardware mode the firmware
advertises. On the Zyxel NBG7815 that is DBS+SBS, which splits the
eight 5 GHz chains between two radios, neither with a 160 MHz channel
width. The firmware also advertises DBS, which gives one 5 GHz radio
with all eight chains and 160 MHz. Add a hw_mode parameter that selects
any mode the firmware advertises; for a mode it does not advertise, warn
with the modes it does advertise and keep the default.

On the NBG7815, hw_mode=1 brings up the 8-chain 5 GHz radio. iperf3
from the router to a 2x2 HE client with 4 streams gave 1.22 and
1.20 Gbit/s at 160 MHz (two 20 s runs), against 886 Mbit/s at 80 MHz
with the unpatched driver (one run).

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Tested-by: Semih Baskan <strst.gs@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c |  6 ++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 17 +++++++++++++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f43..e1a6085a065a6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -38,6 +38,12 @@ bool ath11k_ftm_mode;
 module_param_named(ftm_mode, ath11k_ftm_mode, bool, 0444);
 MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");
 
+/* hw mode values are mapped as per enum wmi_host_hw_mode_config_type */
+unsigned int ath11k_hw_mode = WMI_HOST_HW_MODE_MAX;
+module_param_named(hw_mode, ath11k_hw_mode, uint, 0444);
+MODULE_PARM_DESC(hw_mode,
+		 "Hardware mode (0: single, 1: DBS, 2: SBS passive, 3: SBS, 4: DBS+SBS, 5: DBS or SBS, default: preferred mode the firmware supports)");
+
 static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.hw_rev = ATH11K_HW_IPQ8074,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..0d81212770019 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -59,6 +59,7 @@
 #define ATH11K_SMBIOS_BDF_EXT_MAGIC "BDF_"
 
 extern unsigned int ath11k_frame_mode;
+extern unsigned int ath11k_hw_mode;
 extern bool ath11k_ftm_mode;
 
 #define ATH11K_SCAN_TIMEOUT_HZ (20 * HZ)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index b3c778eb15876..615a8fc0b9937 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4760,9 +4760,9 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 				       u16 len, const void *ptr, void *data)
 {
 	struct wmi_tlv_svc_rdy_ext_parse *svc_rdy_ext = data;
-	struct wmi_hw_mode_capabilities *hw_mode_caps;
+	struct wmi_hw_mode_capabilities *hw_mode_caps, *requested = NULL;
 	enum wmi_host_hw_mode_config_type mode, pref;
-	u32 i;
+	u32 i, modes = 0;
 	int ret;
 
 	svc_rdy_ext->n_hw_mode_caps = 0;
@@ -4783,6 +4783,10 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 		if (mode >= WMI_HOST_HW_MODE_MAX)
 			continue;
 
+		modes |= BIT(mode);
+		if (mode == ath11k_hw_mode)
+			requested = hw_mode_caps;
+
 		pref = soc->wmi_ab.preferred_hw_mode;
 
 		if (ath11k_hw_mode_pri_map[mode] < ath11k_hw_mode_pri_map[pref]) {
@@ -4791,6 +4795,15 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 		}
 	}
 
+	if (requested) {
+		svc_rdy_ext->pref_hw_mode_caps = *requested;
+		soc->wmi_ab.preferred_hw_mode = ath11k_hw_mode;
+	} else if (ath11k_hw_mode != WMI_HOST_HW_MODE_MAX) {
+		ath11k_warn(soc, "hw mode %u not supported (modes 0x%x), using %d\n",
+			    ath11k_hw_mode, modes,
+			    soc->wmi_ab.preferred_hw_mode);
+	}
+
 	ath11k_dbg(soc, ATH11K_DBG_WMI, "preferred_hw_mode:%d\n",
 		   soc->wmi_ab.preferred_hw_mode);
 	if (soc->wmi_ab.preferred_hw_mode == WMI_HOST_HW_MODE_MAX)
-- 
2.53.0


