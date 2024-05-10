Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26088C25B5F
	for <ath11k@archiver.kernel.org>; Fri, 10 May 2024 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxBivlOxaqlEEbDLMFV0vCEHdd4iPG+/gEoM2OoSt2w=; b=ZRW57DEM4Ro/lVossbOTxRuZ6D
	TELcy6QSaYoay+WGUk2NAFyAUka7V+D1LuZ7qdXYqVgiqD06ikETsnazwMFE+ad9mDpwUhtr451vI
	guMX+llivQ2TdpWSudeUInpgPjS7ny2Esct8e6peY3C4zMqql49b5HNcxOd1CeFvify4RKaCbAlVM
	yCLCIT+EY6CWRKRB3c5zW8J7jNpNEzMHQQ2JJkveRSldhLwAxG5eFluYPyVMAPLFoWv9+zMCE+1RX
	tCm6LLxiYXJeTBP8ygIARG367Uo7HIS9p2vEacEkO27c1XI+jDagbXIstjS3GQSc/6WF1aBnS6CT4
	7JSYEbaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Pq5-00000005KfN-07vT;
	Fri, 10 May 2024 12:59:05 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ppu-00000005KaU-0e6J
	for ath11k@lists.infradead.org;
	Fri, 10 May 2024 12:59:03 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2e43c481b53so24639181fa.2
        for <ath11k@lists.infradead.org>; Fri, 10 May 2024 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1715345926; x=1715950726; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxBivlOxaqlEEbDLMFV0vCEHdd4iPG+/gEoM2OoSt2w=;
        b=d4qazzr9qUeMG6NUI/RhyM1hvDVb5Ulpk6yvJPBVrSHwKgDvKh/7UYFO4gh7exR7HB
         jTGFdYXw3TAtkd2V/rXSYp0PwgUDEN3ZRWKQKLd8tsYOuLILFPdTlrUX056GNAL1avpj
         aYK3FeGonWk3MqkcFkVwX5eaxBIGwm6kvxjyTcrRmI8cpi89q8loXu/J5Bqe0IQ8bE9E
         LpBM1bRfoQnQsrPnFKds6nfoiafLh8MZDgPMK3tqqU3+I7bfdpELzMOmpn1sTcbt9pTM
         9o9WWCYdGptdumzMIGRqPAVfdFor/aYLlmAcNRiBHmY/1kSOW9pBVvshzqJofdpfjNxC
         K4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345926; x=1715950726;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YxBivlOxaqlEEbDLMFV0vCEHdd4iPG+/gEoM2OoSt2w=;
        b=qD6E+AYeMtRmMvAqSQlDD1xib9JfH8kiE67lf6bdh2FCVhzOCV94vZ+tpwhRDuz0F4
         Uy0EwIbXnl3/B4EvMJLIdztAID2i6POXTHMEw5vlQLV00+eApFs3zKqmP/0acNjVsAlc
         y++uztW+drBOEHFUb1EybofUcy2oQ9zVnv346S3UBMwLfEnXg8BXc6pOAXxSBlcV3aK6
         jGn6/EXS+ix4YjT2M/DjUuDFNQlKneZi0E9VQTYqHNJrci/DBPJocwDkNRvLCoyGD5F5
         5PeqzLz2UBGoi2ALX09DueJPfR/ZbKoU66b4cOIDAlqaErbrBjMLEautlMsi8iIRE0DF
         StVg==
X-Forwarded-Encrypted: i=1; AJvYcCXibWmDM92ck7WK+eXGHtJns/HDBC5h8HL47hYbDJt7P/ARTdLwnslslbw35XIfqILeq1fliiwo+r/N6fQgc3MQlhc+Mo/oARQSog==
X-Gm-Message-State: AOJu0YzrW3YRdfWDP/blqMF0SlMlWv3j8H/CHzL9lpkMvq9ZrMcJQfY7
	4+Jkh1iLLyND31bfdox8E54gPAFTVunTpTgjc5EJGCePHq8e93lfPVZSOHJj/yBgTGqosEiTBm8
	3
