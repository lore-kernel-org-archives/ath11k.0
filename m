Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC7BC369D5
	for <ath11k@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdmvGtQ89u3GR+RFOjou40UjczCb89acby3lLgdG7oo=; b=0VNpoVBP3ZdTqwVMxozjYt1aFs
	1P+AXhL7LD++nv4IW2Hylm7CCuUXrBrJua0tKNW6eUcxLJ+UwKbBUujJuqWVy9KqSWCPKucGnxPJE
	p1L1s8lhgS28vhAvw6uLyCABzWpgaE0KiVb1kH3SWw/U8lhh4Ax7Db1OJmSQ2qH6gUHR97oQRqW0r
	ff30Cu5vAujpwwK6UL7ypHg34G2ro5FDSxL7yy9/UTr0/n9DPSlR35vkVTzEv3yKbKQTvgev8gQ0H
	e/kviMKw+eE42BKSftg3m+uAJKQSEttksTWhhpKUIa3tXqIL5GWbFBFq7O30agZWiB+HK/4+ywqYl
	w90HAmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807b-0000000Er5k-3LvB;
	Thu, 24 Apr 2025 17:12:24 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xEy-0000000EJqn-28MJ
	for ath11k@lists.infradead.org;
	Thu, 24 Apr 2025 14:07:50 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so426147e0c.0
        for <ath11k@lists.infradead.org>; Thu, 24 Apr 2025 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1745503667; x=1746108467; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GdmvGtQ89u3GR+RFOjou40UjczCb89acby3lLgdG7oo=;
        b=fU47DPh8xPbthEu1Yapqu7gjC+jKdPM4A5CmmA5NwNvVAFMjyzKxhlX+X0GKRp5iz9
         BZrMXFltJs8Ncct6TA73W4+n+Y9810VW65+T7UDkX7vV8QL6VrvXwEFx/E4uDAaAY3rA
         vI/cLqp6dHqajbzHVpzwd9quoZViBlF3BLBIn6iCENNzx3NRRigCIWlvleJwf9YoVGJs
         vr0Fzzd1stnKEGVjjHu35IwmXiH92Hd4GPlXn64hS8KyMlyDIAjg1zV4M2B//vGuehFF
         JVJ8DNma/XTRWBLLxY9YufxzBRlG+X+suWkIQA1zFm1oDvv/TxCauU4UF2Vb3yJYOXj5
         ttYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503667; x=1746108467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdmvGtQ89u3GR+RFOjou40UjczCb89acby3lLgdG7oo=;
        b=Kl+OK56cJjjIb5NWyNEAqOC9akulcOdaBZjbheupiG8kIsRy5V9FgknNgH5BV4wegN
         8vOcINVxr0NmAr4xVwcd04ecs35w4BdLyLSYpvc1LCnZzker4lX8Df51vnSqiYjY7Eyy
         UtTEJZCEOkqOdj1p4xou21gXz2J8t8kWXq4DU2eHrR5iq9owUYIRZ7JtqRE0MbX15+Gf
         iFQb8OWFJS7Fay5y2OxZUFxYWQ96lZ5chQGB/dfXtwSNIK0CEmh2Oy1gF7P7Dl02ZPdl
         LlJkTdqISXixsqdyO3R31QnbWdlEgBWUoSx3LxRmmSDL9CgUaYARe/zzWeUWJC2FJFei
         cjGA==
X-Forwarded-Encrypted: i=1; AJvYcCUKveIxdwkwa+Rpc9hdMW3SnbJlBbq4jARVGcfMXFmT1kbr0nHu+n5J+aV6EDg9eJL6WUPmerI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyW6C8FDoD9AWitsokkvVoTKVAPu/9RCiufhIYswB9T68WJA1KF
	2PWYUcD2UWKJqaFm3yRtPrea/Z2DlrevSMSAyCJxoiyiY7mNWD8XoNRSaH6drYeecSGYaTK7E7j
	gucELSldGXwC2Sfkvpv6obpa5zgOfLdAG/kgqzg==
