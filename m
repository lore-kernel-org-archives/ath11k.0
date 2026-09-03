Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03478C624DA
	for <ath11k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJ4aMtCvn3Z4Yt7yz9sP6k2kSmRo47TFlV5RXh9nwkw=; b=3dBXoNTIedR4mp0/5MoGzAJtTL
	SVgk9xRpqnvolu19TvSFB1p+3BfKo8iARKtu14+NSGC/b6otyH37s9Mo2Msk+qZsPAynW4OfHsaEV
	ZtHIqe9QscoD6dbFr3cfmsIjGMza4SOhHmV4EWrMPfNovtL2g3aUBeFHhg3chQ7ZLbffMM86omUJy
	u+U1XaCJhV3Br6gRlA4soGlvAX4wz9gHtGXMYImc6uqhB4nC6P3gZtsLVyltHqjTb+A6/pZpluRcz
	xxiHYfvxbzYgoWsZ+grMSB+PuERh3Flfwb/o5od4QSP6AZk2JYAstnPcL4WKO8OGN9wF1EvQ1JQL0
	acqIBa+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chy-00000000QJK-32tL;
	Thu, 03 Sep 2026 19:02:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chv-00000000QH0-34zc
	for ath11k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3Z0F1091209
	for <ath11k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJ4aMtCvn3Z4Yt7yz9sP6k2kSmRo47TFlV5RXh9nwkw=; b=TrNdT6xWJzcSw4Sy
	F3IjJLsBVs1gNPdUmItnOXL5sTgLBUjudXUKQMPimwGyhLxqvrQ1JNdRkCfHiN7k
	bAGQUtLECHf3iqqJCJOFRzdAzX13zCq/yW1Jw2NvCMUmofmY8rrpgKPV609hq423
	oKyOFX9HyljUtk9BtFN5BULRwrVrao96WNtprq5x6szWEEAlhDbsGjBLw3g6WHMc
	K9Eit8bEX6LF5wcogpjYBdAF5UKvTFJmbK5/XfnXESc5REayO6Ef+coXKaZsrxaa
	ETSGf7zOsz8M2RIXiLn0kmnyVpm82iIKpQ54yIFI3cBryZZREEnCGA+eHom9vhEg
	rJKJZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekk3hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so183793a91.0
        for <ath11k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462162; x=1789066962; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJ4aMtCvn3Z4Yt7yz9sP6k2kSmRo47TFlV5RXh9nwkw=;
        b=g8pfqDnmwSfkxat2sVukTz90HO6brEpVThwuUVIQG+azsjJOKgfb9OxVD6PihPIzcq
         IUOkdaupfZGnnDmcf9x4fXUTxLmwCgEzmf9+UkQSNw/Vp9tPU8T+ItCRQBIP3U7pnMFU
         Bo7GXt9uDfOmUOWLiWwC4XYggr6YUf/XPQmJ5BWgc6mfNGFrUerSbalLDM+6Wm6Q2aZ+
         PaIZBwHkbOJzOTRAJGWPDHuWFL0CNlNneSkyhamzDvrtLVQy7Zw3omm+VBXv18M7MJ3m
         gYzCASsnUpBD3GlfjJhxdPBrxSQoqgVa9XisQO1INpQUEj0+SJ8UK5w9ih/qC0dhQ18i
         f8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462162; x=1789066962;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJ4aMtCvn3Z4Yt7yz9sP6k2kSmRo47TFlV5RXh9nwkw=;
        b=A1VzIQKFnIY5BvdZQGoChDQ4bJuyCoCtibF60Nk2jLsAV7+TLVhYyFADoZGvzJC0oj
         xyp8+oVKrr4I2AJ0spAwbbT3omPUhQIQ96Qh0CIF51lTCwkYl3Zf6DnkQYKFEHIl0NxT
         rWgEsKh1cVl6ko34rvp2TOdDBXhjKHgJbYIzINfPwttzCsJIrxa4UfU3AoZ1IR0O7qvd
         m1+hpQNcYmlSP3kFffdtABXTUP6pfvPqJBhUhNnwks3UVVAFuvRwm/b75Z3WfETbBh9M
         CrgiueU74qfeW0EoM+ZPljwheDl6Qhx/WohyN2AbHto89s+pBK+KS1t+OEV+TGbz+JCs
         DSOw==
X-Gm-Message-State: AFuF++lDUcWlqBXkuklO1EFFPGo7LknYXox6GTzn5ckBlceM9KH3+iAE
	eE5+HqNPIzXWWJUXNv7Kr8X9ZGwXkOI++8lt3ZgdDibQScBhcC0p65LWIugR1b+fYZxJvMLMpDP
	FaerMYsXhq44JhmXZH2hFHUJDtuJp4ycBdtkYCunx0gOv9SuVB8TIlBVAsF4hBmR2KQ45aknV
