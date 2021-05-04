Return-Path: <SRS0=LAxC=J7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88917C43461
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 16:35:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6B361153
	for <ath11k@archiver.kernel.org>; Tue,  4 May 2021 16:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA6B361153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sartura.hr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kHmsSoP3g8jlrM5NKNmR4xxBrsObPzZc4g8+Eg93S+c=; b=akXJYY2MKlqqKQ
	/mQfxUnL82IGhrgmCF1t+GDKFFL9r5JZM68Zh4GNWcmVac5IaOr3LGfH7ul8C1yMS92P6cwRWHFe1
	4ckBP6FOlp0g8YblzGDjAoa2y16ARUx15oXPDYpoMF9CCurZDBqerkaGS/JMmspHpyFhJ4OfOiIWq
	NnKczsxvkurnxrBnn4VHy193afhNIoKEl8fQ0Syf+4hYArukjK8+mYqhLg65dSlzDrPcxwIfDN5Na
	S/8SrdqgGJLO9QpS8IskTZqJeGtKOuPqQZuG9/Be2fgDuPcDs/NuziUSH3IusW/ZwA+B2XS+7Kmx9
	CPnYYe2opbFLE1JpDhMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldy1V-00GYMt-Qj; Tue, 04 May 2021 16:35:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldy1S-00GYMY-L0
 for ath11k@desiato.infradead.org; Tue, 04 May 2021 16:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9rcK99+rqp0Z3nf2VaLpfZNCCCsNG5LTS71sBR/AvcQ=; b=q0bwn4JV/e4KkNbOfwiVWFhF4i
 ocIqAjc4BiJj7JwCVfgZumj0BtIED4W6vFieuK1saA9yxVnT2WPfbZyO8InTRDoTkoBjFVQzYgoqt
 ie7PmQWfWkmop/QHNVmXYRy17H+igJ8VDMKIMYKpS+0nGTVBEIhSLFOAPk9KS9iSPjcp4HDuo/2Qw
 qG1in3nFUpMkZVj0FgwLi2phFNfBKkgaKaf5mhiHSDB2V5goEFdG04ep+pn3PrlDgWe9a3O4jcm94
 ynrWOhtlUVPUVItFR6EzdFs5J+vsr+2X9/2BU3/gzgBxZDHBynOBlAWs7j6GPlshnYMBMWhtNQG4A
 knuGCRQw==;
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldy1P-0046uI-IE
 for ath11k@lists.infradead.org; Tue, 04 May 2021 16:35:45 +0000
Received: by mail-lf1-x141.google.com with SMTP id n138so14252143lfa.3
 for <ath11k@lists.infradead.org>; Tue, 04 May 2021 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=9rcK99+rqp0Z3nf2VaLpfZNCCCsNG5LTS71sBR/AvcQ=;
 b=tbBi3UowgyeHBdhlhwe9NsgJMicqgc6XBToY87INliM/f+DHT6AldWDo0Ac6QBKaeI
 K3AbQLAs9wfgWzUDb4ArC6D33XLg8Wf1EUkGRDtdE0Ij/v34kb58mVb6tsOz1TaE/na1
 S1C9oQmF5JYc5iaCTNQX2EBVOHPqjyhrx7OrT98xfOYBuUIsvGsczWEQ5S+xClXWLgGb
 3CbvLF722XpTPiOT+eZdmQt2xNU9XDgWV5m1qC/k/0B5kulRPX96iXVUZL52GjEhM8TR
 rHxcDnkLLFW2lojwaqwy028k7eTZVZj2Y1Fh3xpJhW0KfKJNviWtuf/RFJD+9yCzX72+
 ag5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9rcK99+rqp0Z3nf2VaLpfZNCCCsNG5LTS71sBR/AvcQ=;
 b=d+hX0xUujGEv/c0mroTHMm9pFcEFzPDidYoWrcC9PXyFo3p0QBRBjdFUVUd16sbKr7
 1NaW+NlZcsFckFLzEDm5BQUgK8rcQEdTaesjoKHZEz9TfWBdLas/EDO3rThJF1otjric
 4PB8QiXWptu/wzJc3+nM466lPL+ruBkD3uTd7CvK5q0GT9NqzLAMis8YuhZ+QPOX7O/1
 w4ejUZV42gmc4NDESmmyc4646UJrClkaBj0Ru2RVlq/fOiyyqDXocPoITax6QoWrUEqE
 /HqIpEggfEiDggKM+BEsdcxT6+GC7HdRYtpaTMBRN6p83YM5V8rXeGQrfBrv/rP96Fp3
 IhXQ==
X-Gm-Message-State: AOAM5300t6rG2fjDnHs5Octfal3TqkXtJYXHvmGpWyqFF6wLp6anwPR3
 5L+O9FLpVvJkatT5XZfubTx44+9F5j9t/kN3ivu79fiGl90PnOH10h4=
X-Google-Smtp-Source: ABdhPJxxvVdnjKR1P0U5Abgs9ikR+bcZ8PNBVCnZPHJmGAs0665JYiSXUSCZ0E7ancAKHhp/ZreLwmLQ5udx5Y6QUAk=
X-Received: by 2002:a19:ee1a:: with SMTP id g26mr3597087lfb.158.1620146141306; 
 Tue, 04 May 2021 09:35:41 -0700 (PDT)