X-Gm-Gg: ASbGncuLCQz4IGH1ZejavL4g8pAFIc8jsTe7SD/qizqaYq+Iy1s/+36Hx6sTbwCtuin
	S7EM34uYxSwoOpdBHTXIt1THuEIQYm71qlFxJIpV2noNZuCYvupIFELb74NG0wD1p4rnJNn1MK3
	qjX1w092jMJyb7Tu9es5tCUeEh
X-Google-Smtp-Source: AGHT+IErhQUPnaKpU1zGFJ2/PkQnddkb7MAALj2W8zXHAMxbJSFnvaokxVPCygzxVqnmqKhgbkG9wcy3YrRYjiCEHV0=
X-Received: by 2002:a05:6122:20ab:b0:518:965c:34a with SMTP id
 71dfb90a1353d-52a7823dea3mr2333665e0c.2.1745503666453; Thu, 24 Apr 2025
 07:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com> <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
 <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
 <3da5d47b-993c-405e-841f-1d16d8715610@quicinc.com> <1d0682c0-ee5d-f2d4-199d-4ebc4e71f9ef@quicinc.com>
 <3660fcfb-be29-422b-a352-3996ad3fc41f@quicinc.com> <CAONkfw5-bfYRwHZ9iHhgJP2f8Zqyz5SZVbdL4n9EPhKU+=ONPg@mail.gmail.com>
In-Reply-To: <CAONkfw5-bfYRwHZ9iHhgJP2f8Zqyz5SZVbdL4n9EPhKU+=ONPg@mail.gmail.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Thu, 24 Apr 2025 16:07:10 +0200
X-Gm-Features: ATxdqUGwtCFsT67ZYg7ZUzooAbjRkhLxFvzWycaGvXtqibopFchZNDxTQk0WmIo
Message-ID: <CAONkfw7xjJjMAZSfHg5avEV=Bc5aJZqrRxMDvKWK4g14bLNjRQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, jjohnson@kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_070748_682118_3373353E 
X-CRM114-Status: UNSURE (   4.28  )
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

I just rebuilt a clean disto and enabled the debug_mask=0x1020.
There are the logs bellow :

root@OpenWrt-WAP:~# uname --all
Linux OpenWrt-WAP 6.6.86 #0 SMP Sun Apr 13 16:38:32 2025 aarch64 GNU/Linux

root@OpenWrt-WAP:~# cat /etc/modules.conf
# examples:
# options mod1 option=val
# blacklist mod2
options ath11k debug_mask=0x1020

root@OpenWrt-WAP:~# cat /sys/module/ath11k/parameters/debug_mask
4128

