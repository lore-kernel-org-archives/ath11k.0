Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF08CD4F3C
	for <ath11k@archiver.kernel.org>; Tue, 19 May 2026 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bIoRuAJAPcJrNuPsGqklanqR/gpLUP+rn1KnUvtrXQA=; b=uhw1LHB8BU6k4KDkgfMtbvGm7p
	9R0yd/c5jYkOKFD0I7IvvDQbhdBZ1832G3K3XYTXkRqURlcJy5lCnf7GVZVho67ddbQHAxACLhy6a
	VFtPNWjWMp2mNpJQ+mN4H12x6OlMs2Wphu5h0hojTXxmH1wkQPH9zt8DRYigXop0YvfMFF9NZaJol
	Co6dATFLcY6QIQsk1bTrKRFTLkZXL6OEfBJnrI41a/KA1YPgv2Ouyxyr3/i4YJmtAjVIQp4OgE9VO
	dzKZf0CTe+MaCExLO31wktO78bnbjaWWw72f7BtAzcFFtbnS3O4mz5Cc7VrNDpYqZfqNLTHoXnva3
	O7DPNwjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLWq-00000001qXO-32iI;
	Tue, 19 May 2026 14:34:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLWn-00000001qVm-2nv0
	for ath11k@lists.infradead.org;
	Tue, 19 May 2026 14:34:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9kqWY1256987
	for <ath11k@lists.infradead.org>; Tue, 19 May 2026 14:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bIoRuAJAPcJrNuPsGqklan
	qR/gpLUP+rn1KnUvtrXQA=; b=DK0MDlr0X1ZNkZUEDuVb36fmYCLwDy3nHTXVte
	ouDf7K9IzR+CyHYWNCoAZIBSvBOId1+NkhxKeDuahqK752emdnVzUMdW8mN+t78x
	SDPZPCixbZ0YccLP/5XQUjQH/UlPdS7nrEifmaxj4C9UezJJkPtEfUWFdsUn7Id/
	udeN6bY3Z+FyzQcJ7uZEnU3JKt9zif85GrSDh+He/yAkAEIDwgFJJ76wZpWZtCpP
	znN6xcP0nSl1eKIP5XIvfsfwe9OagJeZJAr4Td2WMwsXHhMmsxt5IzXbd6YiJyEn
	5nHDvc6KVefe1wLoNW+9YxI0r5wp2tJrW+2F8hWbo8t5hpWw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj94cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 19 May 2026 14:34:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so6928548eec.1
        for <ath11k@lists.infradead.org>; Tue, 19 May 2026 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779201276; x=1779806076; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIoRuAJAPcJrNuPsGqklanqR/gpLUP+rn1KnUvtrXQA=;
        b=fcVNrDOlIokXEQ9k1rxN+nCdXM2oe1MXmfUvU2up+EUOalUP8gLeoZZaMBX7YYtbbV
         UeL7fcPdYPezEdXelMHb6637qF9jSsYObuijaK+YZeJtR2IlFB8PH+ANEhHLqYmxKGPi
         /7jxkYqoqBVqZIwnFfHhKpYry9WJsFtqLzlS5dFboUzhYJIUj0dUx2aIjlpJPDLnuWu3
         894sjm2P3K4pBoKtqfHz26wmWm7sIZrZ5bj1KT+wL3NaNI2su81BveZLTz3MIlP9Yyco
         Vgl6FUlvAMrVAlNQqcgCVq/9lEv2sEHAO/n8sK3EksPyNTMniUF9gqE+HbkIu4xeNcRf
         pjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201276; x=1779806076;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIoRuAJAPcJrNuPsGqklanqR/gpLUP+rn1KnUvtrXQA=;
        b=n9xY6KvD/zaguCBfmapDex/EtsSe33YwS/1w932hRqXatTt8To/3UDqfhlCMr/wE1N
         epy07i7mSUsxsVzxF+ke/eZkrOvH8ypP80pNHcTBrpFFNU3FPddIuQY34dYTeD84NxWL
         16wUQEcKzqcAbUKQbND4ucRiGPB3eKFFBMpe6hwz6+nDEhOuCfQx7CBHmmBUrhUVsVr1
         T2IJn/kg4H26H5HqYv9/EW4tFh1FpBM8Ezvi0U6DQeofpqxnwtMZEbBJMgYBcjsGZWXA
         2SHbrEb1LW7J32ktRbkRTKCxnRY40s12tjoNqeS9ZDEL87tLg+pMYPosWrT3Ar21IaY+
         VcLg==
X-Forwarded-Encrypted: i=1; AFNElJ+DUTM9Aew1lLKn5vCh5VywkQDUx6QHKNEk7CbuI/6p9OhpRuk1NkVbgwVGFcQoSDAOcQWAuMs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCBm8dJl5AsQXo7qtWv2/4mgS6c6hpsEtcY44ekiUt425sPrbB
	nPkAKYlPdbCEBh2nuKhQ951DAfXrCh0fkY2HKVD0Ui2DG1mheiHP8+07QbziLQrsxPO6jsQ3uBg
	SqsDKV95QlOgL3VFZO+fY36ZUXQ8RUfx5pBTxJ8+hPP1TcI34P1+UCn1Sei2c3y0X
