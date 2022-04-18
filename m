Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15045C433EF
	for <ath11k@archiver.kernel.org>; Mon, 18 Apr 2022 08:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8cHqCfri4XCiU/aFT53YJyWn5sByLfZER+ti3To8rKo=; b=0OF
	+Yrpba4nN0aShHHHmFBFZvWBI5/fO2MfD9oQpTFbQctpMkQCMdQSZ7TV3XARq1hEf7BPc1NmowIAO
	hWx3P4HO0Jqswn2u+p1KS3pnjTPLiBFymt0QFmdjkEdMDmATtplOir1T39iyGLKkC82h6jbrRr5oK
	1S+S6XRqwo0PBGdevNHNgAeqnBW5n+bPK1zD+vhfkliNeplOeJwxUNxomwCeJyhS3qG5FoMRfVSlc
	SHqwHczXkrAv/hah91fmI2kwiahBEujWnFH79KPmnKQK+a7si9UQHV+9sNofD+nyyHk/iQ5mzJm+Y
	yMZ2YPCVgnCHkaX0oR/U5epAVYDOXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngMsu-00G4j0-Ri; Mon, 18 Apr 2022 08:37:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngMsr-00G4hM-Rm
 for ath11k@lists.infradead.org; Mon, 18 Apr 2022 08:37:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id ck12so4151882ejb.4
 for <ath11k@lists.infradead.org>; Mon, 18 Apr 2022 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=gLYhpzWzcwvFTY6QmSMFzrvK0uRogoh3tWdnsQuT5uM=;
 b=RX538w6qvjT0OMxx/DLI67/zDan6vsbNh2+7WEfPBkV2r+QMGb+nXEMaoCqB7RHfd9
 qGW43MmQmHXcA4j6zbPm3f5e1IP8M7bD8rh7ZpZHqHUIQDTvD0Gp5moZpnuM5WHX3OuS
 Lgb3BKUmsS+UIoIjdH6atwNEiG9J5JGWqLGFzUBv102/G6OikxlmNyQoE7nLuUOuYsus
 F4BGRIFuT0nxyp7oWl3o6hbpQBLMzQNI/UJZE0HCp1r3AxuYBxhDpFJvv6AyMc3nxTc8
 uoCkEXQLnIPTs93+y8KSSncv9POlZWqeTV8bPyzr3AEeDQ4tCVg1O1KDgAGQ+QqjuTzg
 m5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gLYhpzWzcwvFTY6QmSMFzrvK0uRogoh3tWdnsQuT5uM=;
 b=xP0kHpLgYPSalb1kPTTBqCJka8D9mAqHH5h9s+E+CF85oCqoS7G2dQLDTvIVkoe/l+
 TDWoX0HKM9j0mIciOTGB3UHub3UQIHK34qv1uzHEw6OsF2FfrHDaXPusyGpN6C9T5UQH
 IzUlJ7V+4hg/Q3l1J7ZYszrhkTCE3GZVxSm1xYtZwvwrjllxHhTMtKU0kRn/ssXVCHa8
 qwfkKqY4m/L1r8R6789/D+mgYBfx/2S+mDNevbcGckp9GsiWtt8wIPugGgi8Yz11eL8H
 +xApknB3UyktynW+X3qGhO/C/WgcFYOBb5iK7V/sA+Lr2tFhNLWdRdi/fs0p06zPpBEH
 cejg==
X-Gm-Message-State: AOAM5303km+E9DVt/fAnppcv7SmN9SjwAHKjT3nABXugr1GG4vXn2nDB
 oAhU3gOBfgNsO3J223JOejhlBaFOBcV97qTI0439UeRDwSwyZh9g
X-Google-Smtp-Source: ABdhPJzxmQDl9aIJzOPXvCE28wWWcUXXWkkC4HC8f1wT40eA9yC1kD0AUJGhf2UOa2iCsVhzXWcvE2dxxAhEy/RCgvU=
X-Received: by 2002:a17:906:c0d6:b0:6ca:457e:f1b7 with SMTP id
 bn22-20020a170906c0d600b006ca457ef1b7mr7970236ejb.399.1650271040025; Mon, 18
 Apr 2022 01:37:20 -0700 (PDT)
