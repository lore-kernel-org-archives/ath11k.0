Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927A2C433FE
	for <ath11k@archiver.kernel.org>; Thu, 12 May 2022 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I6mSqZjpjljOgA+gr2ad2xTOfcUNXWDnDa8It1CCpCY=; b=u28PDNNLSZ4ckw
	vrWv9SGJdptPw7m7xw9F+QXOz//x9EbpycpchfvlNhxsYRlsOWNPlRs8LpQTnogad1iOaaTbQ2jsU
	Mov/5aUymcc0VTeef3yE3vEP3rDVxGjSxCP+TIWD4swLjLYT4ykUjw/Yhfn3PK9SGr28Dwo3UvGWM
	sdeWymgbii4gBrdocOLPgadPkrcGFpbEe1zp3WpN8S+jH8CrK4NtWe2AxGOtscYC5Ot3lpGz2qjFu
	kwSL4p2TGPUONmuhKzn4+dSkI4G8oOAwV0X78xd5RR4084s3lPsOnh5xLs9bnNFXH5XfOHCiXLfaF
	uXccuAKo8614tK8HSpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9rC-00CP4a-VV; Thu, 12 May 2022 14:31:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9r9-00CP2z-NW
 for ath11k@lists.infradead.org; Thu, 12 May 2022 14:31:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id j4so9416699lfh.8
 for <ath11k@lists.infradead.org>; Thu, 12 May 2022 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=011SriAoDCvCNFzY0EVNDfB85MBefzK24ZuGj/fScB0=;
 b=ptPt0F2X98indsAADqmmAVcWypbW3JkofM2uLICPbtWW8LjswxkMyTJyBeaw2RGphF
 yMzKs1W7bXaIR+qriidi8Qycz8xu9PQlS16ExVsm+VftSjWKPmg9FAyluyAy26yIQpSy
 Wc0M0MWppRbvfo4iOId5RJ/FMWfEloFTRjlprzPCd1qADFfPUls7qDQkqX7Q09wxpedH
 aK4pCAuK3V8UOYAt0lgTaMNPgZ40My9EuNf7xYT7i2Lm/qQc2gGuwrmKJwmWAEaxeMuJ
 La6p6S14jB2zWVa2IQEhe4d54ah1AGk5NzXwmuBRNmqILmH1LQuMxY44K3z99PPMlRWN
 m/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=011SriAoDCvCNFzY0EVNDfB85MBefzK24ZuGj/fScB0=;
 b=pHKlatn3W91s5uxi3emF6akeBrhNn1oqgzWiPOzPGcrtvvmoXLKAIdICsOzfIQj+lk
 S9TIbU4e1ma/5LhpCbtCbUJ78EUqViGGy2aoe3syN17V7IpI2s6gEGP6pf6XYZfDJDEX
 ecsakIwWapclPr+DvnAlh3c17o2cqkn04hxK8gJUgHmdm7XOLF2nMrzEyH2OB6EpfL1a
 XagP1y0hTtvwQpK265Lh7jxWlfF6cEXXnWFdsF9dnF3mHSubjwc/LHIwyDWAod/yCt50
 YFG/2jr2FZvfZPgjV4Nck+G67rdGZasov18ndkX22KmghxgwD4P58bJRB+H6vtz7UtBs
 TLmA==
X-Gm-Message-State: AOAM532z0Dcoy1J0+/CnhQHN78QdEWGthFL+wS7tYCt2UE6we5fr2DoX
 P4iP8bNqW7sALKCggE95h9AChMZSHuX1fg==
X-Google-Smtp-Source: ABdhPJzTsgn7Ce+UdTdUtYwGlue79lRMX9mWMKyaIcasJAiVAlvAq0PgUhfZm6jinccVfYl95i5jnA==
X-Received: by 2002:a05:6512:ea1:b0:473:bf79:e124 with SMTP id
 bi33-20020a0565120ea100b00473bf79e124mr47152lfb.191.1652365912311; 
 Thu, 12 May 2022 07:31:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a056512238e00b0047255d21170sm811793lfv.159.2022.05.12.07.31.51
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:31:51 -0700 (PDT)
Message-ID: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
Date: Thu, 12 May 2022 17:31:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: WCN6855 issues with latest linux-firmware
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_073155_816629_B7148E0A 
X-CRM114-Status: UNSURE (   7.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

The wcn6855 WiFi chip stopped working for me after an update to the 
latest linux-firmware (Linux 5.18-rc2). I can reproduce it with both 
hw2.0 and hw2.1 chips.

Here is the set of kernel messages I'm getting from ath11k_pci driver:

[    4.422391] ath11k_pci 0000:01:00.0: Adding to iommu group 3
[    4.429571] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem 
0x60400000-0x605fffff 64bit]
[    4.437857] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    4.445323] ath11k_pci 0000:01:00.0: MSI vectors: 1
[    4.450375] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
[    5.378488] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb 
board_id 0x8c soc_id 0x400c0200
[    5.392898] ath11k_pci 0000:01:00.0: fw_version 0x110f0c35 
fw_build_timestamp 2022-03-30 09:05 fw_build_id 
QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.7
[    5.420648] ath11k_pci 0000:01:00.0: failed to fetch board data for 
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=140 
from ath11k/WCN6855/hw2.0/board-2.bin
[   15.686398] ath11k_pci 0000:01:00.0: failed to wait board file 
download request: -110
[   15.694530] ath11k_pci 0000:01:00.0: qmi failed to load bdf file
[   15.700784] ath11k_pci 0000:01:00.0: failed to load board data file: -110


With the earlier firmware from [1] I'm getting the following trace (and 
WiFi device probes). Interestingly enough the chip_id differs between 
these firmware versions.

[    4.352661] ath11k_pci 0000:01:00.0: Adding to iommu group 3
[    4.359192] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem 
0x60400000-0x605fffff 64bit]
[    4.367466] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    4.374916] ath11k_pci 0000:01:00.0: MSI vectors: 1
[    4.379963] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
[    5.273930] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb 
board_id 0x8c soc_id 0x400c0200
[    5.286020] ath11k_pci 0000:01:00.0: fw_version 0x110406b8 
fw_build_timestamp 2021-01-08 06:14 fw_build_id 
QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
[    5.312464] ath11k_pci 0000:01:00.0: failed to fetch board data for 
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=0,qmi-board-id=140 
from ath11k/WCN6855/hw2.0/board-2.bin
[    5.384315] ath11k_pci 0000:01:00.0: leaving PCI ASPM disabled to 
avoid MHI M2 problems



[1] 
https://chromium.googlesource.com/chromiumos/third_party/linux-firmware/+/d233ddd89abe06448070471963a58c0a7da81d79/ath11k/WCN6855/hw2.0


-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
