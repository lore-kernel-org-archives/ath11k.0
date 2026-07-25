Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6622DC531C9
	for <ath11k@archiver.kernel.org>; Sat, 25 Jul 2026 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXY4j56rD3KtaSlsN4KTeiYRDj0jhfdXi33CFrmcr4c=; b=PYAxvY2amh09mM6C1cKemnbJkk
	rinEO8PHmPIdnZIUpyDAr+39W+Kk7/WxuVUwhVgRKP4vokdrEUZ4s0wI8+LYti2vQuDiOzyXA88nf
	rjEA2lWH/Oe7Dtsc7T2kK4ve/g3gvgc1/ZnXPYYeCRfV/YqgEABc9S4pLXHQyuXhjKtNGF4z6ncuj
	q6iC++zRrvy+GeY23P7R5NPZdIWtk16NPh9dVOuzBqtbhe0E+8VbDgAvRxjArtu5HR8FP06ppVUTg
	sN+ejoW/Qd2WNxUzuN/YtXlvFYPxOR9NnnWXDDDEVFn+hwfCE0V3+kvpAQebiSp1HIKQLR172uXPY
	FVSmnYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndD0-00000000Qq2-0OSM;
	Sat, 25 Jul 2026 14:18:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndCx-00000000Qp7-36i7
	for ath11k@lists.infradead.org;
	Sat, 25 Jul 2026 14:18:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-69fdcb13fdbso9332a12.0
        for <ath11k@lists.infradead.org>; Sat, 25 Jul 2026 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1784989109; x=1785593909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXY4j56rD3KtaSlsN4KTeiYRDj0jhfdXi33CFrmcr4c=;
        b=D0UUMOrRF3J/qeEniGjZh5X/MJkCNhfwDkdN95f5dweZZsbgdNmLbyZhBuwfF32oDk
         5BDidTIseR3KNm+/E05abDZx1D3vzGZjHbEjNkRZXD6ucNbP5ftxJV5IkkxRVAN35f/p
         hn9p1gYfIDxAjw54XRrbsshhky+xW8HOUYeQSj0HmcMjc4wB0R+W490J8qb4voLYY2Fi
         q0UPcf5cMDLnqU5crUOHmBIthEyggpDfhzcbo/i9yLQrEPkQmcV15nd64C1mKRPAVTSe
         24Tic019FTDbDeb16zkUp/X9zvzaGFH1PqyddeMIrKbaf3P9aQY4hH62KHHt97YM/+IY
         QuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784989109; x=1785593909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXY4j56rD3KtaSlsN4KTeiYRDj0jhfdXi33CFrmcr4c=;
        b=ZR0cuPGmXKURlRS0HXR/dPeArLRq+qpz60w6Yrt8X7jm6DT/8aXEgEpT3csKzJgyiB
         0ytfXPNY3+5nEf3e5GSEmL7H2TWR5+0g09tRE3+PXgRizcAAHrGGe7D5gPlNeEU8O23U
         OvvJvlxEIEJHXPjQ7jn+dI0rSPL02MR8kcd0NOtC7kKFAAJIOFcmFYVMFV3V7yqjSqaK
         ipEeB0JoBLc5B1Od0OnnVoStf2VsA5guB5XnTkzQBYhIf+8y1g+DLHvAPq4dB2QcoMQ7
         lLavuE3/+aAd0jvYEKgzMVLqojL0D1ialQZOvNOmK8VXGJ0iXv7Zz6kVEn624Gln/g3c
         MwCQ==
X-Gm-Message-State: AOJu0Yzut2cfpV/vHL7+uFVmAHdyImyrmy/+mDjW+MYoeFbWVaHnkf1s
	HHK5V74Yu7a5U5mkiIDXEEyF6aiM0iiXRLuTqbi0trkfGbtgfsfseoAkLE6dwhSBzg==
