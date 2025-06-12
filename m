Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC64C71136
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hna0uT/tt+295NucNwpNuwLw8jSjLp+ED36vMV3j8M=; b=gkL+idWKWwv8wIc8Dw4rSUIBQF
	N6S9lBO0KOdIUFvu1QIbWs7J+zLJ+qugYwoyrSHkLiBklE9El2YYmRJNBmyuwNPPWPvjb/6nieOYc
	YNN1JaVBmCrViQp7LpyWvqmyDgNLUloHgkGS3m4+wH3fatywa3KYQAaCsYDTpjdRJZeDi/xmmOHMS
	iUYQKdMyt/XyctKhGeqXN7m4td56XVDzW1sfA5n0jATVF2/O7VUDzUCcspa0Y9p9R65wzYfsdp3Eq
	eq5YNVVTdcBnM6Tf0t1dHG8CMp/l25cHSMSy3ko3mAdxeAHIugxpjHBq8Qr+14XfNNyBuKy1YI9Ia
	iN4G1NzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdXu-0000000CgSr-0ATN;
	Thu, 12 Jun 2025 08:44:26 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcrE-0000000CXTI-3Unp
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 08:00:22 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-86d0168616aso63705839f.1
        for <ath11k@lists.infradead.org>; Thu, 12 Jun 2025 01:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749715220; x=1750320020; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hna0uT/tt+295NucNwpNuwLw8jSjLp+ED36vMV3j8M=;
        b=kTgc4zIJ2pWZFT2rB3SIPFuUojT2R5C/tFXs9+J3qtjFPMH54xCWItm/ManmOaB+sz
         g0BIdfeajR8HMoeUBNm00kUw/tO7XU30MXnjeZ6ZMrTTplnx9fIkr454lEtQLT/kjCXm
         SOn5j/HvE69Z2M3SHTTatEVHREMjvMp4WA6FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715220; x=1750320020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hna0uT/tt+295NucNwpNuwLw8jSjLp+ED36vMV3j8M=;
        b=OCOvaNWUagHs20l+rIrVh0aavYSrBYS376oiudBaBRajPIKZ/+R0m/BpJQTdeD8AMN
         ICyz1dCz4Ez2Z8PUIBQ6+xQCyTU7k5YJyv3Sa1GjArLiNEAVLK7XDOxIuUUTxoioi5YV
         fpCSHdL8FDisO6CibANGdSV+ROU41Le+FT3mh4x7QengHdpLb19H7I5ecs31gMLbwxyL
         To3LzGiI5/QNsOaV/rIK0BMsTbJTzY/sP6Ztuq6XoMT/pKoELzyvbz+ifNWe2VNZRUBH
         HJgGyLdsIlrjXBTGvfA9juPj/832ZpVMRRl/H+ZOjgflpWjjQlI5Xnk3mdrl2Wu8tU6m
         6S3A==
X-Forwarded-Encrypted: i=1; AJvYcCW/kq5m+5Wbgj5GfPsviRUgo9/1KajYrlgKeCiDUpI7iQevDZqY+9zcnm1RInp+MrF3MILsB98=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTl1BSPH0HSYYMcZa1nM1W3jyB5BLho8uDKS11igsaV6TLdqRj
	UCnBK2Xyf8b69qTetJ+aj13STevbvBBcARefr6bJ0AdUMDtaaUmlkytgUs+Zm02bLDuGAhlRLMe
	5j9Q=
X-Gm-Gg: ASbGncu+yQxWJ31v6klCpuerPxOENeKx+CZszOGzpSKspPyHq0zlSUs2DFxAjxyVq1A
	ZKOM/D+LrA+mEFgRvSZlUm2ROZdDLHRWaaGu3XW95amItSpgiYfVWfoJg0izmWo3IldMeOnVLeo
	YngXOJgTieF9Pk/VXT6gIHSvnd82U/T1U4cTb1B0UHZZFALM1scB7j64ArxKogjmJgGHu/HdYGd
	Jb8yDJf8uxXI3GbEFnmWjGSWxGPDRmRerjIdvEnE4ZtvHnNVDNcoyXVzH4+n4ypR7/5tHx5suIL
	dyCH5mgXZPzMT4veJLmWYF6pBmNRjgUPluRjw2/HzdMuXIfpeCZC57VYT6hSU1QU