root@OpenWrt-WAP:~# dmesg | grep ath
[   15.093627] ath11k_pci 0001:01:00.0: Adding to iommu group 2
[   15.099326] ath11k_pci 0001:01:00.0: assign IRQ: got 0
[   15.099512] ath11k_pci 0001:01:00.0: BAR 0: assigned [mem
0x2840000000-0x28401fffff 64bit]
[   15.107879] ath11k_pci 0001:01:00.0: boot pci_mem 0x00000000880f25e0
[   15.107886] ath11k_pci 0001:01:00.0: boot pci probe 17cb:1104 17cb:1104
[   15.108483] ath11k_pci 0001:01:00.0: MSI vectors: 16
[   15.113538] ath11k_pci 0001:01:00.0: pci msi base data is 0
[   15.113545] ath11k_pci 0001:01:00.0: qcn9074 hw1.0
[   15.118336] ath11k_pci 0001:01:00.0: FW memory mode: 2
[   15.125643] ath11k_pci 0001:01:00.0: boot failed to load firmware-2.bin: -2
[   15.125658] ath11k_pci 0001:01:00.0: boot using fw api 1
[   15.125668] ath11k_pci 0001:01:00.0: pci msi assignment MHI
num_vectors 3 user_base_data 0 base_vector 0
[   15.125675] ath11k_pci 0001:01:00.0: pci num_vectors 3 base_vector 0
[   15.129780] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   15.129933] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   15.129964] ath11k_pci 0001:01:00.0: pci irq 369 group 0
[   15.130013] ath11k_pci 0001:01:00.0: pci irq 370 group 1
[   15.130059] ath11k_pci 0001:01:00.0: pci irq 371 group 2
[   15.130110] ath11k_pci 0001:01:00.0: pci irq 372 group 3
[   15.130157] ath11k_pci 0001:01:00.0: pci irq 373 group 4
[   15.130204] ath11k_pci 0001:01:00.0: pci irq 374 group 5
[   15.130250] ath11k_pci 0001:01:00.0: pci irq 375 group 6
[   15.130295] ath11k_pci 0001:01:00.0: pci irq 376 group 7
[   15.130359] ath11k_pci 0001:01:00.0: pci after request_irq msi_ep_base_data 0
[   15.230443] ath11k_pci 0001:01:00.0: pci ltssm 0x111
[   15.230456] ath11k_pci 0001:01:00.0: pci pcie_hot_rst 0x11
[   15.235499] ath11k_pci 0001:01:00.0: pci pcie_q6_cookie_addr 0x0
[   15.235514] ath11k_pci 0001:01:00.0: pci wlaon_warm_sw_entry 0x0
[   15.255530] ath11k_pci 0001:01:00.0: pci wlaon_warm_sw_entry 0x0
[   15.255545] ath11k_pci 0001:01:00.0: pci soc reset cause 0
[   15.275554] ath11k_pci 0001:01:00.0: pci mhistatus 0xff04
[   15.285571] ath11k_pci 0001:01:00.0: pci link_ctl 0x0000 L0s 0 L1 0
[   15.446403] ath11k_pci 0001:01:00.0: boot notify status reason
MHI_CB_EE_SBL_MODE
[   15.494739] ath11k_pci 0001:01:00.0: boot notify status reason
MHI_CB_EE_MISSION_MODE
[   15.515587] ath11k_pci 0001:01:00.0: chip_id 0x0 chip_family 0x0
board_id 0xff soc_id 0xffffffff
[   15.524423] ath11k_pci 0001:01:00.0: fw_version 0x290b8862
fw_build_timestamp 2024-09-23 10:51 fw_build_id
[   15.534202] ath11k_pci 0001:01:00.0: boot using board name
'bus=pci,qmi-chip-id=0,qmi-board-id=255'
[   15.551970] ath11k_pci 0001:01:00.0: boot firmware request
ath11k/QCN9074/hw1.0/board-2.bin size 786836
[   15.551992] ath11k_pci 0001:01:00.0: boot board name
[   15.552001] ath11k_pci 0001:01:00.0: 00000000: 62 75 73 3d 70 63 69
2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
[   15.552007] ath11k_pci 0001:01:00.0: 00000010: 2d 69 64 3d 30 2c 71
6d 69 2d 62 6f 61 72 64 2d  -id=0,qmi-board-
[   15.552013] ath11k_pci 0001:01:00.0: 00000020: 69 64 3d 31 36 30
                            id=160
[   15.552018] ath11k_pci 0001:01:00.0: boot board name
[   15.552024] ath11k_pci 0001:01:00.0: 00000000: 62 75 73 3d 70 63 69
2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
[   15.552030] ath11k_pci 0001:01:00.0: 00000010: 2d 69 64 3d 30 2c 71
6d 69 2d 62 6f 61 72 64 2d  -id=0,qmi-board-
[   15.552036] ath11k_pci 0001:01:00.0: 00000020: 69 64 3d 31 36 31
                            id=161
