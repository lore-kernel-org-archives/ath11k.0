Return-Path: <SRS0=rTjQ=KF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE86C43461
	for <ath11k@archiver.kernel.org>; Mon, 10 May 2021 12:06:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36D1613C2
	for <ath11k@archiver.kernel.org>; Mon, 10 May 2021 12:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D36D1613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ra54Ff985jKXMnIqITrX9ug6fPXMxeelLFAR1ZPVHkE=; b=HTKnEvTfYGbi1C
	gKIvOskRGmSBndvUjLxb/hp/0ZDwlRYXSZWr3JXVeEdAO7CALOclamdnK0+0PJAi/Obff2iM6sK75
	+P7zIUqvDsjmyuaDo7ISbo+SOwtqHLglbxrWVlg1B5MLgL/0GMXJjOhl8iLcwCqF8eDOGfX379t28
	6mfkFML9IvgJnFFWE1SwU6yQG/Ey+uRDRlNZMyiZwYZx9meVZsi1yraogTLJMjR6w74JzaWPL1CBb
	TnDxIya+eBzk7/R9rGwnWKhZpJCdFQe7umnvc8FbuIBQxrmbyi3xvlX4LMd2GggpHaSyi551eaNOB
	uChimNbTKx0r06sGNY5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4g8-00EC1A-Dy; Mon, 10 May 2021 12:06:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4ZO-00EAX5-Tl
 for ath11k@desiato.infradead.org; Mon, 10 May 2021 11:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=EzbTTt/ZX2vNahtBevAdtc7SPs1JvMQPIEFu7/8Glxo=; b=eEBJ0KTcXJNbQnBi1ef/ea76fn
 Ls8lRLsRkgB1MySSAu0eyWFgRolqf30DywFkejmJ0UzatyW/dofQNIFMQh22jbicTvySmjNlEPChO
 IRX842XKAegNF/YtYpGYrRjhDSkZC9w1Lu53COCI8L3UMM/rhD3hUqGd+9/aGFgxxcqgOBs94BJCz
 uyPDkb6WZg5sBTORuuC/SSD/xfUbBjArZ1DRITu2/Qp9CY4vjKP46lkCO/A5j3X+9eDGD05E4dOTU
 UOPtDhA7T5Sqj8g+Qb2IE9El3+Bag6zHxm5VscMQl2ypTtz+03Hfo9ewsGN6udDBERpSplsju0KiJ
 KWvBpRxQ==;
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4ZL-008ekZ-QH
 for ath11k@lists.infradead.org; Mon, 10 May 2021 11:59:29 +0000
Received: by mail-yb1-xb34.google.com with SMTP id g38so21269499ybi.12
 for <ath11k@lists.infradead.org>; Mon, 10 May 2021 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EzbTTt/ZX2vNahtBevAdtc7SPs1JvMQPIEFu7/8Glxo=;
 b=a3VYhP6/w17l3Gmw01D24oueJdgf5hGkjywDcux1IfQeNTWN5F8WGlDRntj5b0aaeV
 aNFRPRzyn8CRLYXqpjt2yBDSIdb8EkYHLukZLxb56KK6JvkE84Jdu0/Pm8ceFNpkZFXe
 sWxlIAUOxIEf2aRJpoIOx8ikwWP6ldgKNeBSsGb65FnQ8ZTnhkZO9nrkdZKaAMPY5ANx
 QtBfajlv+Rqdf/PXWrzBr3y4cSnCFnRfWxG4RJAA2k/VIPoWqEc1WCiGqf9y7gaIzsg9
 Qq/7roNIrmhFHfn9QhrV9nGRdB3ms4sbXsKLZs1EzQifMLaedPoVCrHxcfO10TIELb/l
 aZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EzbTTt/ZX2vNahtBevAdtc7SPs1JvMQPIEFu7/8Glxo=;
 b=c38Qu+qbDqV+NPL2Br+90GQFHw16YnsGz4bSpGbVPQMaUY6Sh+Rp70+adibnZBxpoZ
 Hol7irnLsbGvsGEEWag3Rm1J8kXInqS1gjN7Z/Ec4Da16Ydg6bZ+l5CrrOTkifCyQp1u
 obaZ0c+c059omh/sddR/h8QAYpPIYNuKznux2g3js6+dsT3zZPUMLr54Mmyy2oSSLiYW
 O7fCLfvJlRK1efv0gJBdY9AhJ4mxaprhmnIG3clzdrtzTtirIKf8K+BGJk4z0ehm9+jF
 JwYPRQBzeYo2l71xRA3whasafL7KiOKyE3c/XLyOBvbsyVij+w/rngfv9PIzz8H/p21o
 v9wQ==
X-Gm-Message-State: AOAM531l5tstgt3IWp59mqiGc/TRSQPOfWxCvM0B29QVRfjsKYnYXuJD
 LfglY+2JbvR6YZURta33a57zCEar6EioIbWomBBfMHS3