X-Google-Smtp-Source: AGHT+IF3ZGHB7FEmLCTn+tqiSWIXZUozm84Y9ndMWAG0Ko2Ey0fvYarMXu67XesMBf9DfF9hIGlC+A==
X-Received: by 2002:a17:903:1210:b0:234:9094:3fb1 with SMTP id d9443c01a7336-2364d8cc796mr33206775ad.35.1749715206724;
        Thu, 12 Jun 2025 01:00:06 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:fcb5:79e0:99d6:8d5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e637be5sm8021665ad.62.2025.06.12.01.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:00:06 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:00:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Message-ID: <qqhs2mzhg6mgq23wej5a65iau4ysfjh2raakcsvwc4fuqtpwk2@4ouqfld6mrnd>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
 <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
 <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
 <2f77045c-6763-4fc4-bf09-50fd9b76a394@quicinc.com>
 <xr3n5pbohquhaloonctfqvpb2r3eu6fi5jly7ms4pgcotqmqzh@msrgbaawafsj>
 <ce3c0e51-4df0-4164-adcd-e98f2edee454@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce3c0e51-4df0-4164-adcd-e98f2edee454@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_010020_893955_2632E3E8 
X-CRM114-Status: GOOD (  18.89  )
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

On (25/06/12 15:49), Baochen Qiang wrote:
> > My understanding is that the driver first fails to reconfigure
> > 
> > <4>[163874.555825] ath11k_pci 0000:01:00.0: already resetting count 2
> > <4>[163884.606490] ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
> > <4>[163884.606508] ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
> > <3>[163884.606550] ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
> > 
> > so ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit(),
> > which destroys the srng lists, but leaves the stale initialized flag.
> > So next time ath11k_hal_dump_srng_stats() is called everything looks ok,
> > but in fact everything is not quite ok.
> 
> OK, we have a second crash while the first crash is still in recovering. And guess the
> first recovery fails such that srng is not reinitialized. Then after a
> wait-for-first-recovery time out, the second recovery starts, this results in
> ath11k_hal_dump_srng_stats() getting called and hence the kernel crash.
> 
> Could you please share complete verbose kernel log? you may enable it with
> 
> 	modprobe ath11k debug_mask=0xffffffff
> 	modprobe ath11k_pci

Unfortunately I don't have a reproducer.  We just see that some of the
consumer devices crash on resume and all we get is ramoops.  We can't
do any debugging on consumer devices.

This is all I have:

