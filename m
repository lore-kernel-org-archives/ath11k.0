Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A55C4332F
	for <ath11k@archiver.kernel.org>; Sat,  5 Nov 2022 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qJRduK5jfG1nPf38nSo0eCHdcbjJjX7wPJtPNrA4Ftc=; b=CBz
	WVhHL/ACKpamZ6oGi6khAhmYtCbq52KvIIQdAFXTSO9noKWH98su3xAdl1XWARIe/x3fNUTG8rRO9
	4H7htcRvL4iwCwybktQZkU5rrqVhJWcOWRbijGtpk7WLOLJQAm+gdYiIsTct36bbxA7lQTm8cTKcf
	KPrLsv8YGCv00m9GImx7oL4clyOZWh4X2MWblxp/wt3qaUId9q66cCsdZVYVTTG6xLv7usNqC3RWb
	RqDWr7yFPEjo3Yyf3aCTBjUNeXRxiaU0XeXTltV5SsZvwxQwTTBhttAHwOW+XrISW1FWsBrEFLZsL
	b+CPg5qxl8yqKnbNg6xPv35ZESfjaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orHGg-006Pr3-4H; Sat, 05 Nov 2022 11:23:18 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orHGd-006PqN-I8
	for ath11k@lists.infradead.org; Sat, 05 Nov 2022 11:23:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id f37so10651101lfv.8
        for <ath11k@lists.infradead.org>; Sat, 05 Nov 2022 04:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vxo8n/GMKmES9uFXA4RVA3sVrDGSEmbTpjduBugUNOI=;
        b=XjRrXhPyM7N6ZjfoDimBFHOBfITjk+TuWQaDqStBwbd/Wz6kDXTNJ1KUMX/ebkn97N
         uUpKBfC4RcW8ZtVm0f7sb6uVAWsRnRRnc4nuS0uP6/Q6NPRwzj1Ulbj0ExqXkdcWx0XS
         sdr4OhAvz1eyjGm2Slj0rXonLA+KGK+xX31RMXMfDfBlbJNZbn0v3P2EbM9nNRwtKC/4
         u98VPon1hPf6uqAylq/BcDmfWk7AwI7s6OEQSAhujFBX22HIQSdmsowJFypyDzyT2S7I
         Zust/jGTXZYqRjtKhWCvmmaYx7PbrJM5JohPt0ZNGkdkQbREqbvOt9dKoSqOHZ8PkWB2
         +u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxo8n/GMKmES9uFXA4RVA3sVrDGSEmbTpjduBugUNOI=;
        b=6Hkei2fs3vnqg3wGi65OEVY5xhngsPFAH138v5OMQbUa7wkEdjOFbQuTUR7u4kIL6N
         GP6ZECne4RlLfrYd83jfsjuzPYXLg8ty4YBVQq6SJKT6hoI0wiqFp4oCKO0Z2kInzx5h
         VtJi7bMIjEzSB9A+nkB+hdP8IjR2ahY12Q1fbDO/dmAHqDHW4pBEVHPbb47XCPzfXpm+
         9mh0ZpyOdABPXlZQ4ZMcSFYXUkDWAkTgn1dqjE+yNBpHIFaWYcoO+C7Rkt8H0rWBiX2m
         Nek4oiFMlUPui60FJUJmjFxEDX09aaMPqh2wzdwYWOK/za4IJIqA3jKB5KdVHZQbCDlt
         caVQ==
X-Gm-Message-State: ACrzQf3g3IBuTJWRCIG5PyIxWnew9Ns7dJRsxRbiBDTPFbK5eDARq0Cl
	QuIKs889SCGHs4pJ13q4waNs75m6Ppg6YL6xkxMUrfHO5tyiWw==
X-Google-Smtp-Source: AMsMyM5JrWg6TCp64tjESl8pHJXmY7rKOQH2W1OR978UXEFvj2mDk+bcdRniFvYCCofQGbvooCyCRkLN8Q2lnB4+O0w=
X-Received: by 2002:ac2:5dd4:0:b0:4af:fbde:bca4 with SMTP id
 x20-20020ac25dd4000000b004affbdebca4mr14380726lfq.387.1667647392715; Sat, 05
 Nov 2022 04:23:12 -0700 (PDT)
MIME-Version: 1.0
From: Mariusz <enebeo@gmail.com>
Date: Sat, 5 Nov 2022 12:23:02 +0100
Message-ID: <CAJrE-q6NVEF4sNW1s4Zz7Pb2ryzCi69e+_vLQswBWm747DHYDw@mail.gmail.com>
Subject: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_042315_639881_E04A770D 
X-CRM114-Status: GOOD (  12.16  )
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

As support for QCN9074 got better I went ahead and built a 6E linux
based AP. Dell R720 server x86 running Linux s4 5.19.0-23-generic
#24-Ubuntu SMP PREEMPT_DYNAMIC Fri Oct 14 15:39:57 UTC 2022 x86_64
x86_64 x86_64 GNU/Linux.

My issue is that I cannot get it working on 6GHz bands but it works
fine on 5GHz. I bought 6E version  and since this is a single band
module it cannot be both 5G & 6G and linux driver does not agree with
it being 6E version:

[71914.038562] ath11k_pci 0000:03:00.0: BAR 0: assigned [mem
0xdf800000-0xdf9fffff 64bit]
[71914.038840] ath11k_pci 0000:03:00.0: MSI vectors: 16
[71914.038852] ath11k_pci 0000:03:00.0: qcn9074 hw1.0
[71914.194459] mhi mhi0: Requested to power ON
[71914.194712] mhi mhi0: Power on setup success
[71914.297749] mhi mhi0: Wait for device to enter SBL or Mission mode
[71914.647118] ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0
board_id 0xff soc_id 0xffffffff
[71914.647134] ath11k_pci 0000:03:00.0: fw_version 0x250a04b8
fw_build_timestamp 2021-12-20 06:41 fw_build_id
[71916.310787] ath11k_pci 0000:03:00.0 wlp3s0: renamed from wlan0

HE PHY Capabilities: (0x1c604c88ffdb839c110c00):
                                HE40/HE80/5GHz
                                HE160/5GHz
                                HE160/HE80+80/5GHz

iw dev wlp3s0 set freq 6195 160MHz
kernel reports: Channel is disabled
command failed: Invalid argument (-22)

I am using the latest firmware files from ath11k tree. Is there any
special firmware to force this to 6GHz? I read somewhere board_id
determines which one it is and 255 disables 6GHz but I miss more data
on that.

phy#2 (self-managed)
country US: DFS-FCC
        (2402 - 2472 @ 40), (6, 30), (N/A)
        (5170 - 5250 @ 80), (N/A, 30), (N/A), AUTO-BW
        (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
        (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
        (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
        (5945 - 7125 @ 160), (N/A, 30), (N/A), NO-OUTDOOR, AUTO-BW

It works fine in 5GHz but this is not what I purchased it for, so I am
puzzled if this is something in software or I was sold wrong
hardware.Is there a specific board-2.bin for 6GHz? Since the 9074 chip
is the same in all versions perhaps this is a software hiccup.

Any clues are welcome.

Regards,
Mario

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