X-Gm-Gg: Acq92OERAQZCqdZkas1SMkg+j+UKkwMxw+XbeZf1DGPAQibTRgEA8JS8GfpbACbVoX0
	/rC5PExMBBPy4w5+0lcx/T1rgm+nPyuaOl7E1t89B2CSSIGXzX8pTKhg6aTJ49ni2s8ewGHUvn+
	0bHVeUD7EiRwOO+1ipmb9ukgrcZ2doqSB3DFSFpPFSPNgQ7X370QPBBwmO6PvtfqPJYcTFASQya
	AHRvjEjH9VHNTBTUV67CQoV4gR+Jb5d+ojiwLRpVkjA14DaEndLIMpMzdMzZ+pkbJq3XeKCspJn
	SoKR7L6QhAQSKZDI55JzC3BT74h0yNgB3SrQJyqfA1zKWA2sF5t24/3QBm2wGP+PIN1UnOVkmk5
	Qmly5zXu8YwU1q/xq7iGyb+k2GoXQxTmHONkr8TTtXDEr8YWRUHKz/mKgNA==
X-Received: by 2002:a05:7300:fb83:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-3039818afa7mr9591101eec.1.1779201275490;
        Tue, 19 May 2026 07:34:35 -0700 (PDT)
X-Received: by 2002:a05:7300:fb83:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-3039818afa7mr9591070eec.1.1779201274916;
        Tue, 19 May 2026 07:34:34 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm16526448eec.29.2026.05.19.07.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 07:34:34 -0700 (PDT)
Message-ID: <651b9fa7-ac08-4b50-bb68-1d649d27ed91@oss.qualcomm.com>
Date: Tue, 19 May 2026 07:34:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260519
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RwiDwpNhU_KVABokc7qtdoArXW3i_6rg
X-Proofpoint-ORIG-GUID: RwiDwpNhU_KVABokc7qtdoArXW3i_6rg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0MyBTYWx0ZWRfX9qi0gm7q+U1R
 9KQLyHqoJmkU2KfuLUeKbygT/vPC6Np/ddBNLZrrQ4AAu9RkKksJKAd5gizD2GwJGds7wZbH9ub
 EhQ9cCxIdeSSQCPSwN3EBPApfLL9rBGrUjpwxJX8X9+KUHOmNvWxtW5biDJUXQ9nCETNKQoQGHa
 X+IUo7xYEtUAcF8LcJTF2LXjEHRCKw/gFrGCx8pJ2n4ZQsIZurTmLJEp5HRltnfrjCGDAx23UD5
 05cu9hq2dnL2SVrnb7zwyUtCTQItuNAQ/mg7xSTe059MJU+eG/hXiyZ2ym1F8NqEBbyEnZAUNl6
 vydljAZ0l3VIc3dxL5KBHEthWqa7V4IYCViP07qZqmPQuFtJBHl5U49jqLlpNPTccK54W115MVu
 mE4KMe6SH8hbQq405f0BzlipK9yVeB/xKmQwt0m5SUq7hNeRLqcQN232Qr6I1FCn/Im58twlDyP
 56+BdwNd2gvyjTqozqg==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c74fc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=MhPGfwmvrDdq-928PkYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_073437_830942_9108631B 
X-CRM114-Status: UNSURE (   9.37  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The following changes since commit 7666dbb1bacc4ba522b96740cba7283d243d16e1:

  wifi: cfg80211: advance loop vars in cfg80211_merge_profile() (2026-05-08 09:20:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260519

for you to fetch changes up to 60fb2cf51e77bb1c0261160b4be44209d68956b1:

  wifi: ath12k: fix EHT TX MCS limitation due to wrong 20 MHz-only parsing (2026-05-18 06:47:03 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc5

ath10k:
- avoid sending any commands to firmware when it is wedged

ath11k:
- fix WMI buffer leaks on error conditions
- fix UAF in RX MSDU coalesce path
- allow peer ID 0 on RX path (legal for mobile devices)
- reinitialize shared SRNG pointers on restart

ath12k:
- fix 20 MHz-only parsing of EHT-MCS map

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: fix EHT TX MCS limitation due to wrong 20 MHz-only parsing

Kang Yang (1):
      wifi: ath10k: skip WMI and beacon transmission when device is wedged

Kyle Farnung (1):
      wifi: ath11k: clear shared SRNG pointer state on restart

Matthew Leach (1):
      wifi: ath11k: fix peer resolution on rx path when peer_id=0

Nicolas Escande (3):
      wifi: ath11k: fix error path leaks in some WMI WOW calls
      wifi: ath11k: fix error path leaks in some WMI calls
      wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()

Willmar Knikker (1):
      wifi: ath11k: fix use after free in ath11k_dp_rx_msdu_coalesce()

 drivers/net/wireless/ath/ath10k/wmi.c      |  15 ++--
 drivers/net/wireless/ath/ath11k/dp_rx.c    |   9 +-
 drivers/net/wireless/ath/ath11k/hal.c      |  14 ++-
 drivers/net/wireless/ath/ath11k/hal_rx.c   |   5 +-
 drivers/net/wireless/ath/ath11k/testmode.c |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.c      |   8 +-
 7 files changed, 143 insertions(+), 40 deletions(-)