<3>[23518.302240] Last interrupt received for each group:
<3>[23518.302243] ath11k_pci 0000:01:00.0: group_id 0 22511ms before
<3>[23518.302246] ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
<3>[23518.302248] ath11k_pci 0000:01:00.0: group_id 2 14440788ms before
<3>[23518.302250] ath11k_pci 0000:01:00.0: group_id 3 14440788ms before
<3>[23518.302252] ath11k_pci 0000:01:00.0: group_id 4 14736571ms before
<3>[23518.302253] ath11k_pci 0000:01:00.0: group_id 5 14736571ms before
<3>[23518.302261] ath11k_pci 0000:01:00.0: group_id 6 14440789ms before
<3>[23518.302263] ath11k_pci 0000:01:00.0: group_id 7 22541ms before
<3>[23518.302265] ath11k_pci 0000:01:00.0: group_id 8 24724ms before
<3>[23518.302266] ath11k_pci 0000:01:00.0: group_id 9 23315ms before
<3>[23518.302268] ath11k_pci 0000:01:00.0: group_id 10 25238ms before
<3>[23518.302270] ath11k_pci 0000:01:00.0: dst srng id 0 tp 5312, cur hp 5312, cached hp 5312 last hp 5312 napi processed before 22541ms
<3>[23518.302272] ath11k_pci 0000:01:00.0: dst srng id 1 tp 27664, cur hp 27664, cached hp 27664 last hp 27664 napi processed before 24724ms
<3>[23518.302274] ath11k_pci 0000:01:00.0: dst srng id 2 tp 12432, cur hp 12432, cached hp 12432 last hp 12432 napi processed before 23315ms
<3>[23518.302276] ath11k_pci 0000:01:00.0: dst srng id 3 tp 1424, cur hp 1424, cached hp 1424 last hp 1424 napi processed before 25238ms
<3>[23518.302278] ath11k_pci 0000:01:00.0: dst srng id 4 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 22512ms
<3>[23518.302280] ath11k_pci 0000:01:00.0: src srng id 5 hp 0, reap_hp 248, cur tp 0, cached tp 0 last tp 0 napi processed before 14440789ms
<3>[23518.302282] ath11k_pci 0000:01:00.0: src srng id 8 hp 950, reap_hp 950, cur tp 950, cached tp 280 last tp 280 napi processed before 22512ms
<3>[23518.302284] ath11k_pci 0000:01:00.0: dst srng id 9 tp 19526, cur hp 19526, cached hp 19526 last hp 19526 napi processed before 22512ms
<3>[23518.302286] ath11k_pci 0000:01:00.0: src srng id 16 hp 3832, reap_hp 3832, cur tp 3832, cached tp 3824 last tp 3824 napi processed before 22758ms
<3>[23518.302288] ath11k_pci 0000:01:00.0: src srng id 24 hp 0, reap_hp 248, cur tp 0, cached tp 0 last tp 0 napi processed before 14440789ms
<3>[23518.302290] ath11k_pci 0000:01:00.0: dst srng id 25 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 14440789ms
<3>[23518.302292] ath11k_pci 0000:01:00.0: src srng id 32 hp 12, reap_hp 8, cur tp 12, cached tp 12 last tp 8 napi processed before 14736834ms
<3>[23518.302294] ath11k_pci 0000:01:00.0: src srng id 35 hp 96, reap_hp 88, cur tp 92, cached tp 92 last tp 92 napi processed before 21573ms
<3>[23518.302296] ath11k_pci 0000:01:00.0: src srng id 36 hp 176, reap_hp 164, cur tp 176, cached tp 168 last tp 168 napi processed before 22447ms
<3>[23518.302298] ath11k_pci 0000:01:00.0: src srng id 39 hp 0, reap_hp 124, cur tp 0, cached tp 0 last tp 0 napi processed before 14440789ms
<3>[23518.302300] ath11k_pci 0000:01:00.0: src srng id 57 hp 54, reap_hp 54, cur tp 58, cached tp 58 last tp 58 napi processed before 22485ms
<3>[23518.302302] ath11k_pci 0000:01:00.0: src srng id 58 hp 584, reap_hp 584, cur tp 588, cached tp 588 last tp 588 napi processed before 22429ms
<3>[23518.302304] ath11k_pci 0000:01:00.0: src srng id 61 hp 1020, reap_hp 1020, cur tp 0, cached tp 0 last tp 0 napi processed before 14736834ms
<3>[23518.302306] ath11k_pci 0000:01:00.0: dst srng id 81 tp 116, cur hp 116, cached hp 116 last hp 116 napi processed before 22485ms
<3>[23518.302308] ath11k_pci 0000:01:00.0: dst srng id 82 tp 1176, cur hp 1176, cached hp 1176 last hp 1176 napi processed before 22429ms
<3>[23518.302309] ath11k_pci 0000:01:00.0: dst srng id 85 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 14440789ms
<3>[23518.302311] ath11k_pci 0000:01:00.0: src srng id 104 hp 65532, reap_hp 65532, cur tp 0, cached tp 0 last tp 0 napi processed before 14736836ms
<3>[23518.302313] ath11k_pci 0000:01:00.0: src srng id 105 hp 0, reap_hp 504, cur tp 0, cached tp 0 last tp 0 napi processed before 14440789ms
<3>[23518.302315] ath11k_pci 0000:01:00.0: dst srng id 106 tp 245496, cur hp 245496, cached hp 245496 last hp 245496 napi processed before 22512ms
<3>[23518.302317] ath11k_pci 0000:01:00.0: dst srng id 109 tp 5704, cur hp 5704, cached hp 5704 last hp 5704 napi processed before 22512ms
<3>[23518.302319] ath11k_pci 0000:01:00.0: src srng id 128 hp 3182, reap_hp 3182, cur tp 7428, cached tp 7428 last tp 7428 napi processed before 22541ms
<3>[23518.302321] ath11k_pci 0000:01:00.0: src srng id 129 hp 0, reap_hp 2046, cur tp 0, cached tp 0 last tp 0 napi processed before 14440789ms
<3>[23518.302323] ath11k_pci 0000:01:00.0: src srng id 132 hp 1690, reap_hp 1690, cur tp 1692, cached tp 1692 last tp 1692 napi processed before 22429ms
<3>[23518.302324] ath11k_pci 0000:01:00.0: dst srng id 133 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 22512ms
<3>[23518.302326] ath11k_pci 0000:01:00.0: src srng id 144 hp 0, reap_hp 2046, cur tp 0, cached tp 0 last tp 0 napi processed before 14440789ms
<3>[23518.302328] ath11k_pci 0000:01:00.0: src srng id 147 hp 1948, reap_hp 1948, cur tp 1950, cached tp 1950 last tp 1950 napi processed before 22429ms
<3>[23518.302330] ath11k_pci 0000:01:00.0: dst srng id 148 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 14440789ms
<4>[23519.369310] ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
<3>[23520.393292] ath11k_pci 0000:01:00.0: Service connect timeout
<3>[23520.393302] ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
<3>[23520.394087] ath11k_pci 0000:01:00.0: failed to start core: -110
<4>[23520.710478] ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
<4>[23520.710550] ath11k_pci 0000:01:00.0: already resetting count 2
<4>[23530.761544] ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
<4>[23530.761562] ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
<3>[23530.761595] ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
<6>[23561.813605] mhi mhi0: Requested to power ON
<6>[23561.813627] mhi mhi0: Power on setup success
<6>[23561.899318] mhi mhi0: Wait for device to enter SBL or Mission mode
<6>[23562.530990] ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
<6>[23562.531010] ath11k_pci 0000:01:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
<3>[23562.575723] ath11k_pci 0000:01:00.0: Last interrupt received for each CE:
<3>[23562.575742] ath11k_pci 0000:01:00.0: CE_id 0 pipe_num 0 14781107ms before
<3>[23562.575751] ath11k_pci 0000:01:00.0: CE_id 1 pipe_num 1 66758ms before
<3>[23562.575756] ath11k_pci 0000:01:00.0: CE_id 2 pipe_num 2 66702ms before
<3>[23562.575759] ath11k_pci 0000:01:00.0: CE_id 3 pipe_num 3 66720ms before
<3>[23562.575763] ath11k_pci 0000:01:00.0: CE_id 5 pipe_num 5 14485062ms before
<3>[23562.575766] ath11k_pci 0000:01:00.0: CE_id 7 pipe_num 7 14485062ms before
<3>[23562.575770] ath11k_pci 0000:01:00.0: CE_id 8 pipe_num 8 14485062ms before
<3>[23562.575773] ath11k_pci 0000:01:00.0:
<3>[23562.575773] Last interrupt received for each group:
<3>[23562.575778] ath11k_pci 0000:01:00.0: group_id 0 66785ms before
<3>[23562.575781] ath11k_pci 0000:01:00.0: group_id 1 14485062ms before
<3>[23562.575785] ath11k_pci 0000:01:00.0: group_id 2 14485062ms before
<3>[23562.575788] ath11k_pci 0000:01:00.0: group_id 3 14485062ms before
<3>[23562.575791] ath11k_pci 0000:01:00.0: group_id 4 14780845ms before
<3>[23562.575795] ath11k_pci 0000:01:00.0: group_id 5 14780845ms before
<3>[23562.575798] ath11k_pci 0000:01:00.0: group_id 6 14485062ms before
<3>[23562.575801] ath11k_pci 0000:01:00.0: group_id 7 66814ms before
<3>[23562.575805] ath11k_pci 0000:01:00.0: group_id 8 68997ms before
<3>[23562.575808] ath11k_pci 0000:01:00.0: group_id 9 67588ms before
<3>[23562.575812] ath11k_pci 0000:01:00.0: group_id 10 69511ms before
<1>[23562.575828] BUG: unable to handle page fault for address: ffffa007404eb010
<1>[23562.575833] #PF: supervisor read access in kernel mode
<1>[23562.575837] #PF: error_code(0x0000) - not-present page
<6>[23562.575842] PGD 100000067 P4D 100000067 PUD 10022d067 PMD 100b01067 PTE 0
<4>[23562.575852] Oops: 0000 [#1] PREEMPT SMP NOPTI
<4>[23562.575873] Workqueue: ath11k_qmi_driver_event ath11k_qmi_driver_event_work [ath11k]
<4>[23562.575896] RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
<4>[23562.575916] Code: 6b c0 44 89 f2 89 c1 e8 4a 14 06 00 41 be e8 25 00 00 eb 6e 42 0f b6 84 33 78 ff ff ff 89 45 d0 46 8b 7c 33 d8 4a 8b 44 33 e0 <44> 8b 20 46 8b 6c 33 e8 42 8b 04 33 48 89 45 c8 48 8b 3d 45 93 fd
<4>[23562.575922] RSP: 0018:ffffa00759ed3c50 EFLAGS: 00010246
<4>[23562.575926] RAX: ffffa007404eb010 RBX: ffff9eab4ea60000 RCX: 382d128991c49600
<4>[23562.575930] RDX: 00000000ffffffea RSI: ffffa00759ed3998 RDI: ffff9eac66017488
<4>[23562.575934] RBP: ffffa00759ed3c90 R08: ffffffffbd649d80 R09: 0000000000005ffd
<4>[23562.575937] R10: 0000000000000004 R11: 00000000ffffdfff R12: ffff9eab4ea61c90
<4>[23562.575941] R13: ffff9eab4ea60000 R14: 0000000000002828 R15: 0000000000000000
<4>[23562.575945] FS: 0000000000000000(0000) GS:ffff9eac66000000(0000) knlGS:0000000000000000
<4>[23562.575949] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[23562.575953] CR2: ffffa007404eb010 CR3: 0000000136e24000 CR4: 0000000000750ee0
<4>[23562.575956] PKRU: 55555554
<4>[23562.575959] Call Trace:
<4>[23562.575965] <TASK>
<4>[23562.575978] ? __die_body+0xae/0xb0
<4>[23562.575987] ? page_fault_oops+0x381/0x3e0
<4>[23562.575995] ? exc_page_fault+0x69/0xa0
<4>[23562.576003] ? asm_exc_page_fault+0x22/0x30
<4>[23562.576015] ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:6cea 4)]
<4>[23562.576034] ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
<4>[23562.576058] worker_thread+0x389/0x930
<4>[23562.576065] kthread+0x149/0x170
<4>[23562.576074] ? start_flush_work+0x130/0x130
<4>[23562.576078] ? kthread_associate_blkcg+0xb0/0xb0
<4>[23562.576084] ret_from_fork+0x3b/0x50
<4>[23562.576090] ? kthread_associate_blkcg+0xb0/0xb0
<4>[23562.576096] ret_from_fork_asm+0x11/0x20


There are clearly two ath11k_hal_dump_srng_stats() calls, the first
one happens before crash recovery, the second happens right after
and presumably causes UAF, because ->initialized flag is not cleared.