MIME-Version: 1.0
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 4 May 2021 18:35:30 +0200
Message-ID: <CA+HBbNHYiULJ2T1Q3dmmXZSYb3gLajr2m86HTvCO-ud0GwkaZA@mail.gmail.com>
Subject: IPQ6018 issues
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_093543_633490_4702A753 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

I am trying to use ath11k on multiple IPQ6018 and IPQ6010 boards,
unfortunately, they will all fail like this:
>
> # echo c000000.wifi > /sys/bus/platform/drivers/ath11k/bind
> [   12.417214] ath11k c000000.wifi: event type: 0
> [   12.417557] ath11k c000000.wifi: qmi ignore invalid mem req type 3
> [   12.420605] ath11k c000000.wifi: event type: 2
> [   12.427191] ath11k c000000.wifi: event type: 3
> [   12.431312] ath11k c000000.wifi: chip_id 0x0 chip_family 0x4 board_id 0xff soc_id 0xffffffff
> [   12.435626] ath11k c000000.wifi: fw_version 0x240606c6 fw_build_timestamp 2021-02-12 03:17 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1
> [   12.447560] ath11k c000000.wifi: event type: 4
> [   12.459215] ath11k c000000.wifi: ATH11K_QMI_EVENT_FW_READY
> [   12.463551] ath11k c000000.wifi: ath11k_core_qmi_firmware_ready
> [   12.469013] ath11k c000000.wifi: ath11k_core_qmi_firmware_ready start
> [   12.474900] ath11k c000000.wifi: ath11k_ce_init_pipes pass
> # [   12.491124] ath11k c000000.wifi: ath11k_crypto_mode: 0
>
> Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> S - QC_IMAGE_VERSION_STRING=BOOT.XF.0.3-00098-IPQ60xxLZB-1
> S - IMAGE_VARIANT_STRING=IPQ6018LA
> S - OEM_IMAGE_VERSION_STRING=crm-ubuntu121
> S - Boot Interface: SPI
> S - Secure Boot: Off
> S - Boot Config @ 0x000a602c = 0x000002e1
> S - JTAG ID @ 0x000a607c = 0x0013a0e1
> S - OEM ID @ 0x000a6080 = 0x00000000
> S - Serial Number @ 0x000a4128 = 0xd92ca102
> S - OEM Config Row 0 @ 0x000a4188 = 0x0000000000000000
> S - OEM Config Row 1 @ 0x000a4190 = 0x0000000000000000
> S - Feature Config Row 0 @ 0x000a4130 = 0x0000000008000001
> S - Feature Config Row 1 @ 0x000a4138 = 0x02c3e83383000009
> S - PBL Patch Ver: 1
> S - I-cache: On
> S - D-cache: On
> B -      3413 - PBL, Start
> B -       592 - bootable_media_detect_entry, Start
> B -      4339 - bootable_media_detect_success, Start
> B -      4435 - elf_loader_entry, Start
> B -      4607 - auth_hash_seg_entry, Start
> B -     10854 - auth_hash_seg_exit, Start
> B -     11350 - elf_segs_hash_verify_entry, Start
> B -    357983 - elf_segs_hash_verify_exit, Start
> B -    362173 - auth_xbl_sec_hash_seg_entry, Start
> B -    362318 - auth_xbl_sec_hash_seg_exit, Start
> B -    368868 - xbl_sec_segs_hash_verify_entry, Start
> B -    368869 - xbl_sec_segs_hash_verify_exit, Start
> B -    369798 - PBL, End
> B -    296002 - SBL1, Start
> B -    435814 - GCC [RstStat:0x2, RstDbg:0x420100] WDog Stat : 0x4
> B -    438254 - clock_init, Start
> D -      3812 - clock_init, Delta
> B -    447862 - boot_flash_init, Start
> D -      8082 - boot_flash_init, Delta
> B -    458201 - sbl1_ddr_set_default_params, Start
> D -       274 - sbl1_ddr_set_default_params, Delta
> B -    464820 - boot_config_data_table_init, Start
> D -      1891 - boot_config_data_table_init, Delta - (575 Bytes)
> B -    473970 - CDT Version:2,Platform ID:8,Major ID:3,Minor ID:0,Subtype:0
> B -    479490 - Image Load, Start
> D -      6619 - OEM_MISC Image Loaded, Delta - (0 Bytes)
> B -    488823 - Image Load, Start
> D -      5063 - PMIC Image Loaded, Delta - (0 Bytes)
> B -    496692 - sbl1_ddr_set_params, Start
> B -    501694 - CPR configuration: 0x366
> B -    504897 - Pre_DDR_clock_init, Start
> D -       183 - Pre_DDR_clock_init, Delta
> D -         0 - sbl1_ddr_set_params, Delta


I added most of the prints to figure out where it dies.
If cold-boot calibration is enabled then it will die on the
ath11k_qmi_process_coldboot_calibration(), to be exact on the
>
> ret = ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_COLD_BOOT);


But, if cold-boot calibration is disabled then ti will fail in
ath11k_core_qmi_firmware_ready at or after ath11k_crypto_mode switch.

A big issue is that it will crash the board and it will get stuck in
SBL, only removing the power will help.

The hardware I tried on is:
* Wallys CP01-C1
* Wallys CP03-C1
* Alfa AP1800C-AX PRO

I also tried fw versions from 2.1.0.1 to 2.5.0.1-R2

Does anybody have an idea how to solve this?

-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
