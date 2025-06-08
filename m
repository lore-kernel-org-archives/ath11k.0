Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFE4C61DB8
	for <ath11k@archiver.kernel.org>; Sun,  8 Jun 2025 17:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y3MrT2w0E4SzGXJtrJUWL3yg93uDkQIiRATI5H081pc=; b=TiF9xLdM4d8MEhQds9juD9NPz4
	fDPwMXX+q365iqr2JTprfEtoKKCu1WYLJpRC5g3lwiL07/bzFlI2r8atXe6MMGvwIn1RmPKEKZOLF
	RomKYhrM8D4cIBr/H+PzbAdVfHIfGoGDqPfiUwJ/jKAyZpPF+pxft1M62JiJHJPGEUAIU1JRnuW7p
	9I7x+dYi74LcJOC6XmGd3fxK5Y2Dd8CuZz023UqxNkbDbeSHaIMEyzqEHnph1CACdAEmuzyyRI7eA
	6bMLxkAp5eEgLUpLPWcy0wgUkHqLm0Dg1PEOpxs3UfyxgXc2Mn4Mwu/SUcgIsZMc25tfQFAl1s2GC
	CwELwLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOJV0-00000002obD-1sAx;
	Sun, 08 Jun 2025 17:07:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOJUx-00000002oa0-3y8d
	for ath11k@lists.infradead.org;
	Sun, 08 Jun 2025 17:07:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558FZMOa024060
	for <ath11k@lists.infradead.org>; Sun, 8 Jun 2025 17:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y3MrT2w0E4SzGXJtrJUWL3
	yg93uDkQIiRATI5H081pc=; b=i/VhF9hOuJOWkT1hD10lbSs6B80dUFT0/z7evu
	B5vIj8f+c8w1DfKYdX3MF4TeI9U2JWkxH8fhwpoJz1wvd4xVh7lyLXxHsQ6hpxNk
	RCpulA+xGwgSf68ff9BAVYwIzR/RwC0VczeooET0d4++gF61nadvJiyLNaz3WYik
	8qQHtx7xeo16I65Ey02xt6YGWHaTm9Aspf8KD51KrEEUIppAs58bRzTQ/lWKiPcl
	k7CaDWNUbm/ikRs0kLtoK4xCsjlN4bE9/wcfG04m5yzUgexY7/BONWSarWmVOGgc
	5I4zBTH2gRVLwAmaybtZDL5rR0Ut3nv76i2h4UDL5CLNIjxQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxkkg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 08 Jun 2025 17:07:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2eeff19115so4461627a12.0
        for <ath11k@lists.infradead.org>; Sun, 08 Jun 2025 10:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749402472; x=1750007272;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y3MrT2w0E4SzGXJtrJUWL3yg93uDkQIiRATI5H081pc=;
        b=mW6neUYHRgiSO4rnibUqBjT1oU90nsY9yoIYilcR8jHfZkGchgvbTSq2vtIA5cHPuH
         Nc2ozqc1M9nDkqmXdq4Eg0f+5YG1vOkYMYDPDc/o9NufA5/RPi31D02yjTXneU9QS1mA
         Al9NhwsDKriGtxhCbpZDvlgh1NRGid4mvBOw9E0Wc+Vqkg75KF5joOHjOFlVN9XxaGiB
         Ac37QTVcDWCtFadJon1Dca5hkC8Nvtyp94ASgo7Hk6UVzfZzWWG5Q5gnbzwAmOb9vNiK
         P7v3vZ3vV0D58sPvSW4I43wTPpVUhJJaSqGu484vvxpIaOt3UqjZH5ZQoMBmKSBFuMe0
         dMlg==
X-Forwarded-Encrypted: i=1; AJvYcCW79Q8Vi7R7GNi+/z61+1JQlcuyACGsZGGfgc9SbqTRJNtmtQe7s7OUXyTTos40PHTvgl8lG3E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNBTTQ1aSb0c9W+53yZm4Q+T/Lq4E4knuTIITE9DhyyeHaoVy+
	5VU4JL5AqcsImYpj79xVC99dmH24ocD47NIA/AvA+rnn41X0NYUtsPXq2a22MEGceDehhHmTeVO
	usDB3NCUONSLA7NgyNecICKwOhwUB1AWw7Cw4EK5O4Xzt/D2pBIhUswITkkPjZXsYXtrbyOd9
X-Gm-Gg: ASbGncvfHuC0a7D/nD74E+nlQmRSXQcllwGcI+VKcVmYImqXl06CcpfxMIhlUNKJ/6A
	3Pt+qh6Fxs6eVMGZAbEewkxLOeMMH8taF48fujGZPQfY66LvBTxsTH/UcxMvtiI8P5+z1OS52Xc
	wmMwQMDK2UZSHtGj3IQ/HRK6HHkzq3uoIFa4QEfTX60Ld7k4IxyEDSssb+2cy1KPwqXvtts0B2t
	ZKppCViczK1LjFo5fzD1itez+xX9TyXhD+Oa0t+PbvHwGQzcm63JQV6+KFp3tyigAgWNeh4gPVF
	MKTV0MCzZAdWk/0fwz5/kLh/i0IacFB/Bd4xvgS8Uanvj8x4