X-Google-Smtp-Source: AGHT+IEJc48G9N+OCYhNeHSuoRPf1sFLAwGbCobrMfI83OAtAJVZs4zbU6bnpX0pa9EFumY2HbQANg==
X-Received: by 2002:a05:6512:b81:b0:51e:f7de:d8eb with SMTP id 2adb3069b0e04-5220fb76879mr2125869e87.10.1715345926208;
        Fri, 10 May 2024 05:58:46 -0700 (PDT)
Received: from localhost (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bebb57asm1771827a12.26.2024.05.10.05.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 05:58:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 May 2024 14:58:45 +0200
Message-Id: <D15ZDRFYKJPD.20C0WDZQOZSOH@fairphone.com>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Carl Huang" <quic_cjhuang@quicinc.com>, <ath11k@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
 <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
 <D15TIIDIIESY.D1EKKJLZINMA@fairphone.com>
 <4b7719c7-22bf-4644-9705-2518031782d3@quicinc.com>
In-Reply-To: <4b7719c7-22bf-4644-9705-2518031782d3@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_055900_384372_5360FDBA 
X-CRM114-Status: GOOD (  16.67  )
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

On Fri May 10, 2024 at 1:35 PM CEST, Carl Huang wrote:
>
>
> On 2024/5/10 16:22, Luca Weiss wrote:
> > On Fri Jul 14, 2023 at 4:38 AM CEST, Carl Huang wrote:
> >> Add hardware parameter support_dual_stations to indicate
> >> whether 2 station interfaces are supported. For chips which
> >> support this feature, limit total number of AP interface and
> >> mesh point to 1. The max interfaces are 3 for such chips.
> >>
> >> The chips affected are:
> >>   QCA6390 hw2.0
> >>   WCN6855 hw2.0
> >>   WCN6855 hw2.1
> >> Other chips are not affected.
> >>
> >> For affected chips, remove radar_detect_widths because now
> >> num_different_channels is set to 2. radar_detect_widths can
> >> be set only when num_different_channels is 1. See mac80211
> >> function wiphy_verify_combinations for details.
> >>
> >> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILIC=
ONZ_LITE-3
> >=20
> > Hi Carl,
> >=20
> > Unfortunately this commit breaks wifi on a QCM6490 smartphone
> > (qcm6490-fairphone-fp5) and makes the board crash.
> >=20
> > Reverting this commit (plus for conflict resolution 5dc9d1a55e95 ("wifi=
:
> > ath11k: add support for QCA2066") and 24395ec11707 ("wifi: ath11k:
> > provide address list if chip supports 2 stations")) makes wifi work
> > again.
> >=20
> > Here's the crash log:
> >=20
> > [   43.458118] ath11k 17a10040.wifi: Adding to iommu group 11
> > [   43.459075] ath11k 17a10040.wifi: wcn6750 hw1.0
> > [   43.461219] remoteproc remoteproc2: powering up 8a00000.remoteproc
> > [   43.490363] remoteproc remoteproc2: Booting fw image qcom/qcm6490/fa=
irphone5/wpss.mbn, size 7435056
> > [   43.614039] remoteproc remoteproc2: remote processor 8a00000.remotep=
roc is now up
> > [   43.746227] ath11k 17a10040.wifi: chip_id 0x1 chip_family 0xb board_=
id 0xff soc_id 0xffffffff
> > [   43.746262] ath11k 17a10040.wifi: fw_version 0x1011855b fw_build_tim=
estamp 2023-09-03 07:43 fw_build_id WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1
> > [   53.116443] qcom_q6v5_pas 8a00000.remoteproc: fatal error received: =
cmnos_thread.c:4645:Asserted in cmnos_allocram.c:cmnos_allocram_base_with_a=
lignment_recurse:497 with Args:0x3,0x3,0x0
> > [   53.116503] remoteproc remoteproc2: crash detected in 8a00000.remote=
proc: type fatal error
> > [   53.116734] remoteproc remoteproc2: handling crash #1 in 8a00000.rem=
oteproc
> > [   53.116749] remoteproc remoteproc2: recovering 8a00000.remoteproc
> > [   53.125088] ath11k 17a10040.wifi: failed to send WMI_PDEV_SET_PARAM =
cmd
> > [   53.125116] ath11k 17a10040.wifi: failed to enable PMF QOS: (-108
> > [   53.125167] remoteproc remoteproc2: stopped remote processor 8a00000=
.remoteproc
> > [   53.127827] ath11k 17a10040.wifi: failed to send WMI_PDEV_SET_PARAM =
cmd
> > [   53.127848] ath11k 17a10040.wifi: failed to enable PMF QOS: (-108
> > [   53.258990] remoteproc remoteproc2: remote processor 8a00000.remotep=
roc is now up
> > [   53.390288] ath11k 17a10040.wifi: chip_id 0x1 chip_family 0xb board_=
id 0xff soc_id 0xffffffff
> > [   53.390319] ath11k 17a10040.wifi: fw_version 0x1011855b fw_build_tim=
estamp 2023-09-03 07:43 fw_build_id WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1
> > [   53.404765] ath11k 17a10040.wifi: Last interrupt received for each C=
E:
> > [   53.404789] ath11k 17a10040.wifi: CE_id 0 pipe_num 0 580ms before
> > [   53.404804] ath11k 17a10040.wifi: CE_id 1 pipe_num 1 476ms before
> > [   53.404818] ath11k 17a10040.wifi: CE_id 2 pipe_num 2 476ms before
> > [   53.404831] ath11k 17a10040.wifi: CE_id 3 pipe_num 3 580ms before
> > [   53.404844] ath11k 17a10040.wifi: CE_id 5 pipe_num 5 4294720700ms be=
fore
> > [   53.404858] ath11k 17a10040.wifi: CE_id 7 pipe_num 7 4294720700ms be=
fore
> > [   53.404871] ath11k 17a10040.wifi: CE_id 8 pipe_num 8 4294720700ms be=
fore
> > [   53.404883] ath11k 17a10040.wifi:
> >                 Last interrupt received for each group:
> > [   53.404894] ath11k 17a10040.wifi: group_id 0 4294720700ms before
> > [   53.404907] ath11k 17a10040.wifi: group_id 1 4294720700ms before
> > [   53.404918] ath11k 17a10040.wifi: group_id 2 4294720700ms before
> > [   53.404929] ath11k 17a10040.wifi: group_id 3 4294720700ms before
> > [   53.404940] ath11k 17a10040.wifi: group_id 4 4294720700ms before
> > [   53.404952] ath11k 17a10040.wifi: group_id 5 4294720700ms before
> > [   53.404964] ath11k 17a10040.wifi: group_id 6 4294720700ms before
> > [   53.404976] ath11k 17a10040.wifi: group_id 7 4294720700ms before
> > [   53.404987] ath11k 17a10040.wifi: group_id 8 4294720700ms before
> > [   53.404998] ath11k 17a10040.wifi: group_id 9 4294720700ms before
> > [   53.405009] ath11k 17a10040.wifi: group_id 10 4294720700ms before
> > [   53.405021] ath11k 17a10040.wifi: dst srng id 0 tp 0, cur hp 0, cach=
ed hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405037] ath11k 17a10040.wifi: dst srng id 1 tp 0, cur hp 0, cach=
ed hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405052] ath11k 17a10040.wifi: dst srng id 2 tp 0, cur hp 0, cach=
ed hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405066] ath11k 17a10040.wifi: dst srng id 3 tp 0, cur hp 0, cach=
ed hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405082] ath11k 17a10040.wifi: dst srng id 4 tp 0, cur hp 0, cach=
ed hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405097] ath11k 17a10040.wifi: src srng id 5 hp 0, reap_hp 248, c=
ur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405114] ath11k 17a10040.wifi: src srng id 8 hp 0, reap_hp 2550, =
cur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405130] ath11k 17a10040.wifi: dst srng id 9 tp 0, cur hp 0, cach=
ed hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405145] ath11k 17a10040.wifi: src srng id 16 hp 0, reap_hp 16376=
, cur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405162] ath11k 17a10040.wifi: src srng id 17 hp 0, reap_hp 16376=
, cur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405179] ath11k 17a10040.wifi: src srng id 18 hp 0, reap_hp 16376=
, cur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405196] ath11k 17a10040.wifi: src srng id 24 hp 0, reap_hp 248, =
cur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405213] ath11k 17a10040.wifi: dst srng id 25 tp 0, cur hp 0, cac=
hed hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405228] ath11k 17a10040.wifi: src srng id 32 hp 12, reap_hp 8, c=
ur tp 12, cached tp 12 last tp 8 napi processed before 580ms
> > [   53.405244] ath11k 17a10040.wifi: src srng id 35 hp 4, reap_hp 0, cu=
r tp 4, cached tp 4 last tp 0 napi processed before 580ms
> > [   53.405260] ath11k 17a10040.wifi: src srng id 36 hp 20, reap_hp 0, c=
ur tp 20, cached tp 12 last tp 12 napi processed before 460ms
> > [   53.405276] ath11k 17a10040.wifi: src srng id 39 hp 0, reap_hp 124, =
cur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405294] ath11k 17a10040.wifi: src srng id 57 hp 1022, reap_hp 10=
22, cur tp 2, cached tp 2 last tp 2 napi processed before 476ms
> > [   53.405310] ath11k 17a10040.wifi: src srng id 58 hp 18, reap_hp 18, =
cur tp 22, cached tp 22 last tp 22 napi processed before 476ms
> > [   53.405327] ath11k 17a10040.wifi: src srng id 61 hp 1020, reap_hp 10=
20, cur tp 0, cached tp 0 last tp 0 napi processed before 584ms
> > [   53.405345] ath11k 17a10040.wifi: dst srng id 81 tp 4, cur hp 4, cac=
hed hp 4 last hp 4 napi processed before 476ms
> > [   53.405361] ath11k 17a10040.wifi: dst srng id 82 tp 44, cur hp 44, c=
ached hp 44 last hp 44 napi processed before 476ms
> > [   53.405378] ath11k 17a10040.wifi: dst srng id 85 tp 0, cur hp 0, cac=
hed hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405394] ath11k 17a10040.wifi: src srng id 104 hp 65532, reap_hp =
65532, cur tp 0, cached tp 0 last tp 0 napi processed before 588ms
> > [   53.405411] ath11k 17a10040.wifi: src srng id 105 hp 0, reap_hp 504,=
 cur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405427] ath11k 17a10040.wifi: dst srng id 106 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405443] ath11k 17a10040.wifi: dst srng id 108 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405458] ath11k 17a10040.wifi: dst srng id 109 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405474] ath11k 17a10040.wifi: dst srng id 110 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.405491] ath11k 17a10040.wifi: src srng id 128 hp 8190, reap_hp 8=
