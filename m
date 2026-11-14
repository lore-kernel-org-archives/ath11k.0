Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BEC606A8B8
	for <ath11k@archiver.kernel.org>; Sat, 14 Nov 2026 22:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BZdxedOO;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hwKXieMr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=; b=BZdxedOOSnppRFX9Zrcpp8VFaT
	jbYI9KT55H1to7fTpksKlNxTLNfH18Ap/hc4LggC0wP1lRsSiEaGgKIPRv+JgMW+RfGxQgPLyOWNq
	qhvUKydC4s6O/ObcoNV/SHHKLBB5wN0R/xhUitS0D/b2VZwakje+lOzz2IOS3XJ5opA41dQhSun3y
	MQNHLqk97yY7vDduFAx9ToAJXwdT32Q0OMISu2uqDRLdTesurDFhVnH3eDYitssa3DXVyhg00F8oB
	DZWiIW7i4IP7y2UiP8Q7qUayXcXRnKddigQp1F9XARzmWIG5BBL3pwx/PScYfcTsxHVzZ8td6O+ZW
	Mj5bl06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7N-0000000GpSE-2j1z;
	Sat, 14 Nov 2026 22:21:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSM7K-0000000GpR0-3hry
	for ath11k@lists.infradead.org;
	Sat, 14 Nov 2026 22:21:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c45551fa84eso475713366b.3
        for <ath11k@lists.infradead.org>; Sat, 14 Nov 2026 14:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694861; x=1795299661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
        b=hwKXieMrojwK/iXAOyU/bsBziJ7OHAf/sMGAmdxgX1b9yOA5Kcccdk8h2DryjoRF+B
         g0GopCXfXeEVYjxCHBMK+adKyb9FJx9UR9JZUASd+j8rpTgjJwUHYe3N0UNtWqm86+cR
         H+JeYZs02ccLOJv2Bnb4bvoj6WM5ufCgKr3mNPVdTw/O74stQ9UXD/r2wRg6nr4vulhj
         IfwiFdE/txvWhP5R4t8fDiEf3Tz0yCEkq2XtiiB/nKQSYc4iLtgMTLEz1Pry0XMlRXOY
         RnyidCdj+BsGLLmhqhNoHnCRCGNDm87oznKH7tQPJjkGfl40NwapRqKlwLDFK5HlZW2S
         iBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694861; x=1795299661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5knRLyw754hTvw5hVn7VA6Gezq1Ne6ahhrhqW60ihc=;
        b=R7eIHK2dYfW2ig53YXCwKBjDNR+mGERZs/+aPb66HWO5Gvn3QYj+6OfTSrwxL1qUT3
         vR/svTjfL4OeBK/6ayGMMC0VS92L4R+jBQvknvLYC0/Ccc/3DDdxpXO8kiZzUDjd7IVI
         3w6USQ3PLKs3dMMDlIVwB5gjzu5PsnK9V0th1Y6NFCsdYwmYEbH/wrEn+ZNazMox139W
         uMa6inH5vb+BNcEnLEHlbCP6yKKh/QjCh/Unzeys9SSIEg49GSVczx1u+yt9VNj7phHT
         9S7zqH5MWNmhsl8CzQ+UBBfJk+kEOGOa08yWnda6vQpHvY0Fs07VxgMYttEa/e5Rn294
         iIaA==
X-Gm-Message-State: APuU4Z+3xNw+jJ11S3N0RcZCoipL/kaHkKlzSLMdyuxznZn4vU2ddq0K
	j+Qm6fM23afRlUUHGIo4QbHkgcMptYnTjKul93Nl5LU8y/2NBJ5ecGcR68MstPFLbQ==
X-Gm-Gg: AYBFou1517aDDnaTFDpNuZ8+11X28VmX4THAhuk2rzs4MeZuLb+t9jXj6PiRf3wV1rE
	hcXTFUyY67BMKssDDZkdd+dMImlRUB+EskJD6DxkswfeK8IEzZWF5psG4om5HSCBXTjY+9oNtpQ
	HcykjnS5FsmW8Gb1dhNsgDTFHwVAFHxZfAhuUw1ZuCCJHjwD8s927pHLIJBi7OP0aDzGmUQYGeG
	WM4fEYEd3d0JsMzaE1bD1WUP4L/M1MvrwP6DPbUW/p3ytNYRwPz6D1sk6h8fI1pj+0SFPy9l/x8
	QVDxBCfd157/wW6CTSjVEUVjI/1xNbixvz0m5oPvjl6jtDDgi9loQxTf+8IQUBvLlgPtgV83AdT
	tnybgVPWEiqbsFo082IPwHyke1FXhwVNLaAYK49liknLsq2qsW/o5NtzGR9fnPaI5Oaa/pXCTq7
	gqtkWcGsg1bnJ4ONxLB25Y9WccZh2GOaSEqI/8LLI5SakI2ie9FzvPHAmgvmcfxkCGSVPg9VOH9
	6L5WGjBIEq+7kw4edr6JFBs4g0d0o0WVrtlF2a22+cnzjIl4n88EgCF+KDPukfXqCLxRMTzaaTv
	4eB/Rx/UjgU2mkSR9zbU+s0hOqKBgXDgEhJNCijlBhnd4im0GHljEmpqfCb8IR5GA5MjRBgOO1B
	M3HZ/MhSYQwEccRoudoCx7FjcFa0rAulY5cHed7MUNBCPLOjOmCPZYkjSXXEevD+NvnmeLfps5K
	gsGRXqyM2L8hDqXKFdZzxhV9SFQJ/Y/JNi9F+e5GtIR8aBL/z4UxANF3lG7aj3ml9AX/fJpu80a
	2cHObJ8ry+USBRbQs/rvldbOZPQLlRd8Nc7gdjYwWSL8tGzmcu49CDI5yLBtdfTaed+lkwhNHJg
	+CBbdKpJK8s5CCSDiFp438y2qcKKNW42qoHYosbFUUrX1jvub/GZ38B6Nyi7lIdF
X-Received: by 2002:a17:906:5146:10b0:c46:645f:cedf with SMTP id a640c23a62f3a-c5096398ad5mr419322766b.15.1794694860698;
        Sat, 14 Nov 2026 14:21:00 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:00 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 0/2] wifi: ath11k, ath12k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:56 +0100
Message-ID: <20261114222058.184034-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_142102_949431_A10E682D 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k and ath12k request the optional firmware-2.bin with
firmware_request_nowarn(), which silences the kernel's warning but still
lets a missing file fall back to sysfs when
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y. User space then gets a firmware
uevent and OpenWrt's procd hotplug handler logs "Could not find firmware
.../firmware-2.bin" each time ath11k loads on an IPQ8074 device that
ships no such file.

1/2 requests firmware-2.bin with request_firmware_direct() in ath11k,
2/2 does the same in ath12k.

Tested with W=1 builds of ath11k and ath12k. On an IPQ8074 AX3600 with
no firmware-2.bin, 3 reloads of the unpatched ath11k module logged 3
"Could not find firmware" lines. One reload with 1/2 applied logged
none, both radios came up on API 1 with WLAN.HK.2.12-01460 and dmesg
showed no warnings.

v2:
- add 2/2 for ath12k
- drop the Assisted-by trailer, target ath-next in the subject
- see the patches for the rest

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath11k: request firmware-2.bin directly
  wifi: ath12k: request firmware-2.bin directly

 drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
 drivers/net/wireless/ath/ath12k/fw.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0


