Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ED6606A31B
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jcJ84uBS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qyGMvYuB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k9kKQk30;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUFUofvr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=; b=jcJ84uBShxh+6Bek0HC3FxP2Vp
	HtgIgVpzdymzTq3OjK1Hp0CbW80/Gk37KZkq1aClmSvNq7XY/zq6f+ktu74NWSPLu/0ML2uiWhwnY
	GYiKnpLnXmUuAHKa4tnwp7A99iFetqZhWPE3BGDI3o0e/muGos8m5DvKp9L1msCQ3ThwoZLTXTVlt
	QVfNeB16IRws8RkgwK39OzkYI0BRT5s/CIcOaNVZ1jDbBK/yxHmH2Aj1VvrCL4AN5gMuzLXNbxj9z
	c/soYOnqbHDqw/SxLPPPaymM11T0ZQ0ADY4oPDVxm1Yw2ngmb4klj9w2Xj9bI+RD65ukk9lHhjwMC
	TJNF0aag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZCv-0000000CQ3c-3j6J;
	Wed, 21 Oct 2026 16:30:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZCv-0000000CQ3C-0dvM
	for ath11k@bombadil.infradead.org;
	Wed, 21 Oct 2026 16:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=; b=qyGMvYuBzWVLgmYp4KzFJKF33R
	AaxeHeAnpvoKQjGj32gdJeEq0quFBmRNzuE93SqI+wgY892Fx9OUDNqF38fFRSDQrdpVY9hqGNVpV
	YxMxPbsktULpte+QfmlyguANUndbxeg1ghO6YtMoS3glBsPyurVudcCQXmfrveSR8pL0xsABaIcll
	XuqGCM73Y8BXwER5JlV3eFEZJGOzj5BTeCadXyLkbJTZ6diEL+8yS23/rfQ8NopK1iKdEZlr9Y96y
	HJo6Di3osEsa2LQQKvivj8qRPNyckVZfBt1UGUA8CbVTo8+Ge1SL9L0QJ0I5A4p1/vlZsW8NLEFZC
	OkJg7gKw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJZCr-000000060xx-3Yo9
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 16:30:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTtLW1045397
	for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 16:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tlGZKGlDFlSxsOTfMCF1bM
	EShPw4Brtj/kvvPvd5sbU=; b=k9kKQk30PUdLl8ArJ8roU9rVGZsUL1RO7QsJ6g
	ibh9aMHMuoBPsgbxArYJ27WZ9Lqa7wCmj5wPMERpZGXfdC6IUW/NWKFO17jieEz5
	sI0n6UQfSz9gN0jsOwLkNk8za2ylYUkFD3CCu8grAojXmaAmK3TgUZ1/QUZNLoOL
	vP6euYLIeP+f3mNiN4oDMxJiEvkOgq49Uz1jQ86ScJLBXifSDnpJZXJ7ZvlpXLFD
	3KDt6Hw8Ckg+rOpOn6KqBV8+Rnbr7K2rws0Ga73hVFuRiboaMVf0UNgySz/LUf0h
	YFb4WvFf6KFfLhEOnKTbiKb9+Pi/O2aiJEa9Tp2Vc6KJVnkw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj49run-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 16:30:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso27917a91.1
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792600220; x=1793205020; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
        b=DUFUofvrtiNlXYfo61cEbOiwLhx54WLe7MJqrzwDV4pMBClVFVKfu2WDHSJ1vzfsXE
         W6i6sbo1Uun3L5iDgXBiosmNL2r/MFeMFSFMuJh2Ti0sszo35blO+Xk4uIa1BiMF5S8t
         Jqia/kQN95hetLyGtmEqhtfJdQSTPAMvPZqzwa+XNSmzuwFXDpP334cH5zQfoFwzk9lA
         6LAgYlshzsuS9sxoWMRiExBYORCk3DCtea/iToVOncUTpAFKTZvauVHMNZZLITSgdeh5
         /AutezUivtnIQrXehes2D2Ui4MWGFxuFPL1qR6yFvWwzeSJ53DERYiFiFl0SB3Al1wFH
         9B6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600220; x=1793205020;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlGZKGlDFlSxsOTfMCF1bMEShPw4Brtj/kvvPvd5sbU=;
        b=U28T388imItOKnaCo5wGKEUePf4IsK/8QjBycYvEQpxWdkoPI2fLmVt/aPo6twsaPI
         XwpvdFGkEyOg2GLL5ePOiOkBkJp4G6t2ybN9Ly++bqJXhAN8YSx1dEVUA4ApgY1Rl+4s
         8y94Q9uSajeboYKFMtAKx9bhl33x9zk39DpgADL6vyhF9m+aGmbbCX+HMqULjzPAL2Q2
         jO3KpFrw3GYZ0+jDOUc+5b4DBZZpf1b006wA5DIHwUsndNLECxzZaRNQv/7XY0nrAjjM
         XVojUwklMbNTGZKS8GTn9JQUcNnoq1li7KTrJEds6Yr4srrKfyDkVCz+M7M0OsGXm9W9
         lwew==