[   15.552041] ath11k_pci 0001:01:00.0: boot board name
[   15.552047] ath11k_pci 0001:01:00.0: 00000000: 62 75 73 3d 70 63 69
2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
[   15.552053] ath11k_pci 0001:01:00.0: 00000010: 2d 69 64 3d 30 2c 71
6d 69 2d 62 6f 61 72 64 2d  -id=0,qmi-board-
[   15.552059] ath11k_pci 0001:01:00.0: 00000020: 69 64 3d 31 36 32
                            id=162
[   15.552064] ath11k_pci 0001:01:00.0: boot board name
[   15.552070] ath11k_pci 0001:01:00.0: 00000000: 62 75 73 3d 70 63 69
2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
[   15.552076] ath11k_pci 0001:01:00.0: 00000010: 2d 69 64 3d 30 2c 71
6d 69 2d 62 6f 61 72 64 2d  -id=0,qmi-board-
[   15.552082] ath11k_pci 0001:01:00.0: 00000020: 69 64 3d 32 35 35
                            id=255
[   15.552087] ath11k_pci 0001:01:00.0: boot found match board data
for name 'bus=pci,qmi-chip-id=0,qmi-board-id=255'
[   15.552093] ath11k_pci 0001:01:00.0: boot found board data for
'bus=pci,qmi-chip-id=0,qmi-board-id=255'
[   15.552100] ath11k_pci 0001:01:00.0: boot using board api 2
[   16.910820] ath11k_pci 0001:01:00.0: boot firmware request
ath11k/QCN9074/hw1.0/m3.bin size 340108
[   16.934188] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   16.934216] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   16.934228] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   16.934238] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   16.934249] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   16.934258] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   16.934273] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   16.934284] ath11k_pci 0001:01:00.0: pci msi assignment CE
num_vectors 5 user_base_data 3 base_vector 3
[   16.935322] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.935333] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 11,ring_num 0
[   16.937172] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.937185] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 12,ring_num 0
[   16.937196] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.937203] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 6,ring_num 0
[   16.937212] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.937219] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 7,ring_num 0
[   16.937489] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.937497] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 5,ring_num 0
[   16.937934] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.938396] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.938405] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 5,ring_num 1
[   16.938823] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.939059] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.939068] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 5,ring_num 2
[   16.939468] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.939635] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.939642] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 2,ring_num 0
[   16.939765] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.939872] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.939959] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.939967] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 3,ring_num 0
[   16.940135] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.940417] ath11k_pci 0001:01:00.0: boot htc service 'Control' ul
pipe 0 dl pipe 1 eid 0 ready
[   16.940425] ath11k_pci 0001:01:00.0: boot htc service 'Control' eid
0 tx flow control disabled
[   16.941453] ath11k_pci 0001:01:00.0: boot htc service HTT Data does
not allocate target credits
[   16.941570] ath11k_pci 0001:01:00.0: boot htc service 'HTT Data' ul
pipe 4 dl pipe 1 eid 1 ready
[   16.941578] ath11k_pci 0001:01:00.0: boot htc service 'HTT Data'
eid 1 tx flow control disabled
[   16.941633] ath11k_pci 0001:01:00.0: boot htc service 'WMI' ul pipe
3 dl pipe 2 eid 2 ready
[   16.941641] ath11k_pci 0001:01:00.0: boot htc service 'WMI' eid 2
tx flow control disabled
[   16.943010] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.943267] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.943476] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   16.943604] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   17.246410] ath11k_pci 0001:01:00.0: htt event 48 not handled
[   17.252661] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   17.253260] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   17.253871] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   17.254512] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   17.254528] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 16,ring_num 0
[   17.255170] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   17.255743] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   17.255759] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 19,ring_num 0
[   17.284419] ath11k_pci 0001:01:00.0: pci msi assignment DP
num_vectors 8 user_base_data 8 base_vector 8
[   17.284438] ath11k_pci 0001:01:00.0: pci ring not part of an
ext_group; ring_type: 20,ring_num 0
[   22.039565] ath11k_pci 0001:01:00.0 phy0-ap0: entered allmulticast mode
[   22.050081] ath11k_pci 0001:01:00.0 phy0-ap0: entered promiscuous mode
[   30.709682] ath11k_pci 0001:01:00.0 phy0-ap0: left allmulticast mode
[   30.716078] ath11k_pci 0001:01:00.0 phy0-ap0: left promiscuous mode
[   36.330610] ath11k_pci 0001:01:00.0 phy0-ap0: entered allmulticast mode
[   36.337503] ath11k_pci 0001:01:00.0 phy0-ap0: entered promiscuous mode

