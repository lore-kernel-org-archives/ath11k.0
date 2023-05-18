Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45789C7EE23
	for <ath11k@archiver.kernel.org>; Thu, 18 May 2023 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=L9FkafGktg5r8Bsolo2lL1qjRzapmHxqCGxawPm+ly4=; b=Fet
	NsDi7uhxm02bMxpjnk4b8Bd0/1Bkssmqrh6lI3AciYGHVCs3HnMcsoe/a6tkfRP4uNLE/l4bQskCo
	a6RR6B788uLgFQp1SJLbX76f8dqMUAYdek+M27ID3Fi6dnnpLs7E5IOsGC1jU4aEBRu6pdW7kTels
	xYtWtQtvEIvYNbggA/fa1w6SCKACOwmB7zRbA3aSFDUxaLkCt25MODmDlpZbMCDfRcQrAn9UKlrTU
	VY0510XDQzO0wdC7uuhSvT+sd7RCufeE/RpEQgwWeoksLFNcJhYizEqWw9kOhc0+cE3xYkxP+lY7y
	vQJiMC3LlumLXQQ5SmXLm+1F0oOiuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfOg-00DIAt-0j;
	Thu, 18 May 2023 15:18:30 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfOd-00DIAG-1Q
	for ath11k@lists.infradead.org;
	Thu, 18 May 2023 15:18:28 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-392116ae103so1329887b6e.0
        for <ath11k@lists.infradead.org>; Thu, 18 May 2023 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684423105; x=1687015105;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YYSdzW3UndEZVH0j/J6iynzoarfDA0cF0gYr3cxuDTc=;
        b=oojTWBBSwG4eZltI+gR6MAEFa7qCec6JBVLaF3px8bCdSP3XoOVTeVMC/Boc5tjqwU
         WuSWS+FcU5hPD/tjAW+l4HKQiLXkkaaeTFMkquRfzVmZEQaV+CE7i5zTt0/1vDnF8UVm
         c29aTMs4WoT1BVT5an7F7aKTwdzVbd9BwmXlbB/cfgAH5z26fHXUZ6kRm56AXsdXlO95
         WzS97kX4ltxhp56GeeDFzBt5g2LcAYAwYDzrF2tzRp063vzVWwaitS4//1tGcrNENxjn
         yINx+4871YHQfRgnE5ORYVJVBvptDIYZNQdh9nC0prFUrhKVieYA6fj1CSNIVHPho4J2
         oBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684423105; x=1687015105;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYSdzW3UndEZVH0j/J6iynzoarfDA0cF0gYr3cxuDTc=;
        b=XGCDv3kqheouLHSl4p9MlO42tCxDcu1LAgQU1y/mzjpCOlhWjwgttXDocVBN/e7aT1
         GQ3SZiDGoDMmmgwKOZnYdJGKg0sbru5qpx/+uz+nuCEe5ZFOhVtntXpQXnGk4/+0kHIc
         Lfq86/mmnn6kgJrCu3LAs2xihDzapNTl4xoGNNFquFscPz2NA8Drus/VsZPfy2siNm8r
         daKvJgTP6b2QOXsBjPIDgEWnZ1pILhVO3c2bN3w5AUkqJrz1QWRj1rFRaB5soe2/IJHK
         j//Samp6OJyFlR7INwA2u/ScAo3rdGzQyMp2NmjugFNSqXud+DjHVPatNYMeVZr1oUMN
         sohA==
X-Gm-Message-State: AC+VfDxHdANIZssCMbHBuoqHRbirDTESiV/1hkcpoKPGYM0lCn8VclL1
	eGKyEFWph7HofBUKooUbalmW9kBYTVNlAcqnKr+vE6ho+U+s/g==
X-Google-Smtp-Source: ACHHUZ4NTel97MH/FVyfZ11CzgB5lwt+9t9jliKAy+ZHixmtulAHTXlJfHTftnuYeg/Mrq+HUr+aXy/TgFBalgxnnSI=
X-Received: by 2002:a05:6808:8eb:b0:38d:f794:26a with SMTP id
 d11-20020a05680808eb00b0038df794026amr1286395oic.41.1684423105381; Thu, 18
 May 2023 08:18:25 -0700 (PDT)
MIME-Version: 1.0
From: Cristian Ciobanu <cioby.service@gmail.com>
Date: Thu, 18 May 2023 18:18:14 +0300
Message-ID: <CAFoKhMxZ7Etx578CCz8ezhFy4UMXAGW14DX0kFuNUAtGmOv4DQ@mail.gmail.com>
Subject: ath11k driver DBDC support
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_081827_478766_CEC1C06C 
X-CRM114-Status: UNSURE (   8.25  )
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

I have purchased this M.2 wireless card
https://www.sparklan.com/product/wnfq-269axbt-wifi6-wifi6e-11ax-triband-m-2-dbdc-module/
based on the WCN6856 chipset which states that it supports DBDC but I
cannot make it work on Linux.  I plan to use it as an Soft AP for 2.4
and 5/6Ghz.

Does someone know if this DBDC feature is not yet supported in the
current ath11k driver or is this a firmware limitation?

The card is detected and the ath11k driver is loaded but I only see
one wlan card shown in the output of ip addr show command.

Below is some output from dmesg log

dmesg | grep ath11k
[   38.374925] ath11k_pci 0000:02:00.0: BAR 0: assigned [mem
0x7fc00000-0x7fdfffff 64bit]
[   38.374953] ath11k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[   38.375306] ath11k_pci 0000:02:00.0: MSI vectors: 32
[   38.375313] ath11k_pci 0000:02:00.0: wcn6855 hw2.1
[   39.749474] ath11k_pci 0000:02:00.0: chip_id 0x12 chip_family 0xb
board_id 0xff soc_id 0x400c1211
[   39.749481] ath11k_pci 0000:02:00.0: fw_version 0x110b196e
fw_build_timestamp 2022-12-22 12:54 fw_build_id
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Lspci detects it as an Qualcomm Atheros QCNFA765 [17cb:1103] 9rev01)
network controller
Subsystem : Lite-On Communications Inc Device [11ad:a85d]

Please let me know if you need more information

Kind regards,

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