X-Forwarded-Encrypted: i=1; AKwUvBy1cZzCG5iCuMSwVt1a+LRGsNzenWuPI6GBW99yjAczKmYv5ffoiRRsYJAlmOVpBZHSOQ8dkGo=@lists.infradead.org
X-Gm-Message-State: AFq9FYK75oPEZ33fmQvOGP2R62dnkN5rxUZQJFWVxhcuVZElaCBm2Wrf
	pnVTdL9CWAEARoU5+OJE6iqp17/eJuY5wtpm/YkgN+//Yunpw3qaNRlffwVaf8o89PpyWPYQB9e
	W94i0xfyjqwajeGVueASbpllKq5uCfEAXaRMLySXTJpD3MlmGErlWSQHai9roV2Bu
X-Gm-Gg: AYBFou04fCxocu3FNZqCeeWyYZ6+I9rFzVT4IQVpAhBaPRz5UM4Ti3SvjinenKLrA9p
	6LiudvFV08C3I0QxzctUiQOq89M9XzNsZ0ThE8WE7gdYaTfFe4UhJO1gvFK9wG2wLcWoKWObtsN
	xAlZad/ofwtYPQd1RFDkq+Y33APJy8UNPIdUpCmI41Z4jRV2cqzf8U8NkFm2PWz4EXJmyaKrrjE
	9QXsp91s5ia3iyq8Ro13WAFE2IKGY91cELSROfCZ5Z0q6EqqwRypSmbnKzq572KXZmnFf1gD8lL
	ANEujt3lihFb9TmgDVKx+PObM9UaeGEIwt4UTWQyIv1cLnOjrwvxPXRoVRbUlv5rIOo2wccP6dp
	BPmnwJvGvoNRqnBMuLYKIVS5wf5ZlPYJOc0dn
X-Received: by 2002:a17:90b:3d90:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ad86da5631mr1499978a91.3.1792600219331;
        Wed, 21 Oct 2026 09:30:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3d90:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ad86da5631mr1499969a91.3.1792600218678;
        Wed, 21 Oct 2026 09:30:18 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm157338a91.17.2026.10.21.09.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:30:17 -0700 (PDT)
Message-ID: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:30:17 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261021
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rVXW-vPadFVONK5FBiqbGgM1XOp_9yp_
X-Proofpoint-GUID: rVXW-vPadFVONK5FBiqbGgM1XOp_9yp_
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8e89d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=rlMSw0Raz3rYzQdK8EQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX56M8yBGIigEL
 +OMvKqtaBVm/nJDEq+tdObY7n4Drap75i7FNbdkF5KxQ7TooeJcbBz/PzJQBdWp9LslSwjkDI0X
 e1dN6UuS0Kcc/Vjirx7mWAdiFxWhWe8Ka8e5OA7riDIqkKH6fib5Rrt3wGMCJFO5n6SgGuMnbes
 jbuKJST16wRyP18Mzd5X6BroK5ZAiET5QOkt2LbeOqW5scz7u7hQyhVsT2yQuNtL1GDn6yjoGnH
 UqSVVG7qtIjpyn7yM8TrtU/o+dN8+ErIUHKSBV4czuxflThhTIW8tskrHaEDS2deBeR3guHJ9He
 ABJzROIe54KgKQvjvSoKpPRpqjR6ecRbrdtx2LNRy+H/jKtSPjRebWDJbWDRlPiINtj9Ipb9p7c
 U+kMti2B+fwlcoyCdFU0dcaSrs7zK5UCMvYW7d4cDBlpeda1akHJ+uCkVnWf0pqKkDM9WLkvhvG
 zlnCvGHJWJL0uzqBDqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX20z2h6t28wBz
 GKMUPnjgeuY+n90YOl5P0/5AMX6P1p6qi+xlusmHw+SsyA7WZux94m4nuq6mQ/SyMn3dtnbSCpw
 Yf3betSfLgH3+OFJ4ep5p9Irfn6pg8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_173026_423309_5BA3FA4D 
X-CRM114-Status: GOOD (  10.40  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.

For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 59f9fc2ef8d1e312d2a613d4e1ffad2ff31a0a01:

  Merge branch 'qcom-fw-version-qca-path' into 'main' (2026-10-21 14:46:20 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261021

for you to fetch changes up to 0c5fbfd280e21e243f5956a0823cdf958839ebe3:

  ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226 (2026-10-21 09:16:32 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226

 WHENCE                                   |   2 +-
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn | Bin 3811820 -> 3808072 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