X-Gm-Gg: AYBFou0W5Us3EWd532fbavm2RwWAz+9RY4mR0LMxkJ29gPHk8F9mqLLMKr0FIOqTNCp
	Y0ANnBVp53frLW7NoeFNLmrYcp0tJR3pF5F3N+1bSJ5+R/Ec2nzwGD8CuxTmOhseceOf4Dvomn0
	mntnePwAqPqRGGpqxl8pSv42P9G9i+2lXvnPMdTX/t8W+yTR1vRDBKO2X6tCt3WPxrWyeYcpbdZ
	x7MRuFiXvltibEva7+a8a/1qfYdKN+knSQZsURj48FlN5Uqk2PeHZOr33wyfAIVjWqjXfcuKhRM
	UAx2FCMSxzwSXz4vI3DasQP01iaVn4jwgDNrogim9leQoW9nYIz3hgpqGXiXlB344B46lgRrLJl
	x/KhuW1HswUevmcOHZk2IoT4QP2tWX7mE5KDuSJhu/0WNrEe7Oy8IS/A=
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr880505a91.6.1788462161736;
        Thu, 03 Sep 2026 12:02:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr880407a91.6.1788462161137;
        Thu, 03 Sep 2026 12:02:41 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:39 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Julius Bairaktaris <julius@bairaktaris.de>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
In-Reply-To: <20260726221908.104873-1-julius@bairaktaris.de>
References: <20260726221908.104873-1-julius@bairaktaris.de>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath11k: fix SoC reboot on
 firmware crash on AHB
Message-Id: <178846215969.824911.12599048326629539586.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: uYzwLAnHVu01iwyZZCR5r5Ik7lXj1aga
X-Proofpoint-GUID: uYzwLAnHVu01iwyZZCR5r5Ik7lXj1aga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX0RlCFSR3s9Fs
 +kmg3Yj46PkH7EXXxU4xPOuag9d6/Zcn0MXRblphrHT6In818qR9k/utaOEEzvV496TeLSFiHcP
 BtAOgUnKP/gTNfGHM4tDAyV/AVjIETIRWw2oMbDcwxYPzxly3/cfzbge9iFuFPuvjyPOJLoWLGX
 BV4r9rtZx3b01EhHrpDyBk/bj6mh64p15IaVDMECJVeRJ4dFqzxQwkraP/Wf3IfI6SCNIF3yzJe
 MoiqgTOe3mt+b56pjQG9blEn9Faqd2dZ5es630rEgPH3M5o5JIvUw++HaeJTf5SWf6WY4FyH/EX
 CxP4aLcS0Wc+fqCqawgBAACH33bVjWgpP8tuaU6z+ULFanbWk+VhmmxUnbfxKTexmvENcwRJAyT
 y0x5INVs1o3wAVlxCQufsGpCKYjgkz5+fJrsuQcJjmiG9phHHYGNAkJEzhAsYCcYVE3s2YMb7Je
 NM/9h8xrm/tqr7ZIVpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX33ayfBWsuMb/
 gC0S7G6a7vayMs6ixCxxnSKGPzW1ozvVJbj+s71nDdAeTZAYbvpJCvFkCFtbi5MlxGDlYu967Y4
 nLx0nMOFKcvZofwhJktr9U21wKMypnE=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99c452 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=36bELOsONUWl3FBOthYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120243_897704_A73AC172 
X-CRM114-Status: GOOD (  12.49  )
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


On Mon, 27 Jul 2026 00:19:06 +0200, Julius Bairaktaris wrote:
> On IPQ8074 every firmware assert takes the whole SoC down. The DP NAPI
> keeps polling while ath11k_core_reconfigure_on_crash() frees the data
> path underneath it, and dereferences a ring the teardown has already
> cleared.
> 
> The interrupts used to be disabled at the top of that function.
> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> moved the disable into ath11k_core_reset(), which AHB parts never reach
> on a real firmware crash: reset_work is queued only from mhi.c and from
> the debugfs hw-restart handler. Patch 2 puts the disable back on the
> crash path. Patch 1 is a prerequisite - the CE half of the quiesce is a
> no-op on AHB today because the bus never implemented the hif ops.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: implement CE interrupt enable/disable for AHB
      commit: a7ab5c835e4253b6577e4137367c05bfddd79fa2
[2/2] wifi: ath11k: disable interrupts during firmware crash recovery
      commit: f7a74e131d3f0de04335dbe278bfb82bdafcdb3e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


