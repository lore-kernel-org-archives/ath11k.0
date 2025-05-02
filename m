Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA61C3ABAC
	for <ath11k@archiver.kernel.org>; Fri,  2 May 2025 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84CrWQUO3MnFFPefMzxpDlQeyVctJsJF0WYn/k9T0Jc=; b=bqqg4XJd+Ix/lk7eScr91zhSji
	ipsoVzKMamK67+yzkSiy5AtWk7iUkwzWSO58dvyRFCgZpTXBKaZX8Zk8AQO5mrqA1fVkjJNJFeyu1
	36BNmms/j2XHQpcd2xfB42Zxd/x7g/8uAfmSWLAwXLFn7cx1xwSrXXBNxGo3vMCTHZrdtX2D9U0ga
	O6vpLD3UIVfNnsNif69vUSmJrzv4LiShIr53DC3C59WMWAjniFvGGBbsX0S7aPV7LpNYVxOnWHWyl
	HWpgkOarfBnTZM0PcqvdB2pg1MmZ9Vjar6+9v+hYW6UZe7dQNjyWhBjFwcK50hNR7ipYcYwOTppaF
	GK31Ddlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlcN-00000001Bqx-46jo;
	Fri, 02 May 2025 08:19:35 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlcL-00000001BpY-0WlE
	for ath11k@lists.infradead.org;
	Fri, 02 May 2025 08:19:35 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5259331b31eso562126e0c.0
        for <ath11k@lists.infradead.org>; Fri, 02 May 2025 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1746173971; x=1746778771; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=84CrWQUO3MnFFPefMzxpDlQeyVctJsJF0WYn/k9T0Jc=;
        b=maJpMUGBwCR/MvFwh7m5pRcejlutXBs880AJkGtYmRMwapvBfywpbSaF2Lq1LHgr4S
         uc2AxsjFHLgYgbOew5O/uVdwOuWR5viY9sReosgzQa0NagzDGImsebnrdPuHj5fGDIYE
         8hu235SG9aG9T84BMscRsQ1BxMUrW4yJWjFZXqoe6W2ZIBPE4O/1Spgoe3l2wg39dwGt
         rT2jLVh9ZZH68nwxW7gwnRHPzD2TesnSna/ujEefMpXixB5weS0BSDkv4AlblFSWLV3v
         biV9kYy4h/ScwHgNiesZ/dHSekPyHmNPqhZruu99nFV3+zFtHbQs/HEqbxjEle+4eG4h
         cNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746173971; x=1746778771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84CrWQUO3MnFFPefMzxpDlQeyVctJsJF0WYn/k9T0Jc=;
        b=AMN+MorZmPvHD8R+ioyeXUD4Em3YHSb2Kt1QAYLMTGn79ZtTVnekwX0IskMhHfanTl
         5KhuuhNQURR/vpEaOE+3UgQWDVsV7koHlysw+Qqiu33eyzwJXA1oBZK0MSsm3oj0430R
         X02HDLbZ6pIWNZG9MSgOvt8OHr6JOucsmHZ9xJjGnOpi0aViNmoEIP5WNK6Vz3EfQTUi
         gTBr3ML8f7oH9q6mspFNAMfka6di7PBV5orHJiBs1cQOX3sBvXfOcYwg9WM8+4wITylH
         2U27xpxGqynNuKta48VBP8aw83n1BYxl9/oYQwtLAWHsI259twz8n7neqRaXivy1YQHY
         7zsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFrkTKddFx/oGGbOVU+1DWalK3dlYb0tqY4Gczin/7cRMK3cI8dEG/p9S9koR3oAToyIT+vKs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Vg0zaFfatGu5ENVIt7vmKPmRfCGcSR9ERNJQNOTxp7PZMu2F
	RBGZH0sRruF9pY94bK+5Fene1SB8tI6INVoZgEFVNbYoEMOotY4iI0cfLNqwVywZklQNx6rlNGk
	9e758NEHgNCD7hd83jRdEsk3duSNj+5paSTXx7A==
X-Gm-Gg: ASbGncscSPK+I7WinHe0pFuj6hxQtSuCzu+zBc1JGhXeJGdliLXvqLBzynRDqBU/FpU
	dzP00+Np/9xU8f2xb+V0tVV73txONLSLczLCuPPC0fXmgfnC27YbDZgOCTv27Zj0upW5oRVyT8K
	TOcca1dfcXIkKVt/8iHu9w7Lw=