190, cur tp 0, cached tp 0 last tp 0 napi processed before 464ms
> > [   53.405507] ath11k 17a10040.wifi: src srng id 129 hp 0, reap_hp 2046=
, cur tp 0, cached tp 0 last tp 0 napi processed before 4294720700ms
> > [   53.405525] ath11k 17a10040.wifi: src srng id 132 hp 2046, reap_hp 2=
046, cur tp 0, cached tp 0 last tp 0 napi processed before 460ms
> > [   53.405542] ath11k 17a10040.wifi: dst srng id 133 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294720700ms
> > [   53.747641] qcom_q6v5_pas 8a00000.remoteproc: fatal error received: =
platform_msl.c:513:PCIE ACMT error debug0 0x6030, debug1 0x101
> > [   53.747677] remoteproc remoteproc2: crash detected in 8a00000.remote=
proc: type fatal error
> > [   53.747864] remoteproc remoteproc2: handling crash #2 in 8a00000.rem=
oteproc
> > [   53.747875] remoteproc remoteproc2: recovering 8a00000.remoteproc
> > [   53.758632] remoteproc remoteproc2: stopped remote processor 8a00000=
.remoteproc
> > [   53.886889] remoteproc remoteproc2: remote processor 8a00000.remotep=
roc is now up
> > [   54.017475] ath11k 17a10040.wifi: chip_id 0x1 chip_family 0xb board_=
id 0xff soc_id 0xffffffff
> > [   54.017505] ath11k 17a10040.wifi: fw_version 0x1011855b fw_build_tim=
estamp 2023-09-03 07:43 fw_build_id WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1
> > [   54.027605] ath11k 17a10040.wifi: Last interrupt received for each C=
E:
> > [   54.027627] ath11k 17a10040.wifi: CE_id 0 pipe_num 0 1204ms before
> > [   54.027642] ath11k 17a10040.wifi: CE_id 1 pipe_num 1 1100ms before
> > [   54.027655] ath11k 17a10040.wifi: CE_id 2 pipe_num 2 1100ms before
> > [   54.027667] ath11k 17a10040.wifi: CE_id 3 pipe_num 3 1204ms before
> > [   54.027680] ath11k 17a10040.wifi: CE_id 5 pipe_num 5 4294721324ms be=
fore
> > [   54.027692] ath11k 17a10040.wifi: CE_id 7 pipe_num 7 4294721324ms be=
fore
> > [   54.027704] ath11k 17a10040.wifi: CE_id 8 pipe_num 8 4294721324ms be=
fore
> > [   54.027716] ath11k 17a10040.wifi:
> >                 Last interrupt received for each group:
> > [   54.027726] ath11k 17a10040.wifi: group_id 0 4294721324ms before
> > [   54.027738] ath11k 17a10040.wifi: group_id 1 4294721324ms before
> > [   54.027749] ath11k 17a10040.wifi: group_id 2 4294721324ms before
> > [   54.027760] ath11k 17a10040.wifi: group_id 3 4294721324ms before
> > [   54.027771] ath11k 17a10040.wifi: group_id 4 4294721324ms before
> > [   54.027782] ath11k 17a10040.wifi: group_id 5 4294721324ms before
> > [   54.027794] ath11k 17a10040.wifi: group_id 6 4294721324ms before
> > [   54.027805] ath11k 17a10040.wifi: group_id 7 4294721324ms before
> > [   54.027816] ath11k 17a10040.wifi: group_id 8 4294721324ms before
> > [   54.027827] ath11k 17a10040.wifi: group_id 9 4294721324ms before
> > [   54.027838] ath11k 17a10040.wifi: group_id 10 4294721324ms before
> > [   54.027850] ath11k 17a10040.wifi: dst srng id 4 tp 0, cur hp 0, cach=
ed hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.027866] ath11k 17a10040.wifi: src srng id 5 hp 0, reap_hp 248, c=
ur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.027882] ath11k 17a10040.wifi: src srng id 8 hp 0, reap_hp 2550, =
cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.027898] ath11k 17a10040.wifi: dst srng id 9 tp 0, cur hp 0, cach=
ed hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.027914] ath11k 17a10040.wifi: src srng id 16 hp 0, reap_hp 16376=
, cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.027930] ath11k 17a10040.wifi: src srng id 17 hp 0, reap_hp 16376=
, cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.027947] ath11k 17a10040.wifi: src srng id 18 hp 0, reap_hp 16376=
, cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.027964] ath11k 17a10040.wifi: src srng id 24 hp 0, reap_hp 248, =
cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.027980] ath11k 17a10040.wifi: dst srng id 25 tp 0, cur hp 0, cac=
hed hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.027997] ath11k 17a10040.wifi: src srng id 32 hp 0, reap_hp 60, c=
ur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.028014] ath11k 17a10040.wifi: src srng id 35 hp 0, reap_hp 124, =
cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.028030] ath11k 17a10040.wifi: src srng id 36 hp 0, reap_hp 8188,=
 cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.028045] ath11k 17a10040.wifi: src srng id 39 hp 0, reap_hp 124, =
cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.028063] ath11k 17a10040.wifi: src srng id 57 hp 1020, reap_hp 10=
20, cur tp 0, cached tp 0 last tp 0 napi processed before 440ms
> > [   54.028079] ath11k 17a10040.wifi: src srng id 58 hp 1020, reap_hp 10=
20, cur tp 0, cached tp 0 last tp 0 napi processed before 436ms
> > [   54.028095] ath11k 17a10040.wifi: src srng id 61 hp 1020, reap_hp 10=
20, cur tp 0, cached tp 0 last tp 0 napi processed before 436ms
> > [   54.028112] ath11k 17a10040.wifi: dst srng id 81 tp 0, cur hp 0, cac=
hed hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.028128] ath11k 17a10040.wifi: dst srng id 82 tp 0, cur hp 0, cac=
hed hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.028143] ath11k 17a10040.wifi: dst srng id 85 tp 0, cur hp 0, cac=
hed hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.028160] ath11k 17a10040.wifi: src srng id 104 hp 65532, reap_hp =
65532, cur tp 0, cached tp 0 last tp 0 napi processed before 448ms
> > [   54.028177] ath11k 17a10040.wifi: src srng id 105 hp 0, reap_hp 504,=
 cur tp 0, cached tp 0 last tp 0 napi processed before 4294721324ms