X-Google-Smtp-Source: ABdhPJwWLIF9Wt/6B7ysHwE77OABI//FbSarg5Pz5JB2Yu97oU0EKznUklf4f7RgCRQah+eKVcFw9s+PGBZ81Y3c+4U=
X-Received: by 2002:a5b:cc7:: with SMTP id e7mr31702559ybr.358.1620647966211; 
 Mon, 10 May 2021 04:59:26 -0700 (PDT)
MIME-Version: 1.0
From: SaGGy00 <saggy00@gmail.com>
Date: Mon, 10 May 2021 13:59:15 +0200
Message-ID: <CAAzMHAgT3Xwfth_gu43bqKyTcpWvy+5abKfdicCKcLZBzZQ3fw@mail.gmail.com>
Subject: Dell XPS 13 9310 MHI issue
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_045927_882735_7E5EA357 
X-CRM114-Status: GOOD (  10.98  )
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

Hi everyone,

I am facing a problem with my Dell XPS 13 regarding the ath11k_pci module.

I have tried the following kernels:
ath11k-qca6390-bringup, ath-202104221406, archlinux's stock 5.12.1.

Wifi is working only for ath11k-qca6390-bringup and only when the
kernel is auto-loading the ath11k_pci/ath11k modules. For all three
kernels the wifi doesn't work when the modules are loaded manually
after booting the kernel. I tried to see what is going on and it seems
that the process fails because the MHI command to the PCI never
returns a response.