X-Google-Smtp-Source: AGHT+IHxsA6UkxMOVUH65tG13GkZAPDMxSJgtyY4IzL6w+Y4D8uNT7W+U7Dgze8ywmQoBbZnpmnrL/sRVsMfSWUhbYE=
X-Received: by 2002:a05:6122:82a7:b0:520:61ee:c814 with SMTP id
 71dfb90a1353d-52aed675ebdmr976892e0c.1.1746173971118; Fri, 02 May 2025
 01:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com> <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
 <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
 <3da5d47b-993c-405e-841f-1d16d8715610@quicinc.com> <1d0682c0-ee5d-f2d4-199d-4ebc4e71f9ef@quicinc.com>
 <3660fcfb-be29-422b-a352-3996ad3fc41f@quicinc.com> <CAONkfw5-bfYRwHZ9iHhgJP2f8Zqyz5SZVbdL4n9EPhKU+=ONPg@mail.gmail.com>
 <CAONkfw7xjJjMAZSfHg5avEV=Bc5aJZqrRxMDvKWK4g14bLNjRQ@mail.gmail.com>
 <d4b01807-0770-439a-a77b-1e0f078687e3@quicinc.com> <07013bbc-296a-2403-a6ca-70de220495c5@quicinc.com>
 <fd6c118b-90ea-4d11-13d0-d8f49f9325e3@quicinc.com> <CAONkfw7z3QZORCMxOJAnzF0bLNmsZKfV3rOYEhStAK628dpq+g@mail.gmail.com>
 <15edfacb-4eeb-bc3f-72cd-4b7744c9da13@quicinc.com>
In-Reply-To: <15edfacb-4eeb-bc3f-72cd-4b7744c9da13@quicinc.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Fri, 2 May 2025 10:18:54 +0200
X-Gm-Features: ATxdqUF4R3CpScbdGnvNfMuGve0rFItJnL4807hw3x4RQybCmb1AmtLCdqx_x3Y
Message-ID: <CAONkfw5=Ze5TrGf1ZYrgDsWhGzOrK8oj4vPGf=xL9UDuLTYx6g@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, jjohnson@kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_011933_428858_EC1FFC72 
X-CRM114-Status: UNSURE (   9.30  )
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

I had to skip all "ath11k_pcic_read32()" calls to avoid the kernel crash.
When booting and loading the driver the  "ath11k_pcic_read32()" does
not cause any issues, only when unloading, rebooting and poweroff the
problem appears.
I will send the boot and reboot logs as soon as possible (probably
monday, when i get my hands on the target device).
and this is the diff that worked for me, that replaces the initial patch :

--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -201,16 +201,18 @@ static void ath11k_pci_soc_global_reset(
  ath11k_warn(ab, "link down error during global reset\n");
 }

-static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
+static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab,
bool power_on)
 {
- u32 val;
+ if (power_on) {
+ u32 val;

- /* read cookie */
- val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
- ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
+ /* read cookie */
+ val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
+ ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);

- val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
- ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
+ val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
+ ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
+ }

  /* TODO: exact time to sleep is uncertain */
  mdelay(10);
@@ -221,14 +223,18 @@ static void ath11k_pci_clear_dbg_registe
  ath11k_pcic_write32(ab, WLAON_WARM_SW_ENTRY, 0);
  mdelay(10);

- val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
- ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
+ if (power_on) {
+ u32 val;

- /* A read clear register. clear the register to prevent
- * Q6 from entering wrong code path.
- */
- val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
- ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
+ val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
+ ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
+
+ /* A read clear register. clear the register to prevent
+ * Q6 from entering wrong code path.
+ */
+ val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
+ ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
+ }
 }

 static int ath11k_pci_set_link_reg(struct ath11k_base *ab,
@@ -366,7 +372,7 @@ static void ath11k_pci_sw_reset(struct a
  }

  ath11k_mhi_clear_vector(ab);
- ath11k_pci_clear_dbg_registers(ab);
+ ath11k_pci_clear_dbg_registers(ab, power_on);
  ath11k_pci_soc_global_reset(ab);
  ath11k_mhi_set_mhictrl_reset(ab);
 }

