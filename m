Return-Path: <SRS0=ucx4=I4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3D5C433C1
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 04:49:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA23361957
	for <ath11k@archiver.kernel.org>; Tue, 30 Mar 2021 04:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA23361957
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U9Df8A0vKX7ngZtuNdCaUn2Flgo5PHqTcqz3Pstu178=; b=Pj3jrAonIOZ7WZ
	BY4s+Yx1QOtN9geIdABzlz6K1vcnj0V4yxlA3sFoOyIOUI3NZkw99jwUq+f059SE45s07vqdvxRHY
	M8Hfn+Rsgoyn00DBoReqcxFrjHG0TO6WcpjlR7YuE0Izt1EdcqPqsBSQ+E8360b7m/OVXNdSJWnH9
	fTAUOQzOOha6/Csdw5UOI/C9xz7GbbdgoAj93wz9xyl+qYnmA5zjE/cAgDf53LgMVAgyYi0bu8K6x
	2hI8Uuxk1KcCc5+8i3gmDTEcTcPN+OQBbzXx+SCziJnIKBohWrotGkKn386ed2AtOVZDa77tTakYs
	r0W305pisevqivQfPMWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6Jq-002i2w-Ee; Tue, 30 Mar 2021 04:49:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6Jl-002i2R-BS
 for ath11k@lists.infradead.org; Tue, 30 Mar 2021 04:49:31 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso6286231pjh.2
 for <ath11k@lists.infradead.org>; Mon, 29 Mar 2021 21:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=penguintechs.org; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=BfsLNjg8rDWOkHykyN02BkBzi5kslWXoqFftF4RJmV0=;
 b=eQpA20Cca220Q1AdPb2SOkeCg2Yh0ECmyFoM4T1xSZM0OFGkXseKpEuA+Fg6YA2OdG
 1UajfMcPnJcbediyZRw9RoK73byLtbfoq/LZTHXawYrl9zpJg4f2R8JQbt8k9awLGQYa
 NSwcGccYU5jqMKhdSfHyc/rWgo+u27pi59dqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=BfsLNjg8rDWOkHykyN02BkBzi5kslWXoqFftF4RJmV0=;
 b=gUS6gNBO3OX26WUymTAVGkl+uzAK7+CzqD/TPucQ/PxJjNQcOUEZMW87/uAL7XOfrs
 sEBVyfnPnC+EA7ShNt73LmbyEsldRu8vxQ8mqijjRFkVNkgfMPGCaCAaoQfIxXrRsr8u
 MTSxXfcnK5xfWoKqOPfgZyU4i/OAkN188J/zReWYRr5czO9hiUIVelqHIqIJfKukegkw
 DFgvFvgqjVBPe3RWlPBPRoTzT04bl1IPPM2C/aV4jg3u8scvvNNZA9yzPvg7KCZizKCW
 UeGM1s975maP3k/L5aEDJkSl6GKs4mBTo8Kf8AHyK+wU+e8JAlGbJysp7ImoQbvHxMTK
 P/RA==
X-Gm-Message-State: AOAM531WKT5MI591U5ns+XKN7LONXWan0CcZPjk/Hl5VlJVc5gflMIIo
 RYDMWVyWg01cK7I7ELvg/kQl2Qx/k/2hvg==
X-Google-Smtp-Source: ABdhPJwHz5VJVWgvlaoHNXrzhG0Z6qx/oh9JJnEJiYyAgxaX7FZFFF9Ms24fdSmQNXl+jeqljrreMA==
X-Received: by 2002:a17:90a:c797:: with SMTP id
 gn23mr2551633pjb.180.1617079766145; 
 Mon, 29 Mar 2021 21:49:26 -0700 (PDT)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net.
 [71.202.115.154])
 by smtp.gmail.com with ESMTPSA id n184sm18790317pfd.205.2021.03.29.21.49.25
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 21:49:25 -0700 (PDT)
To: ath11k@lists.infradead.org
From: Wren Turkal <wt@penguintechs.org>
Subject: issues with QCA6390 on Dell XPS 13
Message-ID: <d09c349a-8d3e-ffc9-452d-e1c7c6915b55@penguintechs.org>
Date: Mon, 29 Mar 2021 21:49:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_054929_570424_94C440B8 
X-CRM114-Status: GOOD (  11.92  )
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

Hey there,

I am getting the following in my kernel logs on 5.12-rc5:

Mar 29 18:01:47 braindead kernel: Bluetooth: hci0: QCA Downloading 
qca/htnv20.bin
Mar 29 18:01:47 braindead kernel: BUG: unable to handle page fault for 
address: ffffc90000446047
Mar 29 18:01:47 braindead kernel: #PF: supervisor write access in kernel 
mode
Mar 29 18:01:47 braindead kernel: #PF: error_code(0x0003) - permissions 
violation
Mar 29 18:01:47 braindead kernel: PGD 100000067 P4D 100000067 PUD 
1001c5067 PMD 1015eb067 PTE 800000010bbbc161
Mar 29 18:01:47 braindead kernel: Oops: 0003 [#1] SMP NOPTI
Mar 29 18:01:47 braindead kernel: CPU: 6 PID: 201 Comm: kworker/u17:0 
Not tainted 5.12.0-rc5+ #2
Mar 29 18:01:47 braindead kernel: Hardware name: Dell Inc. XPS 13 
9310/0F7M4C, BIOS 2.0.0 01/28/2021
Mar 29 18:01:47 braindead kernel: Workqueue: hci0 hci_power_on [bluetooth]
Mar 29 18:01:47 braindead kernel: RIP: 
0010:qca_download_firmware+0x231/0x490 [btqca]
Mar 29 18:01:47 braindead kernel: Code: 1b 75 04 80 48 0c 01 0f b7 c1 8d 
54 02 0c 41 39 d7 0f 8e 99 fe ff ff 48 63 c2 4c 01 e8 0f b7 30 0f b7 48 
02 66 83 fe 11 75 d3 <80> 48 0c 80 41 83 fc 03 7e 6f 44 88 70 0d eb cd 
41 0f b6 45 0e 48
Mar 29 18:01:47 braindead kernel: RSP: 0018:ffffc90000877c60 EFLAGS: 
00010246
Mar 29 18:01:47 braindead kernel: RAX: ffffc9000044603b RBX: 
0000000000000005 RCX: 0000000000000006
Mar 29 18:01:47 braindead kernel: RDX: 0000000000000037 RSI: 
0000000000000011 RDI: ffff888106bf0640
Mar 29 18:01:47 braindead kernel: RBP: ffff8881190f6000 R08: 
ffff8881125ddcc0 R09: ffff888106bf0640
Mar 29 18:01:47 braindead kernel: R10: ffff88811a59e000 R11: 
0000000000000001 R12: 0000000000000005
Mar 29 18:01:47 braindead kernel: R13: ffffc90000446004 R14: 
000000000000000e R15: 00000000000016a9
Mar 29 18:01:47 braindead kernel: FS:  0000000000000000(0000) 
GS:ffff88886f780000(0000) knlGS:0000000000000000
Mar 29 18:01:47 braindead kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
Mar 29 18:01:47 braindead kernel: CR2: ffffc90000446047 CR3: 
0000000102f18006 CR4: 0000000000770ee0
Mar 29 18:01:47 braindead kernel: PKRU: 55555554
Mar 29 18:01:47 braindead kernel: Call Trace:
Mar 29 18:01:47 braindead kernel: qca_uart_setup+0x2cb/0x13e0 [btqca]
Mar 29 18:01:47 braindead kernel: ? qca_read_soc_version+0x136/0x220 [btqca]
Mar 29 18:01:47 braindead kernel: qca_setup+0x52e/0xb37 [hci_uart]
Mar 29 18:01:47 braindead kernel: hci_dev_do_open+0x1d0/0x740 [bluetooth]
Mar 29 18:01:47 braindead kernel: ? try_to_wake_up+0x1c1/0x4f0
Mar 29 18:01:47 braindead kernel: hci_power_on+0x3f/0x200 [bluetooth]
Mar 29 18:01:47 braindead kernel: process_one_work+0x1ec/0x380
Mar 29 18:01:47 braindead kernel: worker_thread+0x53/0x3e0
Mar 29 18:01:47 braindead kernel: ? process_one_work+0x380/0x380
Mar 29 18:01:47 braindead kernel: kthread+0x11b/0x140
Mar 29 18:01:47 braindead kernel: ? kthread_associate_blkcg+0xa0/0xa0
Mar 29 18:01:47 braindead kernel: ret_from_fork+0x1f/0x30
Mar 29 18:01:47 braindead kernel: Modules linked in: vfat fat qrtr_mhi 
snd_hda_codec_hdmi snd_hda_codec_generic snd_soc_dmic 
snd_sof_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda 
soundwire_intel soundwire_generic_allocation soundwire_cadence 
snd_sof_intel_hda snd_sof_pci snd_sof snd_sof_xtensa_dsp 
snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi snd_soc_core 
snd_compress iTCO_wdt snd_pcm_dmaengine qrtr intel_pmc_bxt ledtrig_audio 
ns ac97_bus iTCO_vendor_support intel_pmt_telemetry intel_pmt_class 
intel_rapl_msr snd_hda_intel mei_hdcp wmi_bmof ath11k_pci 
snd_intel_dspcfg snd_intel_sdw_acpi x86_pkg_temp_thermal ath11k 
dell_smm_hwmon snd_hda_codec mac80211 snd_hwdep kvm_intel snd_hda_core 
kvm snd_seq irqbypass intel_cstate snd_seq_device cfg80211 intel_uncore 
snd_pcm uvcvideo snd_timer qmi_helpers joydev pcspkr snd mhi 
videobuf2_vmalloc i2c_i801 videobuf2_memops i2c_smbus soundcore hci_uart 
libarc4 videobuf2_v4l2 btqca mei_me videobuf2_common btrtl 
hid_sensor_als hid_sensor_trigger
Mar 29 18:01:47 braindead kernel: processor_thermal_device btbcm 
industrialio_triggered_buffer processor_thermal_rfim videodev mei 
btintel intel_soc_dts_iosf kfifo_buf ucsi_acpi processor_thermal_mbox 
intel_lpss_pci hid_sensor_iio_common typec_ucsi intel_lpss 
processor_thermal_rapl bluetooth thunderbolt idma64 mc industrialio 
typec intel_rapl_common intel_pmt ecdh_generic rfkill wmi ecc 
int3403_thermal int340x_thermal_zone acpi_pad int3400_thermal intel_hid 
acpi_tad sparse_keymap acpi_thermal_rel binfmt_misc zram ip_tables 
hid_sensor_hub intel_ishtp_loader intel_ishtp_hid i915 i2c_algo_bit 
intel_gtt drm_kms_helper cec drm rtsx_pci_sdmmc nvme crct10dif_pclmul 
crc32_pclmul mmc_core nvme_core crc32c_intel t10_pi intel_ish_ipc 
rtsx_pci ghash_clmulni_intel intel_ishtp serio_raw vmd video 
pinctrl_tigerlake pinctrl_intel fuse
Mar 29 18:01:47 braindead kernel: CR2: ffffc90000446047
Mar 29 18:01:47 braindead kernel: ---[ end trace 6ee77fdc859564fa ]---
Mar 29 18:01:47 braindead kernel: RIP: 
0010:qca_download_firmware+0x231/0x490 [btqca]
Mar 29 18:01:47 braindead kernel: Code: 1b 75 04 80 48 0c 01 0f b7 c1 8d 
54 02 0c 41 39 d7 0f 8e 99 fe ff ff 48 63 c2 4c 01 e8 0f b7 30 0f b7 48 
02 66 83 fe 11 75 d3 <80> 48 0c 80 41 83 fc 03 7e 6f 44 88 70 0d eb cd 
41 0f b6 45 0e 48
Mar 29 18:01:47 braindead kernel: RSP: 0018:ffffc90000877c60 EFLAGS: 
00010246
Mar 29 18:01:47 braindead kernel: RAX: ffffc9000044603b RBX: 
0000000000000005 RCX: 0000000000000006
Mar 29 18:01:47 braindead kernel: RDX: 0000000000000037 RSI: 
0000000000000011 RDI: ffff888106bf0640
Mar 29 18:01:47 braindead kernel: RBP: ffff8881190f6000 R08: 
ffff8881125ddcc0 R09: ffff888106bf0640
Mar 29 18:01:47 braindead kernel: R10: ffff88811a59e000 R11: 
0000000000000001 R12: 0000000000000005
Mar 29 18:01:47 braindead kernel: R13: ffffc90000446004 R14: 
000000000000000e R15: 00000000000016a9
Mar 29 18:01:47 braindead kernel: FS:  0000000000000000(0000) 
GS:ffff88886f780000(0000) knlGS:0000000000000000
Mar 29 18:01:47 braindead kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
Mar 29 18:01:47 braindead kernel: CR2: ffffc90000446047 CR3: 
0000000102f18006 CR4: 0000000000770ee0
Mar 29 18:01:47 braindead kernel: PKRU: 55555554

To my untrained eye, it looks like some kind of failure during the 
firmware load process. I did try to add some prints into the kernel, and 
I know that it is getting to here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bluetooth/btqca.c?h=v5.12-rc5#n256

I have a couple questions.
* Is there anything I could provide to make replication easier?
* Is there any way I can get access to information that might help me
   see if there are features I could help implement?

Thanks,
wt
-- 
You're more amazing than you think! ymatyt.com

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