The debug output when loading ath11k_pci is given below:
[   37.680944] ath11k_pci 0000:72:00.0: BAR 0: assigned [mem
0xa2500000-0xa25fffff 64bit]
[   37.680970] ath11k_pci 0000:72:00.0: enabling device (0000 -> 0002)
[   37.681025] ath11k_pci 0000:72:00.0: boot pci_mem 0x00000000c2f3a455
[   37.681030] ath11k_pci 0000:72:00.0: pci tcsr_soc_hw_version major 2 minor 0
[   37.681257] ath11k_pci 0000:72:00.0: msi base data is 0
[   37.681258] ath11k_pci 0000:72:00.0: qca6390 hw2.0
[   37.681259] ath11k_pci 0000:72:00.0: Assign MSI to user: MHI,
num_vectors: 3, user_base_data: 0, base_vector: 0
[   37.681260] ath11k_pci 0000:72:00.0: Number of assigned MSI for MHI
is 3, base vector is 0
[   37.681329] ath11k_pci 0000:72:00.0: target_reg a3b034, shadow reg
0x8fc shadow_idx 0x0, ring_type 0, ring num 0
[   37.681330] ath11k_pci 0000:72:00.0: target_reg a3b03c, shadow reg
0x900 shadow_idx 0x1, ring_type 0, ring num 1
[   37.681331] ath11k_pci 0000:72:00.0: target_reg a3b044, shadow reg
0x904 shadow_idx 0x2, ring_type 0, ring num 2
[   37.681332] ath11k_pci 0000:72:00.0: target_reg a3b04c, shadow reg
0x908 shadow_idx 0x3, ring_type 0, ring num 3
[   37.681333] ath11k_pci 0000:72:00.0: target_reg a3b054, shadow reg
0x90c shadow_idx 0x4, ring_type 1, ring num 0
[   37.681334] ath11k_pci 0000:72:00.0: target_reg a3b028, shadow reg
0x910 shadow_idx 0x5, ring_type 2, ring num 0
[   37.681335] ath11k_pci 0000:72:00.0: target_reg a3b020, shadow reg
0x914 shadow_idx 0x6, ring_type 3, ring num 0
[   37.681335] ath11k_pci 0000:72:00.0: target_reg a3b06c, shadow reg
0x918 shadow_idx 0x7, ring_type 4, ring num 0
[   37.681336] ath11k_pci 0000:72:00.0: target_reg a46000, shadow reg
0x91c shadow_idx 0x8, ring_type 5, ring num 0
[   37.681337] ath11k_pci 0000:72:00.0: target_reg a46008, shadow reg
0x920 shadow_idx 0x9, ring_type 5, ring num 1
[   37.681338] ath11k_pci 0000:72:00.0: target_reg a46010, shadow reg
0x924 shadow_idx 0xa, ring_type 5, ring num 2
[   37.681338] ath11k_pci 0000:72:00.0: target_reg a46018, shadow reg
0x928 shadow_idx 0xb, ring_type 6, ring num 0
[   37.681339] ath11k_pci 0000:72:00.0: target_reg a46034, shadow reg
0x92c shadow_idx 0xc, ring_type 7, ring num 0
[   37.681347] ath11k_pci 0000:72:00.0: target_reg a370b0, shadow reg
0x930 shadow_idx 0xd, ring_type 11, ring num 0
[   37.681348] ath11k_pci 0000:72:00.0: target_reg a37018, shadow reg
0x934 shadow_idx 0xe, ring_type 12, ring num 0
[   37.681349] ath11k_pci 0000:72:00.0: target_reg a370c4, shadow reg
0x938 shadow_idx 0xf, ring_type 13, ring num 0
[   37.681349] ath11k_pci 0000:72:00.0: target_reg a370cc, shadow reg
0x93c shadow_idx 0x10, ring_type 13, ring num 1
[   37.681350] ath11k_pci 0000:72:00.0: target_reg a370d4, shadow reg
0x940 shadow_idx 0x11, ring_type 13, ring num 2
[   37.681351] ath11k_pci 0000:72:00.0: target_reg a370dc, shadow reg
0x944 shadow_idx 0x12, ring_type 13, ring num 3
[   37.681352] ath11k_pci 0000:72:00.0: target_reg a00400, shadow reg
0x948 shadow_idx 0x13, ring_type 8, ring num 0
[   37.681353] ath11k_pci 0000:72:00.0: target_reg a03400, shadow reg
0x94c shadow_idx 0x14, ring_type 9, ring num 1
[   37.681354] ath11k_pci 0000:72:00.0: target_reg a0340c, shadow reg
0x950 shadow_idx 0x15, ring_type 10, ring num 1
[   37.681355] ath11k_pci 0000:72:00.0: target_reg a05400, shadow reg
0x954 shadow_idx 0x16, ring_type 9, ring num 2
[   37.681356] ath11k_pci 0000:72:00.0: target_reg a0540c, shadow reg
0x958 shadow_idx 0x17, ring_type 10, ring num 2
[   37.681356] ath11k_pci 0000:72:00.0: target_reg a06400, shadow reg
0x95c shadow_idx 0x18, ring_type 8, ring num 3
[   37.681357] ath11k_pci 0000:72:00.0: target_reg a08400, shadow reg
0x960 shadow_idx 0x19, ring_type 8, ring num 4
[   37.681358] ath11k_pci 0000:72:00.0: target_reg a0b400, shadow reg
0x964 shadow_idx 0x1a, ring_type 9, ring num 5
[   37.681359] ath11k_pci 0000:72:00.0: target_reg a0b40c, shadow reg
0x968 shadow_idx 0x1b, ring_type 10, ring num 5
[   37.681360] ath11k_pci 0000:72:00.0: target_reg a0e400, shadow reg
0x96c shadow_idx 0x1c, ring_type 8, ring num 7
[   37.681360] ath11k_pci 0000:72:00.0: Assign MSI to user: CE,
num_vectors: 10, user_base_data: 3, base_vector: 3
[   37.681417] ath11k_pci 0000:72:00.0: Assign MSI to user: DP,
num_vectors: 18, user_base_data: 14, base_vector: 14
[   37.681419] ath11k_pci 0000:72:00.0: irq:192 group:0
[   37.681429] ath11k_pci 0000:72:00.0: irq:193 group:1
[   37.681438] ath11k_pci 0000:72:00.0: irq:194 group:2
[   37.681447] ath11k_pci 0000:72:00.0: irq:196 group:4
[   37.681457] ath11k_pci 0000:72:00.0: irq:197 group:5
[   37.681466] ath11k_pci 0000:72:00.0: irq:198 group:6
[   37.681475] ath11k_pci 0000:72:00.0: irq:199 group:7
[   37.681484] ath11k_pci 0000:72:00.0: irq:200 group:8
[   37.681494] ath11k_pci 0000:72:00.0: irq:201 group:9
[   37.681503] ath11k_pci 0000:72:00.0: irq:202 group:10
[   37.685504] NET: Registered protocol family 42
[   37.685694] ath11k_pci 0000:72:00.0: pci ltssm 0x111
[   37.685705] ath11k_pci 0000:72:00.0: pci pcie_hot_rst 0x10
[   37.710771] ath11k_pci 0000:72:00.0: MHISTATUS 0xff04
[   37.720790] ath11k_pci 0000:72:00.0: cookie:0x0
[   37.720802] ath11k_pci 0000:72:00.0: WLAON_WARM_SW_ENTRY 0x0
[   37.740817] ath11k_pci 0000:72:00.0: WLAON_WARM_SW_ENTRY 0x0
[   37.740829] ath11k_pci 0000:72:00.0: soc reset cause:0
[   37.740833] ath11k_pci 0000:72:00.0: pci link_ctl 0x0042 L0s 0 L1 1
[   37.740836] ath11k_pci 0000:72:00.0: setting mhi state: INIT(0)
[   37.740844] ath11k_pci 0000:72:00.0: setting mhi state: POWER_ON(2)
[   37.740846] mhi mhi0: Requested to power ON
[   37.741117] mhi mhi0: Power on setup success
[   37.741448] audit: type=1106 audit(1619127314.596:98): pid=1034
uid=1000 auid=1000 ses=4 msg='op=PAM:session_close
grantors=pam_limits,pam_unix,pam_permit acct="root"
exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[   37.741481] audit: type=1104 audit(1619127314.596:99): pid=1034
uid=1000 auid=1000 ses=4 msg='op=PAM:setcred
grantors=pam_faillock,pam_permit,pam_env,pam_faillock acct="root"
exe="/usr/bin/sudo" hostname=? addr=? terminal=/dev/pts/0 res=success'
[   38.051572] mhi mhi0: Wait for device to enter SBL or Mission mode

I also tried the booting from the archlinux livecd and I noticed that
sometimes ath11k_pci is loaded properly, while other times is not.

Any help appreciated,
Thanasis Xigis

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