MIME-Version: 1.0
From: fengbin <arithdon@gmail.com>
Date: Mon, 18 Apr 2022 16:37:11 +0800
Message-ID: <CADP2NhYqHncUxxSKeWahYuVV98fA2BrWt7A486Cwu8pzQrqwug@mail.gmail.com>
Subject: ath11k: does qmi support multiple soc
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_013721_981514_44BF3AAE 
X-CRM114-Status: UNSURE (   5.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello,
I have qca6390 and qcn9074 both of them works fine individually.
However when I install them together errors show up.


here is log with only 9074 installed:
[   17.759191] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
connected qmi:00000000181299d3 node:7, port:2
[   17.759197] ath11k_pci 0000:01:00.0:
ath11k_qmi_event_server_arrive@2709 qmi:00000000181299d3
[   17.760436] ath11k_pci 0000:01:00.0:
ath11k_qmi_event_server_arrive@2718 qmi:00000000181299d3
fw_ind_register completed.
[   17.761703] ath11k_pci 0000:01:00.0:
ath11k_qmi_event_server_arrive@2725 qmi:00000000181299d3
fw_ind_register host_cap completed.
[   17.767555] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0x0
board_id 0xff soc_id 0xffffffff
[   17.767559] ath11k_pci 0000:01:00.0: fw_version 0x2506844c
fw_build_timestamp 2021-07-13 10:24 fw_build_id
[   19.495395] ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0

and here is log with 6390+9074 and from the log it seems 01:00.01
device get same qmi messages twice and thus the host_cap request
failed the second time where chipset FW consider the host_cap request
is in bad state.

[   19.106915] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
0x92000000-0x921fffff 64bit]
[   19.106947] ath11k_pci 0000:01:00.0: enabling device (0100 -> 0102)
[   19.107355] ath11k_pci 0000:01:00.0: MSI vectors: 16
[   19.107366] ath11k_pci 0000:01:00.0: qcn9074 hw1.0
[   19.107505] ath11k_pci 0000:01:00.0: mhi controller registered
:0000000054128108 mhi_ctrl->index:0 mhi_ctrl->mhi_dev:mhi0
[   20.173172] ath11k_pci 0000:05:00.0: BAR 0: assigned [mem
0x91000000-0x91ffffff 64bit]
[   20.173218] ath11k_pci 0000:05:00.0: enabling device (0100 -> 0102)
[   20.173937] ath11k_pci 0000:05:00.0: MSI vectors: 32
[   20.173959] ath11k_pci 0000:05:00.0: qca6390 hw2.0
[   20.174111] ath11k_pci 0000:05:00.0: mhi controller registered
:00000000c33f02d3 mhi_ctrl->index:1 mhi_ctrl->mhi_dev:mhi1
[   20.767399] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
connected qmi:00000000e25ddf03 node:7, port:2
[   20.767423] ath11k_pci 0000:01:00.0:
ath11k_qmi_event_server_arrive@2709 qmi:00000000e25ddf03
[   20.768739] ath11k_pci 0000:01:00.0:
ath11k_qmi_event_server_arrive@2718 qmi:00000000e25ddf03
fw_ind_register completed.
[   20.770333] ath11k_pci 0000:01:00.0:
ath11k_qmi_event_server_arrive@2725 qmi:00000000e25ddf03
fw_ind_register host_cap completed.
[   20.770375] ath11k_pci 0000:01:00.0: qmi wifi fw qmi service
connected qmi:00000000e25ddf03 node:7, port:2
[   20.771668] ath11k_pci 0000:01:00.0:
ath11k_qmi_event_server_arrive@2709 qmi:00000000e25ddf03
[   20.776796] ath11k_pci 0000:01:00.0:
ath11k_qmi_event_server_arrive@2718 qmi:00000000e25ddf03
fw_ind_register completed.
[   20.778021] ath11k_pci 0000:01:00.0: host capability request failed: 1 90


Any thoughts and ideas of what might be the cause?
thanks

-- 
arithdon

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
