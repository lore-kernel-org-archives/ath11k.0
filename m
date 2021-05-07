Return-Path: <SRS0=IakY=KC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3C8C433B4
	for <ath11k@archiver.kernel.org>; Fri,  7 May 2021 05:03:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1810613E3
	for <ath11k@archiver.kernel.org>; Fri,  7 May 2021 05:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1810613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WxC0uXryYzcRhZS4RLv4QgzcsV282bjldh5arG17MQw=; b=DskQW5o+xPZgN6KsmmBfN8rn+
	U4v1k7Pco39Vvt/qnrOtThfRe6Woji+BYYFTsAq4iI5taOYyWbXDX3DUYGF9vtujcHYUq31+KvG5A
	6vU4282VmMKh5f9OjDIzjKcIYTbwIgwNMbDxPE7kpP4YRV03DULK/Q5lxDUN/5ajMAXow5ReGXfJy
	CR16lcapKaTWpDbTF8OnWBhK/E4Sxf7UcD6AR8J84Ja+iqniryCGCtR0CSHH0TIqjuKkLi9wQVTD5
	b4b6svain0+bGIANHNSYoDkxc6Re85cXt+RRxln9bVMRwfbqghhIIXCXbR82/PLu6qZwvAjyHscJy
	rNt0EsokQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lesdj-00689g-B4; Fri, 07 May 2021 05:03:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lesdg-00689Y-MJ
 for ath11k@desiato.infradead.org; Fri, 07 May 2021 05:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=5DApajcvWZ0c1rdHpZ6fq6YsGtDfuD8Mk7Gjy0k1f0g=; b=OHeUHw47S0amyumXS+XrXi8QZk
 iDF5wtfnuRQaTFRBzwRXFCBfbq7O4mWRZSHZnvfIl+/abd1a7wF+LtXaHUOl4mUHgAqBmR2aeYgsF
 mYmg3d3/hj/HxjCr/hkm/DDMufFbUX62neSk8xKZ+wXNy7Ba/a5KMfEacYMaTD5/J2wHYOiP5DaN+
 94UXgOrztN9bwuO6pX53noQ0+K84ygZr5oFsHpLguHD8sFah7Um8PeVeqHV5Pc8g03mHM2h8LlQ+Z
 jrvSzci0zVG/sSexqBajut6j0TT9xIxtwWJkSdsO7N7hqBWqa1nJWwO/G4JPirIcZEqlmgAVamxFR
 A1OcukLg==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lesdd-006Zvx-NQ
 for ath11k@lists.infradead.org; Fri, 07 May 2021 05:02:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620363777; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5DApajcvWZ0c1rdHpZ6fq6YsGtDfuD8Mk7Gjy0k1f0g=;
 b=C73goO07/SmgJLY6O2VJn0PJh4pc5xsDVg9JCHIeylVMSlye6Q+124fLJgiVFdkoVM/eV6ge
 TjSQVrhcEUDMKmRPqGsiF7BD0TQ+maCW6tPtC+9HMbAKqcwOP2g4ljTAtOYIUpOTxZRd2pq+
 v7ZxN1ehbn0ie7p9uqkf5lhoQ/g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6094ca0087ce1fbb56c7a4e3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 May 2021 05:02:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ABB12C43143; Fri,  7 May 2021 05:02:55 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bperumal)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 265A7C4338A;
 Fri,  7 May 2021 05:02:55 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 07 May 2021 10:32:55 +0530
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: ath11k@lists.infradead.org
Subject: Re: IPQ6018 issues
In-Reply-To: <CA+HBbNHYiULJ2T1Q3dmmXZSYb3gLajr2m86HTvCO-ud0GwkaZA@mail.gmail.com>
References: <CA+HBbNHYiULJ2T1Q3dmmXZSYb3gLajr2m86HTvCO-ud0GwkaZA@mail.gmail.com>
Message-ID: <6b7c79f0fd04c2d7752a181e5d0281f5@codeaurora.org>
X-Sender: bperumal@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_220257_843067_6EBF6620 
X-CRM114-Status: GOOD (  19.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-05-04 22:05, Robert Marko wrote:
> Hi,
> 
> I am trying to use ath11k on multiple IPQ6018 and IPQ6010 boards,
> unfortunately, they will all fail like this:
>> 
>> # echo c000000.wifi > /sys/bus/platform/drivers/ath11k/bind
>> [   12.417214] ath11k c000000.wifi: event type: 0
>> [   12.417557] ath11k c000000.wifi: qmi ignore invalid mem req type 3
>> [   12.420605] ath11k c000000.wifi: event type: 2
>> [   12.427191] ath11k c000000.wifi: event type: 3
>> [   12.431312] ath11k c000000.wifi: chip_id 0x0 chip_family 0x4 
>> board_id 0xff soc_id 0xffffffff
>> [   12.435626] ath11k c000000.wifi: fw_version 0x240606c6 
>> fw_build_timestamp 2021-02-12 03:17 fw_build_id 
>> QC_IMAGE_VERSION_STRING=WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1
>> [   12.447560] ath11k c000000.wifi: event type: 4
>> [   12.459215] ath11k c000000.wifi: ATH11K_QMI_EVENT_FW_READY
>> [   12.463551] ath11k c000000.wifi: ath11k_core_qmi_firmware_ready
>> [   12.469013] ath11k c000000.wifi: ath11k_core_qmi_firmware_ready 
>> start
>> [   12.474900] ath11k c000000.wifi: ath11k_ce_init_pipes pass
>> # [   12.491124] ath11k c000000.wifi: ath11k_crypto_mode: 0
>> 
>> Format: Log Type - Time(microsec) - Message - Optional Info
>> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
>> S - QC_IMAGE_VERSION_STRING=BOOT.XF.0.3-00098-IPQ60xxLZB-1
>> S - IMAGE_VARIANT_STRING=IPQ6018LA
>> S - OEM_IMAGE_VERSION_STRING=crm-ubuntu121
>> S - Boot Interface: SPI
>> S - Secure Boot: Off
>> S - Boot Config @ 0x000a602c = 0x000002e1
>> S - JTAG ID @ 0x000a607c = 0x0013a0e1
>> S - OEM ID @ 0x000a6080 = 0x00000000
>> S - Serial Number @ 0x000a4128 = 0xd92ca102
>> S - OEM Config Row 0 @ 0x000a4188 = 0x0000000000000000
>> S - OEM Config Row 1 @ 0x000a4190 = 0x0000000000000000
>> S - Feature Config Row 0 @ 0x000a4130 = 0x0000000008000001
>> S - Feature Config Row 1 @ 0x000a4138 = 0x02c3e83383000009
>> S - PBL Patch Ver: 1
>> S - I-cache: On
>> S - D-cache: On
>> B -      3413 - PBL, Start
>> B -       592 - bootable_media_detect_entry, Start
>> B -      4339 - bootable_media_detect_success, Start
>> B -      4435 - elf_loader_entry, Start
>> B -      4607 - auth_hash_seg_entry, Start
>> B -     10854 - auth_hash_seg_exit, Start
>> B -     11350 - elf_segs_hash_verify_entry, Start
>> B -    357983 - elf_segs_hash_verify_exit, Start
>> B -    362173 - auth_xbl_sec_hash_seg_entry, Start
>> B -    362318 - auth_xbl_sec_hash_seg_exit, Start
>> B -    368868 - xbl_sec_segs_hash_verify_entry, Start
>> B -    368869 - xbl_sec_segs_hash_verify_exit, Start
>> B -    369798 - PBL, End
>> B -    296002 - SBL1, Start
>> B -    435814 - GCC [RstStat:0x2, RstDbg:0x420100] WDog Stat : 0x4
>> B -    438254 - clock_init, Start
>> D -      3812 - clock_init, Delta
>> B -    447862 - boot_flash_init, Start
>> D -      8082 - boot_flash_init, Delta
>> B -    458201 - sbl1_ddr_set_default_params, Start
>> D -       274 - sbl1_ddr_set_default_params, Delta
>> B -    464820 - boot_config_data_table_init, Start
>> D -      1891 - boot_config_data_table_init, Delta - (575 Bytes)
>> B -    473970 - CDT Version:2,Platform ID:8,Major ID:3,Minor 
>> ID:0,Subtype:0
>> B -    479490 - Image Load, Start
>> D -      6619 - OEM_MISC Image Loaded, Delta - (0 Bytes)
>> B -    488823 - Image Load, Start
>> D -      5063 - PMIC Image Loaded, Delta - (0 Bytes)
>> B -    496692 - sbl1_ddr_set_params, Start
>> B -    501694 - CPR configuration: 0x366
>> B -    504897 - Pre_DDR_clock_init, Start
>> D -       183 - Pre_DDR_clock_init, Delta
>> D -         0 - sbl1_ddr_set_params, Delta
> 
> 
> I added most of the prints to figure out where it dies.
> If cold-boot calibration is enabled then it will die on the
> ath11k_qmi_process_coldboot_calibration(), to be exact on the
>> 
>> ret = ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_COLD_BOOT);
> 
> 
> But, if cold-boot calibration is disabled then ti will fail in
> ath11k_core_qmi_firmware_ready at or after ath11k_crypto_mode switch.
> 
> A big issue is that it will crash the board and it will get stuck in
> SBL, only removing the power will help.
> 
> The hardware I tried on is:
> * Wallys CP01-C1
> * Wallys CP03-C1
> * Alfa AP1800C-AX PRO
> 
> I also tried fw versions from 2.1.0.1 to 2.5.0.1-R2
> 
> Does anybody have an idea how to solve this?
> 
> --
> Robert Marko
> Staff Embedded Linux Engineer
> Sartura Ltd.
> Lendavska ulica 16a
> 10000 Zagreb, Croatia
> Email: robert.marko@sartura.hr
> Web: www.sartura.hr

Hi, Please share full boot up log(enable below logs and include them as 
well), what is the image version you used and please share kernel 
version as well? and share us the codebase details as well?

ATH11K_DBG_QMI          = 0x00000040,
ATH11K_DBG_BOOT         = 0x00000020

eg:
echo 0x60 >/sys/module/ath11k/parameters/debug_mask

or modify below file and get during boot

$cat /etc/modules.d/ath11k
ath11k debug_mask=0x60
ath11k_ahb



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