X-Received: by 2002:a17:902:c952:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23601cfb69emr151020925ad.14.1749402472240;
        Sun, 08 Jun 2025 10:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPF5QYVXldVbJU9+uqJzs3oYWjXUWO5AZS79gxD1TIb8AWh0wWhXGKUy1/A7ATvW/Qpi4ApA==
X-Received: by 2002:a17:902:c952:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23601cfb69emr151020725ad.14.1749402471854;
        Sun, 08 Jun 2025 10:07:51 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078ca1sm40900605ad.35.2025.06.08.10.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 10:07:51 -0700 (PDT)
Message-ID: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 10:07:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250608
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1th69glfKEDJkwwQSAQxsUTJilDIbN45
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6845c369 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=wYb_BKVbZVJNipbyvL8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 1th69glfKEDJkwwQSAQxsUTJilDIbN45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEzNiBTYWx0ZWRfX/Txz/xrc+MZK
 uDXrrE+31jTqC8iH4gfftg/jiFCEm/Sw2gcfGKnuGLpUL5FAA2MRqxDWoZum2x2aFmE1/R8IlA8
 zRjORe5nXja8xNbdcYa35hIGUPjkWdg7NFaiF2B+rQmeBmIn6Lyb99a/A/MEgjmxh+oWXJesCJf
 mXLrgNSm+vR7VAX+rO9+x8CvfJpaNFiUWINl5gd7awalzoVocLKcz45Luarb+br/4s+gzn9211Q
 7VOQML/lBIdYj8HaBG3+O1EbOrgIgCyn20T1N1slh2tJ5/SKcXGjDZYHzcyuwAFLisjMEoSNy4T
 IdpuYzMmaeI8dL2ZcsT4DIWcpkj8MZqyw1O3R/e+0MwZY+xjOYwrG109njkwxB/YrBaS9Kz+7P/
 bHfXJMB6s21J6TbPQacHpsN3ISk35CuMkAIc/TUItIcxT4DaYFc3MwkhT1zSCCKbQ6YLbfqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_100756_105914_16706F45 
X-CRM114-Status: UNSURE (   9.04  )
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

The following changes since commit 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21:

  Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next (2025-05-28 15:24:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250608

for you to fetch changes up to f3fe49dbddd73f0155a8935af47cb63693069dbe:

  wifi: ath12k: fix uaf in ath12k_core_init() (2025-06-07 07:41:50 -0700)

----------------------------------------------------------------
ath.git updates for v6.16-rc2

Fix a handful of both build and stability issues across multiple drivers.

----------------------------------------------------------------
Baochen Qiang (8):
      wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
      wifi: ath11k: don't use static variables in ath11k_debugfs_fw_stats_process()
      wifi: ath11k: don't wait when there is no vdev started
      wifi: ath11k: move some firmware stats related functions outside of debugfs
      wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
      wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
      wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
      wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850

Caleb Connolly (1):
      ath10k: snoc: fix unbalanced IRQ enable in crash recovery

Jeff Johnson (1):
      wifi: ath12k: Fix hal_reo_cmd_status kernel-doc

Loic Poulain (1):
      wifi: ath10k: Avoid vdev delete timeout when firmware is already down

Miaoqing Pan (1):
      wifi: ath12k: fix uaf in ath12k_core_init()

Rodrigo Gobbi (1):
      wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready

Sebastian Gottschall (1):
      wil6210: fix support for sparrow chipsets

 drivers/net/wireless/ath/ath10k/mac.c        |  33 ++++--
 drivers/net/wireless/ath/ath10k/snoc.c       |   4 +-
 drivers/net/wireless/ath/ath11k/core.c       |  29 +++---
 drivers/net/wireless/ath/ath11k/core.h       |   4 +-
 drivers/net/wireless/ath/ath11k/debugfs.c    | 148 +++------------------------
 drivers/net/wireless/ath/ath11k/debugfs.h    |  10 +-
 drivers/net/wireless/ath/ath11k/mac.c        | 127 +++++++++++++++--------
 drivers/net/wireless/ath/ath11k/mac.h        |   4 +-
 drivers/net/wireless/ath/ath11k/wmi.c        |  49 +++++++--
 drivers/net/wireless/ath/ath12k/core.c       |  10 +-
 drivers/net/wireless/ath/ath12k/hal.h        |   3 +-
 drivers/net/wireless/ath/ath12k/hw.c         |   6 ++
 drivers/net/wireless/ath/ath12k/hw.h         |   2 +
 drivers/net/wireless/ath/ath12k/pci.c        |   6 +-
 drivers/net/wireless/ath/ath12k/pci.h        |   4 +-
 drivers/net/wireless/ath/wil6210/interrupt.c |  26 +++--
 16 files changed, 228 insertions(+), 237 deletions(-)