X-Gm-Gg: AR+sD11kQ1qJteB0XoGvxkBqDZ3o3SZOFbb0i8C8SOaMrGuGs+TlacT2KcHffKIjTpJ
	Ykf+v/Im2KmkywLmOXx+mtjz1Aopi92tAfZe1/Zl+eAidfPVN3o9KF2nDcQxoJPN6zf8YZRACtn
	Ce6hutmCqVORR47QqVFlVzVpUY9rkgZgjltFpf9SO3ggt5tPQ4te3KYjnuEiYhgsSY4KTLcuU7o
	BR2zOu0qMjHGGvXYo6Yu0VsspiJ9Kanm31K2rpCWngPQgYtP6ZbINOLwN+4vdCXSbITD88EACdA
	GIc8k1vcDfy0L4Qhm2qorZcwPCpKgUXUwBh5V6PZ2Yqo6py/E+ITlEYZLrOvNWSVt952QAxZFTp
	03jUxWW935sfC5dyaYBcXGYiWhx+Avwcv3R9NY8UTwE2+q1Xiu4Ttc+OpR4IxsiNQdXWk+Ndf+t
	hD+IbUOZAr9cMuuPZ821Sy2avK3UZHyJYuI1NfblTcgHOvp0QeAIq7ApUljemZSrhTZ9FFx73tF
	POvgf8rZyfIiHtNR/rVQffWBJ7WujTUuRrM6MKl4duD8UbkMg4pKkQY7MNd3qnVjTlzzjIE/Cv3
	iUtMCzS6iqyzUwTiNp8ccRcoFoJF7a/53LizYIi1fD5g1xybeuaoW2hnjjdaZG6hjpNPmB0Mz38
	s1xwEwLzsOZdfComueC/boei43GWTpbk=
X-Received: by 2002:aa7:d0d0:0:b0:69a:3652:9d33 with SMTP id 4fb4d7f45d1cf-69fb1bb2da2mr1339966a12.19.1784989109529;
        Sat, 25 Jul 2026 07:18:29 -0700 (PDT)
Received: from Desktop (p54aff063.dip0.t-ipconnect.de. [84.175.240.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm894010a12.26.2026.07.25.07.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:18:28 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath11k: fix SoC reboot on firmware crash on AHB
Date: Sat, 25 Jul 2026 16:17:55 +0200
Message-ID: <20260725141757.1316877-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_071831_806182_1DDFB66D 
X-CRM114-Status: GOOD (  10.86  )
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

On IPQ8074 every firmware assert takes the whole SoC down. The DP NAPI
keeps polling while ath11k_core_reconfigure_on_crash() frees the data
path underneath it, and dereferences a ring the teardown has already
cleared.

The interrupts used to be disabled at the top of that function.
commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
moved the disable into ath11k_core_reset(), which AHB parts never reach
on a real firmware crash: reset_work is queued only from mhi.c and from
the debugfs hw-restart handler. Patch 2 puts the disable back on the
crash path. Patch 1 is a prerequisite - the CE half of the quiesce is a
no-op on AHB today because the bus never implemented the hif ops.

Reproduced and fixed on a Xiaomi AX3600 (IPQ8074 hw2.0), with no
out-of-tree modules loaded, using the debugfs simulate_fw_crash
'assert' trigger:

  before: 2/2 asserts panic in ath11k_dp_rx_process_mon_status() and
          reboot the SoC
  after:  3/3 asserts recover, 5 firmware boots across a single 397 s
          uptime, no panics, both radios stay up

Note the debugfs 'hw-restart' trigger does not reproduce this, since it
goes through ath11k_core_reset() - the one path that still disables the
interrupts. Only a real firmware assert does.

Patch 1 is by inspection: it makes ath11k_hif_ce_irq_disable() take
effect on AHB, which also fixes the existing call in
ath11k_core_reset(). I have not managed to trigger a CE-side crash on
its own, so if you would rather see that split out or dropped, say so.

Julius Bairaktaris (2):
  wifi: ath11k: implement CE interrupt enable/disable for AHB
  wifi: ath11k: disable interrupts during firmware crash recovery

 drivers/net/wireless/ath/ath11k/ahb.c  | 9 ++++++++-
 drivers/net/wireless/ath/ath11k/core.c | 9 +++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.53.0