> > [   54.028194] ath11k 17a10040.wifi: dst srng id 106 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.028210] ath11k 17a10040.wifi: dst srng id 108 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.028226] ath11k 17a10040.wifi: dst srng id 109 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.028242] ath11k 17a10040.wifi: dst srng id 110 tp 0, cur hp 0, ca=
ched hp 0 last hp 0 napi processed before 4294721324ms
> > [   54.622819] ath11k 17a10040.wifi: failed to receive control response=
 completion, polling..
> > [   55.646232] ath11k 17a10040.wifi: ctl_resp never came in (-110)
> > [   55.646259] ath11k 17a10040.wifi: failed to connect to HTC: -110
> > [   55.653201] ath11k 17a10040.wifi: failed to start core: -110
> >=20
> >=20
> > Let me know if you need any more information.
> >=20
> > Regards
> > Luca
> >=20
> >>
> >> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> >> ---
> >>   drivers/net/wireless/ath/ath11k/core.c | 14 ++++--
> >>   drivers/net/wireless/ath/ath11k/hw.c   |  2 +-
> >>   drivers/net/wireless/ath/ath11k/hw.h   |  1 +
> >>   drivers/net/wireless/ath/ath11k/mac.c  | 62 +++++++++++++++++-------=
--
> >>   4 files changed, 53 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wire=
less/ath/ath11k/core.c
> >> index bebfd342e28b..739a8d13d57d 100644
> >> --- a/drivers/net/wireless/ath/ath11k/core.c
> >> +++ b/drivers/net/wireless/ath/ath11k/core.c
> >> @@ -120,6 +120,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.tcl_ring_retry =3D true,
> >>   		.tx_ring_size =3D DP_TCL_DATA_RING_SIZE,
> >>   		.smp2p_wow_exit =3D false,
> >> +		.support_dual_stations =3D false,
> >>   	},
> >>   	{
> >>   		.hw_rev =3D ATH11K_HW_IPQ6018_HW10,
> >> @@ -202,6 +203,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.tx_ring_size =3D DP_TCL_DATA_RING_SIZE,
> >>   		.smp2p_wow_exit =3D false,
> >>   		.support_fw_mac_sequence =3D false,
> >> +		.support_dual_stations =3D false,
> >>   	},
> >>   	{
> >>   		.name =3D "qca6390 hw2.0",
> >> @@ -251,7 +253,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.cold_boot_calib =3D false,
> >>   		.cbcal_restart_fw =3D false,
> >>   		.fw_mem_mode =3D 0,
> >> -		.num_vdevs =3D 16 + 1,
> >> +		.num_vdevs =3D 2 + 1,
> >>   		.num_peers =3D 512,
> >>   		.supports_suspend =3D true,
> >>   		.hal_desc_sz =3D sizeof(struct hal_rx_desc_ipq8074),
> >> @@ -286,6 +288,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.tx_ring_size =3D DP_TCL_DATA_RING_SIZE,
> >>   		.smp2p_wow_exit =3D false,
> >>   		.support_fw_mac_sequence =3D true,
> >> +		.support_dual_stations =3D true,
> >>   	},
> >>   	{
> >>   		.name =3D "qcn9074 hw1.0",
> >> @@ -367,6 +370,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.tx_ring_size =3D DP_TCL_DATA_RING_SIZE,
> >>   		.smp2p_wow_exit =3D false,
> >>   		.support_fw_mac_sequence =3D false,
> >> +		.support_dual_stations =3D false,
> >>   	},
> >>   	{
> >>   		.name =3D "wcn6855 hw2.0",
> >> @@ -416,7 +420,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.cold_boot_calib =3D false,
> >>   		.cbcal_restart_fw =3D false,
> >>   		.fw_mem_mode =3D 0,
> >> -		.num_vdevs =3D 16 + 1,
> >> +		.num_vdevs =3D 2 + 1,
> >>   		.num_peers =3D 512,
> >>   		.supports_suspend =3D true,
> >>   		.hal_desc_sz =3D sizeof(struct hal_rx_desc_wcn6855),
> >> @@ -451,6 +455,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.tx_ring_size =3D DP_TCL_DATA_RING_SIZE,
> >>   		.smp2p_wow_exit =3D false,
> >>   		.support_fw_mac_sequence =3D true,
> >> +		.support_dual_stations =3D true,
> >>   	},
> >>   	{
> >>   		.name =3D "wcn6855 hw2.1",
> >> @@ -498,7 +503,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.cold_boot_calib =3D false,
> >>   		.cbcal_restart_fw =3D false,
> >>   		.fw_mem_mode =3D 0,
> >> -		.num_vdevs =3D 16 + 1,
> >> +		.num_vdevs =3D 2 + 1,
> >>   		.num_peers =3D 512,
> >>   		.supports_suspend =3D true,
> >>   		.hal_desc_sz =3D sizeof(struct hal_rx_desc_wcn6855),
> >> @@ -533,6 +538,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.tx_ring_size =3D DP_TCL_DATA_RING_SIZE,
> >>   		.smp2p_wow_exit =3D false,
> >>   		.support_fw_mac_sequence =3D true,
> >> +		.support_dual_stations =3D true,
> >>   	},
> >>   	{
> >>   		.name =3D "wcn6750 hw1.0",
> >> @@ -613,6 +619,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.tx_ring_size =3D DP_TCL_DATA_RING_SIZE_WCN6750,
> >>   		.smp2p_wow_exit =3D true,
> >>   		.support_fw_mac_sequence =3D true,
> >> +		.support_dual_stations =3D false,
> >>   	},
> >>   	{
> >>   		.hw_rev =3D ATH11K_HW_IPQ5018_HW10,
> >> @@ -693,6 +700,7 @@ static const struct ath11k_hw_params ath11k_hw_par=
ams[] =3D {
> >>   		.tx_ring_size =3D DP_TCL_DATA_RING_SIZE,
> >>   		.smp2p_wow_exit =3D false,
> >>   		.support_fw_mac_sequence =3D false,
> >> +		.support_dual_stations =3D false,
> >>   	},
> >>   };
> >>  =20
> >> diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wirele=
ss/ath/ath11k/hw.c
> >> index d7b5ec6e6904..3b56ba1b8534 100644
> >> --- a/drivers/net/wireless/ath/ath11k/hw.c
> >> +++ b/drivers/net/wireless/ath/ath11k/hw.c
> >> @@ -58,7 +58,7 @@ static void ath11k_hw_wcn6855_tx_mesh_enable(struct =
ath11k_base *ab,
> >>   static void ath11k_init_wmi_config_qca6390(struct ath11k_base *ab,
> >>   					   struct target_resource_config *config)
> >>   {
> >> -	config->num_vdevs =3D 4;
> >> +	config->num_vdevs =3D ab->hw_params.num_vdevs;
>
> Hi Luca, I guess above line caused WCN6750 crash.
> For a quick try, you can change it back to "config->num_vdevs =3D 4".
>
> A more reasonable fix coule be to define a dedicated function like=20
> ath11k_init_wmi_config_wcn6750() so wcn6750 doesn't use the same=20
> function as QCA6390 and WCN6855, and everything changed in this patch=20
> will not affect wcn6750.

Hi Carl,

Thanks for the quick response!

It seems you're right, applying the following patch without the reverts
on 6.9-rc6 doesn't make the phone crash anymore and wifi seems to work
fine, thanks!

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/at=
h/ath11k/hw.c
index caa6dc12a790..77d8f9237680 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -58,7 +58,7 @@ static void ath11k_hw_wcn6855_tx_mesh_enable(struct ath11=
k_base *ab,
 static void ath11k_init_wmi_config_qca6390(struct ath11k_base *ab,
 					   struct target_resource_config *config)
 {
-	config->num_vdevs =3D ab->hw_params.num_vdevs;
+	config->num_vdevs =3D 4;
 	config->num_peers =3D 16;
 	config->num_tids =3D 32;
=20