root@OpenWrt-WAP:~# iw dev
phy#0
Interface phy0-ap0
ifindex 14
wdev 0x2
addr 04:f0:21:bd:d7:99
type AP
channel 100 (5500 MHz), width: 160 MHz, center1: 5570 MHz
multicast TXQ:
qsz-byt qsz-pkt flows drops marks overlmt hashcol tx-bytes tx-packets
0 0 0 0 0 0 0 0 0

root@OpenWrt-WAP:~# iwinfo
phy0-ap0  ESSID: "OpenWrt-WAP-5GHz"
          Access Point: 04:F0:21:BD:D7:99
          Mode: Master  Channel: 100 (5.500 GHz)  HT Mode: HE160
          Center Channel 1: 114 2: unknown
          Tx-Power: 0 dBm  Link Quality: unknown/70
          Signal: unknown  Noise: -101 dBm
          Bit Rate: unknown
          Encryption: none
          Type: nl80211  HW Mode(s): 802.11ac/ax/n
          Hardware: 17CB:1104 17CB:1104 [Qualcomm Atheros QCN6024/9024/9074]
          TX power offset: none
          Frequency offset: none
          Supports VAPs: yes  PHY name: phy0

root@OpenWrt-WAP:~# reboot
[  343.663492] Internal error: synchronous external abort:
0000000096000210 [#1] SMP
[  343.670992] Modules linked in: nft_fib_inet nft_connlimit
nf_flow_table_inet nf_conncount ath11k_pci(O) ath11k(O) rndis_host
nft_socket nft_reject_ipv6 nft_reject_ipv4 nft_reject_inet nft_reject
nft_redir nft_quota nft_queue nft_numgen nft_nat nft_masq nft_log
nft_limit nft_hash nft_fwd_netdev nft_flow_offload nft_fib_ipv6
nft_fib_ipv4 nft_fib nft_dup_netdev nft_dup_ipv6 nft_dup_ipv4 nft_ct
nft_chain_nat nfnetlink_cttimeout nfnetlink_cthelper nf_tables nf_nat
nf_flow_table nf_conntrack_netlink nf_conntrack mmc_spi mac80211(O)
ftdi_sio ch348 ch341 cfg80211(O) cdc_subset cdc_ether cdc_eem
usbserial usbnet usbmon usbhid ums_usbat ums_sddr55 ums_sddr09
ums_karma ums_jumpshot ums_isd200 ums_freecom ums_datafab ums_cypress
ums_alauda tps23861 tmp103 tmp102 spidev spi_gpio spi_bitbang sfp
rtc_pcf8563 rtc_pcf2123 rtc_ds1672 rtc_ds1374 qrtr_mhi qrtr
qmi_helpers(O) of_mmc_spi nfnetlink_queue nfnetlink nf_socket_ipv6
nf_socket_ipv4 nf_reject_ipv6 nf_reject_ipv4 nf_log_syslog
nf_dup_netdev nf_dup_ipv6 nf_dup_ipv4 nf_defrag_ipv6
[  343.671198]  nf_defrag_ipv4 mhi_pci_generic mhi_net mhi mdio_i2c
mdio_gpio max6697 ltc4151 lm95241 lm92 lm90 lm85 lm77 lm70 lm63 jc42
ina2xx ina209 hid_generic compat(O) cdc_acm at25 adt7475 ntfs3 configs
sg hid tmp421 tc654 adt7410 adt7x10 adcxx ad7418 i2c_gpio
i2c_designware_pci i2c_ccgx_ucsi i2c_algo_bit gpio_pcf857x i2c_mux_reg
i2c_mux_pca954x i2c_mux_pca9541 i2c_mux_gpio cryptodev(O) hwmon_vid
msdos bonding nls_utf8 zram zsmalloc eeprom_93cx6 crypto_user
algif_skcipher algif_rng algif_hash algif_aead af_alg sha512_generic
sha512_arm64 seqiv sha3_generic jitterentropy_rng drbg michael_mic md5
hmac geniv cmac uas usb_storage xhci_plat_hcd xhci_pci xhci_hcd dwc3
dwc2_pci dwc2 roles ohci_pci uhci_hcd ohci_platform ohci_hcd ehci_pci
fsl_mph_dr_of ehci_platform ehci_fsl ahci_platform ahci_qoriq
libahci_platform libahci ehci_hcd nvme nvme_core exfat gpio_cascade
mux_gpio phy_generic usbcore usb_common microchip mii
[  343.842432] CPU: 7 PID: 9435 Comm: procd Tainted: G           O
  6.6.86 #0
[  343.849746] Hardware name: LS1088A
[  343.856969] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  343.863933] pc : ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
[  343.870125] lr : ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
[  343.876070] sp : ffff80008d473b60
[  343.879380] x29: ffff80008d473b60 x28: ffff000005e88000 x27: ffff000000e7f138
[  343.886522] x26: ffff800080f20128 x25: ffff8000811b0028 x24: 0000000000000000
[  343.893664] x23: 0000000000000001 x22: ffff00000720ade8 x21: ffff800079a80be4
[  343.900807] x20: ffff000007200000 x19: ffff800083c80500 x18: 0000000000000000
[  343.907948] x17: 0000000000000000 x16: 0000000000000000 x15: 00004b0957e10d10
[  343.915090] x14: ffff000002f3961c x13: ffff800081113d10 x12: 0000000000000169
[  343.922232] x11: ffff800080d63a68 x10: 1fffe000005e7301 x9 : 0000000000000000
[  343.929374] x8 : 0000000000000000 x7 : ffff7ffffa960000 x6 : 0000000000000004
[  343.936516] x5 : 0000000000000000 x4 : 000000000007ffff x3 : 0000000000000000
[  343.943658] x2 : 000000000000003f x1 : ffff00000720ad58 x0 : ffff800083c00000
[  343.950800] Call trace:
[  343.953241]  ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
[  343.959080]  ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
[  343.964671]  ath11k_pcic_read32+0x30/0xb4 [ath11k]
[  343.969477]  ath11k_pci_get_msi_irq+0x528/0x1900 [ath11k_pci]
[  343.975230]  ath11k_pci_get_msi_irq+0x1460/0x1900 [ath11k_pci]
[  343.981068]  ath11k_pci_get_msi_irq+0x1750/0x1900 [ath11k_pci]
[  343.986906]  pci_device_shutdown+0x34/0x44
[  343.991004]  device_shutdown+0x160/0x268
[  343.994928]  kernel_restart+0x40/0xc0
[  343.998594]  __do_sys_reboot+0x104/0x23c
[  344.002518]  __arm64_sys_reboot+0x24/0x30
[  344.006529]  do_el0_svc+0x6c/0x100
[  344.009931]  el0_svc+0x28/0x9c
[  344.012986]  el0t_64_sync_handler+0x120/0x12c
[  344.017344]  el0t_64_sync+0x178/0x17c
[  344.021009] Code: f94e0a80 92404a73 91420273 8b130013 (b9400273)
[  344.027102] ---[ end trace 0000000000000000 ]---
[  344.031718] Kernel panic - not syncing: synchronous external abort:
Fatal exception in interrupt
[  344.040513] Kernel Offset: disabled
[  344.043997] CPU features: 0x0,00000000,00020000,1000400b
[  344.049309] Memory Limit: none
[  344.052358] Rebooting in 3 seconds..

